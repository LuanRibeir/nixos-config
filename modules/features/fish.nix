{ ... }:
{
  flake.modules.homeManager.fish = { pkgs, ... }: {
    programs.fish = {
      enable = true;
      shellAliases = {
        ll = "ls -lah";
        nrsf = "sudo nixos-rebuild switch --flake ~/nixos-config#cherubim";
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
}
