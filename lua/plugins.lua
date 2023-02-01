---@diagnostic disable: redefined-local, undefined-global

vim.g.material_style = "deep ocean"
vim.cmd 'colorscheme material'






local key_mapper = function(mode, key, result)
  vim.api.nvim_set_keymap(
    mode,
    key,
    result,
    {noremap = true, silent = true}
    )
end


return require('packer').startup(function(use)
  local use = use
  use 'wbthomason/packer.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use {'neoclide/coc.nvim', branch = 'release'}
  use 'sheerun/vim-polyglot'
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use {
    "nvim-telescope/telescope.nvim",
    requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}
  }
  use 'jremmen/vim-ripgrep'
  use 'marko-cerovac/material.nvim'

  use 'fannheyward/telescope-coc.nvim'
  use 'norcalli/nvim-colorizer.lua'
  require'colorizer'.setup({
      '*'; -- Highlight all files, but customize some others.
      css = { css = true; }; -- Enable parsing rgb(...) functions in css.
      html = { names = false; }
    })

  use {
    'mg979/vim-visual-multi',
    branch = 'master'
  }


  use {
    'kosayoda/nvim-lightbulb',
    requires = 'antoinemadec/FixCursorHold.nvim',
  }


  use 'yamatsum/nvim-cursorline'

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }



  use({
      "goolord/alpha-nvim",
      requires = { 'nvim-tree/nvim-web-devicons' },
      config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        local ascci = {
          "          ",
          "     ",
          "     ",
          "     ",
          "     ",
          "     ",
          "     ",
          "     ",
          "     ",
          "     ",
          "     ",
          "                    ,,,,,,,,,,,,,,,,,,,,          ,,,,,,,,         ,,,,,,,",
          "                 ▄▓                      ▒     ,▄╝        └ε    ╔▓         ▒",
          "              ╓╣▓▓▓   .╓╓╓╓╓╓╓╓╓╓╓╓,     ╠   ▄▓▓▓▒    .    b ╓▄▓▓▓    ,    ▒",
          "             ▓▓▓▓▓▓                 ╠    ╠ ]▓▓▓▓▓▒    ▒    b╣▓▓▓▓▓    ╠    ▒",
          "             ▓▓▓▓▓▓▄╓╓╓╓╓╓╓╓╓     ,Θ     ╩ ▐▓▓▓▓▓▒    ▒    b▓▓▓▓▓▓    ╠    ▒",
          "             ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▀     é└     é  ▐▓▓▓▓▓▒    ▒    ¼▓▓▓▓▓▀    ╠    ▒",
          "             ╫▓▓▓▓▓▓▓▓▓▓▓▓└    ²╙     ╔┴   ▐▓▓▓▓▓▌    ²╕    ╙▓▓▓╜    é    .Γ",
          "                     ,▓▓╙    ,╛     ╓╙     ▐▓▓▓▓▓▓▌     Σ,    ╙    ╓┴    )╙",
        "                   .╣▓╩     ê     ,╛        ▓▓▓▓▓▓▓▓▓▄    └¼      .╛     ê",
        "                  ▄▓▀     φ┘    .Θ          ╙▓▓▓▓▓▓▓▓▓µ    ²∞αæ≈∩     ╔┘",
        "                ▄▓▌     ╒╙     φ░             ╢▓▓▓▓▓▓▓▓▌      ▌     ,╛",
        "              ╔▓▓▓⌐    Θ                 ╘⌐    └▓▓▓▓▓▓▓▓▓µ    ▌    φ",
        "            ,▓▓▓▓▓⌐   ',,,,,,,,,,,,,,,    µ      ╙▓▓▓▓▓▓▓▒    ▌    ╠",
        "            ║▓▓▓▓▓⌐                       µ        ╫▓▓▓▓▓▒         ╠",
        "            ║▓▓▓▓▓▄╓╓╓╓╓╓╓╓╓╓╓╓╓╓╓╓╓╓╓╓╓╓#         ▐▓▓▓▓▓▌╥╓╓╓╓╓╓╓æ╛",
        "            ║▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▀           ▐▓▓▓▓▓▓▓▓▓▓▓▓▀╙",
        "            ╙▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▀╙             '▓▓▓▓▓▓▓▓▓▓╨",
      }

      dashboard.section.header.val = ascci

       math.randomseed(os.time())

            local function pick_color()
                local colors = {"String", "Identifier", "Keyword", "Number"}
                return colors[math.random(#colors)]
            end
            dashboard.section.header.opts.hl = pick_color()


      dashboard.section.buttons.val = {
        dashboard.button( "e", "  > New file" , ":ene <BAR> startinsert <CR>"),
        dashboard.button( "f", "  > Find file", ":cd $HOME/Workspace | Telescope find_files<CR>"),
        dashboard.button( "r", "  > Recent"   , ":lua CallPreviewToOpenTelescopeFindFiles()<CR>"),
        dashboard.button( "s", "  > Settings" , ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
        dashboard.button( "q", "  > Quit NVIM", ":qa<CR>"),
      }

      alpha.setup(dashboard.opts)

      end,

    })

  local configs = require'nvim-treesitter.configs'


  configs.setup {
    ensure_installed = "javascript",
    highlight = {
      enable = true,
    }
  }

  require('nvim-cursorline').setup {
    cursorline = {
      enable = true,
      timeout = 1000,
      number = false,
    },
    cursorword = {
      enable = true,
      min_length = 3,
      hl = { underline = true },
    }
  }


  require('telescope').setup{
    defaults = {
      layout_strategy = "center",
    },
    pickers = {
      find_files = {
        theme = "dropdown",
      },
      buffers = {
        theme = "dropdown"
      },
      live_grep = {
        theme = "dropdown"
      }
    },
    extensions = {
      coc = {
        theme = 'ivy',
        prefer_locations = true, -- always use Telescope locations to preview definitions/declarations/implementations etc
      }
    }
  }
  require('telescope').load_extension('coc')



  require('lualine').setup {
    options = {
      theme = 'material'
    }
  }

  require('material').setup({
      lualine_style = 'stealth' -- the stealth style
    })

  local Preview = function()
    return require('telescope.themes').get_dropdown({
        initial_mode = 'insert',
        borderchars = {
          { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
          prompt = {"─", "│", " ", "│", '┌', '┐', "│", "│"},
          results = {"─", "│", "─", "│", "├", "┤", "┘", "└"},
          preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
        },
        width = 0.8,
        layout_strategy = "center",
        layout_config = {
          mirror = true,
        },
        prompt_title = false,
        results_title = false,
        preview_title = false,
        preview = {
          msg_bg_fillchar =  '|┌∩┐(◣_◢)┌∩┐|'
        }
      })
  end


  function _G.CallPreviewToOpenTelescopeFindFiles()
    require"telescope.builtin".find_files(Preview())
  end
  function _G.CallPreviewToOpenTelescopeLiveGrep()
    require"telescope.builtin".live_grep(Preview())
  end

  function _G.CallPreviewToOpenTelescopeHelpTags()
    require"telescope.builtin".help_tags(Preview())
  end


  function _G.CallPreviewToOpenTelescopeBuffers()
    require"telescope.builtin".buffers(Preview())
  end

  function _G.CallPreviewToOpenTelescopeOldFiles()
    require"telescope.builtin".oldfiles(Preview())
  end


  key_mapper('n', '<C-p>', ":lua CallPreviewToOpenTelescopeFindFiles()<CR>")
  key_mapper('n', '<leader>fs', '<cmd>lua CallPreviewToOpenTelescopeLiveGrep()<CR>')
  key_mapper('n', '<leader>fh', ':lua CallPreviewToOpenTelescopeHelpTags()<CR>')
  key_mapper('n', '<leader>fb', ':lua CallPreviewToOpenTelescopeBuffers()<CR>')




end)






