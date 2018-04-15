{ config, lib, pkgs, ... }:
with lib;

{
  # resolves nix-shell failing with Error in tempdir() using /run/user/1000/nix-shell.XXXXX
  # https://nixos.wiki/wiki/Mosh
  system.activationScripts.systemd = stringAfter["groups"]
    ''
       loginctl enable-linger yeahnah
    '';

  environment.systemPackages = [ pkgs.mosh ];

  networking.firewall = {
    allowedUDPPortRanges = [
      { from = 60000; to = 61000; }  # mosh
    ];
  };

}

