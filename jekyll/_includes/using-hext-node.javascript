<div class='ace-clouds'><div class='ace_static_highlight' style='counter-reset:ace_line 0'><div class='ace_line'><span class='ace_storage ace_type'>var</span> <span class='ace_identifier'>hext</span> <span class='ace_keyword ace_operator'>=</span> <span class='ace_identifier'>require</span><span class='ace_paren ace_lparen'>(</span><span class='ace_string'>&#39;hext&#39;</span><span class='ace_paren ace_rparen'>)</span><span class='ace_punctuation ace_operator'>;</span>
</div><div class='ace_line'>
</div><div class='ace_line'><span class='ace_comment'>// hext.Html&#39;s constructor expects a single argument</span>
</div><div class='ace_line'><span class='ace_comment'>// containing an UTF-8 encoded string of HTML.</span>
</div><div class='ace_line'><span class='ace_storage ace_type'>var</span> <span class='ace_identifier'>html</span> <span class='ace_keyword ace_operator'>=</span> <span class='ace_keyword'>new</span> <span class='ace_identifier'>hext</span><span class='ace_punctuation ace_operator'>.</span><span class='ace_identifier'>Html</span><span class='ace_paren ace_lparen'>(</span>
</div><div class='ace_line'>  <span class='ace_string'>&#39;&#60;a href=&#34;one.html&#34;>  &#60;img src=&#34;one.jpg&#34; />  &#60;/a>&#39;</span> <span class='ace_keyword ace_operator'>+</span>
</div><div class='ace_line'>  <span class='ace_string'>&#39;&#60;a href=&#34;two.html&#34;>  &#60;img src=&#34;two.jpg&#34; />  &#60;/a>&#39;</span> <span class='ace_keyword ace_operator'>+</span>
</div><div class='ace_line'>  <span class='ace_string'>&#39;&#60;a href=&#34;three.html&#34;>&#60;img src=&#34;three.jpg&#34; />&#60;/a>&#39;</span><span class='ace_paren ace_rparen'>)</span><span class='ace_punctuation ace_operator'>;</span>
</div><div class='ace_line'>
</div><div class='ace_line'><span class='ace_comment'>// hext.Rule&#39;s constructor expects a single argument</span>
</div><div class='ace_line'><span class='ace_comment'>// containing a Hext snippet.</span>
</div><div class='ace_line'><span class='ace_comment'>// Throws an Error on invalid syntax, with</span>
</div><div class='ace_line'><span class='ace_comment'>// Error.message containing the error description.</span>
</div><div class='ace_line'><span class='ace_storage ace_type'>var</span> <span class='ace_identifier'>rule</span> <span class='ace_keyword ace_operator'>=</span> <span class='ace_keyword'>new</span> <span class='ace_identifier'>hext</span><span class='ace_punctuation ace_operator'>.</span><span class='ace_identifier'>Rule</span><span class='ace_paren ace_lparen'>(</span><span class='ace_string'>&#39;&#60;a href:link>&#39;</span> <span class='ace_keyword ace_operator'>+</span>
</div><div class='ace_line'><span class='ace_indent-guide'>    </span><span class='ace_indent-guide'>    </span><span class='ace_indent-guide'>    </span><span class='ace_indent-guide'>    </span><span class='ace_indent-guide'>    </span><span class='ace_indent-guide'>    </span> <span class='ace_string'>&#39;  &#60;img src:image />&#39;</span> <span class='ace_keyword ace_operator'>+</span>
</div><div class='ace_line'><span class='ace_indent-guide'>    </span><span class='ace_indent-guide'>    </span><span class='ace_indent-guide'>    </span><span class='ace_indent-guide'>    </span><span class='ace_indent-guide'>    </span><span class='ace_indent-guide'>    </span> <span class='ace_string'>&#39;&#60;/a>&#39;</span><span class='ace_paren ace_rparen'>)</span><span class='ace_punctuation ace_operator'>;</span>
</div><div class='ace_line'>
</div><div class='ace_line'><span class='ace_comment'>// hext.Rule.extract expects an argument of type</span>
</div><div class='ace_line'><span class='ace_comment'>// hext.Html. Returns an Array containing Objects</span>
</div><div class='ace_line'><span class='ace_comment'>// which contain key-value pairs of type String.</span>
</div><div class='ace_line'><span class='ace_storage ace_type'>var</span> <span class='ace_identifier'>result</span> <span class='ace_keyword ace_operator'>=</span> <span class='ace_identifier'>rule</span><span class='ace_punctuation ace_operator'>.</span><span class='ace_identifier'>extract</span><span class='ace_paren ace_lparen'>(</span><span class='ace_identifier'>html</span><span class='ace_paren ace_rparen'>)</span><span class='ace_punctuation ace_operator'>;</span>
</div><div class='ace_line'>
</div><div class='ace_line'><span class='ace_comment'>// hext.Rule.extract has a second, optional parameter</span>
</div><div class='ace_line'><span class='ace_comment'>// of type unsigned int, called max_searches.</span>
</div><div class='ace_line'><span class='ace_comment'>// The search for matching elements is aborted by</span>
</div><div class='ace_line'><span class='ace_comment'>// throwing an exception after this limit is reached.</span>
</div><div class='ace_line'><span class='ace_comment'>// The default is 0, which never aborts. If running</span>
</div><div class='ace_line'><span class='ace_comment'>// untrusted hext templates, it is recommend to set</span>
</div><div class='ace_line'><span class='ace_comment'>// max_searches to some high value, like 10000, to</span>
</div><div class='ace_line'><span class='ace_comment'>// protect against resource exhaustion.</span>
</div><div class='ace_line'><span class='ace_comment'>// var result = rule.extract(html, 10000);</span>
</div><div class='ace_line'>
</div><div class='ace_line'><span class='ace_comment'>// print each key-value pair</span>
</div><div class='ace_line'><span class='ace_keyword'>for</span><span class='ace_paren ace_lparen'>(</span><span class='ace_storage ace_type'>var</span> <span class='ace_identifier'>i</span> <span class='ace_keyword'>in</span> <span class='ace_identifier'>result</span><span class='ace_paren ace_rparen'>)</span>
</div><div class='ace_line'><span class='ace_paren ace_lparen'>{</span>
</div><div class='ace_line'>  <span class='ace_keyword'>for</span><span class='ace_paren ace_lparen'>(</span><span class='ace_storage ace_type'>var</span> <span class='ace_identifier'>key</span> <span class='ace_keyword'>in</span> <span class='ace_identifier'>result</span><span class='ace_paren ace_lparen'>[</span><span class='ace_identifier'>i</span><span class='ace_paren ace_rparen'>])</span>
</div><div class='ace_line'>    <span class='ace_storage ace_type'>console</span><span class='ace_punctuation ace_operator'>.</span><span class='ace_support ace_function ace_firebug'>log</span><span class='ace_paren ace_lparen'>(</span><span class='ace_identifier'>key</span><span class='ace_punctuation ace_operator'>,</span> <span class='ace_string'>&#34;->&#34;</span><span class='ace_punctuation ace_operator'>,</span> <span class='ace_identifier'>result</span><span class='ace_paren ace_lparen'>[</span><span class='ace_identifier'>i</span><span class='ace_paren ace_rparen'>]</span><span class='ace_paren ace_lparen'>[</span><span class='ace_identifier'>key</span><span class='ace_paren ace_rparen'>])</span><span class='ace_punctuation ace_operator'>;</span>
</div><div class='ace_line'>  <span class='ace_storage ace_type'>console</span><span class='ace_punctuation ace_operator'>.</span><span class='ace_support ace_function ace_firebug'>log</span><span class='ace_paren ace_lparen'>(</span><span class='ace_paren ace_rparen'>)</span>
</div><div class='ace_line'><span class='ace_paren ace_rparen'>}</span>
</div></div></div>