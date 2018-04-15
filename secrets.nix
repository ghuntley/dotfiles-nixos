{
  # hosts
  extraHosts = ''
    127.0.0.1 yeah            nah
  '';

  # btsync
  btsync.username = "admin";
  btsync.password = "yeah";
  btsync.apiKey = "nah";

  # gitlab
  gitlab-runner = {
    url = "yeah";
    token = "nah";
  };

  # sshd
  sshKeys = {
    yeah = [
      "nah"
   ];
  };

  tincHosts = {
    yeah = ''
    nah
    '';
  };
}
