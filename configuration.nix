{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];


  networking.hostName = "nixy";
  networking.networkmanager.enable = true;

  time.timeZone = "America/New_York";

  services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      theme  = "/home/loki/nixos-dots/sddm/pixel-rainyroom";
    };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  users.users.loki = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      tree
    ];
  };

  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    kitty
    git 
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.05";

}

