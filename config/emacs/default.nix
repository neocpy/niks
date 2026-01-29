{ pkgs, config, lib, callPackage, ... }:
{
  
  environment.systemPackages = with pkgs; [
    emacs
    ripgrep
    fd
    emacs.pkgs.vertico
    emacs.pkgs.websocket
    emacs.pkgs.mu4e
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
      sha256 = "1lkn430ph22x2f5msjf5bs0r667nz8pnibnwc9ff4q8s4jcggbk2";
    }))
  ];
}
