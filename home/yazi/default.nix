{...}: {
  programs = {
    yazi = {
      enable = true;
      enableZshIntegration = true;
      enableNushellIntegration = true;
    };
  };
  xdg.configFile.yazi.source = ./yazi;
}
