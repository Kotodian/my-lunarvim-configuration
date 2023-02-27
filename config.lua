--[[
THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
 `lvim` is the global options object ]] -- vim options
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.relativenumber = true
vim.opt.termguicolors = true
-- general
lvim.log.level = "info"

lvim.format_on_save = {
    enabled = true,
    pattern = "*.lua,*.rs,*.go,*.proto",
    timeout = 1000,
}
-- lvim.use_icons = false
-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings> lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<S-x>"] = ":BufferKill<CR>"
lvim.keys.normal_mode["<S-n>"] = ":NvimTreeToggle<CR>"

-- -- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
-- 	name = "Trouble",
-- 	r = { "<cmd>Trouble lsp_references<cr>", "References" },
-- 	f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
-- 	d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
-- 	q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
-- 	l = { "<cmd>Trouble loclist<cr>", "LocationList" },
-- 	w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
-- }

-- -- Change theme settings
lvim.colorscheme = "lunaperche"
lvim.transparent_window = true

-- After changing plugin config exit and reopen LunarVim, Run :Lazy sync
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.gitsigns.opts.current_line_blame = true
lvim.builtin.dap.active = true

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true
lvim.builtin.treesitter.ensure_installed = {
    "rust",
    "go",
    "gomod",
}
local colors = {
    blue   = '#80a0ff',
    cyan   = '#79dac8',
    black  = '#080808',
    white  = '#c6c6c6',
    red    = '#ff5189',
    violet = '#d183e8',
    grey   = '#303030',
}

lvim.builtin.lualine.options.theme = {
    normal = {
        c = { fg = colors.black, bg = colors.violet },
        a = { fg = colors.white, bg = colors.grey },
        b = { fg = colors.black, bg = colors.white },
    },
    insert = {
        a = { fg = colors.black, bg = colors.blue },
    },
    visual = {
        a = { fg = colors.black, bg = colors.cyan },
    },
    replace = {
        a = { fg = colors.black, bg = colors.cyan },
    },
    inactive = {
        a = { fg = colors.white, bg = colors.black },
        b = { fg = colors.white, bg = colors.black },
        c = { fg = colors.black, bg = colors.black },
    },
}
lvim.builtin.lualine.options.component_separators = '|'
lvim.builtin.lualine.options.section_separators = { left = '', right = '' }
lvim.builtin.lualine.sections = {
    lualine_a = {
        { 'mode', separator = { left = '' }, right_padding = 2 },
    },
    lualine_b = { 'filename', 'branch' },
    lualine_c = { 'fileformat' },
    lualine_x = {},
    lualine_y = { 'filetype', 'progress' },
    lualine_z = {
        { 'location', separator = { right = '' }, left_padding = 2 },
    },
}
lvim.builtin.lualine.inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
}
lvim.builtin.lualine.tabline = {}
lvim.builtin.lualine.extensions = {} -- lvim.builtin.treesitter.ignore_install = { "haskell" }

