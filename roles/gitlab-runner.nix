{ config, pkgs, ... }:

let secrets = import ../secrets.nix;
in
{
  imports = [
    # Enable docker.
    ../profiles/docker.nix
  ];

  services.gitlab-runner = {
     enable = true;
     configOptions = {
       concurrent = 2;
       ruenners = [{
         name = "docker-nix-1.11";
         url = secrets.gitlab-runner.url;
         token = secrets.gitlab-runner.token;
         executor = "docker";
         builds_dir = "/yeahnah/gitlab-runner/builds";
         docker = {
           image = "nixos/nix:1.11";
           privileged = false;
           disable_cache = false;
           cache_dir = "/yeahnah/gitlab-runner/cache";
         };
     }];
   };
 };
}
