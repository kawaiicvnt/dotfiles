{
  pkgs,
  host,
  username,
  config,
  ...
}: let
  inherit
    (import ../../../hosts/${host}/variables.nix)
    extraMonitorSettings
    ;
  mod = "SUPER";
  fileManager = "dolphin";
  menu = "rofi -show dmenu";
in {
  wayland.windowManager.hyprland = {
    settings = {
      exec-once = [
        "dbus-update-activation-environment --all --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "killall -q swww;sleep .5 && swww init"
        "killall -q waybar;sleep .5 && waybar"
        "nm-applet --indicator"
        "${pkgs.kdePackages.polkit-kde-agent-1}/libexec/polkit-kde-agent-1"
        "dunst &"
        "sleep 1.5 && swww img /home/${username}/Pictures/misc/wallpaper-rotation/wallpaper.png"
      ];

      input = {
        kb_layout = "us,gr";
        kb_options = [
          "grp:win_space_toggle,grp:caps_toggle"
        ];
        numlock_by_default = true;
        repeat_delay = 300;
        follow_mouse = 1;
        sensitivity = -0.1;
        accel_profile = "flat";
        touchpad = {
          natural_scroll = true;
          clickfinger_behavior = true;
          disable_while_typing = true;
          scroll_factor = 0.67;
        };
      };

      device = {
        name = "syna32cf:00-06cb:cecd-touchpad";
        sensitivity = -0.25;
        accel_profile = "adaptive";
      };
      #device = {
      #  name = "epic-mouse-v1";
      #  sensitivity = -0.5;
      #};

      general = {
        "$modifier" = "SUPER";
        layout = "dwindle";
        gaps_in = 5;
        gaps_out = 5;
        border_size = 2;
        resize_on_border = false;
        allow_tearing = false;
        "col.active_border" = "rgba(66aaff88) rgba(44ff9988) rgba(ffaaff88) 35deg";
        "col.inactive_border" = "rgba(66aaff55) rgba(44ff9955) rgba(ffaaff55) 35deg";
      };

      misc = {
        force_default_wallpaper = -1;
        disable_hyprland_logo = true;
        font_family = "icomoon-feather, Monospace";
        vrr = 1;
        enable_swallow = true;
        swallow_regex = ^((K|k)itty|.*\.(G|g)hostty|XTerm|UXTerm)$;
        new_window_takes_over_fullscreen = 2;
        layers_hog_keyboard_focus = true;
        initial_workspace_tracking = 0;
        mouse_move_enables_dpms = true;
        key_press_enables_dpms = false;
        disable_splash_rendering = true;
      };

      master = {
        new_status = "master";
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      decoration = {
        rounding = 4;
        active_opacity = 0.85;
        inactive_opacity = 0.75;

        dim_inactive = true;
        dim_strength = 0.1;

        blur = {
          enabled = true;
          size = 12;
          noise = 0.5;
          passes = 2;
          xray = false;
          brightness = 0.325;
          contrast = 0.625;
          vibrancy = 0.05;
          vibrancy_darkness = 1;
        };

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aaa)";
        };
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_touch = true;
        workspace_swipe_min_fingers = true;
      };

      xwayland = {
        force_zero_scaling = true;
      };

      cursor = {
        inactive_timeout = 15;
      };

      bindl = [
        ", switch:on:Lid, exec:hyprctl keyword monitor \"eDP-1, disable\""
        ", switch:off:Lid, exec:hyprctl keyword monitor \"eDP-1, enable\""
      ];

      bind = [
        "${mod}, R, exec, cd /home/${username}/Pictures/misc/wallpaper-rotation && ./getrandomwallpaper.sh && swww img /home/${username}/Pictures/misc/wallpaper-rotation/wallpaper.png && cd"
        "${mod}, L, exec, hyprlock"
        "${mod}, O, exec, killall -SIGUSR1 waybar"
        "${mod} SHIFT, T, exec, kill -9 $(ps aux | grep waybar | grep -v grep | awk '{print $2}') ; waybar -c $HOME/.config/waybar/config.jsonc"
        "${mod}, E, exec, ${fileManager}"
        "${mod}, tab, togglefloating"
        "${mod}, D, exec, ${menu}"
        "${mod}, P, pseudo"
        "${mod}, J, togglesplit"
        "${mod}, F, fullscreen"
        "${mod}, left, movefocus, l"
        "${mod}, right, movefocus, r"
        "${mod}, up, movefocus, u"
        "${mod}, down, movefocus, d"
        "${mod}, 1, workspace, 1"
        "${mod}, 2, workspace, 2"
        "${mod}, 3, workspace, 3"
        "${mod}, 4, workspace, 4"
        "${mod}, 5, workspace, 5"
        "${mod}, 6, workspace, 6"
        "${mod}, 7, workspace, 7"
        "${mod}, 8, workspace, 8"
        "${mod}, 9, workspace, 9"
        "${mod}, 0, workspace, 10"
        "${mod} SHIFT, 1, movetoworkspace, 1"
        "${mod} SHIFT, 2, movetoworkspace, 2"
        "${mod} SHIFT, 3, movetoworkspace, 3"
        "${mod} SHIFT, 4, movetoworkspace, 4"
        "${mod} SHIFT, 5, movetoworkspace, 5"
        "${mod} SHIFT, 6, movetoworkspace, 6"
        "${mod} SHIFT, 7, movetoworkspace, 7"
        "${mod} SHIFT, 8, movetoworkspace, 8"
        "${mod} SHIFT, 9, movetoworkspace, 9"
        "${mod} SHIFT, 0, movetoworkspace, 10"
        "${mod}, S, togglespecialworkspace, magic"
        "${mod} SHIFT, S, movetoworkspace, special:magic"
        "${mod}, mouse_down, workspace, e+1"
        "${mod}, mouse_up, workspace, e-1"
      ];

      bindm = [
        "${mod}, mouse:272, movewindow"
        "${mod}, mouse:273, resizewindow"
      ];

      unbind = [
        "ALT, 0"
      ];

      # bindel = {
      #   ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
      #   ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      #   ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      #   ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      #   ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
      #   ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
      # };

      animations = {
        enabled = true;
        bezier = [
          "wind, 0.05, 0.9, 0.1, 1.05"
          "winIn, 0.1, 1.1, 0.1, 1.1"
          "winOut, 0.3, -0.3, 0, 1"
          "liner, 1, 1, 1, 1"
          "easeOutQuint, 0.23, 1, 0.32, 1"
          "easeInOutCubic, 0.65, 0.05, 0.36, 1"
          "linear, 0, 0, 1, 1"
          "almostLinear, 0.5, 0.5, 0.75, 1.0"
          "quick, 0.15, 0, 0.1, 1"
        ];
        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, almostLinear, fade"
          "workspacesIn, 1, 1.21, almostLinear, fade"
          "workspacesOut, 1, 1.94, almostLinear, fade"
        ];
      };

      windowrulev2 = [
        # "tag +file-manager, class:^([Tt]hunar|org.gnome.Nautilus|[Pp]cmanfm-qt)$"
        # "tag +terminal, class:^(Alacritty|kitty|kitty-dropterm)$"
        # "tag +browser, class:^(Brave-browser(-beta|-dev|-unstable)?)$"
        # "tag +browser, class:^([Ff]irefox|org.mozilla.firefox|[Ff]irefox-esr)$"
        # "tag +browser, class:^([Gg]oogle-chrome(-beta|-dev|-unstable)?)$"
        # "tag +browser, class:^([Tt]horium-browser|[Cc]achy-browser)$"
        # "tag +projects, class:^(codium|codium-url-handler|VSCodium)$"
        # "tag +projects, class:^(VSCode|code-url-handler)$"
        # "tag +im, class:^([Dd]iscord|[Ww]ebCord|[Vv]esktop)$"
        # "tag +im, class:^([Ff]erdium)$"
        # "tag +im, class:^([Ww]hatsapp-for-linux)$"
        # "tag +im, class:^(org.telegram.desktop|io.github.tdesktop_x64.TDesktop)$"
        # "tag +im, class:^(teams-for-linux)$"
        # "tag +games, class:^(gamescope)$"
        # "tag +games, class:^(steam_app_\d+)$"
        # "tag +gamestore, class:^([Ss]team)$"
        # "tag +gamestore, title:^([Ll]utris)$"
        # "tag +gamestore, class:^(com.heroicgameslauncher.hgl)$"
        # "tag +settings, class:^(gnome-disks|wihotspot(-gui)?)$"
        # "tag +settings, class:^([Rr]ofi)$"
        # "tag +settings, class:^(file-roller|org.gnome.FileRoller)$"
        # "tag +settings, class:^(nm-applet|nm-connection-editor|blueman-manager)$"
        # "tag +settings, class:^(pavucontrol|org.pulseaudio.pavucontrol|com.saivert.pwvucontrol)$"
        # "tag +settings, class:^(nwg-look|qt5ct|qt6ct|[Yy]ad)$"
        # "tag +settings, class:(xdg-desktop-portal-gtk)"
        # "move 72% 7%,title:^(Picture-in-Picture)$"
        # "center, class:^([Ff]erdium)$"
        # "center, class:^(pavucontrol|org.pulseaudio.pavucontrol|com.saivert.pwvucontrol)$"
        # "center, class:([Tt]hunar), title:negative:(.*[Tt]hunar.*)"
        # "center, title:^(Authentication Required)$"
        # "idleinhibit fullscreen, class:^(*)$"
        # "idleinhibit fullscreen, title:^(*)$"
        # "idleinhibit fullscreen, fullscreen:1"
        # "float, tag:settings*"
        # "float, class:^([Ff]erdium)$"
        # "float, title:^(Picture-in-Picture)$"
        # "float, class:^(mpv|com.github.rafostar.Clapper)$"
        # "float, title:^(Authentication Required)$"
        # "float, class:(codium|codium-url-handler|VSCodium), title:negative:(.*codium.*|.*VSCodium.*)"
        # "float, class:^(com.heroicgameslauncher.hgl)$, title:negative:(Heroic Games Launcher)"
        # "float, class:^([Ss]team)$, title:negative:^([Ss]team)$"
        # "float, class:([Tt]hunar), title:negative:(.*[Tt]hunar.*)"
        # "float, initialTitle:(Add Folder to Workspace)"
        # "float, initialTitle:(Open Files)"
        # "float, initialTitle:(wants to save)"
        # "size 70% 60%, initialTitle:(Open Files)"
        # "size 70% 60%, initialTitle:(Add Folder to Workspace)"
        # "size 70% 70%, tag:settings*"
        # "size 60% 70%, class:^([Ff]erdium)$"
        # "opacity 1.0 1.0, tag:browser*"
        # "opacity 0.9 0.8, tag:projects*"
        # "opacity 0.94 0.86, tag:im*"
        # "opacity 0.9 0.8, tag:file-manager*"
        # "opacity 0.8 0.7, tag:terminal*"
        # "opacity 0.8 0.7, tag:settings*"
        # "opacity 0.8 0.7, class:^(gedit|org.gnome.TextEditor|mousepad)$"
        # "opacity 0.9 0.8, class:^(seahorse)$ # gnome-keyring gui"
        # "opacity 0.95 0.75, title:^(Picture-in-Picture)$"
        "suppressevent maximize, class:.*"
        "nofocus, class:^$, title:^$, xwayland:1, floating:1, fullscreen:0, pinned:0"
        "float, class:^(galculator)$, title:^(galculator)$"
        "pin, title:^(Picture-in-Picture)$"
        "keepaspectratio, title:^(Picture-in-Picture)$"
        "noblur, tag:games*"
        "fullscreen, tag:games*"
      ];

      env = [
        "XCURSOR_SIZE, 24"
        "HYPRCURSOR_SIZE, 24"
        "NIXOS_OZONE_WL, 1"
        "NIXPKGS_ALLOW_UNFREE, 1"
        "XDG_CURRENT_DESKTOP, Hyprland"
        "XDG_SESSION_TYPE, wayland"
        "XDG_SESSION_DESKTOP, Hyprland"
        "GDK_BACKEND, wayland, x11"
        "CLUTTER_BACKEND, wayland"
        "QT_QPA_PLATFORM=wayland;xcb"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION, 1"
        "QT_AUTO_SCREEN_SCALE_FACTOR, 1"
        "SDL_VIDEODRIVER, x11"
        "MOZ_ENABLE_WAYLAND, 1"
        "AQ_DRM_DEVICES,/dev/dri/card0:/dev/dri/card1"
        "GDK_SCALE,1"
        "QT_SCALE_FACTOR,1"
        "EDITOR,nvim"
      ];
    };

    extraConfig = "
      monitor=,preferred,auto,auto
      ${extraMonitorSettings}
    ";
  };
}
