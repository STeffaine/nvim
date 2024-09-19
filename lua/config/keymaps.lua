-- Keymaps for vim stuff itself
vim.keymap.set("n", "<leader>O", "<cmd>e .<CR>", { desc = "Open vim explorer in the wd" })
vim.keymap.set("n", "<leader>o", "<cmd>Ex %:h<CR>", { desc = "Open vim explorer in the files dir" })

-- Buffers
vim.keymap.set("n", "<leader>c", "<cmd>bw!<CR>", { desc = "Write and close current buffer" })
vim.keymap.set("n", "<leader>[", "<cmd>bprev<CR>", { desc = "Go to previous buffer" })
vim.keymap.set("n", "<leader>]", "<cmd>bnext<CR>", { desc = "Go to next buffer" })
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "quit file"})
vim.keymap.set("n", "<leader>Q", "<cmd>q!<CR>", { desc = "quit file force"})

-- Windows
vim.keymap.set("n", "<C-h>", "<cmd>wincmd h<CR>", { desc = "Select window to left"})
vim.keymap.set("n", "<C-j>", "<cmd>wincmd j<CR>", { desc = "Select window to left"})
vim.keymap.set("n", "<C-k>", "<cmd>wincmd k<CR>", { desc = "Select window to left"})
vim.keymap.set("n", "<C-l>", "<cmd>wincmd l<CR>", { desc = "Select window to left"})
vim.keymap.set("n", "<leader>p", "<cmd>Lexplore<CR>", { desc = "Open Explore in VSplit"})

-- Keymaps for finding things
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files by name" })
vim.keymap.set("n", "<leader>ft", builtin.live_grep, { desc = "Grep over all files in wd 'find text'" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help tags" })
vim.keymap.set("n", "<C-space>", builtin.live_grep, { desc = "Grep over all files in the wd" })

-- LSP Stuff
vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, { desc = "LSP buf Hover" })
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, { desc = "Go to Definition" })
vim.keymap.set("n", "<leader>lt", vim.lsp.buf.type_definition, { desc = "Go to Type Definition" })
vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, { desc = "Go to Type Definition" })
vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code Actions" })
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "Format" })

-- DAP Stuff
local dap = require("dap")
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP Toggle Breakpoint" })
vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "DAP Continue" })

-- Git Stuff
vim.keymap.set("n", "<leader>sl", "<cmd>LazyGit<cr>", { desc = "Open LazyGit" })
require("gitsigns").setup({
	on_attach = function(bufnr)
		local gitsigns = require("gitsigns")

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		map("n", "]c", function()
			if vim.wo.diff then
				vim.cmd.normal({ "]c", bang = true })
			else
				gitsigns.nav_hunk("next")
			end
		end)

		map("n", "[c", function()
			if vim.wo.diff then
				vim.cmd.normal({ "[c", bang = true })
			else
				gitsigns.nav_hunk("prev")
			end
		end)

		-- Actions
		map("n", "<leader>ss", gitsigns.stage_hunk, { desc = "Stage Hunk Under Cursor" })
		map("n", "<leader>sr", gitsigns.reset_hunk, { desc = "Reset Hunk Under Cursor" })
		map("v", "<leader>ss", function()
			gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end, { desc = "Stage Selected Hunk" })
		map("v", "<leader>sr", function()
			gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end, { desc = "Reset Selected Hunk" })
		map("n", "<leader>sS", gitsigns.stage_buffer, { desc = "Stage Buffer" })
		map("n", "<leader>su", gitsigns.undo_stage_hunk, { desc = "Undo Stage Hunk" })
		map("n", "<leader>sR", gitsigns.reset_buffer, { desc = "Reset Buffer Hunk" })
		map("n", "<leader>sp", gitsigns.preview_hunk, { desc = "Preview Hunk" })
		map("n", "<leader>sB", function()
			gitsigns.blame_line({ full = true })
		end, { desc = "Show Full Git Blame" })
		map("n", "<leader>sb", gitsigns.toggle_current_line_blame, { desc = "Toggle inline Git Blame" })
		map("n", "<leader>sd", gitsigns.diffthis, { desc = "Diff This" })
		map("n", "<leader>sD", function()
			gitsigns.diffthis("~")
		end)
	end,
})
