{ config, pkgs, ... }:

{
  imports =
    [
      ../profiles/desktop.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  
  # Define on which hard drive you want to install Grub.
  #boot.loader.grub.device = "/dev/sda";
}
