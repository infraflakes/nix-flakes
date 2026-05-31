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
    export BUN_INSTALL="$HOME/.local/share/bun"
    export PATH="$BUN_INSTALL/bin:$PATH"
    export BUN_INSTALL_CACHE_DIR="$HOME/.cache/bun"
    export PATH="$HOME/.local/bin:$PATH"

    echo "JS environment is ready!"
    exec fish
  '';
}
