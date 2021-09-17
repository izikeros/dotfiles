import sublime
import sublime_plugin
import re

def swap_terms(str_in):
	if '-' in str_in:
		terms = str_in.split('-')
	else:
		raise ValueError(f"{str_in} does not contains '-' sign")
		# TODO: display pop-up

	if not(len(terms)==2):
		raise ValueError(f"{str_in} was not divided into two parts") 

	return "-".join([terms[1].strip(),terms[0].strip()])

class MyCommand(sublime_plugin.TextCommand):
	def run(self, edit):
		for region in self.view.sel():
			original = self.view.substr(region)
			lines = original.split('\n')
			print(lines)
			new_lines = [swap_terms(l) for l in lines]
			print(new_lines)
			final_lines = [l.replace('-',';') for l in new_lines]
			print(final_lines)
			self.view.replace(edit, region, "\n".join(final_lines))