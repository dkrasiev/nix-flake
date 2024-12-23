{
  description = "dkrasiev's flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, nixos-hardware }:
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs { inherit system; };
      pkgs-unstable = import nixpkgs-unstable { inherit system; };

      mkSystem = profile:
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit pkgs-unstable nixos-hardware;
            hostname = profile;
            user = {
              name = "dkrasiev";
              description = "Dmitry Krasiev";
            };
          };
          modules = [
            ./systems/${profile}/configuration.nix
          ];
        };

      mkShell = profile:
        import ./shells/${profile}.nix { inherit pkgs pkgs-unstable system; };

    in {
      nixosConfigurations = {
        matebook = mkSystem "matebook";
        b550mpro = mkSystem "b550mpro";
        nixos-work = mkSystem "nixos-work";
      };

      devShells.${system} = {
        emias = mkShell "emias";
        prisma = mkShell "prisma";
      };
    };
}
