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
    graphviz
  ];

  services.emacs = {
    enable = true; 
    package = pkgs.emacs-unstable;
  };

  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
      sha256 = "15wmw5f8xc0jlp9kx2dbfslvidlv1m23sxss6m9855frdlhwgm4j";
    }))
  ];
}
