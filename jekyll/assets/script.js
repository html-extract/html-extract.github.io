
var hext_ws = (function() {
  var m = {
      hext_host: "wss://hextws.thomastrapp.com:8080/",
      websocket: null,
      onmessage: null,
      onerror:   null
  };

  var extract = function(hext, html) {
    var request = build_request(hext, html);

    if( m.websocket == null )
    {
      m.websocket = new ReconnectingWebSocket(m.hext_host);
      var orig_onopen = m.websocket.onopen;
      m.websocket.onopen = function() {
        m.websocket.onopen = orig_onopen;
        m.websocket.send(request);
      };
      m.websocket.onerror = m.onerror;
      m.websocket.onmessage = m.onmessage;
    }
    else
    {
      m.websocket.send(request);
    }
  };

  var build_request = function(hext, html) {
    return JSON.stringify([hext, html]);
  };

  return {
    extract:   extract,
    onmessage: function(cb_message) { m.onmessage = cb_message; },
    onerror:   function(cb_error)   { m.onerror = cb_error; }
  };
})();


var hext_tryit = (function() {
  var m = {
      $form:      null,
      $in_hext:   null,
      $in_html:   null,
      $button:    null,
      $out_head:  null,
      $out_json:  null,
      $out_error: null,
      $shc_hint:  null,
      hext_ed:    null,
      html_ed:    null,
      waiting:    false
  };

  var init = function() {
    m.$form      = $('#tryit-form');
    m.$in_hext   = $('#tryit-hext');
    m.$in_html   = $('#tryit-html');
    m.$button    = $('#tryit-button');
    m.$out_head  = $('#tryit-result-header');
    m.$out_json  = $('#tryit-json');
    m.$out_error = $('#tryit-error');
    m.$shc_hint  = $('#tryit-shortcut-hint');

    // If the editor is not present, load syntaxhl theme and exit.
    // The theme is needed for ace-static-hl elements, i.e.
    // highlighted code snippets.
    if( !m.$in_hext.length )
    {
      require("ace/theme/clouds");
      return;
    }

    // Hext editor
    m.hext_ed = ace.edit("tryit-hext");
    m.hext_ed.setTheme("ace/theme/clouds");
    m.hext_ed.getSession().setMode("ace/mode/hext");
    m.hext_ed.getSession().setTabSize(2);
    // disable error messages
    m.hext_ed.getSession().setUseWorker(false);
    m.hext_ed.$blockScrolling = Infinity

    // HTML editor
    m.html_ed = ace.edit("tryit-html");
    m.html_ed.setTheme("ace/theme/clouds");
    m.html_ed.getSession().setMode("ace/mode/html");
    m.html_ed.getSession().setTabSize(2);
    // disable error messages
    m.html_ed.getSession().setUseWorker(false);
    m.html_ed.$blockScrolling = Infinity

    hext_ws.onmessage(onmessage);
    hext_ws.onerror(onerror);

    // shortcut [ctrl]+[enter] to submit form
    $(document)
      .on("focusin", "#tryit-form", function() {
        m.$shc_hint.stop().show("slow");
      })
      .on("focusout", "#tryit-form", function() {
        m.$shc_hint.stop().hide("slow");
      })
      .on("keydown", "#tryit-form", function(e) {
        if( (e.keyCode == 10 || e.keyCode == 13) && e.ctrlKey )
        {
          m.$form.submit();
        }
        else if( e.ctrlKey && e.altKey && e.keyCode == 88 /* x */ )
        {
          if( m.hext_ed.isFocused() )
            m.html_ed.focus();
          else
            m.hext_ed.focus();
        }
      });

    init_menu();
    init_form();
  };

  var init_form = function() {
    m.$form.submit(on_form_submit);
  };

  var init_menu = function() {
    $('.example-menu .item').click(function(){
      var example = $(this).data('example');
      var hext = $('#tryit-example-'+example+'-hext').html();
      var html = $('#tryit-example-'+example+'-html').html();
      var json = $('#tryit-example-'+example+'-json').html();

      m.hext_ed.setValue(hext, /* move cursor to start: */ -1);
      m.html_ed.setValue(html, -1);

      m.$out_error.html('');
      print_hext_result(JSON.parse(json));
    });
  };

  var html_escape_string = function(str) {
    // http://stackoverflow.com/a/6234804
    return str.replace(/&/g, "&amp;")
              .replace(/</g, "&lt;")
              .replace(/>/g, "&gt;")
              .replace(/"/g, "&quot;")
              .replace(/'/g, "&#039;");
  }

  var html_escape_object = function(obj) {
    var safe = {};
    for(var key in obj)
    {
      var value = obj[key];
      if( value !== null )
        safe[html_escape_string(key)] = html_escape_value(value);
    }

    return safe;
  };

  var html_escape_value = function(value) {
    if( value === null )
      return null;
    else if( typeof value === 'string' )
      return html_escape_string(value);
    else if( Array.isArray(value) )
      return value.map(html_escape_value);
    else if( typeof value === 'object' )
      return html_escape_object(value);
    else
      return null;
  }

  var highlight_json = function(str) {
    return str.replace(/(".*?"):/g, "<b>$1</b>:");
  };

  var send_request = function() {
    on_start_loading();
    var hext = m.hext_ed.getValue();
    var html = m.html_ed.getValue();
    try
    {
      hext_ws.extract(hext, html);
    }
    catch(e)
    {
      print_transport_error("socket error");
      on_stop_loading();
    }
  };

  var on_form_submit = function(event) {
    event.preventDefault();
    send_request();
    m.$form.off('submit');
    m.$form.submit(function(e) {e.preventDefault();});
    setTimeout(init_form, 1000);
  };

  var on_start_loading = function() {
    m.waiting = true;
    m.$button.addClass('loading');
    m.$out_json.css({minHeight: m.$out_json.height() - 1 });
    m.$out_json.finish().animate({opacity: 0}, 300);
  };

  var on_stop_loading = function() {
    m.waiting = false;
    m.$button.removeClass('loading');
    m.$out_json.css({minHeight: "auto"});
    m.$out_json.finish().animate({opacity: 1}, 300);
  };

  var onmessage = function(event) {
    m.$out_error.html('');
    try
    {
      var response = JSON.parse(event.data);
      if( response.hasOwnProperty('status') )
        print_hext_ws_message(response);
      else
        print_transport_error("invalid reponse");
    }
    catch( e )
    {
      print_transport_error("invalid response (" + e.message + ")");
    }

    on_stop_loading();
  };

  var print_hext_ws_message = function(data) {
    if( data.status == 200 )
      print_hext_result(data.result);
    else if( data.status == 400 )
      print_hext_error(data.error);
    else
      print_transport_error("unknown response message");
  };

  var onerror = function(event) {
    if( m.waiting )
      print_transport_error(event.type);
  };

  var print_hext_result = function(result) {
    m.$out_json.html('');
    m.$out_head.removeClass('red').addClass('green');
    var len = Object.keys(result).length;
    if( len > 0 )
    {
      m.$out_head.text(len + ' Result' + (len != 1 ? 's' : ''));
      for(var i in result)
      {
        var $result = $('<div class="ui column"></div>');
        $('<pre>')
          // convert string to JSON and back again for pretty-printing.
          .html(
              highlight_json(
                JSON.stringify(
                  // escape html in keys and values (esp. important for the
                  // result of @inner-html)
                  html_escape_object(result[i]),
                  // giving a replace function is not suitable because we
                  // cant change the value of keys
                  /* replacer: */ null,
                  /* spacing: */ 2)))
          .appendTo($result)
        $result
          .appendTo(m.$out_json);
      }
    }
    else
    {
      m.$out_head.text('0 Results');
      var $result = $('<div class="ui column"></div>');
      $('<pre>')
        .html('[empty]')
        .appendTo($result);
      $result
        .appendTo(m.$out_json)
    }
  }

  var print_hext_error = function(hext_error) {
    m.$out_head.removeClass('green').addClass('red');
    m.$out_head.text('Syntax Error');
    m.$out_json.html('');
    m.$out_error
        .html('')
        .append(
            $('<div>')
            .append('<i class="warning sign icon">')
            .append(document.createTextNode('Error: '
            // first line of an error message returned by hext_ws contains
            // the error description
            + hext_error.substring(0, hext_error.indexOf('\n')))))
        .append($('<pre>').text(
            // all lines after the first one describe the error location
            hext_error.substring(hext_error.indexOf('\n') + 1).trim()));
  };

  var print_transport_error = function(error_msg) {
    m.$out_head.removeClass('green').addClass('red');
    m.$out_head.text('Error');
    m.$out_json.html('');
    m.$out_error
        .html('')
        .append(
            $('<div>')
            .append('<i class="warning sign icon">')
            .append(document.createTextNode('Error: Request failed '
            + '(' + error_msg + ')')))
        .append('Please try again later.');
  };

  return {init: init, print_hext_result: print_hext_result};
})();

var scrollspy = (function() {
  var m = {
    $anchors: null,
    $menu_items: null
  };

  var init = function($anchors, $menu_items) {
    m.$anchors = $anchors;
    m.$menu_items = $menu_items;
    m.$anchors.visibility({
      observeChanges: false,
      once: false,
      // Fire 10px too early (expecially important when clicking on
      // links in the menu).
      offset: 10,
      onTopPassed: activate,
      onTopPassedReverse: activate_previous
    });
  };

  var activate = function() {
    var $current_item = m.$menu_items.filter(
        "[href='#" + this.id + "']");
    m.$menu_items.removeClass('active');
    $current_item.addClass('active');
  };

  var activate_previous = function() {
    var $current_item = m.$menu_items.filter('.active');
    var index = m.$menu_items.index($current_item);
    if( index > 0 ) --index;
    var $previous_item = m.$menu_items.eq(index);
    if( $previous_item.size() )
    {
      m.$menu_items.removeClass('active');
      $previous_item.addClass('active');
    }
  };

  return {init: init};
})();

$(function() {
  // Tell ace not to load worker-html.js as soon as possible
  require('ace/edit_session').EditSession.prototype.$useWorker = false;

  $('.ui.dropdown').dropdown();

  // Stickies are small menus that follow the viewport when scrolling.
  // Only enable them on large enough screens.
  if( $(window).width() > 767 )
    $('.ui.sticky').sticky();

  hext_tryit.init();
  hext_tryit.print_hext_result(JSON.parse($('#tryit-example-attribute-json').html()));

  // Load specific example if hash was given
  if( window.location.hash )
  {
    var hash = window.location.hash.substring(1);
    var $menu_item = $('.example-menu .item[data-example="' + hash + '"]');
    if( $menu_item.length === 1 )
    {
      $menu_item.click();
      $('#anchor-tryit-hext')[0].scrollIntoView();
    }
  }

  scrollspy.init(
    $('.scrollspy.anchor'),
    $('.scrollspy.menu .item')
  );
});

