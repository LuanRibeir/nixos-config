{ inputs, config, ... }:
let
  nixos = config.flake.modules.nixos;
in
{
  flake.nixosConfigurations.cherubim = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      ./_hardware-configuration.nix

      nixos.base
      nixos.audio
      nixos.graphics
      nixos.sway
      nixos.firefox
      nixos.ssh
      nixos.git
      nixos.fonts
      nixos.home-manager

      {
        networking.hostName = "cherubim";
        nixpkgs.hostPlatform = "x86_64-linux";

        boot.loader.systemd-boot.enable = true;
        boot.loader.efi.canTouchEfiVariables = true;
        boot.initrd.luks.devices."luks-3bfdd707-0524-4e7c-bf3b-e48596c06f10".device =
          "/dev/disk/by-uuid/3bfdd707-0524-4e7c-bf3b-e48596c06f10";

        system.stateVersion = "26.05";
      }
    ];
  };
}
