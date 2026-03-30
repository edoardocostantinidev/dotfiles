{ config, pkgs, ... }:

{
  imports = [
    ../../modules/system.nix
    ../../modules/user.nix
    ../../modules/packages.nix
    ../../modules/sway.nix
  ];
}