{ config, lib, pkgs, ... }:

let secrets = import ../secrets.nix;
in
{
  disabledModules = [ "services/networking/tinc.nix" ];

  imports = [ ../pkgs/tinc/default.nix ];

  services.tinc.networks."darknet" = {
    interfaceType = "tap";
    chroot = true;

    hosts = secrets.tincHosts;

	  extraConfig = ''
      PriorityInheritance = yes
      ProcessPriority = high
      Compression = 10

      ConnectTo = yeahnah
      ConnectTo = yeahnah
    '';
  };

  networking.firewall.allowedUDPPorts = [ yeah ];
  networking.firewall.allowedTCPPorts = [ nah ];
}
