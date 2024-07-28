{pkgs, ...}: {
  programs = {
    bat = {
      enable = true;
      config = {
        pager = "less -FR";
        theme = "Catppuccin Mocha";
      };
      themes = {
        "Catppuccin Mocha" = {
          src = pkgs.fetchFromGitHub {
            owner = "catppuccin";
            repo = "bat";
            rev = "d714cc1d358ea51bfc02550dabab693f70cccea0";
            sha256 = "1zlryg39y4dbrycjlp009vd7hx2yvn5zfb03a2vq426z78s7i423";
          };
          file = "themes/Catppuccin Mocha.tmTheme";
        };
      };
    };
    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
    fzf = {
      enable = true;
      enableZshIntegration = true;
    };
    vscode = {
      enable = true;
      extensions = [];
    };
    rbenv = {
      enable = true;
      enableZshIntegration = true;
    };
    jq = {
      enable = true;
    };
    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
    atuin = {
      enable = true;
      enableZshIntegration = true;
    };
    eza = {
      enable = true;
      enableZshIntegration = true;
      git = true;
      icons = true;
      extraOptions = [
        "--group-directories-first"
        "--header"
      ];
    };
    fd = {
      enable = true;
      ignores = [
        "*.bak"
        ".git/"
        "node_modules/"
        "vendor/"
      ];
    };
    gh = {
      enable = true;
    };
    yazi = {
      enable = true;
      enableZshIntegration = true;
    };
    pyenv = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
