{
  description = "Home Manager configuration of dkrasiev";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-old.url = "github:nixos/nixpkgs/62fab0d98ae9f62c41832ec2986bb7d8622786a0";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      pkgs-old = inputs.nixpkgs-old.legacyPackages.${system};
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

      devShells.${system} =
      let
        node14shell = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
            pkgs-old.nodejs-14_x
          ];
        };
      in
      {
        default = node14shell;
        node14 = node14shell;
        java8 = (import ./shells/java8.nix { inherit pkgs; });
      };
    };
}
