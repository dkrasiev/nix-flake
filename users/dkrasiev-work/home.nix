{ lib, ... }:

{
  imports = [
    ../dkrasiev/home.nix
  ];
  
  programs.git.userEmail = lib.mkForce "dkrasiev@datafire.ru";
}
