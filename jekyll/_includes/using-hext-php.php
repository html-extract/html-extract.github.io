<div class='ace-clouds'><div class='ace_static_highlight' style='counter-reset:ace_line 0'><div class='ace_line'><span class='ace_support ace_php_tag'>&#60;?php</span>
</div><div class='ace_line'><span class='ace_support ace_function'>require</span> <span class='ace_string'>&#39;hext.php&#39;</span><span class='ace_punctuation ace_operator'>;</span>
</div><div class='ace_line'>
</div><div class='ace_line'><span class='ace_comment'># HextHtml&#39;s constructor expects a single argument</span>
</div><div class='ace_line'><span class='ace_comment'># containing an UTF-8 encoded string of HTML.</span>
</div><div class='ace_line'><span class='ace_variable'>$html</span> <span class='ace_keyword ace_operator'>=</span> <span class='ace_keyword'>new</span> <span class='ace_support ace_class'>HextHtml</span><span class='ace_paren ace_lparen'>(</span>
</div><div class='ace_line'>  <span class='ace_string'>&#39;&#60;a href=&#34;one.html&#34;>  &#60;img src=&#34;one.jpg&#34; />  &#60;/a></span>
</div><div class='ace_line'><span class='ace_string'>   &#60;a href=&#34;two.html&#34;>  &#60;img src=&#34;two.jpg&#34; />  &#60;/a></span>
</div><div class='ace_line'><span class='ace_string'>   &#60;a href=&#34;three.html&#34;>&#60;img src=&#34;three.jpg&#34; />&#60;/a>&#39;</span><span class='ace_paren ace_rparen'>)</span><span class='ace_punctuation ace_operator'>;</span>
</div><div class='ace_line'>
</div><div class='ace_line'><span class='ace_comment'># HextRule&#39;s constructor expects a single argument</span>
</div><div class='ace_line'><span class='ace_comment'># containing a Hext snippet.</span>
</div><div class='ace_line'><span class='ace_comment'># Throws an exception on invalid syntax.</span>
</div><div class='ace_line'><span class='ace_variable'>$rule</span> <span class='ace_keyword ace_operator'>=</span> <span class='ace_keyword'>new</span> <span class='ace_support ace_class'>HextRule</span><span class='ace_paren ace_lparen'>(</span><span class='ace_string'>&#39;&#60;a href:link>&#39;</span>.
</div><div class='ace_line'><span class='ace_indent-guide'>    </span><span class='ace_indent-guide'>    </span><span class='ace_indent-guide'>    </span><span class='ace_indent-guide'>    </span><span class='ace_indent-guide'>    </span> <span class='ace_string'>&#39;  &#60;img src:image />&#39;</span>.
</div><div class='ace_line'><span class='ace_indent-guide'>    </span><span class='ace_indent-guide'>    </span><span class='ace_indent-guide'>    </span><span class='ace_indent-guide'>    </span><span class='ace_indent-guide'>    </span> <span class='ace_string'>&#39;&#60;/a>&#39;</span><span class='ace_paren ace_rparen'>)</span><span class='ace_punctuation ace_operator'>;</span>
</div><div class='ace_line'>
</div><div class='ace_line'><span class='ace_comment'># HextRule->extract expects an argument of type HextHtml.</span>
</div><div class='ace_line'><span class='ace_comment'># Returns an array containing arrays which contain</span>
</div><div class='ace_line'><span class='ace_comment'># key-value pairs of type string.</span>
</div><div class='ace_line'><span class='ace_variable'>$result</span> <span class='ace_keyword ace_operator'>=</span> <span class='ace_variable'>$rule</span><span class='ace_keyword ace_operator'>-></span><span class='ace_support ace_function'>extract</span><span class='ace_paren ace_lparen'>(</span><span class='ace_variable'>$html</span><span class='ace_paren ace_rparen'>)</span><span class='ace_punctuation ace_operator'>;</span>
</div><div class='ace_line'>
</div><div class='ace_line'><span class='ace_comment'># hext.Rule.extract has a second, optional parameter</span>
</div><div class='ace_line'><span class='ace_comment'># of type unsigned int, called max_searches.</span>
</div><div class='ace_line'><span class='ace_comment'># The search for matching elements is aborted by</span>
</div><div class='ace_line'><span class='ace_comment'># throwing an exception after this limit is reached.</span>
</div><div class='ace_line'><span class='ace_comment'># The default is 0, which never aborts. If running</span>
</div><div class='ace_line'><span class='ace_comment'># untrusted hext templates, it is recommend to set</span>
</div><div class='ace_line'><span class='ace_comment'># max_searches to some high value, like 10000, to</span>
</div><div class='ace_line'><span class='ace_comment'># protect against resource exhaustion.</span>
</div><div class='ace_line'><span class='ace_comment'># $result = $rule->extract($html, 10000);</span>
</div><div class='ace_line'>
</div><div class='ace_line'><span class='ace_comment'># print each key-value pair</span>
</div><div class='ace_line'><span class='ace_keyword'>foreach</span><span class='ace_paren ace_lparen'>(</span><span class='ace_variable'>$result</span> <span class='ace_keyword'>as</span> <span class='ace_variable'>$map</span><span class='ace_paren ace_rparen'>)</span>
</div><div class='ace_line'><span class='ace_paren ace_lparen'>{</span>
</div><div class='ace_line'>  <span class='ace_keyword'>foreach</span><span class='ace_paren ace_lparen'>(</span><span class='ace_variable'>$map</span> <span class='ace_keyword'>as</span> <span class='ace_variable'>$key</span> <span class='ace_keyword ace_operator'>=></span> <span class='ace_variable'>$value</span><span class='ace_paren ace_rparen'>)</span>
</div><div class='ace_line'>    <span class='ace_support ace_function'>echo</span> <span class='ace_string'>&#34;</span><span class='ace_variable'>$key</span><span class='ace_string'>: </span><span class='ace_variable'>$value</span><span class='ace_constant ace_language ace_escape'>\n</span><span class='ace_string'>&#34;</span><span class='ace_punctuation ace_operator'>;</span>
</div><div class='ace_line'>
</div><div class='ace_line'>  <span class='ace_support ace_function'>echo</span> <span class='ace_string'>&#34;</span><span class='ace_constant ace_language ace_escape'>\n</span><span class='ace_string'>&#34;</span><span class='ace_punctuation ace_operator'>;</span>
</div><div class='ace_line'><span class='ace_paren ace_rparen'>}</span>
</div></div></div>