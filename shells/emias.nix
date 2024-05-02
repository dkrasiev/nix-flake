{ pkgs, pkgs-20-09, ... }:

let
  nodejs = pkgs-20-09.nodejs-14_x;
in
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    jdk8
    maven
    nodejs
  ];
}
