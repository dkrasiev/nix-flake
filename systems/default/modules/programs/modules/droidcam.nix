{ config, pkgs, ... }:

{
  # TODO: Get install of v4l2loopback-ctl working.
  environment.systemPackages = [
    pkgs.v4l-utils
    pkgs.droidcam
    config.boot.kernelPackages.v4l2loopback
  ];

  boot = {
    # Make v4l2loopback kernel module available to NixOS.
    extraModulePackages = with config.boot.kernelPackages; [
      v4l2loopback
    ];
    # Activate kernel modules.
    kernelModules = [
      # Virtual camera.
      "v4l2loopback"
      # Virtual microphone, built-in.
#     "snd-aloop" <-- Not worried about getting this working right now.
    ];
    # Set initial kernel module settings.
    extraModprobeConfig = ''
      options v4l2loopback video_nr=2,3 width=640,1920 max_width=1920 height=480,1080 max_height=1080 format=YU12,YU12 exclusive_caps=1,1 card_label=Phone,Laptop debug=1
    '';
  };
}
