{
  description = "dkrasiev's flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
  };

  outputs = { nixpkgs, ... }@inputs:
  let
    system = "x86_64-linux";

    pkgs = import nixpkgs { inherit system; };

    mkSystem = { profile, hostname ? profile, modules ? [] }: nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit hostname; };
      modules = [ ./systems/${profile}/configuration.nix ] ++ modules;
    };
    
    mkShell = { profile, inputs }: import ./shells/${profile}.nix inputs;
  in
  {
    nixosConfigurations = {
      matebook = mkSystem { profile = "matebook"; };
      b550mpro = mkSystem { profile = "b550mpro"; };
      nixos-work = mkSystem { profile = "nixos-work"; };
    };

    devShells.${system} = {
      emias = mkShell {
        profile = "emias";
        inputs = { inherit pkgs system; };
      };
      prisma = mkShell {
        profile = "prisma";
        inputs = { inherit pkgs system; };
      };
    };
  };
}
