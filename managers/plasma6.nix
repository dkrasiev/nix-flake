{ pkgs, ... }:

{
  services.desktopManager.plasma6.enable = true;

  environment.systemPackages = with pkgs; [
    kdePackages.sddm-kcm
    kdePackages.plasma-browser-integration
  ];
}
