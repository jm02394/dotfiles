{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;

    plugins = [
      {
        name = "p10k-config";
        src = ./.;
        file = "p10k.zsh";
      }
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];
  };
}