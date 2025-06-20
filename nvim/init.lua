pcall(function()
	vim.loader.enable()
end)

-- Define main config table
Config = {
	path_package = vim.fn.stdpath("data") .. "/site/",
	path_source = vim.fn.stdpath("config") .. "/src/",
}

-- Ensure 'mini.nvim' is set up
local mini_path = Config.path_package .. "pack/deps/start/mini.nvim"
if not vim.loop.fs_stat(mini_path) then
	vim.cmd([[echo "Installing 'mini.nvim'" | redraw]])
	local clone_cmd = { "git", "clone", "--filter=blob:none", "https://github.com/echasnovski/mini.nvim", mini_path }
	vim.fn.system(clone_cmd)
end
require("mini.deps").setup({ path = { package = Config.path_package } })

-- Define helpers
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

local source = function(path)
	dofile(Config.path_source .. path)
end

-- always load
now(function()
	source("functions.lua")
end)
-- now(function() source('mappings.lua') end)
now(function()
	source("mappings-leader.lua")
end)
add({ name = "mini.nvim", checkout = "HEAD" })
later(function()
	require("mini.extra").setup()
end)

later(function()
	local ai = require("mini.ai")
	ai.setup({
		custom_textobjects = {
			B = MiniExtra.gen_ai_spec.buffer(),
			F = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
		},
	})
end)
later(function()
	require("mini.basics").setup({
		options = {
			basic = true,
		},
		mappings = {
			windows = true,
			move_with_alt = true,
		},
		autocommands = {
			relnum_in_visual_mode = true,
		},
	})
	-- Have no transparency to always have "overflow" icons (otherwise there can
	-- be a symbol visible from underneath blocking "overflow if next to space"
	-- approach from terminal emulator)
	vim.o.pumblend = 0
	vim.o.winblend = 0
end)

later(function()
	require("mini.align").setup()
end)

later(function()
	require("mini.bracketed").setup()
end)

later(function()
	require("mini.splitjoin").setup()
end)

later(function()
	require("mini.bufremove").setup()
end)
later(function()
	require("mini.jump").setup()
end)

later(function()
	local jump2d = require("mini.jump2d")
	jump2d.setup({
		spotter = jump2d.gen_pattern_spotter("[^%s%p]+"),
		view = { dim = true, n_steps_ahead = 2 },
	})
end)

later(function()
	require("mini.trailspace").setup()
end)

if vim.g.vscode ~= nil then
	now(function()
		source("vscode.lua")
	end)
end

