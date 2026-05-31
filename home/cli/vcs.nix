{ ... }: {
  programs.direnv = {
    enable = true;
  };
  programs.diff-so-fancy = {
    enable = true;
    enableGitIntegration = true;
  };
  programs.git = {
    enable = true;
    settings = {
      user = {
        email = "infraflakes@proton.me";
        name = "infraflakes";
      };
      color.diff = {
        meta = "blue";
        frag = "brightyellow";
        old = "red";
        new = "green";
      };
    };
  };

  # Generate key: ssh-keygen -t ed25519 -C "infraflakes@proton.me"
  # ssh-add ~/.ssh/id_ed25519
  # `cat ~/.ssh/id_ed25519.pub` then copy and make new ssh key on github

  # Ensure the SSH agent starts with session
  services.ssh-agent.enable = true;
  home.sessionVariables = {
    SSH_AUTH_SOCK = "/run/user/1000/ssh-agent";
  };
}
