{
  hostname,
  username,
  ...
}:
#############################################################
#
#  Host & Users configuration
#
#############################################################
{
  networking = {
    hostName = hostname;
    computerName = hostname;
  };

  users.users."${username}" = {
    home = "/Users/${username}";
    description = username;
  };
}
