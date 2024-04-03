function SetColors(color)
	color = color or "gruvbox"
	vim.cmd.colorscheme(color)
end

SetColors()
