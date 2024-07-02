{
  description = "Home Manager configuration of dkrasiev";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    plasma-manager.url = "github:pjones/plasma-manager";
    plasma-manager.inputs.nixpkgs.follows = "nixpkgs";
    plasma-manager.inputs.home-manager.follows = "home-manager";

    dotfiles.url = "github:dkrasiev/dotfiles/master";
    dotfiles.flake = false;
  };

  outputs = { nixpkgs, home-manager, plasma-manager, ... }@inputs:
  let
    system = "x86_64-linux";

    pkgs = import nixpkgs { inherit system; };

    mkSystem = { profile, hostname ? profile, modules ? [] }: nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit hostname; };
      modules = [ ./systems/${profile}/configuration.nix ] ++ modules;
    };
    
    mkUser = { profile, username ? profile }: home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = { inherit inputs; };
      modules = [
        plasma-manager.homeManagerModules.plasma-manager
      
        ./users/${profile}/home.nix

        {
          home.username = username;
          home.homeDirectory = "/home/${username}";
        }
      ];
    };
    
    mkShell = { profile, inputs }: import ./shells/${profile}.nix inputs;
  in
  {
    nixosConfigurations = {
      matebook = mkSystem { profile = "matebook"; };
      b550mpro = mkSystem { profile = "b550mpro"; };
      nixos-work = mkSystem { profile = "nixos-work"; };
    };

    homeConfigurations = {
      dkrasiev = mkUser { profile = "dkrasiev"; };
      dkrasiev-work = mkUser { profile = "dkrasiev"; username = "dkrasiev-work"; };
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
