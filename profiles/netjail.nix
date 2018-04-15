{ config, pkgs, ... }:

{

  # thx pjf - https://twitter.com/pjf/status/956338472863727616
  # usage: `sg netjail cmdname`

  networking.firewall.enable = true;
  networking.firewall.extraCommands = ''
    # Always allow loopback traffic
    iptables -A OUTPUT -o lo -j ACCEPT

    # Block any traffic from the netjail group
    iptables -A OUTPUT -m owner --gid-owner netjail -j LOG --log-prefix 'Netjailed process blocked: '
    #iptables -A OUTPUT -m owner --gid-owner netjail -j REJECT
  '';


  users.extraGroups = {
    netjail = { };
  };

}


