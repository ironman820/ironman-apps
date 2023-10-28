{
  description = "My Nix Flakes";

  inputs = {
    cellular-automaton = {
      flake = false;
      url = "github:eandrju/cellular-automaton.nvim";
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    snowfall-lib = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:snowfallorg/lib";
    };
    tmux-session-wizard = {
      flake = false;
      url = "github:27medkamal/tmux-session-wizard";
    };
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = inputs: let
    lib = inputs.snowfall-lib.mkLib {
      inherit inputs;
      src = ./.;

      snowfall = {
        meta = {
          name = "ironman-apps";
          title = "Ironman Apps";
        };
        namespace = "ironman";
      };
    };
  in lib.mkFlake {
    channels-config = {
      allowUnfree = true;
    };

    # overlays = with inputs; [
    # ];

    alias = {
      shells.default = "ironman-shell";
    };
  };
}
