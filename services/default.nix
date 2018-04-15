{ config, pkgs, ... }:

{
  imports = [
    ./duosec.nix
    ./fail2ban.nix
    ./fstrim.nix
    ./mosh.nix
    ./ntp.nix
    ./sshd.nix
    ./tinc.nix
  ];
}
