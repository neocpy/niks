{ config, pkgs, lib, ...}:
{
  environment.systemPackages = with pkgs; [
    (writeShellScriptBin "freecad" ''
      export __NV_PRIME_RENDER_OFFLOAD=1
      export __GLX_VENDOR_LIBRARY_NAME=nvidia
      exec ${freecad}/bin/freecad "$@"
    '')
  ];
}

