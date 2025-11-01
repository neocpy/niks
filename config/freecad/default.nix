{ config, pkgs, ... }:

{
  environment.systemPackages = [
    (pkgs.symlinkJoin {
      name = "freecad-wrapped";
      paths = [ pkgs.freecad ];
      buildInputs = [ pkgs.makeWrapper ];
      postBuild = ''
        wrapProgram $out/bin/freecad \
          --set QT_QPA_PLATFORM xcb \
          --set MESA_GL_VERSION_OVERRIDE 4.5 \
          --set MESA_GLSL_VERSION_OVERRIDE 450
      '';
    })
  ];
}
