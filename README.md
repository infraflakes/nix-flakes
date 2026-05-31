### Personal flakes for non-nixos setup.

### How to install!

Make sure nix is installed, personally I prefer Determinate Nix:

```bash
curl -fsSL https://install.determinate.systems/nix | sh -s -- install --determinate
```

Clone the repo:

```bash
git clone -b non-nixos https://github.com/infraflakes/nix-flakes.git non-nixos
```

Build home manager:

```bash
nix run .#homeConfigurations.<username>@<hostname>.activationPackage --extra-experimental-features nix-command --extra-experimental-features flakes
```

---
