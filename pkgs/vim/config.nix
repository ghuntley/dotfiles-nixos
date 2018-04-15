{ config, pkgs, ... }:

{

  nixpkgs.config.vim = {
    ftNixSupport = true;
  };

  environment.interactiveShellInit = ''
    alias vi='vim'
  '';

  environment.variables = {
    EDITOR = [ "${pkgs.vim}/bin/vim" ];
  };

  environment.etc.vimrc = {
    text = ''
      " Use Vim settings, rather than Vi settings (much better!).
      " This must be first, because it changes other options as a side effect.
      set nocompatible
      
      " allow backspacing over everything in insert mode
      set backspace=indent,eol,start

      " keep 1024 lines of command line history
      set history=1024
      
      " use syntax highlighting if possible
      if has("syntax")
        syntax on
      endif
      
      " spaces not tabs
      set tabstop=2
      set shiftwidth=2
      set expandtab

      " show the cursor position all the time
      set ruler
    '';
  };

  environment.systemPackages = [ pkgs.vim_configurable ];
}
