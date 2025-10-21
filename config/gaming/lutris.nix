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

  #-----------------------------
  #      Dependencies
  #-----------------------------
    wineWowPackages.stable
    winetricks
    wineWowPackages.waylandFull

    dotnet-runtime
    dotnet-sdk
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
  };
  #==========================================================================
  #                         Hardware
  #==========================================================================
  
  hardware = {
    graphics.enable = true;
  };



}

