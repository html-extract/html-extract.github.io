<div class='ace-clouds'><div class='ace_static_highlight' style='counter-reset:ace_line 0'><div class='ace_line'><span class='ace_storage ace_type'>const</span> <span class='ace_identifier'>loadHext</span> <span class='ace_keyword ace_operator'>=</span> <span class='ace_identifier'>require</span><span class='ace_paren ace_lparen'>(</span><span class='ace_string'>&#39;./hext.js&#39;</span><span class='ace_paren ace_rparen'>)</span><span class='ace_punctuation ace_operator'>;</span>
</div><div class='ace_line'>
</div><div class='ace_line'><span class='ace_identifier'>loadHext</span><span class='ace_paren ace_lparen'>(</span><span class='ace_paren ace_rparen'>)</span><span class='ace_punctuation ace_operator'>.</span><span class='ace_identifier'>then</span><span class='ace_paren ace_lparen'>(</span><span class='ace_identifier'>hext</span> <span class='ace_storage ace_type'>=></span> <span class='ace_paren ace_lparen'>{</span>
</div><div class='ace_line'>  <span class='ace_storage ace_type'>const</span> <span class='ace_identifier'>html</span> <span class='ace_keyword ace_operator'>=</span> <span class='ace_keyword'>new</span> <span class='ace_identifier'>hext</span><span class='ace_punctuation ace_operator'>.</span><span class='ace_identifier'>Html</span><span class='ace_paren ace_lparen'>(</span><span class='ace_string'>&#34;&#60;ul>&#60;li>Hello&#60;/li>&#60;li>World&#60;/li>&#60;/ul>&#34;</span><span class='ace_paren ace_rparen'>)</span><span class='ace_punctuation ace_operator'>;</span>
</div><div class='ace_line'>  <span class='ace_storage ace_type'>const</span> <span class='ace_identifier'>rule</span> <span class='ace_keyword ace_operator'>=</span> <span class='ace_keyword'>new</span> <span class='ace_identifier'>hext</span><span class='ace_punctuation ace_operator'>.</span><span class='ace_identifier'>Rule</span><span class='ace_paren ace_lparen'>(</span><span class='ace_string'>&#34;&#60;li @text:my_text />&#34;</span><span class='ace_paren ace_rparen'>)</span><span class='ace_punctuation ace_operator'>;</span>
</div><div class='ace_line'>  <span class='ace_storage ace_type'>const</span> <span class='ace_identifier'>result</span> <span class='ace_keyword ace_operator'>=</span> <span class='ace_identifier'>rule</span><span class='ace_punctuation ace_operator'>.</span><span class='ace_identifier'>extract</span><span class='ace_paren ace_lparen'>(</span><span class='ace_identifier'>html</span><span class='ace_paren ace_rparen'>)</span><span class='ace_punctuation ace_operator'>.</span><span class='ace_identifier'>map</span><span class='ace_paren ace_lparen'>(</span><span class='ace_identifier'>x</span> <span class='ace_storage ace_type'>=></span> <span class='ace_identifier'>x</span><span class='ace_punctuation ace_operator'>.</span><span class='ace_identifier'>my_text</span><span class='ace_paren ace_rparen'>)</span><span class='ace_punctuation ace_operator'>.</span><span class='ace_support ace_function'>join</span><span class='ace_paren ace_lparen'>(</span><span class='ace_string'>&#34;, &#34;</span><span class='ace_paren ace_rparen'>)</span><span class='ace_punctuation ace_operator'>;</span>
</div><div class='ace_line'>  <span class='ace_storage ace_type'>console</span><span class='ace_punctuation ace_operator'>.</span><span class='ace_support ace_function ace_firebug'>log</span><span class='ace_paren ace_lparen'>(</span><span class='ace_identifier'>result</span><span class='ace_paren ace_rparen'>)</span><span class='ace_punctuation ace_operator'>;</span> <span class='ace_comment'>// &#34;Hello, World&#34;</span>
</div><div class='ace_line'><span class='ace_paren ace_rparen'>})</span><span class='ace_punctuation ace_operator'>;</span>
</div></div></div>