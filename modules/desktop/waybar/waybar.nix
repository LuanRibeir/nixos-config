{ ... }:
{
  flake.modules.homeManager.waybar = { pkgs, mkSymlink, ... }: {
    home.packages = [ pkgs.waybar ];
    xdg.configFile."waybar".source = mkSymlink "desktop/waybar/_files";
  };
}
