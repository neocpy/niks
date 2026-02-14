{ config, pkgs, ... }:
{

   environment.systemPackages = with pkgs; [
   #Apps
    # Internet  
      qutebrowser
      python313Packages.adblock
      python312Packages.adblock
      brave
    # Art
      krita
      gimp
    # Design
      freecad
      prusa-slicer
    # Games
      vesktop
      qbittorrent
    # Work
      onlyoffice-desktopeditors
   #Terminal
     fastfetch
     jq
     parallel
   #Utility
     nix-prefetch
     btop
     regex-cli
     unrar
     zathura
     usbutils
   #Filesystem
     btrfs-progs
     ntfs3g
     krusader
     appimage-run
     exfat
     exfatprogs
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
     canon-cups-ufr2
     canon-capt
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
      noto-fonts-color-emoji
      material-icons
      jetbrains-mono
      nerd-fonts.symbols-only
      nerd-fonts.iosevka-term-slab
      source-sans-pro
      corefonts
    ];
  };
}

