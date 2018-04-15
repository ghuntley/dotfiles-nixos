{ config, lib, pkgs, ... }:

{
  # install graphics-related packages
  environment.systemPackages = with pkgs; [
    blender
    gimp
    inkscape
  ];
}
