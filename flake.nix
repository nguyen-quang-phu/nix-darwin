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
    agenix.url = "github:ryantm/agenix";
    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
    secrets = {
      url = "git+ssh://git@github.com/nguyen-quang-phu/nix-secrets.git";
      flake = false;
    };
  };

  outputs = inputs @ {
    agenix,
    home-manager,
    nix-darwin,
    nix-index-database,
    nixpkgs,
    nixvim,
    secrets,
    ...
  }: let
    username = "harvey";
    system = "x86_64-darwin"; # aarch64-darwin or x86_64-darwin
    hostname = "harvey";
    useremail = "nqphu1998" + "@" + "gmail" + "." + "com";
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
        agenix.darwinModules.default
        nix-index-database.darwinModules.nix-index
      ];
    };
    # nix code formatter
    formatter.${system} = nixpkgs.legacyPackages.${system}.alejandra;
  };
}
