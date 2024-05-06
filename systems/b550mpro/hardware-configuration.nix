# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

let
  rootPartition = "/dev/disk/by-uuid/bddfb118-1e1a-4307-8f61-c9dd6f41b62c";
  bootPartition = "/dev/disk/by-uuid/1EEB-502D";
in
{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.extraModulePackages = [ ];
  boot.loader.grub.device = bootPartition;

  fileSystems."/" =
    { device = rootPartition;
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = bootPartition;
      fsType = "vfat";
    };

  swapDevices = [ ];
}
