{ config, pkgs, ... }:
{

   environment.systemPackages = with pkgs; [
   #Apps
    # Internet  
      qutebrowser
      python313Packages.adblock
      python312Packages.adblock
    # Art
      krita
    # Design
      freecad
      prusa-slicer
    # Games
      vesktop
   #Terminal
     fastfetch
     jq
     parallel
   #Utility
     nix-prefetch
     btop
     regex-cli
   #Filesystem
     btrfs-progs
     ntfs3g
     krusader
   #General Dependecies
     python3
     clang-tools
   #   sqlite
   #   graphviz
   #   shellcheck
   #   nixfmt-rfc-style
   #Other
   #Services
     pavucontrol
     easyeffects
     udiskie
   #   syncthing
   #Wayland Dependencies
     #-------------------------
     # envsubst
     # imagemagick
     # grimblast
     # swappy
   ];

  programs = {
    thunar.enable = true;    
  };

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

