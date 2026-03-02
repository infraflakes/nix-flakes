{
  config,
  lib,
  pkgs,
  username,
  ...
}: {
  #doas zfs create -o mountpoint=legacy iris_pool/nextcloud
  #doas zfs set com.sun:auto-snapshot=true iris_pool/nextcloud
  fileSystems."/data/nextcloud" = {
    device = "iris_pool/nextcloud";
    fsType = "zfs";
    options = ["nofail"];
    depends = ["/data"]; # Ensures the parent mount is ready first
  };
  # systemd.services.nextcloud = {
  #   description = "Nextcloud";
  #   after = ["network.target" "data-nextcloud.mount"];
  #   wantedBy = ["multi-user.target"];
  #
  #   serviceConfig = {
  #     Type = "simple";
  #     User = "root";
  #     Group = "root";
  #     WorkingDirectory = "/data/nextcloud";
  #     ExecStart = "${pkgs.podman}/bin/podman compose up";
  #     ExecStop = "${pkgs.podman}/bin/podman compose down";
  #     Restart = "always";
  #   };
  # };
}
