function prompt_login --description "display user name for the prompt"
    if not set -q __fish_machine
        set -g __fish_machine
        set -l debian_chroot $debian_chroot

        if test -r /etc/debian_chroot
            set debian_chroot (cat /etc/debian_chroot)
        end

        if set -q debian_chroot[1]
            and test -n "$debian_chroot"
            set -g __fish_machine "(chroot:$debian_chroot)"
        end
    end

    # Prepend the chroot environment if present
    if set -q __fish_machine[1]
        echo -n -s (set_color yellow) "$__fish_machine" (set_color normal) ' '
    end

    # If we're running via SSH, change the host name and color.
    set -l hostname_icon " "
    set -l color_host $fish_color_host
    if set -q SSH_TTY
        set hostname_icon " "
        set color_host $fish_color_host_remote
    end

    # If we're in a toolbox show the sibby icon
    if test "$(string match -r '^tbx_' $hostname)" = 'tbx_'
        set hostname_icon " "
    end

    # Our most used computers get their own special color
    switch $hostname
        case "sylveon"
            set color_host "#ccbbff" # lilac
        case "espeon"
            set color_host "#ffbbdd" # pink-ish
        case "umbreon"
            set color_host "#aaaaaa" # gray
        case "plantj"
            set color_host "#bbffbb" # light green
    end

    # If we're root, make the color *known*
    if test $fish_color_user = "root"
        set fish_color_user "#ff0000"
    end

    #echo -n -s (set_color $fish_color_param) "" (set_color $fish_color_user) "$USER" (set_color $fish_color_param) " >> " (set_color $color_host) (prompt_hostname) (set_color $fish_color_param) " >>" (set_color normal)
    echo -n -s (set_color $fish_color_param) "" " << " (set_color $color_host) "$hostname_icon " (prompt_hostname) (set_color $fish_color_param) " << " (set_color $fish_color_user) "$USER" (set_color normal)
end
