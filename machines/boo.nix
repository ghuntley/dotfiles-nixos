{ config, pkgs, ... }:

{
  imports =
    [
      ../profiles/android.nix
      ../profiles/audio.nix
      #../profiles/bluetooth.nix
      ../profiles/desktop.nix
      ../profiles/development.nix
      #../profiles/docker.nix
      ../profiles/dotnet.nix
      ../profiles/drawing.nix
      ../profiles/email.nix
      ../profiles/games.nix
      ../profiles/graphics.nix
      ../profiles/homeautomation.nix
      ../profiles/latex.nix
      ../profiles/livecoding.nix
      ../profiles/maclaptop.nix
      ../profiles/mathematics.nix
      ../profiles/networking.nix
      ../profiles/powermanagement.nix
      ../profiles/printing.nix
      ../profiles/redshift.nix
      ../profiles/rust.nix
      ../profiles/ruby.nix
      ../profiles/steam.nix
      ../profiles/virtualization.nix

      ../roles/btsync.nix
      # Experimental
    ];

  # required for 2011 macbook air broadcom drivers
  nixpkgs.config.allowUnfree = true;

#  networking.firewall.enable = false;
#  networking.firewall.allowPing = true;
# Set a static IP when I didn't want to set up dhcp
#  networking.defaultGateway = "192.168.0.1";
#  networking.interfaces.enp3s0 = {
#    ipAddress = "192.168.0.42";
#    prefixLength = 24;
#  };

  # Speed up development at the cost of possible build race conditions
  nix.buildCores = 4;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices = [
    {
      name = "root"; device = "/dev/sda2"; preLVM = true;
    }
  ];

  boot.extraModprobeConfig = ''
  options resume=/dev/rootvg/swap
  '';

  
  networking.hostName = "boo";

  services.btsync.enable = false;
  services.btsync.deviceName = "boo";

  networking.networkmanager.enable = true;

  powerManagement.enable = true;

  hardware.facetimehd.enable = true;
  #hardware.bluetooth.enable = true;

  hardware.opengl.extraPackages = [ pkgs.vaapiIntel ];

}

