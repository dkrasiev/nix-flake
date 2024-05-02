{ pkgs, ... }:

{
  # required by users.defaultUserShell
  programs.fish.enable = true;

  users = {
    defaultUserShell = pkgs.fish;
    
    users.dkrasiev = {
      isNormalUser = true;
      description = "Dmitry Krasiev";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [];
    };

    users.dkrasiev-work = {
      isNormalUser = true;
      description = "Dmitry Krasiev's work account";
      extraGroups = [ "networkmanager" "wheel" "docker" ];
      packages = with pkgs; [];
    };
  };
}
