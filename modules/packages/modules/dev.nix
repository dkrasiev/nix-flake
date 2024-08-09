{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # git stuff
    git lazygit gh

    # compilers
    gnumake cmake gcc rustc

    # package managers / languages
    # rust
    cargo
    # lua
    luarocks
    # javascript
    nodejs
    # python
    python3
    # java
    maven jre

    # terminal
    kitty nerdfonts

    # tmux
    tmux tmuxinator

    # editors
    neovim vscode

    # shell
    zsh oh-my-posh

    # gui stuff
    postman
    insomnia
    dbeaver-bin
    burpsuite
    soapui
    charles
  ];
}
