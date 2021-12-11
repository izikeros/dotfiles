import sublime
import sublime_plugin

# To change key bindings:
# Preferences -> Key Bindings
# and add similar to:
# ```json
#   // Change filename finished with .md to H1 markdown header
#   { "keys": ["ctrl+alt+t"],
#     "command": "file_name_to_title" },
# ```

class FilenameToTitleCommand(sublime_plugin.TextCommand):
	def run(self, edit):
		for region in self.view.sel():
			if not region.empty():
				# Get the selected text
				s_orig = self.view.substr(region)
				# Remove underscore and remove extension
				s = s_orig.replace("_", " ").replace(".md","")
				# Ensure first letter is capital
				s = s.capitalize()
				# Add H1 header mark
				s = "# " + s
				# Replace the selection with transformed text
				self.view.replace(edit, region, s)
