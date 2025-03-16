{ username, ... }:

{
  colorBackground = "rgba(114424FF)";
  colorPassBorder = "rgba(66FFCCBB)";
  colorPassField = "rgba(229944AA)";
  colorPassFont = "rgba(AAFFFFFF)";
  colorDate = "rgba(77FFDDCC)";
  colorWeek = "rgba(77FFDDCC)";
  colorTime = "rgba(77FFDDCC)";
  colorUptime = "rgba(77FFDDCC)";
  colorUser = "rgba(77FFDDCC)";
  colorWeather = "rgba(229944AA)";
  colorWallpaperBorder = "rgba(229944AA)";
  fontFamily = "icomoon-feather, Monospace";
  
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        grace = 1;
        hide_cursor = true;
        no_fade_in = false;
      };
      background = [
        {
          path = "screenshot";
          blur_size = 10;
          blur_passes = 3;
          noise = 0.15;
          contrast = 1.500;
          brightness = 0.75;
          vibrancy = 0.25;
          vibrancy_darkness = 0.25;
        }
      ];
    #   image = [
    #     {
    #       path = "/home/${username}/.config/face.jpg";
    #       size = 150;
    #       border_size = 4;
    #       border_color = "rgb(0C96F9)";
    #       rounding = -1; # Negative means circle
    #       position = "0, 200";
    #       halign = "center";
    #       valign = "center";
    #     }
    #   ];
      input-field = [
        {
          size = "250, 50";
          position = "0, 200";
          halign = "center";
          valign = "bottom";
          monitor = "";
          dots_center = true;
          dots_size = 0.25;
          dots_spacing = 0.2;
          fade_on_empty = false;
          font_color = ${colorPassFont};
          inner_color = ${colorPassField};
          outer_color = ${colorPassBorder};
          font_family = ${fontFamily};
          outline_thickness = 3;
          placeholder_text = "No Bitches?!";
          hide_input = false;
        #   shadow_passes = 2;
        }
      ];

      label = [
        {
          text = "cmd[update:18000000] echo \"<b> $(date +'%A, %-d %B %Y')\" </b>";
          color = ${colorDate};
          font_size = 34;
          font_family = ${fontFamily};
          position = "0, -150";
          halign = "center";
          valign = "top";
          monitor = "";
        }
        {
          text = "cmd[update:18000000] echo \"<b> $(date +'Week %U')\" </b>";
          color = ${colorWeek};
          font_size = 24;
          font_family = ${fontFamily};
          position = "0, -250";
          halign = "center";
          valign = "top";
          monitor = "";
          }
          {
          text = "cmd[update:1000] echo \"<b> $(date +'%H:%M:%S')\" </b>";
          color = ${colorTime};
          font_size = 94;
          font_family = ${fontFamily};
          position = "0, 0";
          halign = "center";
          valign = "center";
          monitor = "";
          }
          {
          text = "cmd[update:1000] echo \"<b> $(uptime -p)\" </b>";
          color = ${colorUptime};
          font_size = 24;
          font_family = ${fontFamily};
          position = "0, 0";
          halign = "right";
          valign = "bottom";
          monitor = "";
          }
          {
          text = " ${username}";
          color = ${colorUser};
          font_size = 18;
          font_family = ${fontFamily};
          position = "0, 100";
          halign = "center";
          valign = "bottom";
          monitor = "";
        }
      ];
    };
  };
}
