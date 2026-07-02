hl.on("hyprland.start", function()
	-- carrega o incializador de áudio
	hl.exec_cmd("gentoo-pipewire-launcher")

	-- inicializa o daemon de notificações
	hl.exec_cmd("mako")

	-- define um wallpaper randomico com waypaper
	hl.exec_cmd("waypaper --random")
end)
