{ pkgs, ... }:

{
  programs.hyprland.enable = true;
  # programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  programs.hyprland.xwayland.enable = true;

  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";
  environment.sessionVariables.NIXOS_OZON_WL = "1";

  xdg.portal.enable = true;
  xdg.portal.extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];

  environment.systemPackages = with pkgs; [
    # bar
    waybar
    # notification
    dunst
    mako
    # wallpaper
    swww
    # task runner
    wofi
  ];
}
