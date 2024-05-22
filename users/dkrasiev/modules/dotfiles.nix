{ pkgs, config, inputs, ... }:

let
  mkDotfileSource = name: "${inputs.dotfiles}/${name}/.config/${name}";

  tpm = pkgs.fetchFromGitHub {
    owner = "tmux-plugins";
    repo = "tpm";
    rev = "99469c4a9b1ccf77fade25842dc7bafbc8ce9946";
    hash = "sha256-hW8mfwB8F9ZkTQ72WQp/1fy8KL1IIYMZBtZYIwZdMQc=";
  };
in
{
  home.file = {
    ".config/kitty".source = mkDotfileSource "kitty";

    ".config/tmux" = { source = mkDotfileSource "tmux"; recursive = true; };
    ".config/tmux/plugins/tpm".source = tpm;
    ".config/tmuxinator".source = mkDotfileSource "tmuxinator";

    # ".config/nvim".source = mkDotfileSource "nvim";

    ".config/hypr".source = mkDotfileSource "hypr";
  };
}
