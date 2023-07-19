<div class='ace-clouds'><div class='ace_static_highlight' style='counter-reset:ace_line 0'><div class='ace_line'><span class='ace_comment'># extract all hrefs from page.html</span>
</div><div class='ace_line'><span class='ace_identifier'>htmlext</span> <span class='ace_keyword ace_operator'>-</span><span class='ace_identifier'>s</span> <span class='ace_string ace_start'>&#34;</span><span class='ace_string'>&#60;a href:h /></span><span class='ace_string ace_end'>&#34;</span> <span class='ace_keyword ace_operator'>-</span><span class='ace_identifier'>i</span> <span class='ace_identifier'>page</span>.<span class='ace_identifier'>html</span>
</div><div class='ace_line'>
</div><div class='ace_line'><span class='ace_comment'># use jq to display the most upvoted reddit thread</span>
</div><div class='ace_line'><span class='ace_identifier'>htmlext</span> <span class='ace_keyword ace_operator'>-</span><span class='ace_identifier'>a</span> <span class='ace_keyword ace_operator'>-</span><span class='ace_identifier'>s</span> <span class='ace_string ace_start'>&#34;</span>
</div><div class='ace_line'><span class='ace_string'>&#60;div class=&#39;midcol&#39;></span>
</div><div class='ace_line'><span class='ace_string'>  &#60;div class=&#39;unvoted&#39; title:score /></span>
</div><div class='ace_line'><span class='ace_string'>&#60;/div></span>
</div><div class='ace_line'><span class='ace_string'>&#60;div class=&#39;entry&#39;></span>
</div><div class='ace_line'><span class='ace_string'>  &#60;div></span>
</div><div class='ace_line'><span class='ace_string'>    &#60;p class=&#39;title&#39;></span>
</div><div class='ace_line'><span class='ace_indent-guide'>    </span><span class='ace_string'>  &#60;a href:link @text:title /></span>
</div><div class='ace_line'><span class='ace_string'>    &#60;/p></span>
</div><div class='ace_line'><span class='ace_string'>  &#60;/div></span>
</div><div class='ace_line'><span class='ace_string'>&#60;/div></span><span class='ace_string ace_end'>&#34;</span> \
</div><div class='ace_line'> <span class='ace_keyword ace_operator'>-</span><span class='ace_identifier'>i</span> <span class='ace_keyword ace_operator'>&#60;</span><span class='ace_paren ace_lparen'>(</span><span class='ace_identifier'>curl</span> <span class='ace_keyword ace_operator'>-</span><span class='ace_identifier'>A</span> <span class='ace_string ace_start'>&#34;F</span><span class='ace_string ace_end'>&#34;</span> <span class='ace_identifier'>https</span>:<span class='ace_keyword ace_operator'>//</span><span class='ace_identifier'>old</span>.<span class='ace_identifier'>reddit</span>.<span class='ace_identifier'>com</span><span class='ace_keyword ace_operator'>/</span><span class='ace_identifier'>r</span><span class='ace_keyword ace_operator'>/</span><span class='ace_identifier'>programming</span><span class='ace_keyword ace_operator'>/</span><span class='ace_paren ace_rparen'>)</span>\
</div><div class='ace_line'> <span class='ace_keyword ace_operator'>|</span> <span class='ace_identifier'>jq</span> <span class='ace_string ace_start'>&#39;</span><span class='ace_string'>sort_by(.score | tonumber) | last</span><span class='ace_string ace_end'>&#39;</span>
</div><div class='ace_line'></div>
<div class='ace_line'><span class='ace_comment'># apply href.hext to all html files</span>
</div><div class='ace_line'><span class='ace_identifier'>htmlext</span> <span class='ace_identifier'>href</span>.<span class='ace_identifier'>hext</span> <span class='ace_keyword ace_operator'>*</span>.<span class='ace_identifier'>html</span>
</div></div></div>