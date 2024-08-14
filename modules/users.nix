{ user, ... }:

{
  users.users.${user.name} = {
    isNormalUser = true;
    description = user.description;
    extraGroups = [ "networkmanager" "wheel" "docker" "libvirtd" ];
  };
}
