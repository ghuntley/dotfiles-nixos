{ config, pkgs, ... }:

{
  services.xrdp.enable = true;
  services.xrdp.defaultWindowManager = "${pkgs.i3-gaps}/bin/i3";
}