{
  description = "Personal flake for servers";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
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
  };
}
