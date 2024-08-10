{...}: {
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
        identityFile = "~/.ssh/id_rsa";
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
