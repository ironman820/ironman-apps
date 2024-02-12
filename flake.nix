{
  description = "My Nix Flakes";

  inputs = {
    cellular-automaton = {
      flake = false;
      url = "github:eandrju/cellular-automaton.nvim";
    };
    flake-utils.url = "https://flakehub.com/f/numtide/flake-utils/0.1.*.tar.gz";
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/*.tar.gz";
    tmux-session-wizard = {
      flake = false;
      url = "github:27medkamal/tmux-session-wizard";
    };
    tochd = {
      flake = false;
      url = "github:ironman820/tochd";
    };
    unstable.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1.0.tar.gz";
  };

  outputs = {
    flake-utils,
    nixpkgs,
    ...
  } @ inputs:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {inherit system;};
      # lib = pkgs.lib // import ./lib {inherit (pkgs) lib;};
    in {
      packages = {
        tochd = import ./packages/tochd {inherit inputs pkgs;};
      };
      devShells.default = import ./shells/ironman-shell {
        inherit pkgs;
      };
    });
}
