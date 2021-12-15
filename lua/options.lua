local opt = vim.opt

-- Set line number
opt.number = true

-- Set defaut tab to 2 spaces
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

-- Disable line wrap
opt.wrap = false

-- Set hidden
opt.hidden = true

-- Always have signcolumn to avoid reshaping with LSP.
opt.signcolumn = 'yes'

-- Syntax highlighting and color theme
opt.syntax = 'enable'
require('onenord').setup()

-- Remove the swap files
opt.swapfile = false

-- Telescope with native fzf
require('telescope').load_extension('fzf')

-- Comments
require('kommentary.config').configure_language("default", {
    prefer_single_line_comments = true,
})

-- Zig no autoformat
vim.g.zig_fmt_autosave = false

-- Terminal
require('toggleterm').setup{
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<c-\>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  shade_terminals = false,
  shading_factor = '<number>', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = false,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  persist_size = true,
  direction = 'float',
  close_on_exit = true, -- close the terminal window when the process exits
  shell = vim.o.shell, -- change the default shell
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    -- The border key is *almost* the same as 'nvim_open_win'
    -- see :h nvim_open_win for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    border = 'single',
    width = 160,
    height = 80,
    winblend = 3,
    highlights = {
      border = "Normal",
      background = "Normal",
    }
  }
}

