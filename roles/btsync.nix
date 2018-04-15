{ config, pkgs, ... }:

let secrets = import ../secrets.nix;
in
{
  imports = [
  ];

  services.btsync = {
     enableWebUI = false;
     httpListenAddr = "yeah";
     httpListenPort = nah;
     httpLogin = secrets.btsync.username;
     httpPass = secrets.btsync.password;
     apiKey = secrets.btsync.apiKey;

     downloadLimit = 0;
     uploadLimit = 0;

     directoryRoot = "/yeah/nah";
   };
}
