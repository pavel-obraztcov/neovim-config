function SetColors(color)
	color = color or "rose-pine-main"
	vim.cmd.colorscheme(color)
end

SetColors()
