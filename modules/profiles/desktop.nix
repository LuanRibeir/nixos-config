{ config, ... }:
let
  m = config.flake.modules;
in
{
  flake.modules.nixos.desktop = {
    imports = [
      m.nixos.sway
      m.nixos.audio
      m.nixos.graphics
      m.nixos.fonts
      m.nixos.firefox
      m.nixos.nautilus
    ];
    home-manager.users.luan.imports = [ m.homeManager.desktop ];
  };

  flake.modules.homeManager.desktop = {
    imports = with m.homeManager; [ sway fonts waybar wofi swappy ghostty ];
  };
}
