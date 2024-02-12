{
  inputs,
  pkgs,
  ...
}: let
  inherit (pkgs.stdenv) mkDerivation;
in
  mkDerivation rec {
    buildPhase = ''
      mkdir -p $out
      cp $src/*.tmTheme $out/
    '';
    name = pname;
    pname = "catppuccin-bat";
    phases = "buildPhase";
    src = inputs.catppuccin-bat;
  }
