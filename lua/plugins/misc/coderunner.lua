local M = {}

local lang_aliases = {
	py = "python",
	python = "python",

	js = "javascript",
	javascript = "javascript",

	ts = "typescript",
	typescript = "typescript",

	lua = "lua",

	sh = "sh",
	bash = "sh",

	c = "c",
	cpp = "cpp",
	["c++"] = "cpp",

	go = "go",
	golang = "go",

	rust = "rust",
	rs = "rust",
}

local function get_command(ft, target)
	if ft == "python" then
		return "python " .. target
	elseif ft == "javascript" then
		return "node " .. target
	elseif ft == "typescript" then
		return "ts-node " .. target
	elseif ft == "lua" then
		return "lua " .. target
	elseif ft == "sh" then
		return "bash " .. target
	elseif ft == "c" then
		return "gcc " .. target .. " -o /tmp/a.out && /tmp/a.out"
	elseif ft == "cpp" then
		return "g++ " .. target .. " -o /tmp/a.out && /tmp/a.out"
	elseif ft == "go" then
		return "go run " .. target
	elseif ft == "rust" then
		return "cargo run"
	end
end

local function run_file()
	local file = vim.fn.expand("%")
	local ft = vim.bo.filetype

	if file == "" then
		vim.notify("No file to run", vim.log.levels.WARN)
		return
	end

	vim.cmd("w")

	local cmd = get_command(ft, file)

	if not cmd then
		vim.notify("No runner for filetype: " .. ft, vim.log.levels.ERROR)
		return
	end

	vim.cmd("botright split | terminal " .. cmd)
end

local function run_markdown_codeblock()
	local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
	local row = vim.api.nvim_win_get_cursor(0)[1]

	local start_line, end_line, lang

	-- find opening fence
	for i = row, 1, -1 do
		local found_lang = lines[i]:match("^```%s*([%w%+%-]+)")
		if found_lang then
			start_line = i
			lang = found_lang:lower()
			break
		end
	end

	if not start_line then
		vim.notify("Not inside a code block", vim.log.levels.WARN)
		return
	end

	-- find closing fence
	for i = start_line + 1, #lines do
		if lines[i]:match("^```%s*$") then
			end_line = i
			break
		end
	end

	if not end_line or row >= end_line then
		vim.notify("Not inside a valid code block", vim.log.levels.WARN)
		return
	end

	lang = lang_aliases[lang] or lang

	local code = table.concat(vim.list_slice(lines, start_line + 1, end_line - 1), "\n")

	-- map to temp extensions
	local ext = {
		python = "py",
		javascript = "js",
		typescript = "ts",
		lua = "lua",
		sh = "sh",
		c = "c",
		cpp = "cpp",
		go = "go",
		rust = "rs",
	}

	local tmpfile = "/tmp/mdcode." .. (ext[lang] or "txt")
	vim.fn.writefile(vim.split(code, "\n"), tmpfile)

	local cmd = get_command(lang, tmpfile)

	if not cmd then
		vim.notify("No runner for language: " .. lang, vim.log.levels.ERROR)
		return
	end

	vim.cmd("botright split | terminal " .. cmd)
end

local function run_smart()
	if vim.bo.filetype == "markdown" then
		run_markdown_codeblock()
	else
		run_file()
	end
end

return {
	"coderunner",
	virtual = true,
	keys = {
		{ "<leader>r", run_smart, desc = "Run current file or markdown code block" },
		{ "<leader>Rb", run_markdown_codeblock, desc = "Run markdown code block" },
		{ "<leader>Rf", run_file, desc = "Run current file" },
	},
}
