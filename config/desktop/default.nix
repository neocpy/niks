{ config, pkgs, lib, ...}:
{

  #==========================================================================
  # Dependencies
  #==========================================================================

  environment.systemPackages = with pkgs; [
  #-----------------------------
  #     General
  #-----------------------------
    gdk-pixbuf

  #-----------------------------
  #     Screen capture
  #-----------------------------
    grim
    slurp

  #-----------------------------
  #	 Services
  #-----------------------------
    wl-clipboard
    mako
    swaybg
  ];

  #==========================================================================
  #                         Hardware
  #==========================================================================
  
  hardware = {
    graphics.enable = true;
  };

  services.gnome.gnome-keyring.enable = true;

  # -----------------------------
  # XDG Portal shiii
  # -----------------------------
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  # -----------------------------
  # Kanshi Systemd shtuff
  # -----------------------------
  systemd.user.services.kanshi = {
    description = "kanshi daemon";
    environment = {
      WAYLAND_DISPLAY = "wayland-1";
      DISPLAY = ":0";
    };
    serviceConfig = {
      Type = "simple";
      ExecStart = ''$(pkgs.kanshi}/bin/kanshi -c kanshi_config_file'';
    };
  };

  # -----------------------------
  # Brightness and Volume
  # -----------------------------
  users.users.sophos.extraGroups = ["video"];
  programs.light.enable = true;

  # ==========================================================================

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;

    package = pkgs.swayfx;
  };

  services = {
    xserver = {
      enable = true;
      desktopManager = {
        xterm.enable = false;
        xfce.enable = true;
      };
    };

    libinput = {
      enable = true;
      touchpad = {
        naturalScrolling = false;
        middleEmulation = true;
        tapping = true;
      };
    };
  };

}

