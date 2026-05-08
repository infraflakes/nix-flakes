{pkgs, ...}: {
  services.desktopManager.plasma6.enable = true;
  services.displayManager = {
    # Enable the new Plasma Login Manager
    plasma-login-manager.enable = true;
    # Disable SDDM
    sddm.enable = false;
  };
  services.orca.enable = false;
  environment.etc."xdg/baloofilerc".text = ''
    [Basic Settings]
    Indexing-Enabled=false
  '';

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    plasma-browser-integration
    konsole
    elisa
    gwenview
    okular
    kate
    khelpcenter

    dolphin
    ark

    print-manager
    baloo-widgets # baloo information in Dolphin
    dolphin-plugins
    ffmpegthumbs
    krdp
    kwalletmanager # "KWalletManager"
    print-manager # "Manage Printing" (usually pulls in the CUPS interface)
    discover # "Discover" (Software Center)
    qrca # "QRca" (QR Code scanner)
    plasma-systemmonitor # "System Monitor"
  ];
}
