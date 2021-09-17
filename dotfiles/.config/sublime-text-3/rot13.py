import sublime
import sublime_plugin

class Rot13Command(sublimeplugin.TextCommand):
    def run(self, view, args):
        for region in view.sel():
            if not region.empty():
                # Get the selected text
                s = view.substr(region)
                # Transform it via rot13
                s = s.encode('rot13')
                # Replace the selection with transformed text
                view.replace(region, s)