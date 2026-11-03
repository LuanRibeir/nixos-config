{ ... }:
{
  flake.modules.homeManager.dotfiles = { config, ... }: {
     # defines mkSymlink so that any HM module can then take it as an argument
    _module.args.mkSymlink = path:
      config.lib.file.mkOutOfStoreSymlink
        "${config.home.homeDirectory}/nixos-config/modules/${path}";
  };
}
