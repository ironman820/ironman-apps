{
  description = "My Nix Flakes";

  inputs = {
    catppuccin-bat = {
      flake = false;
      url = "github:catppuccin/bat";
    };
    catppuccin-btop = {
      flake = false;
      url = "github:catppuccin/btop";
    };
    # catppuccin theme for grub
    catppuccin-grub = {
      flake = false;
      url = "github:catppuccin/grub";
    };
    catppuccin-kitty = {
      flake = false;
      url = "github:catppuccin/kitty";
    };
    catppuccin-lazygit = {
      flake = false;
      url = "github:catppuccin/lazygit";
    };
    catppuccin-neomutt = {
      flake = false;
      url = "github:catppuccin/neomutt";
    };
    catppuccin-rofi = {
      flake = false;
      url = "github:catppuccin/rofi";
    };
    catppuccin-starship = {
      flake = false;
      url = "github:catppuccin/starship";
    };
    catppuccin-tmux = {
      flake = false;
      url = "github:catppuccin/tmux";
    };
    cellular-automaton-nvim = {
      flake = false;
      url = "github:eandrju/cellular-automaton.nvim";
    };
    cloak-nvim = {
      flake = false;
      url = "github:laytan/cloak.nvim";
    };
    conceal-nvim = {
      flake = false;
      url = "github:Jxstxs/conceal.nvim";
    };
    flake-utils.url = "https://flakehub.com/f/numtide/flake-utils/0.1.*.tar.gz";
    nix-ld = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:mic92/nix-ld";
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    # acc5f7b - IcedTea v8 Stable
    nixpkgs-acc5f7b.url = "github:nixos/nixpkgs/acc5f7b";
    # ba45a55 - The last stable update of PHP 7.4
    nixpkgs-ba45a55.url = "github:nixos/nixpkgs/ba45a55";
    nvim-cmp-nerdfont = {
      flake = false;
      url = "github:chrisgrieser/cmp-nerdfont";
    };
    nvim-undotree = {
      flake = false;
      url = "github:jiaoshijie/undotree";
    };
    obsidian-nvim = {
      flake = false;
      url = "github:epwalsh/obsidian.nvim";
    };
    one-small-step-for-vimkind = {
      flake = false;
      url = "github:jbyuki/one-small-step-for-vimkind";
    };
    ranger-devicons = {
      flake = false;
      url = "github:alexanderjeurissen/ranger_devicons";
    };
    # Catppuccin theme for SDDM
    sddm-catppuccin = {
      flake = false;
      url = "github:catppuccin/sddm";
    };
    snowfall-lib = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "https://flakehub.com/f/snowfallorg/lib/2.*.tar.gz";
    };
    tmux-cheat-sh = {
      flake = false;
      url = "github:ironman820/tmux-cheat-sh";
    };
    tmux-fzf-url = {
      flake = false;
      url = "github:wfxr/tmux-fzf-url";
    };
    tmux-session-wizard = {
      flake = false;
      url = "github:27medkamal/tmux-session-wizard";
    };
    tochd = {
      flake = false;
      url = "github:ironman820/tochd";
    };
    unstable.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1.0.tar.gz";
    yanky-nvim = {
      flake = false;
      url = "github:gbprod/yanky.nvim";
    };
  };

  outputs = inputs: let
    lib = inputs.snowfall-lib.mkLib {
      inherit inputs;
      src = ./.;

      snowfall = {
        meta = {
          name = "ironman-apps";
          title = "Ironmans Applications";
        };
        namespace = "ironman";
      };
    };
  in
    lib.mkFlake {
    };
}
