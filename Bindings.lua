BINDING_HEADER_WMB = "World Marker Bindings"

local function MakeBindingButton(name, macroText, bindingLabel)
    _G["BINDING_NAME_CLICK " .. name .. ":LeftButton"] = bindingLabel
    local btn = CreateFrame("Button", name, nil, "SecureActionButtonTemplate")
    btn:SetAttribute("type", "macro")
    btn:SetAttribute("macrotext", macroText)
    btn:RegisterForClicks("AnyUp", "AnyDown")
end

for i = 1, 8 do
    MakeBindingButton(
        "WMB_WM" .. i,
        _G["SLASH_CLEAR_WORLD_MARKER1"] .. " " .. i .. "\n" .. _G["SLASH_WORLD_MARKER1"] .. " " .. i,
        _G["WORLD_MARKER" .. i]
    )
end

MakeBindingButton("WMB_CLEAR", _G["SLASH_CLEAR_WORLD_MARKER1"] .. " 0", REMOVE_WORLD_MARKERS)

for i = 1, 8 do
    MakeBindingButton(
        "WMB_WM" .. i .. "CURSOR",
        _G["SLASH_WORLD_MARKER1"] .. " [@cursor] " .. i,
        _G["WORLD_MARKER" .. i] .. " @ " .. _G["MOUSE_LABEL"]
    )
end
