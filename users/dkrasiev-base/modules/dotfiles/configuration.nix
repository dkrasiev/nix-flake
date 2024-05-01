{ config, ... }:

let
  root = "${config.home.homeDirectory}/nix/users/dkrasiev-base/modules/dotfiles";
  mkSource = path: config.lib.file.mkOutOfStoreSymlink "${root}/${path}";
in
{
  home.file = {
    ".config/nvim".source = mkSource "dotfiles/nvim/.config/nvim";
    ".config/kitty".source = mkSource "dotfiles/kitty/.config/kitty";
    ".config/tmux".source = mkSource "dotfiles/tmux/.config/tmux";
    ".config/hypr".source = mkSource "dotfiles/hypr/.config/hypr";
    ".config/waybar".source = mkSource "dotfiles/waybar/.config/waybar";
    ".config/dunst".source = mkSource "dotfiles/dunst/.config/dunst";
    ".config/wofi".source = mkSource "dotfiles/wofi/.config/wofi";
  };
}
