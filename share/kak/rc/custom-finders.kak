declare-option str find_edit_cmd %{ ls | xargs -I{} find {} -type f }
provide-module custom-finders %{
    define-command -params .. -docstring "grep symbol" symb %{ grep "\b%arg{@}\b" }
    define-command -params .. -docstring "grep with spaces" gr %{ grep "%arg{@}" }
    define-command -docstring "edit file from recursive search" file-edit -params 1 -shell-script-candidates %opt{find_edit_cmd} %{ edit %arg{1} }
    define-command -docstring "edit file from current git-worktree" git-edit -params 1 -shell-script-candidates %{ git ls-files --recurse-submodules } %{ edit %arg{1} }
}
