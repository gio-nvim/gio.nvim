require "gitsigns".setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '│', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '│', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  attach_to_untracked = false,
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text_pos = "right_align",
    delay = 500,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary> ',
  update_debounce = 500,
  max_file_length = 10000,
}
