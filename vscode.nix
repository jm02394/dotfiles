{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;

    extensions = (with pkgs.vscode-extensions; [
        bbenoist.nix
        sanaajani.taskrunnercode
        kamikillerto.vscode-colorize
        jdinhlife.gruvbox
      ])
      ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [{
          name = "andromeda";
          publisher = "EliverLara";
          version = "1.7.1";
          sha256 = "sha256-gCpL94MCMCDuSJ7O0ntOl/GDWrK+VDSIyGMkrW5bV8Y=";
        }];

    userSettings = {
      "editor.formatOnSave" = true;
      "workbench.colorTheme" = "Gruvbox Dark Soft";
      "explorer.confirmDelete" = false;

      "[nix]"."editor.tabSize" = 2;
    };
  };
}
