{
  description = "'Niks' means 'nothing' in Afrikaans... Thus, nothing is happening here ;)";

  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    nix-ld = {
      url = "github:Mic92/nix-ld";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    quickshell = {
        url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
        inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        quickshell.follows = "quickshell";
      };
    };

    ghostty = {
      url = "github:ghostty-org/ghostty";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, ghostty, nix-ld, noctalia, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations = {

        archies-brother = lib.nixosSystem {
	        inherit system;
	        modules = [
	          ./system/archies-brother/configuration.nix

	          ({pkgs, ...}: {
	            environment.systemPackages = [
                ghostty.packages.${pkgs.stdenv.hostPlatform.system}.default
                noctalia.packages.${pkgs.system}.default
	            ];
	          })

	        ];
	      };

        archie = lib.nixosSystem {
	        inherit system;
	        modules = [
	          ./system/archie/configuration.nix

	          ({pkgs, ...}: {
	            environment.systemPackages = [
                ghostty.packages.${pkgs.stdenv.hostPlatform.system}.default
                noctalia.packages.${pkgs.system}.default
	            ];
	          })

	        ];
	      };

      };
    };
}
