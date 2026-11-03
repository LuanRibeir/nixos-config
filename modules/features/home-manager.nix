{ inputs, config, ... }:
{
  flake.modules.nixos.home-manager = {
    imports = [ inputs.home-manager.nixosModules.home-manager ];

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      users.luan.imports = [
        config.flake.modules.homeManager.base
        config.flake.modules.homeManager.sway
	config.flake.modules.homeManager.fish
	config.flake.modules.homeManager.fonts
      ];
    };
  };
}
