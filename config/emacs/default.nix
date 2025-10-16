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
      sha256 = "05b7dz0w2rgjv5kh6dh3syzhisn0k2qjm4zm89sag375zq110vc0";
    }))
  ];
}
