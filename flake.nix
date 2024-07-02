{
  description = "Home Manager configuration of dkrasiev";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # nixpkgs-old.url = "github:nixos/nixpkgs/62fab0d98ae9f62c41832ec2986bb7d8622786a0";
    nixpkgs-20-09.url = "github:nixos/nixpkgs/nixos-20.09";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";

      pkgs = nixpkgs.legacyPackages.${system};
      # pkgs-old = inputs.nixpkgs-old.legacyPackages.${system};
      pkgs-20-09 = inputs.nixpkgs-20-09.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ ./systems/nixos/configuration.nix ];
        };
      };

      homeConfigurations = {
        dkrasiev = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./users/dkrasiev/home.nix ];
        };
        
        dkrasiev-work = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./users/dkrasiev-work/home.nix ];
        };
      };

      devShells.${system} = {
        emias = (import ./shells/emias.nix { inherit pkgs pkgs-20-09; });
      };
    };
}
