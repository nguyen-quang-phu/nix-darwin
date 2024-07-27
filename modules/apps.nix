{pkgs, ...}: {
  ##########################################################################
  #
  #  Install all apps and packages here.
  #
  #  NOTE: Your can find all available options in:
  #    https://daiderd.com/nix-darwin/manual/index.html
  #
  # TODO Fell free to modify this file to fit your needs.
  #
  ##########################################################################

  # Install packages from nix's official package repository.
  #
  # The packages installed here are available to all users, and are reproducible across machines, and are rollbackable.
  # But on macOS, it's less stable than homebrew.
  #
  # Related Discussion: https://discourse.nixos.org/t/darwin-again/29331
  environment.systemPackages = with pkgs; [
    awsebcli
    clipboard-jh
    codespell
    devenv
    devpod
    glab
    graphviz
    just
    lazysql
    macchina
    maccy
    mycli
    nap
    ngrok
    nix-prefetch-scripts
    pgcli
    postman
    rectangle
    ripgrep
    slack
    tldr
    wget
    yaml-language-server
    # nix
    nixd
    statix

    # lua
    luajitPackages.luacheck

    # rust
    rustup

    #node
    nodePackages.yarn
    nodejs_22

    # go
    go
    comma
    openssl
  ];
  environment.variables.EDITOR = "nvim";
  fonts.packages = with pkgs; [
    (nerdfonts.override {fonts = ["JetBrainsMono"];})
  ];

  # TODO To make this work, homebrew need to be installed manually, see https://brew.sh
  #
  # The apps installed by homebrew are not managed by nix, and not reproducible!
  # But on macOS, homebrew has a much larger selection of apps than nixpkgs, especially for GUI apps!
  homebrew = {
    enable = true;
    global.brewfile = true;

    onActivation = {
      autoUpdate = true;
      upgrade = true;
      # 'zap': uninstalls all formulae(and related files) not listed here.
      cleanup = "zap";
    };
    caskArgs = {
      no_quarantine = true;
      require_sha = false;
    };

    taps = [
      "homebrew/services"
      "nikitabobko/tap" # aerospace
    ];

    # `brew install`
    # TODO Feel free to add your favorite apps here.
    brews = [
      "coreutils"
      "ruby-build"
      "imagemagick"
      "spicetify-cli"
      "spotify_player"
      "gnu-sed"
      "whalebrew"
      {
        name = "mysql@8.0";
        restart_service = true;
        link = true;
        conflicts_with = ["mysql"];
      }

      # "aria2"  # download tool
    ];

    # `brew install --cask`
    # TODO Feel free to add your favorite apps here.
    casks = [
      "aerospace"
      "amazon-q"
      "arc"
      "cloudflare-warp"
      "evkey"
      "google-chrome"
      "karabiner-elements"
      "meld"
      "raycast"
      "spotify"
      "android-studio"
    ];

    masApps = {
      "Xcode" = 497799835;
    };
  };
}
