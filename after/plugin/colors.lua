function ColorScreen(color)
	color = color or "everforest"
	vim.cmd.colorscheme(color)
end

ColorScreen()
