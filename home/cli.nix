{pkgs, ...}: {
  programs = {
    direnv = {
      enable = true;
      enableZshIntegration = true;
      enableNushellIntegration = true;
      nix-direnv.enable = true;
    };
    fzf = {
      enable = true;
      enableZshIntegration = true;
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
      enableNushellIntegration = true;
    };
    atuin = {
      enable = true;
      enableZshIntegration = true;
      enableNushellIntegration = true;
    };
    ripgrep = {
      enable = true;
      arguments = [
        "--iglob=!.git"
      ];
    };
    eza = {
      enable = true;
      enableZshIntegration = true;
      enableNushellIntegration = true;
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
    pyenv = {
      enable = true;
      enableZshIntegration = true;
    };
    aerc = {
      enable = true;
    };
    nushell = {
      enable = true;
    };
  };
}
