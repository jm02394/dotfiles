{pkgs, ...}: {
  programs.neovim = {
    enable = true;

    extraConfig = ''
      set background=dark
      colorscheme gruvbox
    '';

    plugins = with pkgs.vimPlugins; [
      {
        plugin = vimtex;
        config = ''
          let g:tex_flavor='latex'
          let g:vimtex_view_method='zathura'
          let g:vimtex_quickfix_mode=0
          set conceallevel=1
          let g:tex_conceal='abdmg'
        '';
      }
      vim-nix
      {
        plugin = ultisnips;
        config = ''
          let g:UltiSnipsExpandTrigger = '<tab>'
          let g:UltiSnipsJumpForwardTrigger = '<tab>'
          let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
          let g:UltiSnipsSnippetDirectories = [home . '/dotfiles/ultisnippets']
        '';
      }
    ];
  };
}
