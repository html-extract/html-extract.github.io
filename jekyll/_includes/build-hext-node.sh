<div class='ace-clouds'><div class='ace_static_highlight' style='counter-reset:ace_line 0'><div class='ace_line'><span class='ace_comment'># relative to the project root</span>
</div><div class='ace_line'><span class='ace_support ace_function ace_builtin'>cd</span> <span class='ace_identifier'>libhext</span><span class='ace_keyword ace_operator'>/</span><span class='ace_identifier'>bindings</span><span class='ace_keyword ace_operator'>/</span><span class='ace_identifier'>nodejs</span>
</div><div class='ace_line'><span class='ace_comment'># install nan (only required for building)</span>
</div><div class='ace_line'><span class='ace_identifier'>npm</span> <span class='ace_identifier'>install</span> <span class='ace_identifier'>nan</span> <span class='ace_keyword ace_operator'>--</span><span class='ace_identifier'>save</span>
</div><div class='ace_line'><span class='ace_comment'># install cmake-js globally (requires root)</span>
</div><div class='ace_line'><span class='ace_identifier'>npm</span> <span class='ace_identifier'>install</span> <span class='ace_identifier'>cmake</span><span class='ace_keyword ace_operator'>-</span><span class='ace_identifier'>js</span> <span class='ace_keyword ace_operator'>-</span><span class='ace_identifier'>g</span>
</div><div class='ace_line'><span class='ace_comment'># build the project</span>
</div><div class='ace_line'><span class='ace_identifier'>cmake</span><span class='ace_keyword ace_operator'>-</span><span class='ace_identifier'>js</span> <span class='ace_identifier'>build</span>
</div></div></div>