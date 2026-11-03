{ config, ... }:
let
  m = config.flake.modules;
in
{ 
  # account, shell, and the Home Manager
  flake.modules.nixos.luan = { pkgs, ... }: {
    imports = [ m.nixos.fish ];

    users.users.luan = {
      isNormalUser = true;
      description = "Luan";
      extraGroups = [ "networkmanager" "wheel" "video" "input" ];
      shell = pkgs.fish;
    };

    home-manager.users.luan.imports = [
      m.homeManager.dotfiles
      m.homeManager.base
      m.homeManager.fish
    ];
  };
}
