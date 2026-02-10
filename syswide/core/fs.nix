{
  config,
  pkgs,
  ...
}: {
#sudo zpool create -f -o ashift=12 -O compression=lz4 -O acltype=posixacl -O xattr=sa -O normalization=formD -O mountpoint=none iris_pool /dev/<disk>
#sudo zfs create -o mountpoint=legacy iris_pool/ocis
  boot.supportedFilesystems = [ "zfs" ];

  # head -c 8 /etc/machine-id
  networking.hostId = "e4a6f118";

  # 2. Tell Nix to import this pool automatically
  boot.zfs.extraPools = [ "iris_pool" ];

  # 3. Define the mount point
  fileSystems."/data" = {
    device = "iris_pool/ocis";
    fsType = "zfs";
    options = [ "nofail"]; 
  };
  
  services.zfs.autoScrub.enable = true;
  services.zfs.autoSnapshot.enable = true;
}
