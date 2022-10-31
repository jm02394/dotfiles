{pkgs, ...}: {
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
      {
        name = "zshrc";
        src = ./.;
        file = "zshrc.zsh";
      }
      {
        name = "zshqns";
        src = ./.;
        file = "zshrc.zsh";
      }
      {
        name = "fast-syntax-highlighting";
        src = pkgs.zsh-fast-syntax-highlighting;
        file = "share/zsh/site-functions/fast-syntax-highlighting.plugin.zsh";
      }
      {
        name = "autosuggestions";
        src = pkgs.zsh-autosuggestions;
        file = "share/zsh-autosuggestions/zsh-autosuggestions.zsh";
      }
    ];

    shellAliases = {
      ls = "${pkgs.exa}/bin/exa";
    };
  };
}
