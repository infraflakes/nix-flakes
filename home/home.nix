{
  pkgs,
  inputs,
  username,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
    stateVersion = "26.05";
    sessionVariables = {
      EDITOR = "nvim";
    };
    sessionPath = [
      "$HOME/.local/bin"
      "$HOME/.cargo/bin"
    ];
    packages = [
      inputs.srn-coreutils.packages.${pkgs.stdenv.hostPlatform.system}.default
      inputs.scd.packages.${pkgs.stdenv.hostPlatform.system}.default
      pkgs.lsd
    ];
  };
  imports = [
    ./pkg/pkgs.nix
    ./environment/environment.nix
  ];
}
