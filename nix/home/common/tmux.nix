_:

{
  programs.tmux = {
    enable = true;

    extraConfig = ''
      set -sg escape-time 5
      set -g mouse on
      set -g history-limit 100000
      setw -g mode-keys vi
      set-window-option -g mode-keys vi
      set -g pane-border-status off
      set -g pane-border-format "#{pane_index} #{pane_current_command}"
      set -g pane-active-border-style fg=yellow

      set -g default-terminal "screen-256color"

      unbind C-b
      set -g prefix C-q
      set -g status-left '[#S] '

      bind c new-window -c "#{pane_current_path}"
      bind '"' split-window -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"

      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      bind -r H resize-pane -L 7
      bind -r J resize-pane -D 7
      bind -r K resize-pane -U 7
      bind -r L resize-pane -R 7

      set -g status-position bottom
      set -g status-bg colour234
      set -g status-fg colour137
      set -g status-left ""
      set -g status-right '#[fg=colour233,bg=colour241,bold] %d/%m #[fg=colour233,bg=colour245,bold] %H:%M:%S '
      set -g status-right-length 50
      set -g status-left-length 20
      setw -g mode-keys vi
      
      setw -g window-status-current-format ' #I#[fg=colour250]:#[fg=colour255]#W#[fg=colour50]#F '
      setw -g window-status-format ' #I#[fg=colour237]:#[fg=colour250]#W#[fg=colour244]#F '
    '';
  };
}
