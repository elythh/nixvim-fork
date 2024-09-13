{ lib, ... }:
with lib;
nixvim.vim-plugin.mkVimPlugin {
  name = "visual-multi";
  originalName = "vim-visual-multi";
  package = "vim-visual-multi";

  maintainers = [ lib.maintainers.elythh ];

  settingsOptions = {
    default_mappings = mkNullBool true;

    keys = mkOption {
      default = { };
      type = with helpers.nixvimTypes; maybeRaw (attrsOf strLua);
      description = ''
        visual-multi mappings declaration.
        See `:h visual-multi` for more information.
      '';
      apply =
        v:
        # Handle the raw case first
        if helpers.nixvimTypes.isRawType v then
          v
        # When v is an attrs **but not {__raw = ...}**
        else
          mapAttrs (_: helpers.mkRaw) v;
      example = {
        "<C-n>" = "Find Word";
      };
    };
  };
}
