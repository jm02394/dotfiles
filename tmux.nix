{
  pkgs,
  config,
  ...
}: {
  programs.tmux = {
    enable = true;
    prefix = "C-a";
    shell = config.home.sessionVariables.SHELL;

    extraConfig = ''
      bind g new-window -c "#{pane_current_path}" "${pkgs.lazygit}/bin/lazygit"
    '';
  };
}
