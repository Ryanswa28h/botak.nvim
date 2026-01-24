local function open_today_journal()
	local date = os.date("%Y-%m-%d")
	local dir = vim.fn.expand("~/.notes/journal")
	local path = dir .. "/" .. date .. ".md"

	if vim.fn.isdirectory(dir) == 0 then
		vim.fn.mkdir(dir, "p")
	end

	if vim.fn.filereadable(path) == 0 then
		local template = { "# 🧠 Journal — " .. date, "", "## Braindump", "", "- ", "", "---", "", "## Notes", "" }
		vim.fn.writefile(template, path)
	end

	-- CHANGE THIS: Use the float util
	require("utils.float").open_float(path, true)

	-- jump to braindump section
	vim.cmd("normal! gg/^## Braindump<CR>jj$")
end

return open_today_journal
