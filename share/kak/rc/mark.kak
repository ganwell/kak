provide-module color-mark %{
    declare-option int color_mark_index 0
    set-face global ColorMark0 rgb:FF7F00+rb
    set-face global ColorMark1 rgb:0095FF+rb
    set-face global ColorMark2 rgb:FF00AA+rb
    set-face global ColorMark3 rgb:6AFF00+rb
    set-face global ColorMark4 rgb:00EAFF+rb
    set-face global ColorMark5 rgb:AA00FF+rb
    set-face global ColorMark6 rgb:8F2323+rb
    set-face global ColorMark7 rgb:23628F+rb
    set-face global ColorMark8 rgb:8F6A23+rb
    set-face global ColorMark9 rgb:6B238F+rb
    set-face global ColorMark10 rgb:0040FF+rb
    set-face global ColorMark11 rgb:DDD400+rb

    set-face global ColorMark12 rgb:FF7F00+b
    set-face global ColorMark13 rgb:0095FF+b
    set-face global ColorMark14 rgb:FF00AA+b
    set-face global ColorMark15 rgb:6AFF00+b
    set-face global ColorMark16 rgb:00EAFF+b
    set-face global ColorMark17 rgb:AA00FF+b
    set-face global ColorMark18 rgb:8F2323+b
    set-face global ColorMark19 rgb:23628F+b
    set-face global ColorMark20 rgb:8F6A23+b
    set-face global ColorMark21 rgb:6B238F+b
    set-face global ColorMark22 rgb:0040FF+b
    set-face global ColorMark23 rgb:DDD400+b

    define-command mark-cursor -docstring 'mark word under cursor' %{
        execute-keys "Z<A-i>w:mark-word %%val{selection}<ret>z"
    }

    define-command mark -params 1 -docstring 'add a mark' %{
        mark-set %opt{color_mark_index} %arg{1}
        set-option window color_mark_index %sh{ printf "%d" $(((kak_opt_color_mark_index+25)%24)) }
    }

    define-command mark-normal -docstring 'jump to normal marks' %{
        set-option window color_mark_index 12
    }

    define-command mark-reverse -docstring 'jump to reverse marks' %{
        set-option window color_mark_index 0
    }

    define-command mark-word -params 1 -docstring 'add a mark as word-regex' %{
        mark-set %opt{color_mark_index} "\b%arg{1}\b"
        set-option window color_mark_index %sh{ printf "%d" $(((kak_opt_color_mark_index+25)%24)) }
    }

    define-command mark-pop -docstring 'pop a mark' %{
        set-option window color_mark_index %sh{ printf "%d" $(((kak_opt_color_mark_index+23)%24)) }
        mark-remove %opt{color_mark_index}
    }

    define-command mark-set -params 2 -docstring 'set a mark' %{
        remove-highlighter "window/color-mark-%arg{1}"
        add-highlighter -override "window/color-mark-%arg{1}" regex %arg{2} "0:ColorMark%arg{1}" "1:ColorMark%arg{1}"    }

    define-command mark-remove -params 1 -docstring 'remove a mark' %{
        remove-highlighter "window/color-mark-%arg{1}"
    }

    define-command mark-clear -docstring 'remove all marks' %{
        evaluate-commands %sh{
            for x in $(seq 0 23); do
                printf "mark-remove %d\n" $x
            done
        }
        set-option window color_mark_index 0
    }
}
