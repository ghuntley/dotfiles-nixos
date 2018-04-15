{ config, lib, pkgs, ... }:

{
  # Allow the Steam controller to be configured by Steam
  services.udev.extraRules =
    ''
      # This rule is needed for basic functionality of the controller in Steam and keyboard/mouse emulation
      SUBSYSTEM=="usb", ATTRS{idVendor}=="28de", MODE="0666"

      # This rule is necessary for gamepad emulation
      KERNEL=="uinput", MODE="0660", GROUP="ghuntley", OPTIONS+="static_node=uinput"
    '';
}

