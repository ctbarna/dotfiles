function fish_prompt
    set_color --bold green
    echo -n -s "$USER@" (hostname) " "

    set_color --bold blue
    echo -n -s (prompt_pwd)

    # Show the dirty state.
    set -g __fish_git_prompt_showdirtystate 1

    # Handle untracked files.
    set -g __fish_git_prompt_showuntrackedfiles 1
    set -g __fish_git_prompt_char_untrackedfiles "+"
    set -g __fish_git_prompt_char_stateseparator ""

    set_color --bold yellow
    echo -n -s (__fish_git_prompt " %s")

    set_color normal
    echo " > "
end
