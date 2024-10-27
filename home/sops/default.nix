{config, ...}: {
  sops = {
    defaultSopsFile = ../../serects/secrets.yaml;
    defaultSopsFormat = "yaml";
    gnupg = {
      home = "~/.gnupg";
      sshKeyPaths = [];
    };
    # defaultSymlinkPath = "/run/user/1000/secrets";
    # defaultSecretsMountPoint = "/run/user/1000/secrets.d";
  };
  sops.secrets."ssh/github/default" = {};
}
