import sublime
import sublime_plugin

# To change key bindings:
# Preferences -> Key Bindings
# and add similar to:
# ```json
#   // Change direction in vocabulary notes
#   { "keys": ["F5"],
#     "command": "insert_iso_date" },
# ```

class InsertIsoDateCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        format = "%Y-%m-%d"
        sel = self.view.sel();
        for s in sel:
            if s.empty():
            	self.view.insert(edit, s.a, strftime(format, localtime()))
            else:
            	self.view.replace(edit, s, strftime(format, localtime()))


