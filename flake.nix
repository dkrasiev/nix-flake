{
  description = "dkrasiev's flake";

  inputs = {
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs { inherit system; };

      mkSystem = profile:
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
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
        import ./shells/${profile}.nix { inherit pkgs system; };

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
