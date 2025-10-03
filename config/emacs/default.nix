{ pkgs, config, lib,... }:
{
  
  home.packages = with pkgs; [
    ripgrep
    fd
  ];

  home.sessionVariables = {
  };

  home.file = {
    ".config/hypr/userprefs.conf".source = ./userprefs.conf;
  };
}
