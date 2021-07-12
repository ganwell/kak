provide-module core-aliases %{
    define-command -docstring "split horizontal" split-horizontal %{tmux-terminal-horizontal kak -c %val{session}}
    define-command -docstring "split vertical" split-vertical %{tmux-terminal-vertical kak -c %val{session}}
    alias global sh split-horizontal
    alias global sv split-vertical
    alias global ae autowrap-enable
    alias global ad autowrap-disable
}
