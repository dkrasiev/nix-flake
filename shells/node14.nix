{ system, pkgs, ... }:

let
  nixpkgs = pkgs.fetchurl {
    url = "github:nixos/nixpkgs/62fab0d98ae9f62c41832ec2986bb7d8622786a0";
    hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
  };
  pkgs = nixpkgs.legacyPackages.${system};
in
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    pkgs-old.nodejs-14_x
  ];
}
