{ inputs, ... }:
{
  home-manager.users.loki = {
    home.stateVersion = "25.05";
    imports = [
      inputs.noctalia.homeModules.default
    ];

    programs.noctalia = {
      enable = true;

      settings = { 
        theme = {
          mode = "dark";
          source = "builtin";
          builtin = "Catppuccin";
        };

      };
    };
  };
}
