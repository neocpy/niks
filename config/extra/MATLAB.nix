{ config, lib, pkgs, ... }:

{
  virtualisation = {

    containers.enable = true;

    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true; # Required for containers under podman-compose to be able to talk to each other.
    };

    virtualbox = {
      host = {
        enable = true;
        enableExtensionPack = true;
      };
    };
  };

  users.users.sophos = { # replace `<USERNAME>` with the actual username
    extraGroups = [
      "podman"
    ];
  };

  users.extraGroups.vboxusers.members = ["sophos"];

  environment.systemPackages = with pkgs; [
    distrobox
  ];
}
