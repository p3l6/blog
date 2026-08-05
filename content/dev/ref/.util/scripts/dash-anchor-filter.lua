local char_to_hex = function(c)
    return string.format("%%%02X", string.byte(c))
end

local function urlencode(url)
    return url:gsub("([^%w_%%%-%.~])", char_to_hex)
end

function Header(elem)
    local text = table.concat( elem.content:map(function (c) if c.text then return c.text end return " " end) )
    local name, type = string.match(text, "(.-)%s*<!%-%-%s*(.-)%s*%-%->")
    if type then
        name = urlencode(name)
        local anchor = string.format('<a name="//apple_ref/%s/%s" class="dashAnchor">', type, name)
        return { pandoc.RawBlock('html', anchor), elem, pandoc.RawBlock('html', "</a>") }
    end
end
