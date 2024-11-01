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
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/2.91.0.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-darwin = {
      url = "github:bandithedoge/nixpkgs-firefox-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    secrets = {
      url = "git+ssh://git@github.com/nguyen-quang-phu/nix-secrets.git";
      flake = false;
    };
  };

  outputs = inputs @ {
    agenix,
    home-manager,
    lix-module,
    nix-darwin,
    nix-index-database,
    nixpkgs,
    nixvim,
    firefox-darwin,
    sops-nix,
    secrets,
    ...
  }: let
    username = "harvey";
    system = "x86_64-darwin"; # aarch64-darwin or x86_64-darwin
    hostname = "harvey";
    useremail = "nqphu1998" + "@" + "gmail" + "." + "com";
    pkgs = nixpkgs.legacyPackages.${system};
    specialArgs =
      inputs
      // {
        inherit username hostname useremail;
      };
  in {
    darwinConfigurations."${hostname}" = nix-darwin.lib.darwinSystem {
      inherit system specialArgs;
      modules = [
        ./modules/secrects.nix
        ./modules/nix-core.nix
        ./modules/system.nix
        ./modules/apps.nix

        ./modules/host-users.nix

        # home manager
        home-manager.darwinModules.home-manager
        {
          nixpkgs.overlays = [firefox-darwin.overlay];
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = specialArgs;
            users.${username} = import ./home;
            backupFileExtension = "backup";
            sharedModules = [
              sops-nix.homeManagerModules.sops
            ];
          };
        }

        nixvim.nixDarwinModules.nixvim
        agenix.darwinModules.default
        nix-index-database.darwinModules.nix-index
        # This is the important part -- add this line to your module list!
        lix-module.nixosModules.default
        agenix.nixosModules.age
      ];
    };
    devShells.${system}.default = pkgs.mkShell {
      buildInputs = with pkgs; [
        lefthook
      ];
    };
    # nix code formatter
    # formatter.${system} = pkgs.alejandra;
  };
}
