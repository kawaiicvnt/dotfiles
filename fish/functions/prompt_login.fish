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
    #if test "$(string match -r '^tbx_' $hostname)" = 'tbx_'
    set -l hostname_name $hostname
    if test $hostname = 'toolbx'
        # Check if we're in a toolbox
        if test -e "/run/.containerenv"
            and test $hostname = "toolbx"
          set -x hostname_name $(grep "name=\"" /run/.containerenv | sed 's/name=\"//; s/.$//; s/-/_/')
        end
        set hostname_icon " "
        set color_host "bbffee" # cyan-ish I guess lmao
    end

    # Our most used computers get their own special color
    switch $hostname
        case "sylveon"
            set color_host "#ddddff"
        case "espeon"
            set color_host "#bbffbb"
    end

    if test $hostname_name = $hostname
        set hostname_name (prompt_hostname)
    end

    # If we're root, make the color *known*
    # If we're our known user abbreviate to kc
    set -l user_color $fish_color_user
    set -l user_name $USER
    switch $user_name
      case "root"
        set user_color $fish_color_user_root
      case "kawaiicvnt"
        set user_color "#c0ffc0"
        set user_name "kc"
    end

    echo -ns (prompt_block $color_host "$hostname_icon$hostname_name")
    #echo -ns (prompt_block $user_color "$user_name")
    echo -ns (set_color normal)
end

#
