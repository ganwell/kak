provide-module search-highlight %{
    set-face global Search white,yellow
    set-face global PrimarySelectionSearch white,red
    set-face global PrimarySelectionDefault white,blue

    define-command search-highlighter-enable -docstring 'Enable search highlighter' %{
      hook window -group search-highlighter NormalKey [/?*nN]|<a-[/?*nN]> %{ try %{
        add-highlighter window/search dynregex '%reg{/}' 0:Search
        search-highlighter-selection-enable
      }}
      hook window -group search-highlighter NormalKey <esc> %{ try %{
        remove-highlighter window/search
        search-highlighter-selection-disable
      }}
    }

    define-command search-highlighter-disable -docstring 'Disable search highlighter' %{
      remove-highlighter window/search
      remove-hooks window search-highlighter
      search-highlighter-selection-disable
    }

    define-command search-highlighter-selection-enable -docstring 'Enable main selection highlighting on search overlapping' %{
      hook window -group search-highlighter-selection NormalIdle .* %{ evaluate-commands %sh{
        if test -n "$kak_main_reg_slash"; then
          echo '
            try %{
              set-register X %reg{/}
              execute-keys -draft <a-k>\A<c-r>X\z<ret>
              set-face global PrimarySelection PrimarySelectionSearch
            } catch %{
              set-face global PrimarySelection PrimarySelectionDefault
            }
          '
        else
          echo set-face global PrimarySelection PrimarySelectionDefault
        fi
      }}
    }

    define-command search-highlighter-selection-disable -docstring 'Disable main selection highlighting on search overlapping' %{
      remove-hooks window search-highlighter-selection
      set-face global PrimarySelection PrimarySelectionDefault
    }
}
