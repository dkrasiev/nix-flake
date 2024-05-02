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
    ".config/tmuxinator".source = mkSource "dotfiles/tmuxinator/.config/tmuxinator";
  };
}
