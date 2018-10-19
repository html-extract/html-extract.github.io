<div class='ace-clouds'><div class='ace_static_highlight' style='counter-reset:ace_line 0'><div class='ace_line'><span class='ace_comment'># Enable C++17</span>
</div><div class='ace_line'><span class='ace_identifier'>SET</span><span class='ace_paren ace_lparen'>(</span><span class='ace_identifier'>CMAKE_CXX_STANDARD</span> <span class='ace_constant ace_numeric'>17</span><span class='ace_paren ace_rparen'>)</span>
</div><div class='ace_line'><span class='ace_comment'># Load HextConfig.cmake</span>
</div><div class='ace_line'><span class='ace_identifier'>FIND_PACKAGE</span><span class='ace_paren ace_lparen'>(</span><span class='ace_identifier'>Hext</span> <span class='ace_identifier'>REQUIRED</span><span class='ace_paren ace_rparen'>)</span>
</div><div class='ace_line'><span class='ace_comment'># Add libhext's include directory</span>
</div><div class='ace_line'><span class='ace_identifier'>INCLUDE_DIRECTORIES</span><span class='ace_paren ace_lparen'>(</span>$<span class='ace_paren ace_lparen'>{</span><span class='ace_identifier'>HEXT_INCLUDE_DIR</span><span class='ace_paren ace_rparen'>})</span>
</div><div class='ace_line'><span class='ace_comment'># Link libhext</span>
</div><div class='ace_line'><span class='ace_identifier'>TARGET_LINK_LIBRARIES</span><span class='ace_paren ace_lparen'>(</span><span class='ace_identifier'>your</span><span class='ace_keyword ace_operator'>-</span><span class='ace_identifier'>target</span> $<span class='ace_paren ace_lparen'>{</span><span class='ace_identifier'>HEXT_LIBRARY</span><span class='ace_paren ace_rparen'>})</span>
</div></div></div>
