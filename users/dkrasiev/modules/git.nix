{ settings, ... }:

with settings.user;
{
  programs.git.enable = true;
  programs.git.userName = name;
  programs.git.userEmail = email;
}
