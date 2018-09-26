<div class='ace-clouds'><div class='ace_static_highlight' style='counter-reset:ace_line 0'><div class='ace_line'><span class='ace_support ace_function'>require</span> <span class='ace_string ace_start'>'</span><span class='ace_string'>hext</span><span class='ace_string ace_end'>'</span>
</div><div class='ace_line'>
</div><div class='ace_line'><span class='ace_comment'># Hext::Html's initializer expects a single argument</span>
</div><div class='ace_line'><span class='ace_comment'># containing an UTF-8 encoded string of HTML.</span>
</div><div class='ace_line'><span class='ace_identifier'>html</span> <span class='ace_keyword ace_operator'>=</span> <span class='ace_support ace_class'>Hext</span>::<span class='ace_support ace_class'>Html</span>.<span class='ace_identifier'>new</span><span class='ace_paren ace_lparen'>(</span><span class='ace_constant'>&#60;&#60;-</span><span class='ace_string'>'</span><span class='ace_support ace_class'>HTML_INPUT</span><span class='ace_string'>'</span><span class='ace_paren ace_rparen'>)</span>
</div><div class='ace_line'><span class='ace_string'>&#60;a href="one.html"&#62;  &#60;img src="one.jpg" /&#62;  &#60;/a&#62;</span>
</div><div class='ace_line'><span class='ace_string'>&#60;a href="two.html"&#62;  &#60;img src="two.jpg" /&#62;  &#60;/a&#62;</span>
</div><div class='ace_line'><span class='ace_string'>&#60;a href="three.html"&#62;&#60;img src="three.jpg" /&#62;&#60;/a&#62;</span>
</div><div class='ace_line'><span class='ace_support ace_class'>HTML_INPUT</span>
</div><div class='ace_line'>
</div><div class='ace_line'><span class='ace_comment'># Hext::Rule's initializer expects a single argument</span>
</div><div class='ace_line'><span class='ace_comment'># containing a Hext snippet.</span>
</div><div class='ace_line'><span class='ace_comment'># Raises an exception of type ArgumentError on invalid syntax.</span>
</div><div class='ace_line'><span class='ace_identifier'>rule</span> <span class='ace_keyword ace_operator'>=</span> <span class='ace_support ace_class'>Hext</span>::<span class='ace_support ace_class'>Rule</span>.<span class='ace_identifier'>new</span><span class='ace_paren ace_lparen'>(</span><span class='ace_string ace_start'>"</span><span class='ace_string'>&#60;a href:link&#62;  &#60;img src:image /&#62;  &#60;/a&#62;</span><span class='ace_string ace_end'>"</span><span class='ace_paren ace_rparen'>)</span>
</div><div class='ace_line'>
</div><div class='ace_line'><span class='ace_comment'># Hext::Rule.extract expects an argument of type Hext::Html.</span>
</div><div class='ace_line'><span class='ace_comment'># Returns an Array of Hashes which contain key-value pairs</span>
</div><div class='ace_line'><span class='ace_comment'># of type String.</span>
</div><div class='ace_line'><span class='ace_identifier'>result</span> <span class='ace_keyword ace_operator'>=</span> <span class='ace_identifier'>rule</span>.<span class='ace_identifier'>extract</span><span class='ace_paren ace_lparen'>(</span><span class='ace_identifier'>html</span><span class='ace_paren ace_rparen'>)</span>
</div><div class='ace_line'>
</div><div class='ace_line'><span class='ace_comment'># print each key-value pair</span>
</div><div class='ace_line'><span class='ace_identifier'>result</span>.<span class='ace_identifier'>each</span> <span class='ace_keyword'>do</span> |<span class='ace_identifier'>map</span>|
</div><div class='ace_line'>  <span class='ace_identifier'>map</span>.<span class='ace_identifier'>each</span> <span class='ace_keyword'>do</span> |<span class='ace_identifier'>key</span>, <span class='ace_identifier'>value</span>|
</div><div class='ace_line'>    <span class='ace_support ace_function'>puts</span> <span class='ace_string ace_start'>"</span><span class='ace_paren ace_start'>#{</span><span class='ace_identifier'>key</span><span class='ace_paren ace_end'>}</span><span class='ace_string'>: </span><span class='ace_paren ace_start'>#{</span><span class='ace_identifier'>value</span><span class='ace_paren ace_end'>}</span><span class='ace_string ace_end'>"</span>
</div><div class='ace_line'>  <span class='ace_keyword'>end</span>
</div><div class='ace_line'>  <span class='ace_support ace_function'>puts</span>
</div><div class='ace_line'><span class='ace_keyword'>end</span>
</div></div></div>