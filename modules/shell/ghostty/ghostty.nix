{ ... }:
{
  flake.modules.homeManager.ghostty = { pkgs, mkSymlink, ... }: {
    home.packages = [ pkgs.ghostty ];
    xdg.configFile."ghostty".source = mkSymlink "desktop/ghostty/_files";
  };
}
