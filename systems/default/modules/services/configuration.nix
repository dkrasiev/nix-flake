{
  imports = [
    # ./modules/xserver.nix
  ];

  services = {
    libinput = {
      enable = true;
      touchpad.tapping = true;
      touchpad.naturalScrolling = true;
      mouse.accelProfile = "flat";
    };

    printing.enable = true;
    samba.enable = true;
  };
}
