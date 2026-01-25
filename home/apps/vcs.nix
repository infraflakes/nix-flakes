{
  config,
  pkgs,
  ...
}: {
  programs.direnv = {
    enable = true;
  };
  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        email = "infraflakes@proton.me";
        name = "infraflakes";
      };
      ui = {
        pager = "cat";
      };
    };
  };
}
