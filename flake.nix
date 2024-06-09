{
  description = "Nix configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    nix-darwin.url = "github:lnl7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nix-darwin, home-manager, ... }: let
    system = "aarch64-darwin";  # Use "x86_64-darwin" para Intel Macs
    pkgs = import nixpkgs {
      inherit system;
      config = { allowUnfree = true; };
    };
    darwinSystem = nix-darwin.lib.darwinSystem;
  in {
    darwinConfigurations = {
      lothric = darwinSystem {
        inherit system;

        specialArgs = { inherit pkgs; };

        modules = [
          ./nix/hosts/lothric/configuration.nix
          home-manager.darwinModules.home-manager
          {
            nixpkgs.config = { allowUnfree = true; };

            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.samuel = import ./nix/home/home.nix;
          }
        ];
      };
    };
  };
}
