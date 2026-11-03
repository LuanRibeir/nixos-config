{ ... }:
{
  flake.modules.homeManager.fish = { ... }: {
    programs.fish = {
      enable = true;
      shellAliases = {
        ll = "ls -lah";
        nrsf = "git -C ~/nixos-config add -A && sudo nixos-rebuild switch --flake ~/nixos-config#(hostname)";
      };
      shellAbbrs = {
        gs = "git status";
        ga = "git add -A";
        gc = "git commit -m";
      };
      interactiveShellInit = ''
        set fish_greeting
      '';
    };

    programs.starship.enable = true;
    programs.fzf.enable = true;
    programs.zoxide.enable = true;
  };

  flake.modules.nixos.fish = {
    programs.fish.enable = true;
  };
}
