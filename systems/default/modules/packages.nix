{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # git/github
    git gh
    # dep for treesiter and many
    gcc
    # main shell
    fish
    # main terminal
    kitty
    # main editor
    tmux tmuxinator
    # main editor
    neovim
    # AstroNvim deps
    nerdfonts ripgrep lazygit
    # archives
    zip unzip
    # wayland clipboard
    wl-clipboard
    # disk management
    partition-manager
    # media
    mpv
    # nixos
    home-manager nh nurl
    # office suite
    libreoffice-qt
    # dev
    python3 nodejs postman dbeaver burpsuite
    # browsers
    google-chrome firefox
    telegram-desktop
    gimp
    obsidian
    vscode
  ];
}
