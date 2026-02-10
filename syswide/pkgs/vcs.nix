{
  config,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    config = {
      user.name = "infraflakes";
      user.email = "infraflakes@proton.com";
    };
  };
}
