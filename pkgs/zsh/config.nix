{ config, pkgs, ... }:

{
  programs.zsh.enable = true;
  programs.zsh.ohMyZsh.enable = true;

  #environment.variables = {
  #  OH_MY_ZSH = [ "${pkgs.oh-my-zsh}/share/oh-my-zsh" ];
  #};
}
