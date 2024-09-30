{config, ...}: {
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
    matchBlocks = {
      env = {
        host = "*";
        setEnv = {
          TERM = "xterm-256color";
        };
      };
      github = {
        host = "github.com";
        hostname = "github.com";
        identityFile = "~/.ssh/id_ed25519";
      };
      github-charlie = {
        host = "github.com-charlie";
        hostname = "github.com";
        identityFile = "~/.ssh/id_rsa_charlie";
      };
      gitlab-harvey = {
        host = "gitlab.com-harvey";
        hostname = "gitlab.com";
        identityFile = "~/.ssh/harvey-gitlab";
      };
      gitlab-keynold = {
        host = "gitlab.com-keynold";
        hostname = "gitlab.com";
        identityFile = "~/.ssh/keynold-gitlab";
      };
      gitlab-marcus = {
        host = "gitlab.com-marcus";
        hostname = "gitlab.com";
        identityFile = "~/.ssh/marcus-gitlab";
      };
      gitlab-zane = {
        host = "gitlab.com-zane";
        hostname = "gitlab.com";
        identityFile = "~/.ssh/zane-gitlab";
      };
      github-nqp = {
        host = "github.com-nqp";
        hostname = "github.com";
        identityFile = "~/.ssh/nqp-github";
      };
      mynixos-nqp = {
        host = "git.mynixos.com-nqp";
        hostname = "git.mynixos.com";
        identityFile = "~/.ssh/nqphu-mynixos";
      };
      github-baron = {
        host = "github.com-baron";
        hostname = "github.com";
        identityFile = "~/.ssh/baron-github";
      };
      github-troy = {
        host = "github.com-troy";
        hostname = "github.com";
        identityFile = "~/.ssh/troy-github";
      };
      bitbucket-troy = {
        host = "bitbucket.org-troy";
        hostname = "bitbucket.org";
        identityFile = "~/.ssh/troy-bitbucket";
      };
    };
  };
}
