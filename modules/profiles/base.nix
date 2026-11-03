{ config, ... }:
let
  m = config.flake.modules.nixos;
in
{
  flake.modules.nixos.base = {
    imports = [ m.nix m.locale m.networking m.tools m.git m.home-manager ];
  };
}
