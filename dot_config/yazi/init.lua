-- Show symlink in status bar
Status:children_add(function(self)
	local h = self._current.hovered
	if h and h.link_to then
		return " -> " .. tostring(h.link_to)
	else
		return ""
	end
end, 3300, Status.LEFT)

-- Show modification time near permissions (right side)
Status:children_add(function(self)
	local h = self._current.hovered
	if not h then
		return ""
	end
	local time = math.floor(h.cha.mtime or 0)
	if time == 0 then
		return ""
	end
	return ui.Line { " ", ui.Span(os.date("%Y-%m-%d %H:%M", time)), " " }
end, 1500, Status.RIGHT)

require("symlink-target-path"):setup {
	normalize = true,
	skip_broken = false,
}

-- Required for duckdb.yazi (parquet previewer)
-- require("duckdb"):setup()
