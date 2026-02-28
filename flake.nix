{
  description = "Personal flake for FX507ZU4";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    srn-coreutils = {
      url = "github:infraflakes/srn-coreutils";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    srn-cd = {
      url = "github:infraflakes/srn-cd";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    self,
    nixpkgs,
    home-manager,
    srn-coreutils,
    srn-cd,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
    username = "nixuris";
    hostname = "serein";
  in {
    # NixOS configuration
    nixosConfigurations.serein = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs username system;};
      modules = [./syswide/host.nix];
    };
    # Home Manager
    homeConfigurations."${username}@${hostname}" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = {inherit inputs username;};
      modules = [./home/home.nix];
    };
    # DevShells
    devShells.${system} = {
      go = import ./devshells/go.nix {inherit pkgs;};
      js = import ./devshells/js.nix {inherit pkgs;};
      py = import ./devshells/py.nix {inherit pkgs;};
      c = import ./devshells/c.nix {inherit pkgs;};
    };
  };
}
