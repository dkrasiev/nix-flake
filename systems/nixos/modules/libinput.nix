{
  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  services.libinput.touchpad.tapping = true;
  services.libinput.touchpad.naturalScrolling = true;

  services.libinput.mouse.accelProfile = "flat";
}
