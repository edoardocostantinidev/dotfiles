{ config, pkgs, ... }:

{
  users.users.costa = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" "audio" ];
  };

  security.sudo.wheelNeedsPassword = false;
}