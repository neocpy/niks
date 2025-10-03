{ pkgs, config, lib,... }:
{
  home.packages = with pkgs; [
  #Desktop
    swww
    grim
    slurp
    waybar
  #Tools
    swappy
    wl-clipboard
    xdotool
  #Services
    wlogout
    networkmanagerapplet
  ];

  home.sessionVariables = {
    LAST_WALLPAPER_PATH = "/home/sophos/.local/state/lastwallpaper";
  };

  home.file = {
    ".config/hypr/hyprland.conf".source = ./hyprland.conf;
    ".config/hypr/keybindings.conf".source = ./keybindings.conf;
    ".config/hypr/monitors.conf".source = ./monitors.conf;
    ".config/hypr/windowrules.conf".source = ./windowrules.conf;
    ".config/hypr/animations.conf".source = ./animations.conf;
    ".config/hypr/themes/theme.conf".source = ./themes/theme.conf;
    ".config/hypr/themes/common.conf".source = ./themes/common.conf;
    ".config/hypr/themes/colors.conf".source = ./themes/colors.conf;
    ".config/hypr/userprefs.conf".source = ./userprefs.conf;
  };
}
