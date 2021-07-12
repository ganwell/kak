provide-module snippets %{
    map global insert <A-i> -docstring "Execute word before cursor" '<esc>h<A-i>w"xd:snippet-<C-r>x<ret>'
    define-command -docstring "pdb set_trace snippet" snippet-pdb %{ exec "i__import__('pdb').set_trace()" }
    define-command -docstring "ipdb set_trace snippet" snippet-ipdb %{ exec "i__import__('ipdb').set_trace()" }
    define-command -docstring "ipdb sset_trace snippet" snippet-sipdb %{ exec "i__import__('ipdb').sset_trace()" }
    define-command -docstring "error_log snippet" snippet-error %{ exec 'ierror_log(var_export(, True) . "\n", 3, "/tmp/my-errors.log");<esc><A-t>(;' }
    define-command -docstring "remote set_trace snippet" snippet-rdb %{ exec "i__import__('remote_pdb').RemotePdb('127.0.0.1', 4444).set_trace()" }
    define-command -docstring "open remote set_trace snippet" snippet-ordb %{ exec "i__import__('remote_pdb').RemotePdb('0.0.0.0', 4444).set_trace()" }
}
