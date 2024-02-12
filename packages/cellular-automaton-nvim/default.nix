{ lib
, inputs
, pkgs
, stdenv
}:
let
  inherit (pkgs.vimUtils) buildVimPlugin;
in buildVimPlugin rec {
  name = "cellular-automaton";
  src = inputs.cellular-automaton;
}
