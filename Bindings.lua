local CreateFrame  = CreateFrame
local SLASH_WM     = SLASH_WORLD_MARKER1
local CLEAR_WM     = SLASH_CLEAR_WORLD_MARKER1
local CURSOR_LABEL = "Cursor"
local format       = format

BINDING_HEADER_WMB = "World Marker Bindings"

local function Binding(name, label, macrotext)
    _G["BINDING_NAME_CLICK " .. name .. ":LeftButton"] = label
    local btn = CreateFrame("Button", name, nil, "SecureActionButtonTemplate")
    btn:SetAttribute("type", "macro")
    btn:SetAttribute("macrotext", macrotext)
    btn:RegisterForClicks("AnyUp", "AnyDown")
end

for i = 1, 8 do
    local marker = _G["WORLD_MARKER" .. i]

    Binding("WMB_WM" .. i,
        marker,
        format("%s %d\n%s %d", CLEAR_WM, i, SLASH_WM, i))

    Binding("WMB_WM" .. i .. "CURSOR",
        marker .. " @ " .. CURSOR_LABEL,
        format("%s [@cursor] %d", SLASH_WM, i))
end

Binding("WMB_CLEAR",
    REMOVE_WORLD_MARKERS,
    format("%s %s", CLEAR_WM, "all"))
