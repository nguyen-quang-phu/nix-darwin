{ agenix, pkgs, ... }: {
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
  environment.systemPath = ["/opt/homebrew/bin"];
  environment.pathsToLink = ["/Applications"];

  environment.systemPackages = with pkgs; [
    agenix.packages."${pkgs.system}".default
    # redis
    awsebcli
    clipboard-jh
    codespell
    devenv
    devpod
    glab
    # graphviz
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
    # rectangle
    slack
    tldr
    wget
    yaml-language-server
    # nix
    nixd
    nil
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
    gitlab-ci-local
    fnm
    vscode-extensions.xdebug.php-debug
    php81Extensions.xdebug

    # rubyPackages.solargraph
    cachix
    ueberzugpp
    podman
    deadnix
    typos-lsp
    typos
    gitleaks
    killport
    age
    postgis
    rubyPackages.solargraph
    rubocop
    git-crypt
    # bundler
    process-compose
    # neovim
    sops
    gnupg
  ];
  environment.variables.EDITOR = "nvim";
  fonts.packages = with pkgs; [
    nerdfonts
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
      "chase/tap"
      "FelixKratz/formulae"
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
      # "awrit"
      {
        name = "felixkratz/formulae/borders";
        restart_service = true;
      }
      {
        name = "felixkratz/formulae/sketchybar";
        restart_service = true;
      }
      # {
      #   name = "mysql@8.0";
      #   restart_service = true;
      #   link = true;
      #   conflicts_with = ["mysql"];
      # }
      # {
      #   name = "postgresql@16";
      #   restart_service = true;
      #   link = true;
      #   conflicts_with = ["postgresql"];
      # }
      # "aria2"  # download tool
    ];

    # `brew install --cask`
    # TODO Feel free to add your favorite apps here.
    casks = [
      "nikitabobko/tap/aerospace"
      "alt-tab"
      "android-studio"
      "arc"
      "cloudflare-warp"
      "evkey"
      "google-chrome"
      "karabiner-elements"
      "numi"
      "spotify"
      "amazon-q"
      "raycast"
      "doll"
    ];

    masApps = {
      "Xcode" = 497799835;
      "DropOver" = 1355679052;
      # "Amphetamine" = 937984704;
    };

    whalebrews = [
      # "whalebrew/wget"
    ];
  };
}
