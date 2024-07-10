{
  lib,
  username,
  useremail,
  ...
}: {
  # `programs.git` will generate the config file: ~/.config/git/config
  # to make git use this config file, `~/.gitconfig` should not exist!
  #
  #    https://git-scm.com/docs/git-config#Documentation/git-config.txt---global
  home.activation.removeExistingGitconfig = lib.hm.dag.entryBefore ["checkLinkTargets"] ''
    rm -f ~/.gitconfig
  '';
  programs = {
    git = {
      enable = true;
      lfs.enable = true;

      includes = [
        {
          condition = "gitdir:~/.config/";
          contents = {
            user = {
              email = useremail;
              name = username;
            };
          };
        }
        {
          condition = "gitdir:~/Code/Personal/";
          contents = {
            user = {
              email = useremail;
              name = username;
            };
          };
        }
        {
          condition = "gitdir:~/Code/GO/GIGADMIN/harvey/";
          contents = {
            user = {
              email = "harvey.nguyen.goldenowl@gmail.com";
              name = "harvey-gig";
            };
          };
        }
        {
          condition = "gitdir:~/Code/GO/GIGADMIN/sean/";
          contents = {
            user = {
              email = "sean.tran.goldenowl@gmail.com";
              name = "sean-gig";
            };
          };
        }
        {
          condition = "gitdir:~/Code/GO/GIGADMIN/troy/";
          contents = {
            user = {
              email = "troy.tran.goldenowl@gmail.com";
              name = "troy-gig";
            };
          };
        }
      ];

      extraConfig = {
        init.defaultBranch = "main";
        push.autoSetupRemote = true;
        pull.rebase = true;
      };

      # signing = {
      #   key = "xxx";
      #   signByDefault = true;
      # };

      delta = {
        enable = true;
        options = {
          features = "side-by-side";
        };
      };

      aliases = {
        email = "config --local user.email";
        name = "config --local user.name";
        s = "stash -u";
        sp = "stash apply stash@{0}";
        pf = "push --force-with-lease";
      };
      ignores = [
        ".DS_Store"
        "Thumbs.db"
      ];
    };

    git-cliff = {
      enable = true;
    };

    lazygit = {
      enable = true;
    };
  };
}
