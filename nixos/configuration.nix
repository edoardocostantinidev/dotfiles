{ config, pkgs, ... }:

{

  imports = [
    /etc/nixos/hardware-configuration.nix
    /etc/nixos/dev.pkgs.nix
    /etc/nixos/terminal.pkgs.nix
    /etc/nixos/fonts.nix
    <home-manager/nixos>
  ];

  users.defaultUserShell = pkgs.zsh;  
  home-manager.users.costa = { pkgs, ... }: {
    home.stateVersion = "23.11";
  };

  # Bootloader
  boot.loader.grub.enable = false;

  networking = {
    firewall = {
      enable = true;
      allowedTCPPorts = [];
      allowedUDPPorts = [];
    };
    hostName = "costa-nix";
    networkmanager.enable = true;
  };

  # edit as per your location and timezone
  time.timeZone = "Europe/Rome";

  sound.enable = true;

  services = {
    xserver = {
      layout = "us";
      xkbVariant = "";
      enable = true;
      windowManager.i3 = {
        enable = true;
        extraPackages = with pkgs; [
          dmenu
          i3status
          i3lock
          i3blocks
        ];
      };
      desktopManager = {
        xterm.enable = false;
        xfce = {
          enable = true;
          noDesktop = true;
          enableXfwm = false;
        };
      };
      displayManager = {
        lightdm.enable = true;
        defaultSession = "none+i3";
      };
    };
    gvfs.enable = true;
    gnome.gnome-keyring.enable = true;
    blueman.enable = true;
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      pulseaudio = true;
    };
  };


  users.users.costa = {
    isNormalUser = true;
    description = "costa";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [
      brave
      xarchiver
    ];
  };

  environment.systemPackages = with pkgs; [
    alacritty
    dmenu
    discord
    git
    google-chrome
    vim
    gnome.gnome-keyring
    nerdfonts
    networkmanagerapplet
    nitrogen
    pasystray
    picom
    polkit_gnome
    pulseaudioFull
    rofi
    vim
    unrar
    unzip
  ];

  programs = {
    thunar.enable = true;
    dconf.enable = true;
    zsh = {
        enable = true;
    };
  };

  security = {
    polkit.enable = true;
    rtkit.enable = true;
  };

  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart =
          "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };

  hardware = {
    bluetooth.enable = true;
  };
  
  environment.sessionVariables.TERMINAL = [ "alacritty" ];
  environment.sessionVariables.EDITOR = [ "vim" ];
  
  # Don't touch this
  system.stateVersion = "23.11";
}
