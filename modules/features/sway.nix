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
  };
}
