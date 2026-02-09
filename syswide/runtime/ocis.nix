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
      # Disable the internal proxy if use Cloudflare Tunnel or Nginx
      PROXY_TLS = "false";
    };
  };
  systemd.services.ocis = {
    description = "ownCloud Infinite Scale";
    after = ["network.target" "local-fs.target"];
    wantedBy = ["multi-user.target"];

    serviceConfig = {
      Type = "simple";
      User = username;
      Group = "users";
      WorkingDirectory = "/data/ocis";
      EnvironmentFile = "/data/ocis/runtime.env";
      ExecStart = "${pkgs.ocis}/bin/ocis server";
      Restart = "always";
    };
  };
}
