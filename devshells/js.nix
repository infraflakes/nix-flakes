{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    nodejs_25
    bun
    pnpm
  ];

  shellHook = ''
    export NPM_CONFIG_PREFIX="$HOME/.local"
    export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_history
    export NPM_CONFIG_CACHE="$HOME/.cache/npm"
    export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
    export PATH="$HOME/.local/bin:$PATH"
    export PATH="$HOME/.bun/bin:$PATH"

    echo "JS environment is ready!"
    exec fish
  '';
}
