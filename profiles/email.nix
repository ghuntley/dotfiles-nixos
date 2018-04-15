{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    offlineimap
    notmuch
    python27Packages.alot
    python36Packages.afew
  ];
}
