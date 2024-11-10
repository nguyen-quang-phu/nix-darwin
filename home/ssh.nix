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
        identitiesOnly = true;
        identityFile = config.sops.secrets."ssh/github/default".path;
      };
      github-charlie = {
        host = "github.com-charlie";
        hostname = "github.com";
        identitiesOnly = true;
        identityFile = config.sops.secrets."ssh/github/charlie".path;
      };
      github-nqp = {
        host = "github.com-nqp";
        hostname = "github.com";
        identitiesOnly = true;
        identityFile = config.sops.secrets."ssh/github/nqphu".path;
      };
      github-baron = {
        host = "github.com-baron";
        hostname = "github.com";
        identitiesOnly = true;
        identityFile = config.sops.secrets."ssh/github/baron".path;
      };
      github-troy = {
        host = "github.com-troy";
        hostname = "github.com";
        identitiesOnly = true;
        identityFile = config.sops.secrets."ssh/github/troy".path;
      };
      github-tim = {
        host = "github.com-tim";
        hostname = "github.com";
        identitiesOnly = true;
        identityFile = config.sops.secrets."ssh/github/tim".path;
      };
      gitlab-harvey = {
        host = "gitlab.com-harvey";
        hostname = "gitlab.com";
        identitiesOnly = true;
        identityFile = config.sops.secrets."ssh/gitlab/harvey".path;
      };
      gitlab-keynold = {
        host = "gitlab.com-keynold";
        hostname = "gitlab.com";
        identitiesOnly = true;
        identityFile = config.sops.secrets."ssh/gitlab/keynold".path;
      };
      gitlab-marcus = {
        host = "gitlab.com-marcus";
        hostname = "gitlab.com";
        identitiesOnly = true;
        identityFile = config.sops.secrets."ssh/gitlab/marcus".path;
      };
      gitlab-zane = {
        host = "gitlab.com-zane";
        hostname = "gitlab.com";
        identitiesOnly = true;
        identityFile = config.sops.secrets."ssh/gitlab/zane".path;
      };
      mynixos-nqp = {
        host = "git.mynixos.com-nqp";
        hostname = "git.mynixos.com";
        identityFile = "~/.ssh/nqphu-mynixos";
      };
      bitbucket-troy = {
        host = "bitbucket.org-troy";
        hostname = "bitbucket.org";
        identityFile = "~/.ssh/troy-bitbucket";
      };
      gitlab-silas = {
        host = "gitlab.com-silas";
        hostname = "gitlab.com";
        identityFile = "~/.ssh/gitlab_silas";
      };
    };
  };
}
