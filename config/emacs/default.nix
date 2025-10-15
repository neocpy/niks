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
      sha256 = "1nn85gyzmlqq60arajcra9d18aciy77j7nhpg7gn08pd0b34j81i";
    }))
  ];
}
