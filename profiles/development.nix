{ config, lib, pkgs, ... }:

{
  imports = [
    ./haskell.nix
  ];

  # install development packages
  environment.systemPackages = with pkgs; [
    zlib
  ];

  # custom packages
  nixpkgs.config.packageOverrides = pkgs: rec {
  };

}
