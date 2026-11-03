{ ... }:
{
  flake.modules.nixos.nix = {
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    nix.gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
    nix.settings.auto-optimise-store = false;
    nix.optimise.automatic = true;
    nixpkgs.config.allowUnfree = true;
  };
}
