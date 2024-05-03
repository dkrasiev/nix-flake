{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    tmuxinator.enable = true;

    plugins = with pkgs.tmuxPlugins; [
      sensible
      rose-pine
      resurrect
      continuum
      yank
    ];

    extraConfig = ''
      # BINDINGS
      # Custom prefix
      unbind C-b
      set -g prefix C-f
      bind C-f send-prefix

      # Alt vim keys to switch panes
      bind -n M-h select-pane -L
      bind -n M-l select-pane -R
      bind -n M-k select-pane -U
      bind -n M-j select-pane -D

      # Prefix vim keys to select pane (Alt vim keys keys is better)
      # bind h select-pane -L
      # bind j select-pane -D 
      # bind k select-pane -U
      # bind l select-pane -R

      # Shift-Alt vim keys to switch windows
      bind -n M-H previous-window
      bind -n M-L next-window

      # Prefix vim keys to switch windows (Shift-Alt is better)
      bind h previous-window
      bind l next-window

      # Splitting panes as in AstroNvim and split in CWD
      unbind '"'
      unbind %
      bind '\' split-window -v -c "#{pane_current_path}"
      bind '|' split-window -h -c "#{pane_current_path}"

      # Keybindings for tmux-yank
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel


      # ARROWS ARE USELESS
      # Alt arrows to switch panes
      # bind -n M-Left select-pane -L
      # bind -n M-Right select-pane -R
      # bind -n M-Up select-pane -U
      # bind -n M-Down select-pane -D

      # Shift arrows to switch windows
      # bind -n S-Left previous-window
      # bind -n S-Right next-window


      # MISC
      # Enable mouse (seems to be useless)
      set -g mouse on

      # Color fix
      set-option -sa terminal-overrides ",xterm*:Tc"

      # Start windows and panes at 1, not 0
      set -g base-index 1
      set -g pane-base-index 1
      set-window-option -g pane-base-index 1
      set-option -g renumber-windows on

      # Set vi-mode for navigation in selection mode
      # Sets by default if VISUAL or EDITOR include vi
      set-window-option -g mode-keys vi
      set-window-option -g status-keys vi
   '';
  };
}
