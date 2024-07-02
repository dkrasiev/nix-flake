{ pkgs, ... }:

{
  users.users = {
    dkrasiev = {
      isNormalUser = true;
      description = "Dmitry Krasiev";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [];
    };
  };
}
