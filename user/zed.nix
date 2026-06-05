{
  programs.zed-editor = {
    enable = true;
    extensions = [ "graphene" ];
    userSettings = {
      ui_font_size = 16;
      buffer_font_size = 12;
      ui_font_family = "MesloLGLDZ Nerd Font";
      buffer_font_family = "MesloLGLDZ Nerd Font";

      theme = {
        mode = "dark";
        dark = "Graphene";
      };

      preferred_line_length = 120;
      wrap_guides = [ 120 ];
      inlay_hints = {
        enabled = true;
      };
      diagnostics = {
        inline = {
          enabled = true;
        };
      };
      sticky_scroll = {
        enabled = true;
      };

      project_panel = {
        dock = "left";
      };
      collaboration_panel = {
        dock = "left";
      };
      outline_panel = {
        dock = "right";
      };

      terminal = {
        minimum_contrast = 25;
      };
    };
    userKeymaps = [
      {
        unbind = {
          ctrl-q = "zed::Quit";
        };
      }
    ];
  };
}
