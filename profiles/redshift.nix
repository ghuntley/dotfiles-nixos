{ config, pkgs, ... }:

{
  services.redshift = {
    enable = true;
    latitude = "33.7710";
    longitude = "-150.9063";
    temperature.night = 4000;
    brightness.night = "0.8";
  };
}
