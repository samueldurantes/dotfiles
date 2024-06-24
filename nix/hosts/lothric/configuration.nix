{ pkgs, ... }:

{
  services.nix-daemon.enable = true;
 
  users.users.samuel = {
    home = "/Users/samuel";
  };
 
  nix.extraOptions = ''
    auto-optimise-store = true
    experimental-features = nix-command flakes
    extra-platforms = x86_64-darwin aarch64-darwin
  '';
 
  homebrew = {
    enable = true;
    casks = [
      "discord"
      "google-chrome"
      "visual-studio-code"
      "iterm2"
    ];
  };
}
