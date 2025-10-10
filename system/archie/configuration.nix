# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, callPackage, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../pkgs.nix
      ../../config/default.nix
    ];

#-----------------------------------------------------------------------------------------#
  # Bootloader 
#-----------------------------------------------------------------------------------------#

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    grub = {
      enable = true;
      devices = ["nodev"];
      efiSupport = true;
      useOSProber = true;
    };
  };


#-----------------------------------------------------------------------------------------#
  # Networking
#-----------------------------------------------------------------------------------------#
  networking.hostName = "archie";
  networking.networkmanager.enable = true;

#-----------------------------------------------------------------------------------------#
  # Timezone and locale
#-----------------------------------------------------------------------------------------#
  time.timeZone = "Africa/Johannesburg";

  i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };


#-----------------------------------------------------------------------------------------#
  # Services and Hardware
#-----------------------------------------------------------------------------------------#
  hardware = {
    bluetooth.enable = true;
  };

  security.rtkit.enable = true;

  services = {
    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      jack.enable = true;
    };
    blueman.enable = true;
    printing.enable = true;
    libinput.enable = true;

    # hardware = {
    #   nvidia = {
    #     modesetting.enable = true;
    #     open = true;
    #     nvidiaSettings = true;
    #   };
    # };
  };

  # Enable touchpad support (enabled default in most desktopManager).
  programs.nix-ld.enable = true;
#-----------------------------------------------------------------------------------------#
  # Desktop
#-----------------------------------------------------------------------------------------#
  environment.systemPackages = with pkgs; [
   brave
   neovim
   git
   gh
   wget
   unzip
   wireplumber
  ];

#-----------------------------------------------------------------------------------------#
  # Users and Packages
#-----------------------------------------------------------------------------------------#
  users.users.sophos = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager"];
    packages = with pkgs; [
    ];
  };

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.05"; # Did you read the comment?

}

