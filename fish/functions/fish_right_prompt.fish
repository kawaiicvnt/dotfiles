function fish_right_prompt --description 'Write out the prompt'
    set -l last_status $status
    set -l normal (set_color normal)
    set -l status_color (set_color brgreen)
    set -l prompt_status ""

    # Since we display the prompt on a new line allow the directory names to be longer.
    #set -q fish_prompt_pwd_dir_length
    set -lx fish_prompt_pwd_dir_length 0

    # Color the prompt differently when we're root
    set -l suffix '❯'
    set -l cwd_color $fish_color_cwd
    if functions -q fish_is_root_user; and fish_is_root_user
       if set -q fish_color_cwd_root
           set cwd_color $fish_color_cwd_root
       end
       set suffix '#'
    end

    # Color the prompt in red on error
    if test $last_status -ne 0
        set status_color (set_color $fish_color_error)
        set prompt_status $status_color "[" $last_status "]" $normal
    end

    set -l cwd_text
    if test $COLUMNS -gt 100
        set cwd_text (prompt_pwd) '' (prompt_login) '' $normal '' $prompt_status
    else
        set cwd_text $(echo $PWD | sed 's/.*\///g') (prompt_login) '' $normal '' $prompt_status
    end

    echo -ns (prompt_block $fish_color_vcs " "(string sub -s3 -e-1 (fish_vcs_prompt)))
    echo -ns (prompt_block $cwd_color $cwd_text)
    echo -ns (prompt_login)
end
