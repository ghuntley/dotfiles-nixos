{ config, lib, pkgs, ... }:

{
  # Debug options for kernel hacking
  nixpkgs.config.packageOverrides = pkgs: rec {
    stdenv = pkgs.stdenv // 
    {
      platform = pkgs.stdenv.platform //
      {
        kernelExtraConfig = ''
          DEBUG_KERNEL y
          MAGIC_SYSRQ y
          KALLSYMS y
          IKCONFIG y
          IKCONFIG_PROC y
          DEBUG_INFO y
          FRAME_POINTER y
          DEBUG_STACKOVERFLOW y
          DEBUG_STACK_USAGE y
        '';
      };
    };
  };
}
