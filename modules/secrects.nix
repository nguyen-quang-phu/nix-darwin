{ config, pkgs, agenix, secrets, ... }:

let user = "harvey"; in
{
  
  age.identityPaths = [ 
    "/Users/${user}/.ssh/id_ed25519"
  ];

  age.secrets."nqphu-github" = {
    symlink = true;
    path = "/Users/${user}/.ssh/nqphu-github";
    file =  "${secrets}/nqphu-github.age";
    mode = "600";
    owner = "${user}";
  };
}