-- -- generic LSP settings <https://www.lunarvim.org/docs/languages#lsp-support>
-- --- disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false
require 'lspconfig'.bufls.setup {}
-- ---configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`

-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- linters and formatters <https://www.lunarvim.org/docs/languages#lintingformatting>
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     command = "shellcheck",
--     args = { "--severity", "warning" },
--   },
-- }

-- -- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>


lvim.plugins = {
    {
        "folke/trouble.nvim",
        cmd = "TroubleToggle",
    },
    {
        "phaazon/hop.nvim",
        event = "BufRead",
        config = function()
            require("hop").setup()
            vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
            vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
        end,
    },
    {
        "ggandor/lightspeed.nvim",
        event = "BufRead",
    },
    {
        "sindrets/diffview.nvim",
        event = "BufRead",
    },
    {
        "Pocco81/auto-save.nvim",
        config = function()
            require("auto-save").setup()
        end,
    },
    {
        "iamcco/markdown-preview.nvim",
        build = "cd app && npm install",
        ft = "markdown",
        config = function()
            vim.g.mkdp_auto_start = 1
        end,
    },
    {
        "s1n7ax/nvim-window-picker",
        version = "1.*",
        config = function()
            require("window-picker").setup({
                autoselect_one = true,
                include_current = false,
                filter_rules = {
                    -- filter using buffer options
                    bo = {
                        -- if the file type is one of following, the window will be ignored
                        filetype = { "neo-tree", "neo-tree-popup", "notify", "quickfix" },

                        -- if the buffer type is one of following, the window will be ignored
                        buftype = { "terminal" },
                    },
                },
                other_win_hl_color = "#e35e4f",
            })
        end,
    },
    {
        "ray-x/go.nvim",
        config = function()
            require('go').setup({
                disable_defaults = false, -- true|false when true set false to all boolean settings and replace all table
                -- settings with {}
                go = 'go', -- go command, can be go[default] or go1.18beta1
                goimport = 'gopls', -- goimport command, can be gopls[default] or goimport
                fillstruct = 'gopls', -- can be nil (use fillstruct, slower) and gopls
                gofmt = 'gofumpt', --gofmt cmd,
                max_line_len = 128, -- max line length in golines format, Target maximum line length for golines
                tag_transform = false, -- can be transform option("snakecase", "camelcase", etc) check gomodifytags for details and more options
                tag_options = 'json=omitempty', -- sets options sent to gomodifytags, i.e., json=omitempty
                gotests_template = "", -- sets gotests -template parameter (check gotests for details)
                gotests_template_dir = "", -- sets gotests -template_dir parameter (check gotests for details)
                comment_placeholder = '', -- comment_placeholder your cool placeholder e.g. ﳑ       
                icons = { breakpoint = '🧘', currentpos = '🏃' }, -- setup to `false` to disable icons setup
                -- icons = false, -- setup to `false` to disable icons setup
                verbose = false, -- output loginf in messages
                lsp_cfg = true, -- true: use non-default gopls setup specified in go/lsp.lua
                -- false: do nothing
                -- if lsp_cfg is a table, merge table with with non-default gopls setup in go/lsp.lua, e.g.
                --   lsp_cfg = {settings={gopls={matcher='CaseInsensitive', ['local'] = 'your_local_module_path', gofumpt = true }}}
                lsp_gofumpt = false, -- true: set default gofmt in gopls format to gofumpt
                lsp_on_attach = true, -- nil: use on_attach function defined in go/lsp.lua,
                --      when lsp_cfg is true
                -- if lsp_on_attach is a function: use this function as on_attach function for gopls
                lsp_keymaps = true, -- set to false to disable gopls/lsp keymap
                lsp_codelens = true, -- set to false to disable codelens, true by default, you can use a function
                -- function(bufnr)
                --    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>F", "<cmd>lua vim.lsp.buf.formatting()<CR>", {noremap=true, silent=true})
                -- end
                -- to setup a table of codelens
                lsp_diag_hdlr = true, -- hook lsp diag handler
                lsp_diag_underline = true,
                -- virtual text setup
                lsp_diag_virtual_text = { space = 0, prefix = "" },
                lsp_diag_signs = true,
                lsp_diag_update_in_insert = false,
                lsp_document_formatting = true,
                -- set to true: use gopls to format
                -- false if you want to use other formatter tool(e.g. efm, nulls)
                lsp_inlay_hints = {
                    enable = true,
                    -- Only show inlay hints for the current line
                    only_current_line = false,
                    -- Event which triggers a refersh of the inlay hints.
                    -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
                    -- not that this may cause higher CPU usage.
                    -- This option is only respected when only_current_line and
                    -- autoSetHints both are true.
                    only_current_line_autocmd = "CursorHold",
                    -- whether to show variable name before type hints with the inlay hints or not
                    -- default: false
                    show_variable_name = true,
                    -- prefix for parameter hints
                    parameter_hints_prefix = " ",
                    show_parameter_hints = true,
                    -- prefix for all the other hints (type, chaining)
                    other_hints_prefix = "=> ",
                    -- whether to align to the lenght of the longest line in the file
                    max_len_align = false,
                    -- padding from the left if max_len_align is true
                    max_len_align_padding = 1,
                    -- whether to align to the extreme right or not
                    right_align = false,
                    -- padding from the right if right_align is true
                    right_align_padding = 6,
                    -- The color of the hints
                    highlight = "Comment",
                },
                gopls_cmd = nil, -- if you need to specify gopls path and cmd, e.g {"/home/user/lsp/gopls", "-logfile","/var/log/gopls.log" }
                gopls_remote_auto = true, -- add -remote=auto to gopls
                gocoverage_sign = "█",
                sign_priority = 5, -- change to a higher number to override other signs
                dap_debug = true, -- set to false to disable dap
                dap_debug_keymap = true, -- true: use keymap for debugger defined in go/dap.lua
                dap_debug_gui = false,
                dap_debug_vt = {
                    enabled = true, -- enable this plugin (the default)
                    enabled_commands = true, -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
                    highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
                    highlight_new_as_changed = false, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
                    show_stop_reason = true, -- show stop reason when stopped for exceptions
                    commented = false, -- prefix virtual text with comment string
                    only_first_definition = true, -- only show virtual text at first definition (if there are multiple)
                    all_references = false, -- show virtual text on all all references of the variable (not only definitions)

                    -- experimental features:
                    virt_text_pos = 'eol', -- position of virtual text, see `:h nvim_buf_set_extmark()`
                    all_frames = false, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
                    virt_lines = false, -- show virtual lines instead of virtual text (will flicker!)
                    virt_text_win_col = nil -- position the virtual text at a fixed window column (starting from the first text column) ,
                    -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
                }, -- bool|table put your dap-virtual-text setup here set to false to disable

                dap_port = 38697, -- can be set to a number, if set to -1 go.nvim will pickup a random port
                dap_timeout = 15, --  see dap option initialize_timeout_sec = 15,
                dap_retries = 20, -- see dap option max_retries
                textobjects = true, -- enable default text jobects through treesittter-text-objects
                test_runner = 'go', -- one of {`go`, `richgo`, `dlv`, `ginkgo`, `gotestsum`}
                run_in_floaterm = true, -- set to true to run in float window. :GoTermClose closes the floatterm
                -- float term recommend if you use richgo/ginkgo with terminal color

                floaterm = { -- position
                    posititon = 'right', -- one of {`top`, `bottom`, `left`, `right`, `center`, `auto`}
                    width = 1,
                    height = 1
                },
                trouble = false, -- true: use trouble to open quickfix
                test_efm = false, -- errorfomat for quickfix, default mix mode, set to true will be efm only
                luasnip = false, -- enable included luasnip snippets. you can also disable while add lua/snips folder to luasnip load
                --  Do not enable this if you already added the path, that will duplicate the entries
            })
        end,
        dependencies = {
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui",
        },
        event = { "CmdlineEnter" },
        ft = { "go", 'gomod' },
        build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
    },
    "ray-x/guihua.lua",
    {
        "rcarriga/nvim-notify",
        config = function()
            local notify = require('notify')
            notify.setup({
                backgroud_colour = '#000000'
            })
            vim.notify = notify
        end
    },
    {
        "theHamsta/nvim-dap-virtual-text",
        config = function()
            require("nvim-dap-virtual-text").setup {
                enabled = true, -- enable this plugin (the default)
                enabled_commands = true, -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
                highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
                highlight_new_as_changed = false, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
                show_stop_reason = true, -- show stop reason when stopped for exceptions
                commented = false, -- prefix virtual text with comment string
                only_first_definition = true, -- only show virtual text at first definition (if there are multiple)
                all_references = false, -- show virtual text on all all references of the variable (not only definitions)

                -- experimental features:
                virt_text_pos = 'eol', -- position of virtual text, see `:h nvim_buf_set_extmark()`
                all_frames = false, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
                virt_lines = false, -- show virtual lines instead of virtual text (will flicker!)
                virt_text_win_col = nil -- position the virtual text at a fixed window column (starting from the first text column) ,
                -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
            }
        end,
        dependencies = {
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui",
        },
    },
    {
        "folke/todo-comments.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    },
    {
        "simrat39/rust-tools.nvim",
        config = function()
            require("rust-tools").setup({
                tools = {
                    -- how to execute terminal commands
                    -- options right now: termopen / quickfix
                    executor = require("rust-tools.executors").termopen,
                    -- callback to execute once rust-analyzer is done initializing the workspace
                    -- The callback receives one parameter indicating the `health` of the server: "ok" | "warning" | "error"
                    on_initialized = nil,

                    -- automatically call RustReloadWorkspace when writing to a Cargo.toml file.
                    reload_workspace_from_cargo_toml = true,

                    autoSetHints = true,
                    runnables = {
                        use_telescope = true,
                    },

                    -- These apply to the default RustSetInlayHints command
                    inlay_hints = {
                        -- automatically set inlay hints (type hints)
                        -- default: true
                        auto = true,

                        -- Only show inlay hints for the current line
                        only_current_line = false,

                        -- whether to show parameter hints with the inlay hints or not
                        -- default: true
                        show_parameter_hints = true,

                        -- prefix for parameter hints
                        -- default: "<-"
                        parameter_hints_prefix = "<- ",

                        -- prefix for all the other hints (type, chaining)
                        -- default: "=>"
                        other_hints_prefix = "=> ",

                        -- whether to align to the length of the longest line in the file
                        max_len_align = false,

                        -- padding from the left if max_len_align is true
                        max_len_align_padding = 1,

                        -- whether to align to the extreme right or not
                        right_align = false,

                        -- padding from the right if right_align is true
                        right_align_padding = 7,

                        -- The color of the hints
                        highlight = "Comment",
                    },
                    -- options same as lsp hover / vim.lsp.util.open_floating_preview()
                    hover_actions = {

                        -- the border that is used for the hover window
                        -- see vim.api.nvim_open_win()
                        border = {
                            { "╭", "FloatBorder" },
                            { "─", "FloatBorder" },
                            { "╮", "FloatBorder" },
                            { "│", "FloatBorder" },
                            { "╯", "FloatBorder" },
                            { "─", "FloatBorder" },
                            { "╰", "FloatBorder" },
                            { "│", "FloatBorder" },
                        },

                        -- Maximal width of the hover window. Nil means no max.
                        max_width = nil,

                        -- Maximal height of the hover window. Nil means no max.
                        max_height = nil,

                        -- whether the hover action window gets automatically focused
                        -- default: false
                        auto_focus = false,
                    },
                    -- settings for showing the crate graph based on graphviz and the dot
                    -- command
                    crate_graph = {
                        -- Backend used for displaying the graph
                        -- see: https://graphviz.org/docs/outputs/
                        -- default: x11
                        backend = "x11",
                        -- where to store the output, nil for no output stored (relative
                        -- path from pwd)
                        -- default: nil
                        output = nil,
                        -- true for all crates.io and external crates, false only the local
                        -- crates
                        -- default: true
                        full = true,

                        -- List of backends found on: https://graphviz.org/docs/outputs/
                        -- Is used for input validation and autocompletion
                        -- Last updated: 2021-08-26
                        enabled_graphviz_backends = {
                            "bmp",
                            "cgimage",
                            "canon",
                            "dot",
                            "gv",
                            "xdot",
                            "xdot1.2",
                            "xdot1.4",
                            "eps",
                            "exr",
                            "fig",
                            "gd",
                            "gd2",
                            "gif",
                            "gtk",
                            "ico",
                            "cmap",
                            "ismap",
                            "imap",
                            "cmapx",
                            "imap_np",
                            "cmapx_np",
                            "jpg",
                            "jpeg",
                            "jpe",
                            "jp2",
                            "json",
                            "json0",
                            "dot_json",
                            "xdot_json",
                            "pdf",
                            "pic",
                            "pct",
                            "pict",
                            "plain",
                            "plain-ext",
                            "png",
                            "pov",
                            "ps",
                            "ps2",
                            "psd",
                            "sgi",
                            "svg",
                            "svgz",
                            "tga",
                            "tiff",
                            "tif",
                            "tk",
                            "vml",
                            "vmlz",
                            "wbmp",
                            "webp",
                            "xlib",
                            "x11",
                        },
                    },
                },
                server = {
                    on_attach = require("lvim.lsp").common_on_attach,
                    on_init = require("lvim.lsp").common_on_init,
                },
                -- debugging stuff
                dap = {
                    adapter = {
                        type = "executable",
                        command = "lldb-vscode",
                        name = "rt_lldb",
                    },
                },
            })
            vim.api.nvim_set_keymap('n', '<leader>j', ':RustMoveItemDown<CR>', { noremap = true })
            vim.api.nvim_set_keymap('n', '<leader>k', ':RustMoveItemUp<CR>', { noremap = true })
        end,
        ft = { "rust", "rs" },
    },
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    {
        "jackMort/ChatGPT.nvim",
        config = function()
            require("chatgpt").setup({
                -- optional configuration
                -- welcome_message = WELCOME_MESSAGE, -- set to "" if you don't like the fancy godot robot
                loading_text = "loading",
                question_sign = "", -- you can use emoji if you want e.g. 🙂
                answer_sign = "ﮧ", -- 🤖
                max_line_length = 120,
                yank_register = "+",
                chat_layout = {
                    relative = "editor",
                    position = "50%",
                    size = {
                        height = "80%",
                        width = "80%",
                    },
                },
                settings_window = {
                    border = {
                        style = "rounded",
                        text = {
                            top = " Settings ",
                        },
                    },
                },
                chat_window = {
                    filetype = "chatgpt",
                    border = {
                        highlight = "FloatBorder",
                        style = "rounded",
                        text = {
                            top = " ChatGPT ",
                        },
                    },
                },
                chat_input = {
                    prompt = "  ",
                    border = {
                        highlight = "FloatBorder",
                        style = "rounded",
                        text = {
                            top_align = "center",
                            top = " Prompt ",
                        },
                    },
                },
                openai_params = {
                    model = "text-davinci-003",
                    frequency_penalty = 0,
                    presence_penalty = 0,
                    max_tokens = 300,
                    temperature = 0,
                    top_p = 1,
                    n = 1,
                },
                openai_edit_params = {
                    model = "code-davinci-edit-001",
                    temperature = 0,
                    top_p = 1,
                    n = 1,
                },
                keymaps = {
                    close = { "<C-c>", "<Esc>" },
                    yank_last = "<C-y>",
                    scroll_up = "<C-u>",
                    scroll_down = "<C-d>",
                    toggle_settings = "<C-o>",
                    new_session = "<C-n>",
                    cycle_windows = "<Tab>",
                },

            })
        end,
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim"
        },
    },
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup({ "css", "scss", "html", "javascript" }, {
                RGB = true, -- #RGB hex codes
                RRGGBB = true, -- #RRGGBB hex codes
                RRGGBBAA = true, -- #RRGGBBAA hex codes
                rgb_fn = true, -- CSS rgb() and rgba() functions
                hsl_fn = true, -- CSS hsl() and hsla() functions
                css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
            })
        end,
    },
    {
        "nacro90/numb.nvim",
        event = "BufRead",
        config = function()
            require("numb").setup {
                show_numbers = true, -- Enable 'number' for the window while peeking
                show_cursorline = true, -- Enable 'cursorline' for the window while peeking
            }
        end,
    },
}

require 'chatgpt'.setup()

-- lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- lvim.keys.normal_mode["<Left>"] = ":echo \"Use h\"<cr>"
-- lvim.keys.normal_mode["<Right>"] = ":echo \"Use l\"<cr>"
-- lvim.keys.normal_mode["<Up>"] = ":echo \"Use k\"<cr>"
-- lvim.keys.normal_mode["<Down>"] = ":echo \"Use j\"<cr>"

lvim.keys.insert_mode["<C-b>"] = "<Left>"
lvim.keys.insert_mode["<C-f>"] = "<Right>"
lvim.keys.insert_mode["<C-p>"] = "<Up>"
lvim.keys.insert_mode["<C-n>"] = "<Down>"


-- example mappings you can place in some other place
-- An awesome method to jump to windows
local picker = require("window-picker")

vim.keymap.set("n", ",w", function()
    local picked_window_id = picker.pick_window({
        include_current_win = true,
    }) or vim.api.nvim_get_current_win()
    vim.api.nvim_set_current_win(picked_window_id)
end, { desc = "Pick a window" })
