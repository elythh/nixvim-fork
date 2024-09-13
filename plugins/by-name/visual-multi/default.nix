{ lib, ... }:
with lib;
nixvim.vim-plugin.mkVimPlugin {
  name = "visual-multi";
  originalName = "vim-visual-multi";
  package = "vim-visual-multi";

  maintainers = [ lib.maintainers.elythh ];

  settingsOptions = {
    default_mappings = helpers.defaultNullOpts.mkBool false;
  };
}
