{pkgs, ...}: {
  programs = {
    vscode = {
      enable = true;
      enableExtensionUpdateCheck = false;
      enableUpdateCheck = false;
      mutableExtensionsDir = false;
      package = pkgs.vscodium;

      extensions = with pkgs.vscode-extensions; [
        eamodio.gitlens
        catppuccin.catppuccin-vsc-icons
        catppuccin.catppuccin-vsc
      ];
      userSettings = {
        "files.autoSave" = "onFocusChange";
        "merge-conflict.autoNavigateNextConflict.enabled" = true;
        "git.mergeEditor" = true;
      };
    };
  };
}
