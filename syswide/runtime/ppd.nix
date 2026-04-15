{...}: {
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
  systemd.services.battery-charge-threshold = {
    wantedBy = ["multi-user.target"];
    description = "Set battery charge threshold to 80%";
    serviceConfig = {
      Type = "oneshot";
      Restart = "on-failure";
    };
    script = ''
      echo 80 > /sys/class/power_supply/BAT0/charge_control_end_threshold
    '';
  };
}
