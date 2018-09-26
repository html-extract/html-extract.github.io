<div class='ace-clouds'><div class='ace_static_highlight' style='counter-reset:ace_line 0'><div class='ace_line'><span class='ace_comment'># apply href.hext to all html files</span>
</div><div class='ace_line'><span class='ace_identifier'>htmlext</span> <span class='ace_identifier'>href</span>.<span class='ace_identifier'>hext</span> <span class='ace_keyword ace_operator'>*</span>.<span class='ace_identifier'>html</span>
</div><div class='ace_line'>
</div><div class='ace_line'><span class='ace_comment'># download every image with wget</span>
</div><div class='ace_line'><span class='ace_identifier'>htmlext</span> <span class='ace_keyword ace_operator'>-</span><span class='ace_identifier'>s</span> <span class='ace_string'>"&#60;img src:x /&#62;"</span>            \
</div><div class='ace_line'><span class='ace_indent-guide'>    </span>    <span class='ace_keyword ace_operator'>-</span><span class='ace_identifier'>f</span> <span class='ace_identifier'>x</span>                          \
</div><div class='ace_line'><span class='ace_indent-guide'>    </span>    <span class='ace_keyword ace_operator'>-</span><span class='ace_identifier'>i</span> <span class='ace_keyword ace_operator'>&#60;</span><span class='ace_paren ace_lparen'>(</span><span class='ace_identifier'>curl</span> <span class='ace_string'>"https://yoursite/"</span><span class='ace_paren ace_rparen'>)</span>\
</div><div class='ace_line'>  | <span class='ace_identifier'>xargs</span> <span class='ace_identifier'>wget</span>
</div><div class='ace_line'>
</div><div class='ace_line'><span class='ace_comment'># extract external links and check</span>
</div><div class='ace_line'><span class='ace_comment'># if they are dead</span>
</div><div class='ace_line'><span class='ace_identifier'>htmlext</span> <span class='ace_keyword ace_operator'>-</span><span class='ace_identifier'>s</span> <span class='ace_string'>"&#60;* href^='http' href:x /&#62;"</span>\
</div><div class='ace_line'><span class='ace_indent-guide'>    </span>    <span class='ace_keyword ace_operator'>-</span><span class='ace_identifier'>s</span> <span class='ace_string'>"&#60;*  src^='http'  src:x /&#62;"</span>\
</div><div class='ace_line'><span class='ace_indent-guide'>    </span>    <span class='ace_keyword ace_operator'>-</span><span class='ace_identifier'>f</span> <span class='ace_identifier'>x</span>                          \
</div><div class='ace_line'><span class='ace_indent-guide'>    </span>    <span class='ace_keyword ace_operator'>-</span><span class='ace_identifier'>i</span> <span class='ace_keyword ace_operator'>&#60;</span><span class='ace_paren ace_lparen'>(</span><span class='ace_identifier'>curl</span> <span class='ace_identifier'>https</span>:<span class='ace_keyword ace_operator'>//</span><span class='ace_identifier'>yoursite</span><span class='ace_paren ace_rparen'>)</span>   \
</div><div class='ace_line'>  | <span class='ace_identifier'>sort</span>                              \
</div><div class='ace_line'>  | <span class='ace_identifier'>uniq</span>                              \
</div><div class='ace_line'>  | <span class='ace_keyword'>while</span> <span class='ace_keyword'>read</span> <span class='ace_keyword ace_operator'>-</span><span class='ace_identifier'>r</span> <span class='ace_identifier'>link</span> ; <span class='ace_keyword'>do</span>
</div><div class='ace_line'><span class='ace_indent-guide'>    </span>  <span class='ace_comment'># print link if curl fails</span>
</div><div class='ace_line'><span class='ace_indent-guide'>    </span>  <span class='ace_identifier'>curl</span> <span class='ace_keyword ace_operator'>-</span><span class='ace_identifier'>sf</span> <span class='ace_string'>"</span><span class='ace_constant'>$link</span><span class='ace_string'>"</span> <span class='ace_keyword ace_operator'>&#62;</span> <span class='ace_keyword ace_operator'>/</span><span class='ace_identifier'>dev</span><span class='ace_keyword ace_operator'>/</span><span class='ace_identifier'>null</span>    \
</div><div class='ace_line'><span class='ace_indent-guide'>    </span>    || <span class='ace_support ace_function ace_builtin'>echo</span> <span class='ace_string'>"</span><span class='ace_constant'>$link</span><span class='ace_string'>"</span>
</div><div class='ace_line'>    <span class='ace_keyword'>done</span>
</div></div></div>