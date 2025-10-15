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
    xwayland-satellite
    egl-wayland
    fuzzel
  ];

  #==========================================================================
  #                         Hardware
  #==========================================================================
  
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
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

  programs = {
    niri = {
      enable = true;
      package = pkgs.niri;
    };
       
    xwayland.enable = true;

    waybar.enable = true;
  };

  services = {
    xserver = {
      enable = true;
      desktopManager = {
        xterm.enable = false;
        xfce.enable = true;
      };

      windowManager.i3 = {
        enable = true;
        extraPackages = with pkgs; [
          dmenu
          i3lock
          i3status
        ];
      };
      xkb.layout = "us";
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

