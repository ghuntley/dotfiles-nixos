{ config, lib, pkgs, ... }:
with lib;

{
  disabledModules = [ "security/duosec.nix" ];
  imports = [ ../pkgs/duosec/default.nix ];

  security.duosec = {
    ssh.enable = true;
    # pam.enable = true; <-- not currently impl

    allowTcpForwarding = true;
    permitTunnel = true;

    ikey = "yeahnah";
    skey = "yeahnah";
    host = "yeahnah";

    # when using autopush, prompts should be set to 1
    autopush = true;
    prompts = 1;
  
    motd = true;
  };

}
