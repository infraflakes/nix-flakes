{ pkgs, ... }: {
  home.packages = with pkgs; [
    zip
    unzip
    p7zip
  ];

  programs.yazi = {
    enable = true;
    settings = {
      mgr = {
        sort_by = "mtime";
        sort_dir_first = true;
        sort_reverse = true;
      };
    };
  };
}
