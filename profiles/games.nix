{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    openra
    prboom
    scorched3d

    # Game related tools
    steam
  ];

  nixpkgs.config.packageOverrides = pkgs: rec {
    # steam = pkgs.callPackage ../pkgs/steam/chrootenv.nix { };
  };
}
