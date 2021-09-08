{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./programs/nvim.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda";
  
  time.timeZone = "America/Sao_Paulo";

  networking.useDHCP = false;
  networking.interfaces.eno1.useDHCP = true;

  nixpkgs.config.allowUnfree = true;
  
  services.xserver = {
    enable = true;
    layout = "us";
    windowManager = {
      xmonad = {
        enable = true;
        enableContribAndExtras = true;
        extraPackages = haskellPackages: with haskellPackages; [
          xmonad
          xmonad-contrib
          xmonad-extras
          xmobar
        ];
        config = builtins.readFile /home/samuel/.xmonad/xmonad.hs;
      };
    };

    displayManager = {
      defaultSession = "none+xmonad";
    };
  };  
  
  fonts = {
    enableDefaultFonts = true;
    fonts = with pkgs; [
      fira-code
      fira-code-symbols
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      noto-fonts-extra	
    ];
    fontconfig = {
      defaultFonts = {
        serif = ["Noto Serif"];
        sansSerif = ["Noto Sans"];
        monospace = ["Fira Code"];
      };
    };
  };

  sound.enable = true;
  hardware.pulseaudio.enable = true;
  
  programs.zsh.enable = true;

  users.users.samuel = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
	  packages = with pkgs; [
	    discord
	  ];
  };

  environment.systemPackages = with pkgs; [
    neovim
    tmux
    firefox
    alacritty   
    manpages
    dmenu
    xmobar
    git
    neofetch
    zsh
    gcc
    yarn
    cmake
    gnumake
    flameshot
    zlib
    nodejs-16_x
    racket
    postman
    pavucontrol
  ] ++ (with pkgs.haskellPackages; [
    haskell-language-server
    stack
    ghc
    cabal-install
    brittany
    hls-brittany-plugin
  ]);

  system.stateVersion = "21.05";
}
