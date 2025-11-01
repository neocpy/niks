{ pkgs, config, lib, callPackage, ... }:
{
  
  environment.systemPackages = with pkgs; [
    emacs
    ripgrep
    fd
    emacsPackages.vertico
    emacsPackages.websocket
    emacsPackages.mu4e
    texliveFull
    auctex
    ghostscript
    ispell
    mu
  ];

  services.emacs = {
    enable = true; 
    package = pkgs.emacs-unstable;
  };

  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
      sha256 = "02d8c24hq4x28g1cvhzi8kz7s2q2clibahnxrx44vb3hhv99zasj";
    }))
  ];
}
