{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;

    extensions = (with pkgs.vscode-extensions; [
        bbenoist.nix
        sanaajani.taskrunnercode
        kamikillerto.vscode-colorize
        jdinhlife.gruvbox
        rust-lang.rust-analyzer
        bungcip.better-toml
        vscjava.vscode-java-debug
      ])
      ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [{
          name = "andromeda";
          publisher = "EliverLara";
          version = "1.7.1";
          sha256 = "sha256-gCpL94MCMCDuSJ7O0ntOl/GDWrK+VDSIyGMkrW5bV8Y=";
        }];

    userSettings = {
      "editor.formatOnSave" = true;
      "editor.inlayHints.enabled" = "offUnlessPressed";
      "colorize.languages" = ["nix"];
      "workbench.colorTheme" = "Gruvbox Dark Medium";
      "explorer.confirmDelete" = false;

      "git.confirmSync" = false;

      "[nix]"."editor.tabSize" = 2;
    };
  };
}
