{
  config,
  lib,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    ffmpeg-headless # No-GUI version of ffmpeg
    ffmpegthumbnailer # Specifically for generating cloud/file manager thumbs
    libva-utils # Includes 'vainfo' to test if this is working
  ];
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver # For Intel VA-API
      libvdpau-va-gl # VDPAU-to-VA-API translation for Intel
    ];
  };
  environment.variables = {
    LIBVA_DRIVER_NAME = "iHD";
    # LIBVA_DRIVER_NAME = "i965";
  };
}
