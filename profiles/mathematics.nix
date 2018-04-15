{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnuplot
  ];
}
