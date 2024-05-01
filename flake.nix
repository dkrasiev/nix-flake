{
  description = "Home Manager configuration of dkrasiev";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
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
        
        dkrasiev-df = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./users/dkrasiev-df/home.nix ];
        };
      };

      devShells.${system} = {
        node14 = (import ./shells/node14.nix { inherit pkgs; });
        nodelts = (import ./shells/nodelts.nix { inherit pkgs; });
      };
    };
}
