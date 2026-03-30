{
  description = "My NixOS config (Sway + dev setup)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";
  in {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      inherit system;

      modules = [
        ./hosts/default/configuration.nix
        home-manager.nixosModules.home-manager
      ];
    };
  };
}