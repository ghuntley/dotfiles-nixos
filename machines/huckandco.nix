{ config, pkgs, ... }:

{
  imports =
    [
      ../profiles/desktop.nix
      ../profiles/docker.nix
      ../profiles/email.nix
      ../profiles/virtualization.nix

      ../roles/gitlab-runner.nix

      # Experimental
    ];

  services.tinc.networks."darknet".name = "yeahnah";

  services.openssh = {
    listenAddresses = [
      { addr = "yeahnah"; port = 22; }
      { addr = "yeahnah"; port = 22; }
    ];
  };

}
