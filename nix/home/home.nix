{ pkgs, ... }:

{
  imports = [
    ./common/git.nix
    ./common/zsh.nix
    ./common/tmux.nix
  ];

  home.stateVersion = "23.11";
 
  home.packages = with pkgs; [
    htop
    curl
    coreutils
    jq
  ];
}
