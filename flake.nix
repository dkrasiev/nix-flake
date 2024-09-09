{
  description = "dkrasiev's flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    vscode-server.url = "github:nix-community/nixos-vscode-server";
  };

  outputs = { self, nixpkgs, vscode-server }:
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

            vscode-server.nixosModules.default
            ({ config, pkgs, ... }: { services.vscode-server.enable = true; })
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
