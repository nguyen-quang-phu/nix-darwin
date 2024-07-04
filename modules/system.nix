{
  pkgs,
  hostname,
  ...
}:
###################################################################################
#
#  macOS's System configuration
#
#  All the configuration options are documented here:
#    https://daiderd.com/nix-darwin/manual/index.html#sec-options
#
###################################################################################
{
  system = {
    # activationScripts are executed every time you boot the system or run `nixos-rebuild` / `darwin-rebuild`.
    activationScripts.postUserActivation.text = ''
      # activateSettings -u will reload the settings from the database and apply them to the current session,
      # so we do not need to logout and login again to make the changes take effect.
      /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
    '';

    defaults = {
      menuExtraClock.Show24Hour = true; # show 24 hour clock

      # smb.NetBIOSName = hostname;
      dock = {
        autohide = true; # Whether to automatically hide and show the dock. The default is false.
        autohide-delay = 0.5; # Sets the speed of the autohide delay.
        autohide-time-modifier = 0.5; # Sets the speed of the animation when hiding/showing the Dock.
        launchanim = false; # Animate opening applications from the Dock.
        orientation = "left"; # Position of the dock on screen. The default is “bottom”.
        show-recents = false; # Show recent applications in the dock. The default is true.
        showhidden = true; # Whether to make icons of hidden applications tranclucent. The default is false.
        tilesize = 16; # Size of the icons in the dock. The default is 64.
      };
      # other macOS's defaults configuration.
      # ......
    };
  };

  # Add ability to used TouchID for sudo authentication
  security.pam.enableSudoTouchIdAuth = true;

  # Create /etc/zshrc that loads the nix-darwin environment.
  # this is required if you want to use darwin's default shell - zsh
  programs.zsh.enable = true;
}
