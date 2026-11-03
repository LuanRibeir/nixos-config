{ ... }:
{
  flake.modules.homeManager.wofi = { pkgs, mkSymlink, ... }: {
    home.packages = [ pkgs.wofi ];
    xdg.configFile."wofi".source = mkSymlink "desktop/wofi/_files";
  };
}
