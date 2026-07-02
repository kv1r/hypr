local terminal = "kitty"
local filemanager = "nemo"
local menu = "rofi -show drun -show-icons"
local mainmod = "ALT"
local flags_el = { repeating = true, locked = true }
local flags_l = { locked = true }

-- MANIPULAÇÃO DE JANELAS
hl.bind(mainmod .. " + return ", hl.dsp.exec_cmd(terminal)) -- executa o terminal
hl.bind(mainmod .. " + q ", hl.dsp.window.close()) -- fecha a janela ativa
hl.bind(mainmod .. " + e ", hl.dsp.exec_cmd(filemanager)) -- executa o gerenciador de arquivos
hl.bind(mainmod .. " + v ", hl.dsp.window.float({ action = "toggle" })) -- ativa/desativa flutuação de janela
hl.bind(mainmod .. " + space ", hl.dsp.exec_cmd(menu)) -- executa o menu de apps

-- MANIPULAÇÃO DE FOCO DE JANELAS
hl.bind(mainmod .. " + u ", hl.dsp.focus({ direction = "left" }))
hl.bind(mainmod .. " + i ", hl.dsp.focus({ direction = "right" }))
hl.bind(mainmod .. " + o ", hl.dsp.focus({ direction = "up" }))
hl.bind(mainmod .. " + p ", hl.dsp.focus({ direction = "down" }))

-- SELEÇÃO DE ÁREA DE TRABALHO
for i = 1, 9 do
	hl.bind(mainmod .. " + " .. i, function()
		hl.dsp.focus({ workspace = tostring(i) })
	end)

	hl.bind(mainmod .. " + SHIFT + " .. i, function()
		hl.dsp.window.move({ workspace = tostring(i) })
	end)
end

-- ÁREA DE TRABALHO ESPECIAL (scratchpad)
hl.bind(mainmod .. " + s ", hl.dsp.workspace.toggle_special("magic"))

-- MOVE A JANELA EM FOCO PARA A ÁREA DE TRABAHO ESPECIAL
hl.bind(mainmod .. " + SHIFT + s ", hl.dsp.window.move({ workspace = "special:magic" }))

-- CONTROLE DE VOLUME
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK 5%+"), flags_el)
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK 5%-"), flags_el)
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK toggle"), flags_el)
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE toggle"), flags_el)

-- CONTROLE DE MÍDIA
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("palyerctl next"), flags_l)
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("palyerctl play-pause"), flags_l)
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), flags_l)
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("palyerctl previous"), flags_l)
