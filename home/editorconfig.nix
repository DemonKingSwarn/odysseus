{
  editorconfig = {
    enable = true;

    settings = {
      "*" = {
        charset = "utf-8";
        end_of_line = "lf";
        insert_final_newline = true;
        indent_size = 2;
        indent_style = "space";
        trim_trailing_whitespace = true;
      };

      "*.jai" = {
        indent_size = 4;
      };

      "*.odin" = {
        indent_size = 4;
      };
    };
  };
}
