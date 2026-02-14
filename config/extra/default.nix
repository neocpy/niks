{ pkgs, ... } :
{
  imports = [
    ./MATLAB.nix
  ];

  services.syncthing = {
    enable = true;
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };
}
