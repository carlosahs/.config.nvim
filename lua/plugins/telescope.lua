return {
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable "make" == 1
      end
    },
    {
      "nvim-telescope/telescope-ui-select.nvim"
    },
    {
      "nvim-tree/nvim-web-devicons",
      enabled = vim.g.have_nerd_fond
    },
    "nvim-treesitter/nvim-treesitter"
  },
  config = function()
    require('telescope').setup {
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')
    local builtin = require 'telescope.builtin'
    local themes = require 'telescope.themes'
    vim.keymap.set('n', '<leader>sa', builtin.help_tags, { desc = '[S]earch [A] help tags' })
    vim.keymap.set('n', '<leader>ss', builtin.keymaps, { desc = '[S]earch [S] keymaps' })
    vim.keymap.set('n', '<leader>sd', builtin.find_files, { desc = '[S]earch [D] files' })
    vim.keymap.set('n', '<leader>sf', builtin.builtin, { desc = '[S]earch [F] select Telescope' })
    vim.keymap.set('n', '<leader>sq', builtin.live_grep, { desc = '[S]earch by [Q] grep' })
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>se', builtin.diagnostics, { desc = '[S]earch [E] diagnostics' })
    vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>sz', builtin.oldfiles, { desc = '[S]earch [Z] old files' })
    vim.keymap.set('n', '<leader>sx', builtin.buffers, { desc = '[S] Find existing [X] buffers' })
    vim.keymap.set('n', '<leader>sc', function()
      builtin.current_buffer_fuzzy_find(themes.get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = 'Fuzzily [S]earch in [C]urrent buffer' })
    vim.keymap.set('n', '<leader>sv', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = '[S] Live [V] grep' })
    vim.keymap.set('n', '<leader>da', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = '[D] Search [A] config files' })
    vim.keymap.set('n', '<leader>ds', function()
      builtin.git_branches(themes.get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[D] Git branches [S] dropdown' })
  end
}

