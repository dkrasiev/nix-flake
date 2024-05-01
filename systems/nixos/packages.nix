{ pkgs, ... }:

{
  nixpkgs.config = {
    allowUnfree = true;
  };

  environment.systemPackages = with pkgs; [
    git
    google-chrome
    telegram-desktop
    stow
    home-manager
    kitty
    nerdfonts
    fish
    tmux
    neovim
    gcc
    ripgrep
    lazygit
    nodejs
    zip
    unzip
    wl-clipboard
    gparted
  ];
}
