{...}: {
  programs = {
    zellij = {
      enable = true;
      # enableZshIntegration = true;
    };
  };
  xdg.configFile.zellij.source = ./zellij;
}
