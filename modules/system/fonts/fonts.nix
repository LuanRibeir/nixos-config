{ ... }:
{
  flake.modules.nixos.fonts = { pkgs, ... }: {
    fonts = {
      enableDefaultPackages = true;

      packages = with pkgs; [
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-color-emoji
        liberation_ttf
        nerd-fonts.jetbrains-mono
        nerd-fonts.fira-code
      ];

      fontconfig.defaultFonts = {
        monospace = [ "JetBrainsMono Nerd Font" ];
        sansSerif = [ "Noto Sans" ];
        serif     = [ "Noto Serif" ];
        emoji     = [ "Noto Color Emoji" ];
      };
    };
  };
  
  flake.modules.homeManager.fonts = { mkSymlink, ... }: {
    xdg.dataFile."fonts".source = mkSymlink "system/fonts/_files";
  };
}
