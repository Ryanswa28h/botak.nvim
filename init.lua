vim.g.configpreset = "default" -- "default" or "minimal"
vim.g.explorer = "xdg-open" -- "xdg-open" on linux, "open" on macOS, "explorer" on Windows
require("config.autocmds")
require("config.options")
require("config.keymaps")
require("config.lazy")
