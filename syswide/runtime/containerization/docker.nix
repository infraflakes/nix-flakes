{...}: {
  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
      daemon.settings = {
        dns = [
          "1.1.1.1"
          "8.8.8.8"
        ];
        registry-mirrors = [
          "https://mirror.gcr.io"
          "https://quay.io"
          "https://registry.fedoraproject.org"
        ];
      };
    };
  };
}
