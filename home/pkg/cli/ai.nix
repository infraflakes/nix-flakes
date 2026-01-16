{
  config,
  pkgs,
  ...
}: let
  nvidia = "cuda";
  amd = "rocm";
in {
  home = {
    sessionVariables = {
      OLLAMA_KV_CACHE_TYPE = "q8_0";
      OLLAMA_FLASH_ATTENTION = "1";
    };
    packages = [
      (pkgs.ollama.override {
        acceleration = nvidia;
      })
    ];
  };
}
