{
  config,
  lib,
  pkgs,
  username,
  ...
}: {
  environment = {
    systemPackages = with pkgs; [ocis];
    variables = {
      OCIS_CONFIG_DIR = "/data/ocis/config";
      OCIS_BASE_DATA_PATH = "/data/ocis/data";
    };
  };
  systemd.services.ocis = {
    description = "ownCloud Infinite Scale";
    after = ["network.target" "local-fs.target"];
    wantedBy = ["multi-user.target"];

    environment = {
      OCIS_CONFIG_DIR = "/data/ocis/config";
      OCIS_BASE_DATA_PATH = "/data/ocis/data";
      # STORAGE_USERS_DRIVER = "posix";
      PROXY_HTTP_ADDR = "192.168.1.20:9200";
      PROXY_TLS = "false"; # Disable the internal proxy if use Cloudflare Tunnel or Nginx
      OCIS_INSECURE = "true";
    };
    serviceConfig = {
      Type = "simple";
      User = username;
      Group = "users";
      WorkingDirectory = "/data/ocis";
      ExecStart = "${pkgs.ocis}/bin/ocis server";
      EnvironmentFile = "/data/ocis/runtime.env";
      Restart = "always";
    };
  };
}
