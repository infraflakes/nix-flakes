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

  services.cron = {
  	enable = true;
  	systemCronJobs = [
    	# "*/15 * * * * root  docker exec --user www-data nextcloud-app php occ preview:pre-generate" #once every 15 min
	"0 2 * * * root docker exec --user www-data nextcloud-app php occ preview:pre-generate" # once every day at 2 am
  	];
  };
}
