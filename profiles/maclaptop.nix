{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    efivar # used to mute macbook air startup beep
    lightum # macbook light sensor daemon
  ];

  services = {
    xserver = {
      synaptics = {
        enable = true;
        dev = "/dev/input/event*";
        twoFingerScroll = true;
        tapButtons = false;
        accelFactor = "0.06";
        buttonsMap = [ 1 3 2 ];
        palmDetect = true;
        additionalOptions = ''
          Option "VertScrollDelta" "-180" # scroll sensitivity, the bigger the negative number = less sensitive
          Option "HorizScrollDelta" "-180"
          Option "FingerLow" "40"
          Option "FingerHigh" "70"
          Option "Resolution" "270" # Pointer sensitivity, this is for a retina screen, so you'll probably need to change this for an air
        '';
      };
    };
  };
}

