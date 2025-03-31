{ config, pkgs, ... }:

let
  host = "umbreon";
  imports = [
    ./hosts/${host}/variables.nix
    ./modules/home/hyprland.nix
    ./modules/home/hyprlock.nix
    ./modules/home/waybar.nix
  ];
in
{
  imports = [
    (import ./modules/home/hyprland.nix)
    (import ./modules/home/hyprlock.nix)
    (import ./modules/home/waybar.nix)
  ];
  #programs.kitty.enable = true;
  wayland.windowManager.hyprland.enable = true;
  programs.waybar.enable = true;
  programs.hyprlock.enable = true;
  home.username = "evie";
  home.homeDirectory = "/home/evie";
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
  #home.shell.enableZshIntegration = true;
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    #autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      upd-sys  = "sudo nixos-rebuild switch";
      upd-home = "home-manager switch";
      psgrep = "ps aux | grep -v \"grep --color=auto\" | grep ";
      sl="exec dbus-launch sway -c ~/.config/sway/config";
      kssh="kitty +kitten ssh";
      spw="startplasma-wayland";
      i3l="xinit -- :0 vt2";
      ffmpreg="ffmpeg";
      factorio-steam="steam steam://rungameid/427520";
      mbit="picocom -b 115200 -c -d 8 --imap lfcrlf";
      ghidras="_JAVA_AWT_WM_NONREPARENTING=1 ghidra";
      pause="kill -STOP $(pgrep -f $1)";
      cont="kill -CONT $(pgrep -f $1)";
      pauseall="killall -STOP";
      contall="killall -CONT";
    };
    history.size = 10000;
    initExtra=''
      clear
      macchina | sed "s/\( Type1ProductConfigId\| 103C_5335M8\)//g" | sed "s/ 13-/ 13-bf0xxx/g"| sed "s/13-bf0xxxbf0xxx/13-bf0xxx/g"
      echo
      df -hT -t ext4 -t fuseblk | grep -v '/boot'
    '';
    oh-my-zsh = {
      enable = true;
    #  plugins = [ "git" "thefuck" "zsh-autosuggestions" ];
      theme = "af-magic";
    };
    plugins = [
      {
        name = pkgs.zsh-autosuggestions.pname;
        src = pkgs.zsh-autosuggestions.src;
      }
      {
        name = pkgs.git.pname;
        src = pkgs.git.src;
      }
    ];
  };
}

