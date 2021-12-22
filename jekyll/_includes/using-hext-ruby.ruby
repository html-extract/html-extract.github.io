<div class='ace-clouds'><div class='ace_static_highlight' style='counter-reset:ace_line 0'><div class='ace_line'><span class='ace_support ace_function'>require</span> <span class='ace_string ace_start'>&#39;</span><span class='ace_string'>hext</span><span class='ace_string ace_end'>&#39;</span>
</div><div class='ace_line'>
</div><div class='ace_line'><span class='ace_comment'># Hext::Html&#39;s initializer expects a single argument</span>
</div><div class='ace_line'><span class='ace_comment'># containing an UTF-8 encoded string of HTML.</span>
</div><div class='ace_line'><span class='ace_identifier'>html</span> <span class='ace_keyword ace_operator'>=</span> <span class='ace_support ace_class'>Hext</span><span class='ace_punctuation'>::</span><span class='ace_support ace_class'>Html</span><span class='ace_punctuation ace_operator'>.</span><span class='ace_support ace_function'>new</span><span class='ace_paren ace_lparen'>(</span><span class='ace_constant'>&#60;&#60;-</span><span class='ace_string'>&#39;</span><span class='ace_support ace_class'>HTML_INPUT</span><span class='ace_string'>&#39;</span><span class='ace_paren ace_rparen'>)</span>
</div><div class='ace_line'><span class='ace_string'>&#60;a href=&#34;one.html&#34;>  &#60;img src=&#34;one.jpg&#34; />  &#60;/a></span>
</div><div class='ace_line'><span class='ace_string'>&#60;a href=&#34;two.html&#34;>  &#60;img src=&#34;two.jpg&#34; />  &#60;/a></span>
</div><div class='ace_line'><span class='ace_string'>&#60;a href=&#34;three.html&#34;>&#60;img src=&#34;three.jpg&#34; />&#60;/a></span>
</div><div class='ace_line'><span class='ace_support ace_class'>HTML_INPUT</span>
</div><div class='ace_line'>
</div><div class='ace_line'><span class='ace_comment'># Hext::Rule&#39;s initializer expects a single argument</span>
</div><div class='ace_line'><span class='ace_comment'># containing a Hext snippet.</span>
</div><div class='ace_line'><span class='ace_comment'># Raises an exception of type ArgumentError on invalid syntax.</span>
</div><div class='ace_line'><span class='ace_identifier'>rule</span> <span class='ace_keyword ace_operator'>=</span> <span class='ace_support ace_class'>Hext</span><span class='ace_punctuation'>::</span><span class='ace_support ace_class'>Rule</span><span class='ace_punctuation ace_operator'>.</span><span class='ace_support ace_function'>new</span><span class='ace_paren ace_lparen'>(</span><span class='ace_string ace_start'>&#34;</span><span class='ace_string'>&#60;a href:link>  &#60;img src:image />  &#60;/a></span><span class='ace_string ace_end'>&#34;</span><span class='ace_paren ace_rparen'>)</span>
</div><div class='ace_line'>
</div><div class='ace_line'><span class='ace_comment'># Hext::Rule.extract expects an argument of type Hext::Html.</span>
</div><div class='ace_line'><span class='ace_comment'># Returns an Array of Hashes which contain key-value pairs</span>
</div><div class='ace_line'><span class='ace_comment'># of type String.</span>
</div><div class='ace_line'><span class='ace_identifier'>result</span> <span class='ace_keyword ace_operator'>=</span> <span class='ace_identifier'>rule</span><span class='ace_punctuation ace_operator'>.</span><span class='ace_support ace_function'>extract</span><span class='ace_paren ace_lparen'>(</span><span class='ace_identifier'>html</span><span class='ace_paren ace_rparen'>)</span>
</div><div class='ace_line'>
</div><div class='ace_line'><span class='ace_comment'># hext.Rule.extract has a second, optional parameter</span>
</div><div class='ace_line'><span class='ace_comment'># of type unsigned int, called max_searches.</span>
</div><div class='ace_line'><span class='ace_comment'># The search for matching elements is aborted by</span>
</div><div class='ace_line'><span class='ace_comment'># throwing an exception after this limit is reached.</span>
</div><div class='ace_line'><span class='ace_comment'># The default is 0, which never aborts. If running</span>
</div><div class='ace_line'><span class='ace_comment'># untrusted hext templates, it is recommend to set</span>
</div><div class='ace_line'><span class='ace_comment'># max_searches to some high value, like 10000, to</span>
</div><div class='ace_line'><span class='ace_comment'># protect against resource exhaustion.</span>
</div><div class='ace_line'><span class='ace_comment'># result = rule.extract(html, 10000);</span>
</div><div class='ace_line'>
</div><div class='ace_line'><span class='ace_comment'># print each key-value pair</span>
</div><div class='ace_line'><span class='ace_identifier'>result</span><span class='ace_punctuation ace_operator'>.</span><span class='ace_identifier'>each</span> <span class='ace_keyword'>do</span> <span class='ace_keyword ace_operator'>|</span><span class='ace_identifier'>map</span><span class='ace_keyword ace_operator'>|</span>
</div><div class='ace_line'>  <span class='ace_identifier'>map</span><span class='ace_punctuation ace_operator'>.</span><span class='ace_identifier'>each</span> <span class='ace_keyword'>do</span> <span class='ace_keyword ace_operator'>|</span><span class='ace_identifier'>key</span><span class='ace_punctuation ace_operator'>,</span> <span class='ace_identifier'>value</span><span class='ace_keyword ace_operator'>|</span>
</div><div class='ace_line'>    <span class='ace_support ace_function'>puts</span> <span class='ace_string ace_start'>&#34;</span><span class='ace_paren ace_start'>#{</span><span class='ace_identifier'>key</span><span class='ace_paren ace_rparen'>}</span><span class='ace_string'>: </span><span class='ace_paren ace_start'>#{</span><span class='ace_identifier'>value</span><span class='ace_paren ace_rparen'>}</span><span class='ace_string ace_end'>&#34;</span>
</div><div class='ace_line'>  <span class='ace_keyword'>end</span>
</div><div class='ace_line'>  <span class='ace_support ace_function'>puts</span>
</div><div class='ace_line'><span class='ace_keyword'>end</span>
</div></div></div>