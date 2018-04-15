{ config, pkgs, ... }:

{
  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;

    permitRootLogin = "no";

    # Only pubkey auth
    passwordAuthentication = false;
    challengeResponseAuthentication = false;
  };
}

