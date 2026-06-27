{ config, pkgs, ... }:
let
  dotfiles = "${config.home.homeDirectory}/nix-dotfiles/.config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;

  configs = {
    hypr = "hypr";
    nvim = "nvim";
    rofi = "rofi";
  };
in
{
 # imports = [
 #   ./modules/theme.nix
 # ];
  home.file.".vimrc".source = create_symlink "${config.home.homeDirectory}/nix-dotfiles/.vimrc";
  home.username = "loki";
  home.homeDirectory = "/home/loki";
  home.stateVersion = "25.05";
 
 # Program modules
 programs.kitty = {
    enable = true;
    font.name = "JetBrainsMono Nerd Font";
    font.size = 13;
  };

programs.bash = {
    enable = true;
    shellAliases = {
      nrs = "sudo nixos-rebuild switch --flake ~/nix-dotfiles#nixy";
      vim = "nvim";
    };
    initExtra = ''
      export PS1='<\[\e[38;5;51;3m\]\H\[\e[0m\]> \[\e[38;5;51;1;3m\]\u\[\e[0m\] \[\e[40m\]in\[\e[0m\] \[\e[38;5;51;3m\]\W\[\e[0m\] \[\e[38;5;99;1m\]~\[\e[0m\]'
      nitch
    '';
  };

  home.packages = with pkgs; [
    neovim
    nixpkgs-fmt
    rofi
    lf
    (pkgs.writeShellApplication {
      name = "ns";
      runtimeInputs = with pkgs; [
        fzf
        (nix-search-tv.overrideAttrs {
          env.GOEXPERIMENT = "jsonv2";
        })
      ];
      text = ''exec "${pkgs.nix-search-tv.src}/nixpkgs.sh" "$@"'';
    })
  ];

  xdg.configFile = builtins.mapAttrs
    (name: subpath: {
      source = create_symlink "${dotfiles}/${subpath}";
      recursive = true;
    })
    configs;

}
