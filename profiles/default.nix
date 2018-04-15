{ config, pkgs, ... }:

{

  imports = [
    ../pkgs/bash/config.nix
    ../pkgs/emacs/config.nix
    ../pkgs/gist/config.nix
    ../pkgs/vim/config.nix
    ../pkgs/zsh/config.nix
  ];

  # List packages installed in system profile. To search by name, run:
  # nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    ack
    apg # random password generation
    aspell
    aspellDicts.en
    bind  # nslookup, dig
    blackbox # safely store secrets in git
    bridge-utils
    ctags
    curl
    dos2unix
    duplicity
    elinks
    expect
    file
    git-lfs
    gitAndTools.gitFull
    gnumake
    gnupg
    htop
    idutils
    iftop
    iotop
    lsof
    mkpasswd
    mosh
    most
    ncftp
    ncurses
    nix-prefetch-scripts
    nix-repl
    nmap
    nox # https://github.com/madjar/nox
    openssl
    p7zip
    pciutils
    pmutils
    psmisc
    stdenv
    strace
    sudo
    sysstat
    tcpdump
    tmux
    tmuxinator
    unison
    unzip
    usbutils
    vim_configurable
    w3m
    wget
    youtube-dl
    zip
    zsh
  ];

  # custom packages
  #nixpkgs.config.packageOverrides = pkgs: rec {
  #  heirloom-mailx = pkgs.callPackage ../pkgs/heirloom-mailx/default.nix { };
  #  unison_2_40_102 = pkgs.callPackage ../pkgs/unison/unison-2.40.102.nix { lablgtk = pkgs.ocamlPackages.lablgtk; };
  #};

  # Enable zsh as a login shell
  programs.zsh.enable = true;
}
