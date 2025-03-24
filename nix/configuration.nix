# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

let
  vscode-extensions = (import ./modules/packages/vscode.nix) { pkgs = pkgs; lib = lib; };
  imports = [
    ./hosts/umreon/variables.nix
    ./modules/home/hyprland.nix
    ./modules/home/hyprlock.nix
    ./modules/home/waybar.nix
  ];
in
{
  # Enable Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Athens";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the KDE Plasma Desktop Environment.
  #services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.xserver = {
    enable = true;
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
  };

  services.blueman = {
    enable = true;
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  #services.dev.udev.packages = with pkgs; [
  #  libfido2
  #];

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  security.polkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  users.defaultUserShell = pkgs.zsh;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.evie = {
    isNormalUser = true;
    description = "Ivi";
    uid = 1024;
    group = "users";
    extraGroups = [ "networkmanager" "wheel" "audio" "input" "kvm" "pipewire" "polkituser" "systemd-journal" "tty" "video" "root" "docker" "dialout" ];
    shell = pkgs.zsh;
    #useDefaultShell = true;
    packages = with pkgs; [
      kdePackages.kate
    #  thunderbird
    ];
  };

  #extra-experimental-features = ["flakes" "nix-command"];

  fonts.fontconfig.enable = true;
  
  fonts.packages = with pkgs; [
    hanazono
    icomoon-feather
    (nerdfonts.override { fonts = [ "Iosevka" ]; })
    
  ];

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
    };
    history.size = 10000;
    initExtra=''
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

  # Install firefox.
  programs.firefox.enable = true;
  #programs.librewolf.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.shells = [ pkgs.zsh pkgs.fish ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Nix
      home-manager

    # System
      # Libs
        libfido2
      # Skeletal packages
        bluez
        bluetui
        dunst
      # Editors
        vim
        neovim
        sublime
      # Remote
        rsync
        wget
        sshfs
        samba
      # Monitoring
        htop
        btop
      # Processes
        killall
      # Shells
        zsh
        fish
        bash
      # Terminals
        kitty
        ghostty
      # Fetch
        pfetch
        neofetch
        uwufetch
        macchina
      # Fonts
        #icomoon-feather
      # WM
        hyprlock
        waybar
        swww
        wofi
        kdePackages.polkit-kde-agent-1
      # Image
        imv
      # Sound
        pavucontrol
      # Video
        ffmpeg
        mpv
      # Space Management
        baobab
        gparted
      # Compatibility layers
        wine
      # I2C
        i2c-tools
      # Wayland / Hyprland
        grim
        slurp
        swappy
        wlprop
      # VPN
        openvpn
    
    # Programming 
      # Version control
        git
      # Package managers
        yarn
        pipx
        #pip3
      # Languages
        rustup
        jdk
        python3
        #python2
        nodejs
        go
      # vms
        docker
        docker-client
        docker-compose
        docker-machine-kvm2
        qemu
        virt-manager
      # DBs
        sqlite
        mariadb
      # Tools / Toolchains
        # Embedded
          gcc-arm-embedded
          stm32flash
          openocd
          ch341eeprom
          flashrom
          imsprog
        # Mobile
          android-tools
          #! android-udev
        # Building
          platformio
          gnumake
          cmake
          libgcc
          tinycc
        # Debug
          gdb
          flamegraph
          gperf
        # UART / TTY
          picocom
        # Misc
          ascii
      # IDEs
        jetbrains.rust-rover
        jetbrains.pycharm-community-bin
        jetbrains.idea-community
        android-studio
        ghidra
        (vscode-with-extensions.override {
          vscodeExtensions = vscode-extensions;
        })
    
    # Social
      discord-ptb
      spotify
    
    # IOT
      librewolf

    # Entertainment
      ani-cli
      ani-skip
      stremio

    # Creative
      #kritta


  ];
  
  networking.firewall.allowedTCPPorts = [
    22    # SSH
    80    # HTTP
    57621 # Spotify local sync
  ];

  networking.firewall.allowedUDPPorts = [
    5353 # Spotify Connect
  ];
  
  virtualisation.docker.daemon.settings = {
    userland-proxy = false;
    experimental = true;
    metrics-addr = "0.0.0.0:9323";
    ipv6 = false;
    #fixed-cidr-v6 = "fd00::/80";
  };

  virtualisation.docker.enable = true;
  
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
