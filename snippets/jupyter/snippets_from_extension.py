# -*- coding: utf-8 -*-
# ---
# jupyter:
#   jupytext:
#     formats: ipynb,py:light
#     text_representation:
#       extension: .py
#       format_name: light
#       format_version: '1.5'
#       jupytext_version: 1.11.4
#   kernelspec:
#     display_name: prolog38
#     language: python
#     name: prolog38
# ---

# +
# TODO: write script that will convert odd cells to snippet name and even cells to json snippet
# (automate generation of snippets.json for Jupyter snippets plugin)
# -

# # Import pandas, numpy, matplotlib

import pandas as pd
import numpy as np
from matplotlib import pyplot as plt

# # Notebook markdown header

# # Title
# **Notebook Purpose:**
#
# -
# -
#
# **Created by:** Krystian Safjan
#
# **Jira:** [PROJECT-123](https://jiradc.com/browse/PROJECT-123)
#
# **Changes:**
#
# - 2020-08-01: KS: Initial implementation

# # Pandas - sample dataframe 1

raw_data = {
        'subject_id': ['1', '2', '3', '4', '5'],
        'first_name': ['Alex', 'Amy', 'Allen', 'Alice', 'Ayoung'], 
        'last_name': ['Anderson', 'Ackerman', 'Ali', 'Aoni', 'Atiches']}
df_a = pd.DataFrame(raw_data, columns = ['subject_id', 'first_name', 'last_name'])

# # Pandas - sample dataframe 2

raw_data = {
        'label': ['Alex', 'Amy', 'Allen', 'Alice', 'Ayoung'],
        'values_1': [104, 105, 109, 99, 80],
        'values_2': [31, 17, 42, 11, 23]}
df_b = pd.DataFrame(raw_data, columns = ['label', 'values_1', 'values_2'])

# # Load numpy sparse

import scipy.sparse
x = scipy.sparse.load_npz('/data/data.npz')

# # Save numpy sparse

import scipy.sparse
scipy.sparse.save_npz('data.npz', x)

# # Pandas - unique from string column

list_of_unique_vals = pd.unique(df[['column_to_extract_unique_vals_from']].values.ravel())

# # Run in joblib context

with joblib.parallel_backend(n_jobs=n_jobs, backend='threading'):
    pass

# # Matplotlib - set my custom plot styling

sys.path.append('../..')
from src.visualization.matplotlib_styling import set_styling
set_styling('bmh')
#set_styling('fivethirtyeight')

# # Matplotlib - set  plot styling

# +
# TODO
# -

# # Matplotlib - download and set my custom styling

# + language="bash"
# if [ ! -e matplotlib_styling.py ]; then
#    wget https://gist.githubusercontent.com/izikeros/457a99d950310da8166050a13f4043cb/raw/4334d77bdaad867003926e7cf87ffbec7131528d/matplotlib_styling.py
# fi
# from matplotlib_styling import set_styling
# set_styling('bmh')
# #set_styling('fivethirtyeight')
# -

# # Pandas - Turn off scientific notation

pd.set_option(‘display.float_format’, lambda x: ‘%.3f’ % x)


# # Pandas - apply: process field

def calculate_taxes(price):
    taxes = price * 0.12
    return taxes
df['taxes'] = df.price.apply(calculate_taxes)


# # Pandas - apply: process row

def calculate_taxes(row):
    row['taxes'] = row['price'] * 0.12
    return row
df.apply(calculate_taxes, axis=1)

# # Pandas - rename columns

df = df.rename(columns={'before':'after'})

# # Bash - Capture results and exchange between bash and python

# +
# a=!ls
print(a)

b='foo'
# ! echo $b
# -

# # Graphviz

# install graphviz and dotmagic extension:
# pip install graphviz git+https://github.com/sursingh/dotmagic.git
# %load_ext dotmagic
# %%dot -p
digraph {
    a -> b -> c -> a
}

# # Jupyter - autoreload

# %load_ext autoreload
# %autoreload

# # Pandas - wide display of dataframe

pd.set_option('display.max_columns', None)
pd.set_option('display.expand_frame_repr', False)
pd.set_option('max_colwidth', None)

# # Plot hist from Count

# +
# TODO
# -

# # Plot hist from dict

# +
# TODO
# -

# # Matplotlib - annotate plot

# need to import it
# TODO: add snippet downloader as for matplotlib_styling
add_label_values_barh(ax)

# # Pandas - display dataframe with caption

display(df.style.set_caption('My caption'))

# # Pandas - display two dataframes side-by-side

# +
# TODO
# -

# # Pandas - limit display precision

pd.set_option('precision', 1)

# # Pandas stylin examples

# +
# TODO: add examples from pbpython: "pandas stylin"
# https://pbpython.com/styling-pandas.html
# -

# # Pandas - convert a column to a numeric type

df['col']=df['col'].astype(str).convert_objects(convert_numeric=True)

# # Jupyter - handle logging in notebook

# At the beginning of the notebook
from importlib import reload
import logging
reload(logging)
log_fmt = '[%(levelname).1s] %(message)s'
logging.basicConfig(format=log_fmt, level=logging.DEBUG, datefmt='%I:%M:%S')
logging.debug("test debug")
logging.info("test info")
logging.warning("test warning")

# # Jupyter - pass the variable to cell with bash

# + magic_args="-s \"$fname\"" language="bash"
# echo "$1"
# -

# # Pandas - display dataframe with limited precision

# all columns
display(df.style.format('{0:,.2f}'))
# selected columns
display(df_agg.style.format({'A': '{0:,.2f}', 'B': '{0:,.2f}'}))

# # Pandas - reorder columns

cols = df_agg.columns.tolist()
    cols.insert(0, cols.pop(cols.index('rel')))
    df_agg = self.df_agg.reindex(columns=cols)

# # Matplotlib - legend outside

ax.legend(loc='center left', bbox_to_anchor=(1, 0.5))

# # Jupyter - save notebook as HTML report with nbconvert

# + language="bash"
# # in the end of the notebook put this bash cell
#
# # NOTE: Ensure that you saved the notebook before generating HTML report!
# now=$(date +"%Y_%m_%d__%H_%M")
# html_report_file = "../../reports/${now}_experiment_result_analysis.html"
# this_notebook_file = "./experiment.ipynb"
# jupyter nbconvert --output $html_report_file  $this_notebook_file --no-input
#
