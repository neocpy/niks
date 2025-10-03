{ pkgs, ...}:
{
  home.packages = with pkgs; [
    #File browser + thumbnail service
    xfce.thunar xfce.tumbler
  ];

  xdg.mime.enable = false;
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "inode/directory" = ["Thunar.desktop"];
      "image/png" = ["imv.desktop"];
      "image/jpeg" = ["imv.desktop"];
    };
  };

  gtk = {
    enable = true;
    };

  home.file.".icons/default".source = "${pkgs.capitaine-cursors}/share/icons/capitaine-cursors-white";
  home.sessionVariables = {
  };


  xdg.systemDirs.data = [
    "${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}"
    "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}"
  ];

  qt = {
    enable = true;
    platformTheme.name = "gtk";
  };
}
