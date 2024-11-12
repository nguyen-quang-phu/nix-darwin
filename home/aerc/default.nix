{...}: {
  programs = {
    aerc = {
      enable = true;
      extraConfig = {
        ui = {
          border-char-vertical = "│";
          border-char-horizontal = "─";
          styleset-name = "catppuccin-mocha";
        };
      };
      stylesets = {
        catppuccin-mocha = {
          "*.default" = true;
          "*.normal" = true;
          "default.fg" = "#cdd6f4";
          "error.fg" = "#f38ba8";
          "warning.fg" = "#fab387";
          "success.fg" = "#a6e3a1";
          "tab.fg" = "#6c7086";
          "tab.bg" = "#181825";
          "tab.selected.fg" = "#cdd6f4";
          "tab.selected.bg" = "#1e1e2e";
          "tab.selected.bold" = true;
          "border.fg" = "#11111b";
          "border.bold" = true;
          "msglist_unread.bold" = true;
          "msglist_flagged.fg" = "#f9e2af";
          "msglist_flagged.bold" = true;
          "msglist_result.fg" = "#89b4fa";
          "msglist_result.bold" = true;
          "msglist_*.selected.bold" = true;
          "msglist_*.selected.bg" = "#313244";
          "dirlist_*.selected.bold" = true;
          "dirlist_*.selected.bg" = "#313244";
          "statusline_default.fg" = "#9399b2";
          "statusline_default.bg" = "#313244";
          "statusline_error.bold" = true;
          "statusline_success.bold" = true;
          "completion_default.selected.bg" = "#313244";
        };
      };
    };
    # accounts.email.accounts.nqphu.aerc.enable = true;
  };
}
