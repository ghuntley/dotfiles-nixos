{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    hue-cli
  ];
}

