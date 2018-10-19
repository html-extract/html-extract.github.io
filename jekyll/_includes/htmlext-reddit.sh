<div class='ace-clouds'><div class='ace_static_highlight' style='counter-reset:ace_line 0'><div class='ace_line'><span class='ace_comment'># extract all hrefs from page.html</span>
</div><div class='ace_line'><span class='ace_identifier'>htmlext</span> <span class='ace_keyword ace_operator'>-</span><span class='ace_identifier'>s</span> <span class='ace_string'>"&#60;a href:h /&#62;"</span> <span class='ace_keyword ace_operator'>-</span><span class='ace_identifier'>i</span> <span class='ace_identifier'>page</span>.<span class='ace_identifier'>html</span>
</div><div class='ace_line'>
</div><div class='ace_line'><span class='ace_comment'># watch every post on /r/videos with vlc</span>
</div><div class='ace_line'><span class='ace_identifier'>htmlext</span> <span class='ace_keyword ace_operator'>-</span><span class='ace_identifier'>f</span> <span class='ace_identifier'>x</span> <span class='ace_keyword ace_operator'>-</span><span class='ace_identifier'>s</span> <span class='ace_string'>"&#60;a class='title' href:x /&#62;"</span> \
</div><div class='ace_line'>  <span class='ace_keyword ace_operator'>-</span><span class='ace_identifier'>i</span> <span class='ace_keyword ace_operator'>&#60;</span><span class='ace_paren ace_lparen'>(</span><span class='ace_identifier'>curl</span> <span class='ace_keyword ace_operator'>-</span><span class='ace_identifier'>A</span> <span class='ace_string'>""</span> <span class='ace_string'>"https://old.reddit.com/r/videos/"</span><span class='ace_paren ace_rparen'>)</span>\
</div><div class='ace_line'>  | <span class='ace_identifier'>xargs</span> <span class='ace_identifier'>vlc</span>
</div><div class='ace_line'>
</div><div class='ace_line'><span class='ace_comment'># use jq's magic to display the most upvoted</span>
</div><div class='ace_line'><span class='ace_comment'># reddit thread</span>
</div><div class='ace_line'><span class='ace_identifier'>htmlext</span> <span class='ace_keyword ace_operator'>-</span><span class='ace_identifier'>a</span> <span class='ace_keyword ace_operator'>-</span><span class='ace_identifier'>s</span> <span class='ace_string'>"</span>
</div><div class='ace_line'><span class='ace_string'>&#60;div class='midcol'&#62;</span>
</div><div class='ace_line'><span class='ace_string'>  &#60;div class='unvoted' title:score /&#62;</span>
</div><div class='ace_line'><span class='ace_string'>&#60;/div&#62;</span>
</div><div class='ace_line'><span class='ace_string'>&#60;div class='entry'&#62;</span>
</div><div class='ace_line'><span class='ace_string'>  &#60;div&#62;</span>
</div><div class='ace_line'><span class='ace_string'>    &#60;p class='title'&#62;</span>
</div><div class='ace_line'><span class='ace_indent-guide'>    </span><span class='ace_string'>  &#60;a href:link @text:title /&#62;</span>
</div><div class='ace_line'><span class='ace_string'>    &#60;/p&#62;</span>
</div><div class='ace_line'><span class='ace_string'>  &#60;/div&#62;</span>
</div><div class='ace_line'><span class='ace_string'>&#60;/div&#62;"</span> \
</div><div class='ace_line'> <span class='ace_keyword ace_operator'>-</span><span class='ace_identifier'>i</span> <span class='ace_keyword ace_operator'>&#60;</span><span class='ace_paren ace_lparen'>(</span><span class='ace_identifier'>curl</span> <span class='ace_keyword ace_operator'>-</span><span class='ace_identifier'>A</span> <span class='ace_string'>""</span> <span class='ace_identifier'>https</span>:<span class='ace_keyword ace_operator'>//</span><span class='ace_identifier'>old</span>.<span class='ace_identifier'>reddit</span>.<span class='ace_identifier'>com</span><span class='ace_keyword ace_operator'>/</span><span class='ace_identifier'>r</span><span class='ace_keyword ace_operator'>/</span><span class='ace_identifier'>programming</span><span class='ace_keyword ace_operator'>/</span><span class='ace_paren ace_rparen'>)</span>\
</div><div class='ace_line'> | <span class='ace_identifier'>jq</span> <span class='ace_string ace_start'>'</span><span class='ace_string'>sort_by(.score | tonumber) | last</span><span class='ace_string ace_end'>'</span>
</div></div></div>
