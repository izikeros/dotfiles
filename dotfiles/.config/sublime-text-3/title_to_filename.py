import sublime
import sublime_plugin

# To change key bindings:
# Preferences -> Key Bindings
# and add similar to:
# ```json
#   // Change direction in vocabulary notes
#   { "keys": ["ctrl+shift+s"],
#     "command": "swap_terms" },
# ```

class TitleToFileNameCommand(sublime_plugin.TextCommand):
	def run(self, edit):
		for region in self.view.sel():
			if not region.empty():
				# Get the selected text
				s_orig = self.view.substr(region)
				# Replace spaces with underscore
				s = s_orig.replace(" ", "_")
				# Add extension	
				s = s + ".md"
				# Ensure filename is lowercase
				s = s.lower()
				# Replace the selection with transformed text
				self.view.replace(edit, region, s)
