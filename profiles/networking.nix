{ config, lib, pkgs, ... }:

{
  # install networking packages
  environment.systemPackages = with pkgs; [
    etherape
    ettercap
    tcpdump
    wireshark
  ];
}
