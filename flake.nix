{
  description = "A very basic flake";

  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nix-ld = {
      url = "github:Mic92/nix-ld";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ghostty = {
      url = "github:ghostty-org/ghostty";
    };
  };

  outputs = { self, nixpkgs, ghostty, nix-ld, ... }: 
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations = {
        archie = lib.nixosSystem {
	        inherit system;
	        modules = [
	          ./system/archies-brother/configuration.nix

	          ({pkgs, ...}: {
	            environment.systemPackages = [
	            ghostty.packages.${pkgs.stdenv.hostPlatform.system}.default
	            ];
	          })

            # nix-ld.nixosModules.nix-ld
            # { programs.nix-ld.dev.enable = true; }

	        ];
	      };
      };
    };
}
