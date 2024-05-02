{
  description = "Home Manager configuration of dkrasiev";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-20-09.url = "github:nixos/nixpkgs/nixos-20.09";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, ... }@inputs:
  let
    system = "x86_64-linux";

    pkgs = import nixpkgs { inherit system; };
    pkgs-20-09 = import inputs.nixpkgs-20-09 { inherit system; };

    settings = {
      user = {
        username = "dkrasiev";
        name = "Dmitry Krasiev";
        email = "dmitrykrasiev@gmail.com";
      };
    };
  in
  {
    nixosConfigurations =
    let
      mkSystem = { hostname, profile }: nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit settings hostname; };
        modules = [ ./systems/${profile}/configuration.nix ];
      };
    in
    {
      nixos = mkSystem {
        profile = "default";
        hostname = "nixos";
      };

      matebook = mkSystem {
        profile = "matebook";
        hostname = "matebook";
      };
    };

    homeConfigurations =
    let
      mkUser = { profile, ... }@user: home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { settings = { inherit user; }; };
        modules = [ ./users/${profile}/home.nix ];
      };
    in
    {
      dkrasiev = mkUser { 
        profile = "dkrasiev";
        username = "dkrasiev";
        name = "Dmitry Krasiev";
        email = "dmitrykrasiev@gmail.com";
      };

      dkrasiev-work = mkUser {
        profile = "dkrasiev-work";
        username = "dkrasiev-work";
        name = "Dmitry Krasiev's work account";
        email = "dkrasiev@datafire.ru";
      };
    };

    devShells.${system} =
    let
      mkShell = { profile, inputs }: import ./shells/${profile}.nix inputs;
    in
    {
      emias = mkShell {
        profile = "emias";
        inputs = { inherit pkgs pkgs-20-09; };
      };
    };
  };
}
