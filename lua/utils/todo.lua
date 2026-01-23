local function open_or_create_todo()
	local path = vim.fn.expand("~/todo.md")

	-- if file does not exist, create with template
	if vim.fn.filereadable(path) == 0 then
		local template = {
			"# 📝 Tasks",
			"",
			"- [ ] ",
			"",
		}
		vim.fn.writefile(template, path)
	end

	vim.cmd("edit " .. path)
end

return open_or_create_todo
