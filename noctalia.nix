{ inputs, ... }:
{
  home-manager.users.drfoobar = {
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
