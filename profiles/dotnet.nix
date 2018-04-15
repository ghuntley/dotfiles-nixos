{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    mono50
    monodevelop

  ];
}
