{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Editors
    vim
    vscode

    # Browser / apps
    google-chrome
    notion-app-enhanced

    # Dev
    git
    curl
    wget
    nodejs
    rustup

    # Wayland tools
    waybar
    wofi
    swaylock
    swayidle
    grim
    slurp
    wl-clipboard

    # Terminal
    alacritty

    # Utils
    htop
    neofetch
  ];
}