{ ... }:
{
  flake.modules.nixos.base = { pkgs, ... }: {
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    nix.gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
    nix.settings.auto-optimise-store = false;
    nix.optimise.automatic = true;

    nixpkgs.config.allowUnfree = true;

    networking.networkmanager.enable = true;

    time.timeZone = "America/Sao_Paulo";
    i18n.defaultLocale = "en_US.UTF-8";
    i18n.extraLocaleSettings = {
      LC_ADDRESS = "pt_BR.UTF-8";
      LC_IDENTIFICATION = "pt_BR.UTF-8";
      LC_MEASUREMENT = "pt_BR.UTF-8";
      LC_MONETARY = "pt_BR.UTF-8";
      LC_NAME = "pt_BR.UTF-8";
      LC_NUMERIC = "pt_BR.UTF-8";
      LC_PAPER = "pt_BR.UTF-8";
      LC_TELEPHONE = "pt_BR.UTF-8";
      LC_TIME = "pt_BR.UTF-8";
    };
    console.keyMap = "us-acentos";

    programs.fish.enable = true;
    users.users.luan = {
      isNormalUser = true;
      description = "Luan";
      extraGroups = [ "networkmanager" "wheel" "video" "input" ];
      shell = pkgs.fish;
    };

    environment.systemPackages = with pkgs; [
      vim wget curl btop tree unzip ripgrep fd fastfetch
    ];
  };
}
