{ config, pkgs, ... }:
{

   environment.systemPackages = with pkgs; [
   #Apps
    # Internet  
     qutebrowser
     python313Packages.adblock

    # Art
     krita
   #Editors
     # emacs
   #Terminal
     fastfetch
     # jq
     # parallel
   #Utility
     # rofi-wayland
     # nix-prefetch
     btop
     regex-cli
   #Filesystem
     btrfs-progs
     ntfs3g
   #General Dependecies
     python3
     clang-tools
   #   sqlite
   #   graphviz
   #   shellcheck
   #   nixfmt-rfc-style
   #   emacsPackages.vertico
   #   emacsPackages.websocket
   #Other
   #   texliveFull
   #   auctex
   #   ghostscript
   #Services
     pavucontrol
   #   easyeffects
   #   udiskie
   #   syncthing
   #Wayland Dependencies
     #-------------------------
     # envsubst
     # imagemagick
     # grimblast
     # swappy
   ];

  # nixpkgs.overlays = [
  #   (import (builtins.fetchTarball {
  #     url = "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
  #     sha256 = "0xd9b3hs7gql2k2c4h324cisbawlid71n2db2bdajqr3gqgz4lfd";
  #   }))
  # ];

  fonts = {
    packages = with pkgs; [
      font-awesome
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      material-icons
      jetbrains-mono
      nerd-fonts.symbols-only
      nerd-fonts.iosevka-term-slab
    ];
  };
}

