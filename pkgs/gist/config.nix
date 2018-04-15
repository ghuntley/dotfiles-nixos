{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ gist ];

  environment.interactiveShellInit = ''
    alias gist='gist --private'
  '';
}
