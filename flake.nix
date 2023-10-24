{
  description = "My Nix Flakes";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    snowfall-lib = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:snowfallorg/lib";
    };
    t-smart-tmux = {
      url = "github:joshmedeski/t-smart-tmux-session-manager";
      flake = false;
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
