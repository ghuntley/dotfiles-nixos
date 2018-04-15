{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cudatoolkit
  ];

  services.xserver.videoDrivers = [ "nvidia" ];

  systemd.services.nvidia-control-devices = {
    wantedBy = [ "multi-user.target" ];
    serviceConfig.ExecStart = "${pkgs.linuxPackages.nvidia_x11}/bin/nvidia-smi";
  };
      
  nixpkgs.config.allowUnfree = true;

  system.activationScripts =
  {
    # Enable OpenCL
    opencl =
    ''
      cd /etc
      mkdir -p ./OpenCL/vendors
      cd ./OpenCL/vendors
#      echo '${pkgs.linuxPackages.nvidia_x11}' > nvidia.icd
    '';
  };
}
