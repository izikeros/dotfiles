#!/usr/bin/env python
import os
import unidecode
import re

def remove_accents(accented_string):
    unaccented_string = unidecode.unidecode(accented_string)
    return unaccented_string

for accented_filename in os.listdir(os.getcwd()):
    filename = remove_accents(accented_filename)
    filename = filename.replace(' ','_')
    filename = re.sub(r'[^\w\.-]+', '', filename)
    if accented_filename != filename:
        try:
            os.rename(accented_filename, filename)
        except ex:
            print(ex)