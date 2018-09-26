<div class='ace-clouds'><div class='ace_static_highlight' style='counter-reset:ace_line 0'><div class='ace_line'><span class='ace_comment'># optional: install the extension for local</span>
</div><div class='ace_line'><span class='ace_comment'># projects (requires root)</span>
</div><div class='ace_line'><span class='ace_support ace_function ace_builtin'>cd</span> <span class='ace_identifier'>libhext</span><span class='ace_keyword ace_operator'>/</span><span class='ace_identifier'>bindings</span><span class='ace_keyword ace_operator'>/</span><span class='ace_identifier'>nodejs</span>
</div><div class='ace_line'><span class='ace_identifier'>npm</span> <span class='ace_identifier'>link</span>
</div><div class='ace_line'><span class='ace_comment'># now npm cann pull hext into your projects</span>
</div><div class='ace_line'><span class='ace_support ace_function ace_builtin'>cd</span> <span class='ace_keyword ace_operator'>/</span><span class='ace_identifier'>path</span><span class='ace_keyword ace_operator'>/</span><span class='ace_identifier'>to</span><span class='ace_keyword ace_operator'>/</span><span class='ace_identifier'>your</span><span class='ace_keyword ace_operator'>/</span><span class='ace_identifier'>project</span>
</div><div class='ace_line'><span class='ace_identifier'>npm</span> <span class='ace_identifier'>link</span> <span class='ace_identifier'>hext</span>
</div><div class='ace_line'>
</div><div class='ace_line'><span class='ace_comment'># alternative: use the path from the repository</span>
</div><div class='ace_line'><span class='ace_support ace_function ace_builtin'>cd</span> <span class='ace_keyword ace_operator'>/</span><span class='ace_identifier'>path</span><span class='ace_keyword ace_operator'>/</span><span class='ace_identifier'>to</span><span class='ace_keyword ace_operator'>/</span><span class='ace_identifier'>your</span><span class='ace_keyword ace_operator'>/</span><span class='ace_identifier'>project</span>
</div><div class='ace_line'><span class='ace_identifier'>npm</span> <span class='ace_identifier'>install</span> \
</div><div class='ace_line'>  <span class='ace_keyword ace_operator'>/</span><span class='ace_identifier'>path</span><span class='ace_keyword ace_operator'>/</span><span class='ace_identifier'>to</span><span class='ace_keyword ace_operator'>/</span><span class='ace_identifier'>libhext</span><span class='ace_keyword ace_operator'>/</span><span class='ace_identifier'>bindings</span><span class='ace_keyword ace_operator'>/</span><span class='ace_identifier'>nodejs</span> <span class='ace_keyword ace_operator'>--</span><span class='ace_identifier'>save</span>
</div><div class='ace_line'><span class='ace_comment'># test loading hext</span>
</div><div class='ace_line'><span class='ace_identifier'>nodejs</span> <span class='ace_keyword ace_operator'>-</span><span class='ace_identifier'>e</span> <span class='ace_string'>"require('hext')"</span> &#38;&#38; <span class='ace_support ace_function ace_builtin'>echo</span> <span class='ace_string'>"It works!"</span>
</div></div></div>