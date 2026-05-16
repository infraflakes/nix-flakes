{inputs, ...}: {
  imports = [
    inputs.srwc.nixosModules.default
  ];

  programs.srwc.enable = true;
}
