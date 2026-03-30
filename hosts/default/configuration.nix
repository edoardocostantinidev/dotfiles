{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system.nix
    ../../modules/user.nix
    ../../modules/packages.nix
    ../../modules/sway.nix
  ];
}
