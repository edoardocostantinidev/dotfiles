{ config, pkgs, ... }:

{
  system.stateVersion = "24.11";

  nixpkgs.config.allowUnfree = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Rome";
  i18n.defaultLocale = "en_US.UTF-8";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  users.users.costa = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" "audio" ];
  };

  programs.sway.enable = true;
  programs.xwayland.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  environment.systemPackages = with pkgs; [
    vim
    vscode
    google-chrome
    notion-app-enhanced
    nodejs
    rustup
    git
    wget
    curl

    waybar
    wofi
    swaylock
    grim
    slurp
    wl-clipboard
    alacritty
  ];

  services.dbus.enable = true;

  hardware.graphics.enable = true;
}