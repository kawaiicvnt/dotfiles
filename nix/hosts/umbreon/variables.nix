{
  # Git Configuration ( For Pulling Software Repos )
  gitUsername = "Evie (Ivi) Ballou";
  gitEmail = "iviballou@gmail.com";

  # Hyprland Settings
  extraMonitorSettings = ''
    desc:Samsung Display Corp. 0x4166, 2880x1800@60, 1920x370, 1.5, bitdepth, 10
    desc:Samsung Electric Company SAMSUNG, 3840x2160@60, 3840x0, 1.5
    desc:Chimei Innolux Corporation 0x14C9, 1920x1080@60, 1920x490, 1
    desc:Dell Inc. DELL U2421E JZVVBH3, 1920x1200@60, 0x370, 1
  '';

  # Waybar Settings
  clock24h = true;

  # Program Options
  browser = "firefox"; # Set Default Browser (google-chrome-stable for google-chrome)
  terminal = "kitty"; # Set Default System Terminal
  fileManager = "dolphin"; # Set Default File Manager
  menu = "wofi --show drun"; # Set Default Menu

  # For Nvidia Prime support
  #intelID = "PCI:1:0:0";
  #nvidiaID = "PCI:0:2:0";

  # Enable NFS
  #enableNFS = true;

  # Enable Printing Support
  printEnable = false;

  # Set Stylix Image
  stylixImage = ../../wallpapers/AnimeGirlNightSky.jpg;

  # Set Waybar
  # Zaneyos includes an alternate waybar-ddubs.nix 
  #waybarChoice = ../../modules/home/waybar.nix;
}
