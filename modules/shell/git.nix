{ ... }:
{
  flake.modules.nixos.git = {
    programs.git.enable = true;
    programs.git.config.init.defaultBranch = "main";
  };
}
