# Most of the configuration is in here. This configuration is common to both
# conventional NixOS installs (see nixos-install) and NixOS installed by
# Nixops. For configuration specific to conventional installs and Nixops
# installs, see ./configuration.nix and ./nixops.nix respectively.

{ config, lib, pkgs, ... }:
with lib;

let secrets = import ./secrets.nix;
in
rec {
  imports = [
    # Import default packages.
    ./profiles/default.nix

    # Import default services.
    ./services/default.nix
    
    # Create user accounts 
    ./users/ghuntley.nix
    ./users/mgmt.nix
  ];

  # Allow proprietary software (such as the NVIDIA drivers).
  nixpkgs.config.allowUnfree = true;

  boot = {
    # See console messages during early boot.
    initrd.kernelModules = [ "fbcon" ];

    # Disable console blanking after being idle.
    kernelParams = [ "consoleblank=0" ];
 
    # Clean /tmp on boot
    cleanTmpDir = true;

  
  };
 
  # /etc/hosts
  networking.extraHosts = secrets.extraHosts;

  # Google nameservers
  networking.nameservers = [
    "8.8.8.8"
    "8.8.4.4"
  ];

  # Select internationalisation properties.
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  # Set the timezone.
  time.timeZone = "Australia/Sydney";

  # automatic updates every day
  system.autoUpgrade.enable = true;

  # automatic gc
  nix.gc.automatic = true;
  nix.gc.dates = "weekly";
  nix.gc.options = "--delete-older-than 30d";

# FIXME: wpa_supplicant expects the wpa_supplicant.conf file to be in a read/write filesystem. This is a problem.
#    # Configure wireless networks
#    wpa_supplicant = ''  # FIXME: does this name have potential for conflict? must investigate
#      ln -fs ${./private/etc/wpa_supplicant.conf} /etc/wpa_supplicant.conf
#    '';
#  };

  # Disable displaying the NixOS manual in a virtual console.
  services.nixosManual.showManual = false;

  # Disable the infamous systemd screen/tmux killer
  services.logind.extraConfig = ''
    KillUserProcesses=no
  '';

  # Increase the amount of inotify watchers
  # Note that inotify watches consume 1kB on 64-bit machines.
  boot.kernel.sysctl = {
    "fs.inotify.max_user_watches"   = 1048576;   # default:  8192
    "fs.inotify.max_user_instances" =    1024;   # default:   128
    "fs.inotify.max_queued_events"  =   32768;   # default: 16384
  };


  # Locate will update its database everyday at lunch time
  services.locate.enable = true;
  services.locate.interval = "00 12 * * *";

}
