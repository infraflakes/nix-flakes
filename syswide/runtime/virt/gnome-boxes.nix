{
  username,
  pkgs,
  ...
}: {
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu.swtpm.enable = true;
    };
    spiceUSBRedirection.enable = true;
  };
  services.qemuGuest.enable = true;
  services.spice-vdagentd.enable = true;
  users.users.${username}.extraGroups = [
    "libvirtd"
    "kvm"
  ];
  environment.systemPackages = with pkgs; [
    gnome-boxes
  ];
}
