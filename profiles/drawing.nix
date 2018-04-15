{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    krita
  ];

  services.xserver.wacom.enable = true;
}
