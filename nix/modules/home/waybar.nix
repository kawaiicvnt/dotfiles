{
  pkgs,
  lib,
  host,
  config,
  ...
}: let
  betterTransition = "all 0.3s cubic-bezier(.55,-0.68,.48,1.682)";
  inherit (import ../../hosts/${host}/variables.nix) clock24h;
in
  with lib; {
    # Configure & Theme Waybar
    programs.waybar = {
      enable = true;
      package = pkgs.waybar;
      settings = [
        {
          layer = "bottom";
          position = "top";
          height = 30;
          spacing = 0;
          margin-top = 5;
          margin-bottom = 5;
          margin-left = 5;
          modules-center = ["hyprland/workspaces"];
          modules-left = [
            "clock"
            "battery"
            "idle_inhibitor"
        	"hyprland/workspaces"
        	"hyprland/scratchpad"
	        "custom/rot-0"
        	"custom/rot-180"
          ];
          modules-right = [
            "pulseaudio"
            "network"
            "bluetooth"
            "power-profiles-daemon"
            "cpu"
            "memory"
            "temperature"
            "backlight"
            "sway/language"
            "hyprland/language"
            "tray"
          ];

          "hyprland/workspaces" = {
            format = "{name}";
            # format-icons = {
            #   default = " ";
            #   active = " ";
            #   urgent = " ";
            # };
            on-scroll-up = "hyprctl dispatch workspace e+1";
            on-scroll-down = "hyprctl dispatch workspace e-1";
          };
          "clock" = {
            format =
              if clock24h == true
              then '' {:L%H:%M}''
              else '' {:L%I:%M %p}'';
            tooltip = true;
            tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
            format-alt = "{:%Y-%m-%d %H:%M}";
          };
          "hyprland/window" = {
            max-length = 50;
            separate-outputs = false;
            rewrite = {
              "" = " 🙈 No Bitches?! ";
            };
          };
          "memory" = {
            interval = 5;
            format = " {}%";
            tooltip = true;
          };
          "cpu" = {
            interval = 5;
            format = " {usage:2}%";
            tooltip = true;
          };
          "disk" = {
            format = " {free}";
            tooltip = true;
          };
          "tray" = {
            spacing = 10;
          };
          "pulseaudio" = {
            format = "{icon} {volume}% {format_source}";
            format-bluetooth = "{volume}% {icon} {format_source}";
            format-bluetooth-muted = " {icon} {format_source}";
            format-muted = " {format_source}";
            format-source = " {volume}%";
            format-source-muted = "";
            format-icons = {
              headphone = "";
              hands-free = "";
              headset = "";
              phone = "";
              portable = "";
              car = "";
              default = [
                ""
                ""
                ""
              ];
            };
            on-click = "sleep 0.1 && pavucontrol";
          };
          "custom/exit" = {
            tooltip = false;
            format = "";
            on-click = "sleep 0.1 && wlogout";
          };
          "custom/startmenu" = {
            tooltip = false;
            format = "";
            # exec = "rofi -show drun";
            on-click = "sleep 0.1 && rofi-launcher";
          };
          "custom/hyprbindings" = {
            tooltip = false;
            format = "󱕴";
            on-click = "sleep 0.1 && list-keybinds";
          };
          "idle_inhibitor" = {
            format = "{icon}";
            format-icons = {
              activated = "";
              deactivated = "";
            };
            tooltip = "true";
          };
          "custom/notification" = {
            tooltip = false;
            format = "{icon} {}";
            format-icons = {
              notification = "<span foreground='red'><sup></sup></span>";
              none = "";
              dnd-notification = "<span foreground='red'><sup></sup></span>";
              dnd-none = "";
              inhibited-notification = "<span foreground='red'><sup></sup></span>";
              inhibited-none = "";
              dnd-inhibited-notification = "<span foreground='red'><sup></sup></span>";
              dnd-inhibited-none = "";
            };
            return-type = "json";
            exec-if = "which swaync-client";
            exec = "swaync-client -swb";
            on-click = "sleep 0.1 && task-waybar";
            escape = true;
          };
          "custom/rot-0" = {
            tooltip = false;
            format = "";
            on-click = "sleep 0.1 && hyprctl dispatch rotate 0";
          };
          "custom/rot-90" = {
            tooltip = false;
            format = "";
            on-click = "sleep 0.1 && hyprctl dispatch rotate 90";
          };
          "battery" = {
            states = {
              warning = 30;
              critical = 15;
            };
            format = "{icon} {capacity}%";
            format-charging = "󰂄 {capacity}%";
            format-plugged = "󱘖 {capacity}%";
            format-icons = [
              "󰁺"
              "󰁻"
              "󰁼"
              "󰁽"
              "󰁾"
              "󰁿"
              "󰂀"
              "󰂁"
              "󰂂"
              "󰁹"
            ];
            on-click = "";
            tooltip = false;
          };
          "backlight" = {
            format = "{icon} {percent}%";
            format-icons = [""
                            ""
                            ""
                            ""
                            ""
                            ""
                            ""
                            ""
                            ""
                            ];
            tooltip = false;
          };
          "temperature" = {
            format = " {temp}°C";
            tooltip = false;
          };
          "power-profiles-daemon" = {
            format = "{icon} {profile}";
            format-icons = {
              balanced = "";
              performance = "";
              powersave = "";
            };
            tooltip = false;
          };
          "bluetooth" = {
            format = "{icon} {device}";
            format-icons = {
              connected = "C";
              disconnected = "D";
            };
            tooltip = true;
          };
          "network" = {
            format-icons = [
              "󰤯"
              "󰤟"
              "󰤢"
              "󰤥"
              "󰤨"
            ];
            format-ethernet = " {bandwidthDownOctets}";
            format-wifi = "{icon} {signalStrength}% | {essid}";
            format-linked = "{ifname} (No IP)";
            format-alt = "{ifname}: {ipaddr}/{cidr}";
            format-disconnected = "󰤮";
            tooltip = true;
            tooltip-format = "Net: {gwaddr}/{cidr}\nVia: {ifname} on {essid}\nIP: {ipaddr}";
            max-length = 30;
          };
          "custom/media" = {
            format = "{icon} {artist} - {title}";
            return-type = "json";
            max-length = 50;
            exec-if = "which playerctl";
            format-icons = {
              play = "";
              pause = "";
              stop = "";
              next = "";
              previous = "";
            };
            escape = true;
            exec = "playerctl metadata --format '{{\"artist\":\"{artist}\",\"title\":\"{title}\",\"icon\":\"{icon}\"}}'";
            tooltip = false;
          };
        }
      ];
      style = [ # = concatStrings [
        ''
          * {
              /* `otf-font-awesome` is required to be installed for icons */
              font-family: "icomoon-feather, Monospace"; /*, FontAwesome, Roboto, Helvetica, Arial, sans-serif*/;
              font-size: 12px;
              border-radius: 3px;
          }

          window#waybar {
              background-image: linear-gradient(150deg, rgba(0, 0, 0, 0), rgba(0,0,0,0.375), rgba(0,0,0,0)), linear-gradient(30deg, rgba(30, 100, 60, 0.67), rgba(50, 125, 175, 0.67));
              border-bottom: 3px solid rgba(200, 200, 200, 0.8);
              border-radius: 5px;
              
              /*overflow: hidden;*/
              color: #ffffff;
              transition-property: background-color;
              transition-duration: .5s;
          }

          window#waybar.hidden {
              opacity: 0.2;
          }

          /*
          window#waybar.empty {
              background-color: transparent;
          }
          window#waybar.solo {
              background-color: #FFFFFF;
          }
          */

          window#waybar.termite {
              background-color: #373b3e;
          }

          window#waybar.chromium {
              background-color: #000000;
              border: none;
          }

          button {
              /* Use box-shadow instead of border so the text isn't offset */
              box-shadow: inset 0 -3px transparent;
              /* Avoid rounded borders under each button name */
              border: none;
              border-radius: 0;
          }

          /* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
          button:hover {
              background: inherit;
              box-shadow: inset 0 -3px #ffffff;
          }

          label.module{
              background-color: rgba(100, 155, 152, 0.3);
          }

          /* you can set a style on hover for any module like this */
          label.module:hover {
              background-color: rgba(100, 155, 152, 0.5);
          }

          #workspaces button {
              padding: 0 5px;
              background-color: transparent;
              color: #ffffff;
          }

          #workspaces button:hover {
              background: rgba(25, 27, 32, 0.6);
          }

          #workspaces button.focused {
              background-color: rgba(38, 40, 46, 0.6);
              box-shadow: inset 0 -3px #ffffff;
          }

          #workspaces button.active {
              background-color: rgba(38, 40, 46, 0.6);
              box-shadow: inset 0 -3px #ffffff;
          }

          #workspaces button.urgent {
              background-color: #e12885;
          }

          #mode {
              background-color: #373b3e;
              box-shadow: inset 0 -3px #ffffff;
          }

          #clock,
          #battery,
          #cpu,
          #memory,
          #disk,
          #temperature,
          #backlight,
          #network,
          #pulseaudio,
          #wireplumber,
          #custom-media,
          #tray,
          #mode,
          #idle_inhibitor,
          #scratchpad,
          #power-profiles-daemon,
          #mpd,
          #bluetooth {
              padding: 0 10px;
              color: #ffffff;
          }

          #window,
          #workspaces {
              margin: 0 4px;
          }

          /* If workspaces is the leftmost module, omit left margin */
          .modules-left > widget:first-child > #workspaces {
              margin-left: 0;
          }

          /* If workspaces is the rightmost module, omit right margin */
          .modules-right > widget:last-child > #workspaces {
              margin-right: 0;
          }
          /*
          #clock {
              background-color: #64727D;
          }*/
          /*
          #battery {
              background-color: #ffffff;
              color: #000000;
          }

          #battery.charging, #battery.plugged {
              color: #ffffff;
              background-color: #26A65B;
          }
          */
          @keyframes blink {
              to {
                  background-color: rgba(134, 206, 203, 0.5);
                  color: #ffffff;
              }
          }

          /* Using steps() instead of linear as a timing function to limit cpu usage */
          #battery.critical:not(.charging) {
              background-color: #e12885;
              color: #ffffff;
              animation-name: blink;
              animation-duration: 1s;
              animation-timing-function: steps(12);
              animation-iteration-count: infinite;
              animation-direction: alternate;
          }

          #power-profiles-daemon {
              padding-right: 15px;
          }

          #power-profiles-daemon.performance {
              background-color: rgba(165, 40, 130, 0.3);
              color: #ffffff;
          }

          #power-profiles-daemon.performance:hover {
              background-color: rgba(165, 40, 130, 0.5);
              color: #ffffff;
          }

          #power-profiles-daemon.balanced {
              background-color: rgba(100, 155, 152, 0.3);
              color: #ffffff;
          }

          #power-profiles-daemon.balanced:hover {
              background-color: rgba(100, 155, 152, 0.5);
              color: #ffffff;
          }

          #power-profiles-daemon.power-saver {
              background-color: rgba(23, 135, 135, 0.3);
              color: #ffffff;
          }


          #power-profiles-daemon.power-saver:hover {
              background-color: rgba(44, 135, 135, 0.5);
              color: #ffffff;
          }

          label:focus {
              background-color: #000000;
          }
          /*
          #cpu {
          }

          #memory {
              background-color: #9b59b6;
          }

          #disk {
              background-color: #964B00;
          }

          #backlight {
              background-color: #90b1b1;
          }

          #network {
              background-color: #2980b9;
          }

          #network.disconnected {
              background-color: #f53c3c;
          }

          #pulseaudio {
              background-color: #f1c40f;
              color: #000000;
          }

          #pulseaudio.muted {
              background-color: #90b1b1;
              color: #2a5c45;
          }

          #wireplumber {
              background-color: #fff0f5;
              color: #000000;
          }

          #wireplumber.muted {
              background-color: #f53c3c;
          }

          #custom-media {
              background-color: #66cc99;
              color: #2a5c45;
              min-width: 100px;
          }
          */
          #custom-media.custom-spotify {
              background-color: rgba(100, 155, 152, 0.3);
          }
          /*
          #custom-media.custom-vlc {
              background-color: #ffa000;
          }

          #temperature {
              background-color: #f0932b;
          }

          #temperature.critical {
              background-color: #eb4d4b;
          }
          */
          #tray {
              background-color: rgba(100, 155, 152, 0.3);
          }

          #tray:hover {
              background-color: rgba(100, 155, 152, 0.5);
          }
          /*
          #tray > .passive {
              -gtk-icon-effect: dim;
          }*/

          #tray > .needs-attention {
              -gtk-icon-effect: highlight;
              background-color: #e12885;
          }

          #idle_inhibitor {
              min-width: 2px;
          }

          /*
          #mpd {
              background-color: #66cc99;
              color: #2a5c45;
          }

          #mpd.disconnected {
              background-color: #f53c3c;
          }

          #mpd.stopped {
              background-color: #90b1b1;
          }

          #mpd.paused {
              background-color: #51a37a;
          }*/

          #language {
              /*background: #00b093;*/
              padding: 0 8px;
              margin: 0 0px;
              min-width: 0px;
          }

          #keyboard-state {
              /*background: #97e1ad;*/
              color: #000000;
              padding: 0 0px;
              margin: 0 0px;
              min-width: 16px;
          }

          #keyboard-state > label {
              padding: 0 5px;
          }

          #keyboard-state > label.locked {
              background: rgba(0, 0, 0, 0.2);
          }

          #scratchpad {
              background: rgba(0, 0, 0, 0);
          }

          #scratchpad.empty {
              background-color: transparent;
          }

          #privacy {
              padding: 0;
          }

          #privacy-item {
              padding: 0 5px;
              color: white;
          }

          #privacy-item.screenshare {
              background-color: #cf5700;
          }

          #privacy-item.audio-in {
              background-color: #1ca000;
          }

          #privacy-item.audio-out {
              background-color: #0069d4;
          }

        ''
      ];
    };
  }
