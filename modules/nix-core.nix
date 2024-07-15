{
  pkgs,
  username,
  ...
}: {
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnsupportedSystem = true;
      allowBroken = true;
    };
  };

  nix = {
    settings = {
      trusted-users = [username];
      # enable flakes globally
      experimental-features = ["nix-command" "flakes"];

      builders-use-substitutes = true;
    };

    gc = {
      user = "root";
      automatic = true;
      interval = {
        Weekday = 0;
        Hour = 2;
        Minute = 0;
      };
      options = "--delete-older-than 30d";
    };
  };

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;
}
