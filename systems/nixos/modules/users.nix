{ pkgs, ... }:

{
  programs.fish.enable = true;

  users = {
    defaultUserShell = pkgs.fish;
    
    users.dkrasiev = {
      isNormalUser = true;
      description = "Dmitry Krasiev";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [];
    };

    users.dkrasiev-df = {
      isNormalUser = true;
      description = "Dmitry Krasiev's work account";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [];
    };
  };
}
