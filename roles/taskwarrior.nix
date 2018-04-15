{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    taskwarrior
  ];

  services.taskserver.enable = true;

}
