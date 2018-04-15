{ pkgs, ... }:

{

  services.xserver = {
    enable = true;
    enableCtrlAltBackspace = true;

    windowManager = {
      i3.enable = true;
      i3.package = pkgs.i3-gaps;
      default = "i3";
    };

    displayManager = {
      sessionCommands = "i3status &";
    };

    desktopManager = {
      default = "none";
      xterm.enable = false;
    };

  };

  nixpkgs.config = {
    chromium = {
      jre = false;
      enableGoogleTalkPlugin = true;
      enableAdobeFlash = false;
      enablePepperPDF = true;
    };

    firefox = {
      jre = false;
      enableGoogleTalkPlugin = true;
      enableAdobeFlash = false;
      enablePepperPDF = true;
    };
  };

  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      corefonts
      dejavu_fonts
      emojione
      fira-code
      font-awesome-ttf
      inconsolata
      proggyfonts
      powerline-fonts
      source-code-pro
      source-sans-pro
      source-serif-pro
      terminus_font
      ubuntu_font_family
      vistafonts
    ];
  };

  environment.systemPackages = with pkgs; [
    xorg.xrdb
    xorg.setxkbmap
    xorg.iceauth # required for KDE applications (it's called by dcopserver)
    xorg.xlsclients
    xorg.xset
    xorg.xsetroot
    xorg.xinput
    xorg.xprop
    xorg.xauth
    xorg.xmodmap
    xorg.xbacklight
    numlockx
    xautolock
    xss-lock
    xtitle
    xclip

    imagemagick

    xterm
    xdg_utils

    gparted

    rofi
    dmenu
    feh       # for background image
    i3lock    # screen lock
    i3status  # sys info  
    scrot     # for screenshot
    hyper
    terminator
    alacritty

    epdfview
    chromium
    dunst
    uget
    wireshark
    firefox
    gimp
    inkscape
    xfontsel
    slack
    atom
    zoom-us
    vimHugeX
    i3minator
    evince
    libreoffice
    vlc

    keybase
    keybase-gui

    gnome3.nautilus
    gnome3.eog

    google-play-music-desktop-player
    messenger-for-desktop

    vscode
  ];

  
  # Enable corsair keyboard/mouse
  hardware.ckb.enable = true;
  
  # Enable 3D acceleration for 32bit applications (e.g. wine)
  hardware.opengl.driSupport32Bit = true;
  hardware.opengl.driSupport = true;
  hardware.opengl.enable = true;

  # Allow ChromeCast to send/receive packets
  # http://askubuntu.com/a/326224/177448
  networking.firewall.extraCommands = ''
    iptables -I INPUT -p udp -m udp --dport 32768:60999 -j ACCEPT
  '';
}
