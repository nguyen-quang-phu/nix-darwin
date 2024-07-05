# flake.nix
{
  description = "Nix for macOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nix-darwin,
    nixpkgs,
    home-manager,
    nixvim,
    ...
  }: let
    username = "harvey";
    system = "x86_64-darwin"; # aarch64-darwin or x86_64-darwin
    hostname = "harvey";
    useremail = "nqphu1998@gmail.com";
    specialArgs =
      inputs
      // {
        inherit username hostname useremail;
      };
  in {
    darwinConfigurations."${hostname}" = nix-darwin.lib.darwinSystem {
      inherit system specialArgs;
      modules = [
        ./modules/nix-core.nix
        ./modules/system.nix
        ./modules/apps.nix

        ./modules/host-users.nix

        # home manager
        home-manager.darwinModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = specialArgs;
            users.${username} = import ./home;
            backupFileExtension = "backup";
          };
        }

        nixvim.nixDarwinModules.nixvim
      ];
    };
    # nix code formatter
    formatter.${system} = nixpkgs.legacyPackages.${system}.alejandra;
  };
}
