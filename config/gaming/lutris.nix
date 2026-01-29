{ config, pkgs, lib, ...}:
{

  #==========================================================================
  # Dependencies
  #==========================================================================

  environment.systemPackages = with pkgs; [
  #-----------------------------
  #     General
  #-----------------------------
    lutris
    steam-run

  #-----------------------------
  #      Dependencies
  #-----------------------------
    wineWowPackages.stable
    winetricks
    wineWowPackages.waylandFull

    dotnet-runtime
    dotnet-sdk

    icu
  ];

  #-----------------------------
  #	 Services
  #-----------------------------
  environment.sessionVariables = {
    DOTNET_ROOT = "${pkgs.dotnet-sdk}/share/dotnet";
  };

  programs = {

    steam = {
      enable = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };

    gamemode.enable = true;
  };

  #==========================================================================
  #                         Hardware
  #==========================================================================
  
  hardware = {
    graphics.enable = true;
  };



}

