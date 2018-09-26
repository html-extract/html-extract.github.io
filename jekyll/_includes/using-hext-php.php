<div class='ace-clouds'><div class='ace_static_highlight' style='counter-reset:ace_line 0'><div class='ace_line'><span class='ace_support ace_php_tag'>&#60;?php</span>
</div><div class='ace_line'><span class='ace_support ace_function'>require</span> <span class='ace_string'>'hext.php'</span>;
</div><div class='ace_line'>
</div><div class='ace_line'><span class='ace_comment'># HextHtml's constructor expects a single argument</span>
</div><div class='ace_line'><span class='ace_comment'># containing an UTF-8 encoded string of HTML.</span>
</div><div class='ace_line'><span class='ace_variable'>$html</span> <span class='ace_keyword ace_operator'>=</span> <span class='ace_keyword'>new</span> <span class='ace_support ace_class'>HextHtml</span><span class='ace_paren ace_lparen'>(</span>
</div><div class='ace_line'>  <span class='ace_string'>'&#60;a href="one.html"&#62;  &#60;img src="one.jpg" /&#62;  &#60;/a&#62;</span>
</div><div class='ace_line'><span class='ace_string'>   &#60;a href="two.html"&#62;  &#60;img src="two.jpg" /&#62;  &#60;/a&#62;</span>
</div><div class='ace_line'><span class='ace_string'>   &#60;a href="three.html"&#62;&#60;img src="three.jpg" /&#62;&#60;/a&#62;'</span><span class='ace_paren ace_rparen'>)</span>;
</div><div class='ace_line'>
</div><div class='ace_line'><span class='ace_comment'># HextRule's constructor expects a single argument</span>
</div><div class='ace_line'><span class='ace_comment'># containing a Hext snippet.</span>
</div><div class='ace_line'><span class='ace_comment'># Throws an exception on invalid syntax.</span>
</div><div class='ace_line'><span class='ace_variable'>$rule</span> <span class='ace_keyword ace_operator'>=</span> <span class='ace_keyword'>new</span> <span class='ace_support ace_class'>HextRule</span><span class='ace_paren ace_lparen'>(</span><span class='ace_string'>'&#60;a href:link&#62;'</span>.
</div><div class='ace_line'><span class='ace_indent-guide'>    </span><span class='ace_indent-guide'>    </span><span class='ace_indent-guide'>    </span><span class='ace_indent-guide'>    </span><span class='ace_indent-guide'>    </span> <span class='ace_string'>'  &#60;img src:image /&#62;'</span>.
</div><div class='ace_line'><span class='ace_indent-guide'>    </span><span class='ace_indent-guide'>    </span><span class='ace_indent-guide'>    </span><span class='ace_indent-guide'>    </span><span class='ace_indent-guide'>    </span> <span class='ace_string'>'&#60;/a&#62;'</span><span class='ace_paren ace_rparen'>)</span>;
</div><div class='ace_line'>
</div><div class='ace_line'><span class='ace_comment'># HextRule-&#62;extract expects an argument of type HextHtml.</span>
</div><div class='ace_line'><span class='ace_comment'># Returns an array containing arrays which contain</span>
</div><div class='ace_line'><span class='ace_comment'># key-value pairs of type string.</span>
</div><div class='ace_line'><span class='ace_variable'>$result</span> <span class='ace_keyword ace_operator'>=</span> <span class='ace_variable'>$rule</span><span class='ace_keyword ace_operator'>-&#62;</span><span class='ace_support ace_function'>extract</span><span class='ace_paren ace_lparen'>(</span><span class='ace_variable'>$html</span><span class='ace_paren ace_rparen'>)</span>;
</div><div class='ace_line'>
</div><div class='ace_line'><span class='ace_comment'># print each key-value pair</span>
</div><div class='ace_line'><span class='ace_keyword'>foreach</span><span class='ace_paren ace_lparen'>(</span><span class='ace_variable'>$result</span> <span class='ace_keyword'>as</span> <span class='ace_variable'>$map</span><span class='ace_paren ace_rparen'>)</span>
</div><div class='ace_line'><span class='ace_paren ace_lparen'>{</span>
</div><div class='ace_line'>  <span class='ace_keyword'>foreach</span><span class='ace_paren ace_lparen'>(</span><span class='ace_variable'>$map</span> <span class='ace_keyword'>as</span> <span class='ace_variable'>$key</span> <span class='ace_keyword ace_operator'>=&#62;</span> <span class='ace_variable'>$value</span><span class='ace_paren ace_rparen'>)</span>
</div><div class='ace_line'>    <span class='ace_support ace_function'>echo</span> <span class='ace_string'>"</span><span class='ace_variable'>$key</span><span class='ace_string'>: </span><span class='ace_variable'>$value</span><span class='ace_constant ace_language ace_escape'>\n</span><span class='ace_string'>"</span>;
</div><div class='ace_line'>
</div><div class='ace_line'>  <span class='ace_support ace_function'>echo</span> <span class='ace_string'>"</span><span class='ace_constant ace_language ace_escape'>\n</span><span class='ace_string'>"</span>;
</div><div class='ace_line'><span class='ace_paren ace_rparen'>}</span>
</div></div></div>