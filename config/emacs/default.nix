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
      sha256 = "0b86zkcd4xyjkk4qbp99sbmlg70l85yi43k9sm9y4wdwj7vil1kg";
    }))
  ];
}