if vim.g.vscode == nil then
	later(function()
		add("rafamadriz/friendly-snippets")
	end)

	-- Step one
	add({ source = "ellisonleao/gruvbox.nvim" })
	add({ source = "folke/tokyonight.nvim" })
	add({ source = "sainnhe/everforest" })
	add({ source = "mhartington/oceanic-next" })
	add({ source = "rebelot/kanagawa.nvim" })
	add({ source = "catppuccin/nvim", name = "catppuccin" })
	add("gbprod/nord.nvim")
	add("maxmx03/solarized.nvim")
	add("olimorris/onedarkpro.nvim")
	add("edeneast/nightfox.nvim")
	add("projekt0n/github-nvim-theme")
	add("marko-cerovac/material.nvim")
	add("nyoom-engineering/oxocarbon.nvim")
	add("phha/zenburn.nvim")
	add({ source = "mofiqul/dracula.nvim" })
	add("miikanissi/modus-themes.nvim")
	now(function()
		vim.cmd("colorscheme gruvbox")
	end)
	now(function()
		local filterout_lua_diagnosing = function(notif_arr)
			local not_diagnosing = function(notif)
				return not vim.startswith(notif.msg, "lua_ls: Diagnosing")
			end
			notif_arr = vim.tbl_filter(not_diagnosing, notif_arr)
			return MiniNotify.default_sort(notif_arr)
		end
		require("mini.notify").setup({
			content = { sort = filterout_lua_diagnosing },
			window = { config = { border = "double" } },
		})
		vim.notify = MiniNotify.make_notify()
	end)
	now(function()
		require("mini.starter").setup()
	end)

	now(function()
		require("mini.statusline").setup()
	end)

	now(function()
		require("mini.tabline").setup()
	end)

	now(function()
		require("mini.icons").setup({
			use_file_extension = function(ext, _)
				local suf3, suf4 = ext:sub(-3), ext:sub(-4)
				return suf3 ~= "scm" and suf3 ~= "txt" and suf3 ~= "yml" and suf4 ~= "json" and suf4 ~= "yaml"
			end,
		})
		MiniIcons.mock_nvim_web_devicons()
		later(MiniIcons.tweak_lsp_kind)
	end)
	later(function()
		local miniclue = require("mini.clue")
		miniclue.setup({
			clues = {
				Config.leader_group_clues,
				miniclue.gen_clues.builtin_completion(),
				miniclue.gen_clues.g(),
				miniclue.gen_clues.marks(),
				miniclue.gen_clues.registers(),
				miniclue.gen_clues.windows({ submode_resize = true }),
				miniclue.gen_clues.z(),
			},
			triggers = {
				{ mode = "n", keys = "<Leader>" }, -- Leader triggers
				{ mode = "x", keys = "<Leader>" },
				{ mode = "n", keys = [[\]] }, -- mini.basics
				{ mode = "n", keys = "[" }, -- mini.bracketed
				{ mode = "n", keys = "]" },
				{ mode = "x", keys = "[" },
				{ mode = "x", keys = "]" },
				{ mode = "i", keys = "<C-x>" }, -- Built-in completion
				{ mode = "n", keys = "g" }, -- `g` key
				{ mode = "x", keys = "g" },
				{ mode = "n", keys = "'" }, -- Marks
				{ mode = "n", keys = "`" },
				{ mode = "x", keys = "'" },
				{ mode = "x", keys = "`" },
				{ mode = "n", keys = '"' }, -- Registers
				{ mode = "x", keys = '"' },
				{ mode = "i", keys = "<C-r>" },
				{ mode = "c", keys = "<C-r>" },
				{ mode = "n", keys = "<C-w>" }, -- Window commands
				{ mode = "n", keys = "z" }, -- `z` key
				{ mode = "x", keys = "z" },
			},
			window = { config = { border = "double" } },
		})
	end)

	later(function()
		-- require("mini.completion").setup({
		-- 	lsp_completion = {
		-- 		source_func = "omnifunc",
		-- 		auto_setup = false,
		-- 		process_items = function(items, base)
		-- 			-- Don't show 'Text' and 'Snippet' suggestions
		-- 			items = vim.tbl_filter(function(x)
		-- 				return x.kind ~= 1 and x.kind ~= 15
		-- 			end, items)
		-- 			return MiniCompletion.default_process_items(items, base)
		-- 		end,
		-- 	},
		-- 	window = {
		-- 		info = { border = "double" },
		-- 		signature = { border = "double" },
		-- 	},
		-- })
		-- if vim.fn.has("nvim-0.11") == 1 then
		-- 	vim.opt.completeopt:append("fuzzy") -- Use fuzzy matching for built-in completion
		-- end
	end)

	later(function()
		require("mini.cursorword").setup()
	end)

	later(function()
		require("mini.diff").setup()
		local rhs = function()
			return MiniDiff.operator("yank") .. "gh"
		end
		vim.keymap.set("n", "ghy", rhs, { expr = true, remap = true, desc = "Copy hunk's reference lines" })
	end)
	later(function()
		require("mini.files").setup({ windows = { preview = true } })
		local minifiles_augroup = vim.api.nvim_create_augroup("ec-mini-files", {})
		vim.api.nvim_create_autocmd("User", {
			group = minifiles_augroup,
			pattern = "MiniFilesWindowOpen",
			callback = function(args)
				vim.api.nvim_win_set_config(args.data.win_id, { border = "double" })
			end,
		})
		vim.api.nvim_create_autocmd("User", {
			group = minifiles_augroup,
			pattern = "MiniFilesExplorerOpen",
			callback = function()
				MiniFiles.set_bookmark("c", vim.fn.stdpath("config"), { desc = "Config" })
				MiniFiles.set_bookmark(
					"m",
					vim.fn.stdpath("data") .. "/site/pack/deps/start/mini.nvim",
					{ desc = "mini.nvim" }
				)
				MiniFiles.set_bookmark("p", vim.fn.stdpath("data") .. "/site/pack/deps/opt", { desc = "Plugins" })
				MiniFiles.set_bookmark("w", vim.fn.getcwd, { desc = "Working directory" })
			end,
		})
	end)

	later(function()
		require("mini.git").setup()
	end)

	later(function()
		local hipatterns = require("mini.hipatterns")
		local hi_words = MiniExtra.gen_highlighter.words
		hipatterns.setup({
			highlighters = {
				fixme = hi_words({ "FIXME", "Fixme", "fixme" }, "MiniHipatternsFixme"),
				hack = hi_words({ "HACK", "Hack", "hack" }, "MiniHipatternsHack"),
				todo = hi_words({ "TODO", "Todo", "todo" }, "MiniHipatternsTodo"),
				note = hi_words({ "NOTE", "Note", "note" }, "MiniHipatternsNote"),

				hex_color = hipatterns.gen_highlighter.hex_color(),
			},
		})
	end)

	later(function()
		require("mini.indentscope").setup()
	end)

	later(function()
		require("mini.misc").setup({ make_global = { "put", "put_text", "stat_summary", "bench_time" } })
		MiniMisc.setup_auto_root()
		-- MiniMisc.setup_termbg_sync()
	end)

	later(function()
		require("mini.move").setup({ options = { reindent_linewise = false } })
	end)

	later(function()
		local remap = function(mode, lhs_from, lhs_to)
			local keymap = vim.fn.maparg(lhs_from, mode, false, true)
			local rhs = keymap.callback or keymap.rhs
			if rhs == nil then
				error("Could not remap from " .. lhs_from .. " to " .. lhs_to)
			end
			vim.keymap.set(mode, lhs_to, rhs, { desc = keymap.desc })
		end
		remap("n", "gx", "<Leader>ox")
		remap("x", "gx", "<Leader>ox")

		require("mini.operators").setup()
	end)

	later(function()
		require("mini.pairs").setup({ modes = { insert = true, command = true, terminal = true } })
		vim.keymap.set("i", "<CR>", "v:lua.Config.cr_action()", { expr = true })
	end)

	later(function()
		require("mini.pick").setup({ window = { config = { border = "double" } } })
		vim.ui.select = MiniPick.ui_select
		vim.keymap.set("n", ",", [[<Cmd>Pick buf_lines scope='current' preserve_order=true<CR>]], { nowait = true })

		MiniPick.registry.projects = function()
			local cwd = vim.fn.expand("~/repos")
			local choose = function(item)
				vim.schedule(function()
					MiniPick.builtin.files(nil, { source = { cwd = item.path } })
				end)
			end
			return MiniExtra.pickers.explorer({ cwd = cwd }, { source = { choose = choose } })
		end
	end)

	later(function()
		require("mini.surround").setup({ search_method = "cover_or_next" })
		-- Disable `s` shortcut (use `cl` instead) for safer usage of 'mini.surround'
		vim.keymap.set({ "n", "x" }, "s", "<Nop>")
	end)

	later(function()
		require("mini.visits").setup()
	end)

	-- Dependencies ===============================================================
	-- Tree-sitter: advanced syntax parsing, highlighting, and text objects
	later(function()
		local ts_spec = {
			source = "nvim-treesitter/nvim-treesitter",
			checkout = "master",
			hooks = {
				post_checkout = function()
					vim.cmd("TSUpdate")
				end,
			},
		}
		add({ source = "nvim-treesitter/nvim-treesitter-textobjects", depends = { ts_spec } })
		local ensure_installed = {
			"bash",
			"c",
			"cpp",
			"css",
			"html",
			"javascript",
			"json",
			"lua",
			"markdown",
			"markdown_inline",
			"nix",
			"powershell",
			"python",
			"r",
			"regex",
			"rst",
			"rust",
			"toml",
			"tsx",
			"yaml",
			"vim",
			"vimdoc",
			"sql",
		}

		require("nvim-treesitter.configs").setup({
			ensure_installed = ensure_installed,
			highlight = { enable = true },
			incremental_selection = { enable = false },
			textobjects = { enable = false },
			indent = { enable = false },
		})

		-- Disable injections in 'lua' language. In Neovim<0.9 it is
		-- `vim.treesitter.query.set_query()`; in Neovim>=0.9 it is
		-- `vim.treesitter.query.set()`.
		local ts_query = require("vim.treesitter.query")
		local ts_query_set = ts_query.set or ts_query.set_query
		ts_query_set("lua", "injections", "")
	end)

	-- Formatting
	later(function()
		add("stevearc/conform.nvim")
		-- source('plugins/conform.lua')
		require("conform").setup({
			-- Map of filetype to formatters
			formatters_by_ft = {
				-- javascript = { "prettierd" },
				-- json = { "prettierd" },
				lua = { "stylua" },
				rust = { "rustfmt" },
				c_sharp = { "csharpier" },
			},
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		})
	end)

	-- Language server configurations
	later(function()
		local BLINKVER = "v0.5.1"
		MiniDeps.add({
			source = "Saghen/blink.cmp",
			checkout = BLINKVER,
		})
		require("blink.cmp").setup({
			fuzzy = {
				prebuiltBinaries = {
					download = true,
					forceVersion = BLINKVER,
				},
			},
			keymap = {
				preset = "enter",
			},
			signature_help = {
				enabled = true,
			},
			windows = {
				selection = "auto_insert",
			},
		})
	end)

	later(function()
		add("neovim/nvim-lspconfig")
		-- source('plugins/nvim-lspconfig.lua')
		local lspconfig = require("lspconfig")

		-- Preconfiguration ===========================================================
		local on_attach_custom = function(client, buf_id)
			if client.server_capabilities.inlayHintProvider then
				vim.lsp.inlay_hint.enable(true, { buf_id })
			end
			vim.bo[buf_id].omnifunc = "v:lua.MiniCompletion.completefunc_lsp"

			-- Mappings are created globally for simplicity

			-- Currently all formatting is handled with 'conform' plugin
			if vim.fn.has("nvim-0.8") == 1 then
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentRangeFormattingProvider = false
			else
				client.resolved_capabilities.document_formatting = false
				client.resolved_capabilities.document_range_formatting = false
			end
		end

		local diagnostic_opts = {
			float = { border = "double" },
			-- Show gutter sings
			signs = {
				-- With highest priority
				priority = 9999,
				-- Only for warnings and errors
				severity = { min = "WARN", max = "ERROR" },
			},
			-- Show virtual text only for errors
			virtual_text = { severity = { min = "WARN", max = "ERROR" } },
			-- Don't update diagnostics when typing
			update_in_insert = false,
		}

		vim.diagnostic.config(diagnostic_opts)

		-- Lua (sumneko_lua) ==========================================================
		-- Deal with the fact that LuaLS in case of `local a = function()` style
		-- treats both `a` and `function()` as definitions of `a`.
		local filter_line_locations = function(locations)
			add_to_log(locations)
			local present, res = {}, {}
			for _, l in ipairs(locations) do
				local t = present[l.filename] or {}
				if not t[l.lnum] then
					table.insert(res, l)
					t[l.lnum] = true
				end
				present[l.filename] = t
			end
			return res
		end

		local show_location = function(location)
			local buf_id = location.bufnr or vim.fn.bufadd(location.filename)
			vim.bo[buf_id].buflisted = true
			vim.api.nvim_win_set_buf(0, buf_id)
			vim.api.nvim_win_set_cursor(0, { location.lnum, location.col - 1 })
			vim.cmd("normal! zv")
		end

		lspconfig.lua_ls.setup({
			capabilities = require("blink.cmp").get_lsp_capabilities(),
			on_attach = function(client, bufnr)
				on_attach_custom(client, bufnr)

				-- Reduce unnecessarily long list of completion triggers for better
				-- `MiniCompletion` experience
				client.server_capabilities.completionProvider.triggerCharacters = { ".", ":" }

				-- Tweak mapping for `vim.lsp.buf_definition` as client-local handlers
				-- are ignored after https://github.com/neovim/neovim/pull/30877
				local unique_definition = function()
					local on_list = function(args)
						local items = filter_line_locations(args.items)
						if #items > 1 then
							vim.fn.setqflist({}, " ", { title = "LSP locations", items = items })
							vim.cmd("botright copen")
							return
						end
						show_location(items[1])
					end
					vim.lsp.buf.definition({ on_list = on_list })
				end
				vim.keymap.set("n", "<Leader>ls", unique_definition, { buffer = bufnr, desc = "Lua source definition" })
			end,
			root_dir = function(fname)
				return lspconfig.util.root_pattern(".git")(fname) or lspconfig.util.path.dirname(fname)
			end,
			settings = {
				Lua = {
					runtime = {
						-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
						version = "LuaJIT",
						-- Setup your lua path
						path = vim.split(package.path, ";"),
					},
					diagnostics = {
						-- Get the language server to recognize common globals
						globals = { "vim", "describe", "it", "before_each", "after_each" },
						disable = { "need-check-nil" },
						-- Don't make workspace diagnostic, as it consumes too much CPU and RAM
						workspaceDelay = -1,
					},
					workspace = {
						-- Don't analyze code from submodules
						ignoreSubmodules = true,
					},
					-- Do not send telemetry data containing a randomized but unique identifier
					telemetry = {
						enable = false,
					},
				},
			},
		})
		-- Markdown
		lspconfig.markdown_oxide.setup({
			on_attach = on_attach_custom,
			capabilities = require("blink.cmp").get_lsp_capabilities(),
		})
		-- TODO: Python
		-- JSON
		lspconfig.jsonls.setup({
			on_attach = on_attach_custom,
			capabilities = require("blink.cmp").get_lsp_capabilities(),
		})
		-- YAML
		lspconfig.yamlls.setup({
			on_attach = on_attach_custom,
			capabilities = require("blink.cmp").get_lsp_capabilities(),
		})
		-- TODO: c/cc
		-- TODO: web
		-- nix
		lspconfig.nixd.setup({
			on_attach = on_attach_custom,
			capabilities = require("blink.cmp").get_lsp_capabilities(),
		})
		-- dotnet
		if vim.loop.os_uname().sysname ~= "Linux" then
			add("williamboman/mason.nvim")
			require("mason").setup()
			add("seblj/roslyn.nvim")
			require("roslyn").setup()
		end
		-- Rust
		add("mrcjkb/rustaceanvim")
		vim.g.rustaceanvim = {
			-- Plugin configuration
			tools = {},
			-- LSP configuration
			server = {
				capabilities = require("blink.cmp").get_lsp_capabilities(),
				on_attach = function(client, bufnr)
					-- you can also put keymaps in here
				end,
				default_settings = {
					-- rust-analyzer language server configuration
					["rust-analyzer"] = {},
				},
			},
			-- DAP configuration
			dap = {},
		}
	end)

	-- -- Snippets
	-- later(function()
	--   add('L3MON4D3/LuaSnip')
	--   local src_file = vim.fn.has('nvim-0.10') == 1 and 'my_snippets.lua' or 'plugins/luasnip.lua'
	--   source(src_file)
	-- end)

	later(function()
		add("OXY2DEV/markview.nvim")
		require("markview").setup()
	end)
	-- TODO: TobinPalmer/pastify.nvim
	now(function()
		if vim.loop.os_uname().sysname == "Linux" then
			add("3rd/image.nvim")
			require("image").setup({ integrations = { markdown = { only_render_image_at_cursor = true } } })
		end
	end)
end

later(function()
	add("folke/trouble.nvim")
	require("trouble").setup()
end)

vim.opt.scrolloff = 5
vim.opt.showtabline = 1
