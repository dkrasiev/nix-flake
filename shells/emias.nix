{ pkgs, system, ... }:

let
  nixpkgs-20-09 = pkgs.fetchFromGitHub {
    owner = "nixos";
    repo = "nixpkgs";
    rev = "nixos-20.09";
    hash = "sha256-tAMJnUwfaDEB2aa31jGcu7R7bzGELM9noc91L2PbVjg=";
  };
  pkgs-20-09 = import nixpkgs-20-09 { inherit system; };
in
pkgs.mkShell {
  packages = with pkgs; [
    jdk8
    maven
    pkgs-20-09.nodejs-14_x
  ];
}
