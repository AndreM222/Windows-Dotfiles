local status, picker = pcall(require, "color-picker")
if (not status) then return end

picker.setup({
    ["keymap"] = {
		["<Left>"] = "<Plug>ColorPickerSlider1Decrease",
        ["<Right>"] = "<Plug>ColorPickerSlider1Increase",
        ["<S-Left>"] = "<Plug>ColorPickerSlider5Decrease",
        ["<S-Right>"] = "<Plug>ColorPickerSlider5Increase",
    },
    ["icons"] = { "", " " },
})
