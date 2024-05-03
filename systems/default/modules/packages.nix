{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    git
    gcc
    fish
    kitty
    tmux tmuxinator
    neovim
    nerdfonts ripgrep lazygit
    nodejs
    zip unzip
    wl-clipboard
    partition-manager
    mpv
    home-manager nh nurl
    libreoffice-qt
    postman dbeaver burpsuite
    google-chrome
    telegram-desktop
  ];
}
