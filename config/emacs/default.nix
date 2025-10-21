{ pkgs, config, lib, callPackage, ... }:
{
  
  environment.systemPackages = with pkgs; [
    emacs
    ripgrep
    fd
    emacsPackages.vertico
    emacsPackages.websocket
    texliveFull
    auctex
    ghostscript
  ];

  services.emacs = {
    enable = true; 
    package = pkgs.emacs-unstable;
  };

  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
      sha256 = "1r0b0ypfqrjf4gwl56rb2hyxr0v60y4zpndmqlf0i1m3rvvlci97";
    }))
  ];
}
