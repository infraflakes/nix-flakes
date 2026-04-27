{...}: {
  home.file.".config/sro/config.sro".text = ''
    shell = `bash`;
    var shell workdir = `echo $HOME/dev`;
    sanctuary = $workdir;

    pr sro {
      url = `https://github.com/infraflakes/sro.git`;
      dir = `sro`;
      sync = `clone`;
      use = `.sro/main.sro`;
    }

    pr srwc {
      url = `https://github.com/infraflakes/srwc.git`;
      dir = `srwc`;
      sync = `ignore`;
      use = `.sro/main.sro`;
    }
  '';
}
