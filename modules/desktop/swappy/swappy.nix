{ ... }:
{
  flake.modules.homeManager.swappy = { pkgs, mkSymlink, ... }: {
    home.packages = with pkgs; [ grim slurp wl-clipboard swappy ];
    xdg.configFile."swappy".source = mkSymlink "desktop/swappy/_files";
  };
}
