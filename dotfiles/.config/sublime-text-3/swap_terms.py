import sublime
import sublime_plugin
import re

def swap_terms(str_in,i):
	if len(str_in)==0:
		return ""

	if '-' in str_in:
		terms = str_in.split('-')
	else:
		raise ValueError(f"{str_in} does not contains '-' sign, Line: {i}")
		# TODO: display pop-up or better hint at line with problem (as PrettyJSON plugin when encountered e.g. \\)

	if not(len(terms)==2):
		raise ValueError(f"{str_in} was not divided into two parts. Line: {i}") 

	return "-".join([terms[1].strip(),terms[0].strip()])

class SwapTermsCommand(sublime_plugin.TextCommand):
	def run(self, edit):
		for region in self.view.sel():
			original = self.view.substr(region)
			lines = original.split('\n')
			new_lines = [swap_terms(l,i) for i,l in enumerate(lines)]
			final_lines = [l.replace('-',';') for l in new_lines]
			self.view.replace(edit, region, "\n".join(final_lines))

# TODO: add menu entry and keybinding as here:
# https://cnpagency.com/blog/creating-sublime-text-3-plugins-part-1/