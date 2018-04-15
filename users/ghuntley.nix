{ config, lib, pkgs, ... }:
with lib;

let secrets = import ../secrets.nix;
in
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.yeahnah = {
    description = "Geoffrey Huntley";
    group = "nah";
    extraGroups = [
      "audio"
      "libvirtd"
      "networkmanager"
      "users"
      "vboxusers"
      "video"
      "wheel"
    ];

    uid = 1000;

    createHome = true;
    home = "/home/yeahnah";
    shell = "/run/current-system/sw/bin/zsh";

    openssh.authorizedKeys.keys = secrets.sshKeys.yeah;

  };
  users.extraGroups.yeahnah.gid = 1000;

  system.activationScripts =
  {
    # Configure various dotfiles.
    dotfiles = stringAfter [ "users" ]
    ''
      cd /home/yeahnah
    '';
  };
}
