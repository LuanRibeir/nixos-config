{ ... }:
{
  flake.modules.nixos.sway = { pkgs, ... }: {
    programs.sway.enable = true;
    programs.dconf.enable = true;

    services.greetd = {
      enable = true;
      settings.default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd sway";
        user = "greeter";
      };
    };

    xdg.portal = {
      enable = true;
      wlr.enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };

    services.xserver.xkb = {
      layout = "us";
      variant = "intl";
    };
    environment.sessionVariables = {
      XKB_DEFAULT_LAYOUT = "us";
      XKB_DEFAULT_VARIANT = "intl";
    };

    
    environment.systemPackages = with pkgs; [
      ghostty
      kitty
      wofi
      waybar
      nautilus
    ];
  }; # <-- NixOs half ends here

  flake.modules.homeManager.sway = { config, ... }:
  let
    dotfiles = "${config.home.homeDirectory}/nixos-config/modules/features/_files";
    mkSymlink = path:
      config.lib.file.mkOutOfStoreSymlink "${dotfiles}/${path}";
  in
  {
    # Sway
    xdg.configFile."sway/config".source =
      mkSymlink "sway-config";

    # Waybar
    xdg.configFile."waybar".source =
      mkSymlink "waybar";

    # Wofi
    xdg.configFile."wofi".source =
      mkSymlink "wofi";

    # Ghostty
    xdg.configFile."ghostty/config".source =
      mkSymlink "ghostty/config";
	
    # Wallpapers
    xdg.dataFile."wallpapers".source = mkSymlink "wallpapers";

    # Swappy (Screenshots)
    xdg.configFile."swappy/config".source = mkSymlink "swappy/config";
  };
}
