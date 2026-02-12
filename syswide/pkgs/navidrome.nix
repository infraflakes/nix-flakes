{
  config,
  pkgs,
  username,
  ...
}: {
  # Create the dataset
  # doas zfs create iris_pool/navidrome
  # doas zfs set recordsize=128k iris_pool/navidrome  # Better for large audio files
  # doas zfs set compression=off iris_pool/navidrome # FLAC/MP3 don't compress further
  # doas zfs set atime=off iris_pool/navidrome
  # doas zfs set mountpoint=legacy iris_pool/navidrome
  # doas zfs set com.sun:auto-snapshot=true iris_pool/navidrome
  # doas zfs destroy -r iris_pool/navidrome
  fileSystems."/data/navidrome" = {
    device = "iris_pool/navidrome";
    fsType = "zfs";
    options = ["nofail"];
    depends = ["/data"];
  };

  environment.systemPackages = [pkgs.navidrome];
  systemd.services.navidrome = {
    description = "Navidrome Music Server";
    after = ["network.target" "data-navidrome.mount"];
    requires = ["data-navidrome.mount"];
    wantedBy = ["multi-user.target"];

    serviceConfig = {
      Type = "simple";
      User = username;
      Group = "users";
      # Navidrome stores its SQLite DB and cache here
      WorkingDirectory = "/data/navidrome";
      ExecStart = "${pkgs.navidrome}/bin/navidrome";
      Restart = "always";
    };

    environment = {
      ND_DATAFOLDER = "/data/navidrome";
      ND_MUSICFOLDER = "/data/navidrome/library";
      ND_PORT = "4533";
      ND_SCANSCHEDULE = "1h";
      ND_LOGLEVEL = "info";
    };
  };
}
