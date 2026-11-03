{ ... }:
{
  flake.modules.nixos.tools = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      vim wget curl btop tree unzip ripgrep fd fastfetch nvd bat glow
    ];
  };
}
