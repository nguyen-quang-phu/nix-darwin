{
  config,
  pkgs,
  agenix,
  secrets,
  ...
}: let
  user = "harvey";
in {
  age.identityPaths = [
    "/Users/${user}/.ssh/id_ed25519"
  ];
  age.secrets."github-ssh-key" = {
    symlink = true;
    path = "/Users/${user}/.ssh/id_github";
    file = "${secrets}/github-ssh-key.age";
    mode = "600";
    owner = "${user}";
    group = "staff";
  };
}
