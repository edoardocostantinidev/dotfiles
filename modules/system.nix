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

  services.dbus.enable = true;

  hardware.graphics.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
  
}
