{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ### package managers / languages
    # C
    gnumake cmake gcc
    # Lua
    luarocks
    # JavaScript
    nodejs
    # Python
    python3
    # Java
    maven ant
    # Rust
    rustc cargo

    ### terminal
    kitty

    ### tmux
    tmux tmuxinator

    ### editors
    neovim vscode
    jetbrains.idea-community-bin

    ### shell/cli
    zsh oh-my-posh
    # git
    git lazygit gh

    ### other gui apps
    # http clients
    postman bruno
    # insomnia
    dbeaver-bin
    # burpsuite
    soapui
    # charles
  ];
}
