{
  pkgs,
  inputs,
  ...
}: {
  home.packages = [inputs.sro.packages.${pkgs.stdenv.hostPlatform.system}.default];
  home.file.".config/sro/config.sro".text = ''
    shell = `bash`;
    var shell workdir = `echo $HOME/dev`;
    sanctuary = $workdir;

    pr nix {
      url = `forgejo@nix-server:infraflakes/nix-flakes.git`;
      dir = `nix`;
      sync = `clone`;
      branch = `wsl`;
    }

    pr sro {
      url = `forgejo@nix-server:infraflakes/sro.git`;
      dir = `sro`;
      sync = `clone`;
      use = `.sro/main.sro`;
    }

    pr portfolio {
      url = `forgejo@nix-server:infraflakes/infraflakes-github-io.git`;
      dir = `portfolio`;
      sync = `clone`;
      use = `.sro/main.sro`;
    }

    pr srwc {
      url = `https://github.com/infraflakes/srwc.git`;
      dir = `srwc`;
      sync = `ignore`;
      branch = `architectural-cleanups`;
      use = `.sro/main.sro`;
    }
  '';
}
