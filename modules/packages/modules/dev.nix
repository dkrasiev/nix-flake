{ pkgs, pkgs-stable, ... }:

{
  environment.systemPackages = with pkgs; [
    # git stuff
    git lazygit gh

    # compilers
    gnumake cmake gcc

    # rust
    rustc cargo

    # package managers / languages
    luarocks
    nodejs
    python3
    maven ant

    # terminal
    kitty

    # tmux
    pkgs-stable.tmux
    pkgs-stable.tmuxinator

    # editors
    neovim vscode
    jetbrains.idea-community-bin

    # shell
    zsh oh-my-posh

    # gui stuff
    # postman
    # insomnia
    # dbeaver-bin
    # burpsuite
    soapui
    # charles
  ];
}
