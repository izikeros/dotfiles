import sublime
import sublime_plugin


class ExampleCommand(sublime_plugin.TextCommand):
	def run(self, edit):
		allcontent = sublime.Region(0, self.view.size())
		print(str(allcontent))
		self.view.replace(edit, allcontent, 'Hello, world!')


