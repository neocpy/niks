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

    ghostty = {
      url = "github:ghostty-org/ghostty";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ghostty, nix-ld, ... }: 
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

	        ];
	      };

        archie = lib.nixosSystem {
	        inherit system;
	        modules = [
	          ./system/archie/configuration.nix

	          ({pkgs, ...}: {
	            environment.systemPackages = [
	            ghostty.packages.${pkgs.stdenv.hostPlatform.system}.default
	            ];
	          })
	        ];
	      };

      };
    };
}
