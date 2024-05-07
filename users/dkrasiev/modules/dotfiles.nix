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
  xdg.configFile = {
    "nvim".source = mkDotfileSource "nvim";
    "kitty".source = mkDotfileSource "kitty";
    "tmux" = { source = mkDotfileSource "tmux"; recursive = true; };
    "tmux/plugins/tpm".source = tpm;
    "tmuxinator".source = mkDotfileSource "tmuxinator";
    "hypr".source = mkDotfileSource "hypr";
  };
}
