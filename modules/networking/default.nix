{ hostname, ... }:

{
  imports = [
    ./modules/firewall.nix
  ];

  networking.hostName = hostname;
  networking.networkmanager.enable = true;
}
