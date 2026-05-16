{...}: {
  services = {
    xserver = {
      enable = true;
      desktopManager.cinnamon.enable = true;
    };
    cinnamon.apps.enable = true;
  };
}
