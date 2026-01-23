local function open_today_journal()
	local date = os.date("%Y-%m-%d")
	local dir = vim.fn.expand("~/.notes/journal")
	local path = dir .. "/" .. date .. ".md"

	-- ensure directory exists
	if vim.fn.isdirectory(dir) == 0 then
		vim.fn.mkdir(dir, "p")
	end

	-- create file if missing
	if vim.fn.filereadable(path) == 0 then
		local template = {
			"# 🧠 Journal — " .. date,
			"",
			"## Braindump",
			"",
			"- ",
			"",
			"---",
			"",
			"## Notes",
			"",
		}
		vim.fn.writefile(template, path)
	end

	vim.cmd("edit " .. path)

	-- jump to braindump section
	vim.cmd("normal! gg/^## Braindump<CR>jj$")
end

return open_today_journal
