# Convert a column to a numeric type
```python
df['col']=df['col'].astype(str).convert_objects(convert_numeric=True)
```

# pandas - wide display of dataframe
```python
pd.set_option('display.max_columns', None)
pd.set_option('display.expand_frame_repr', False)
pd.set_option('max_colwidth', -1)
```

# pandas - limit precision
```pytho
pd.set_option('precision', 1)
```

# Pandas - turn of scientific notation
```python
pd.set_option('display.float_format', lambda x: '%.1f' % x)
```

# handle logging in notebook
```python
# At the beginning of the notebook
from importlib import reload
import logging
reload(logging)
log_fmt = '[%(levelname).1s] %(message)s'
logging.basicConfig(format=log_fmt, level=logging.DEBUG, datefmt='%I:%M:%S')
logging.debug("test")
```

# Pass the variable to cell with bash
```python
%%bash -s "$fname"
echo "$1"
```

# display with limited precission
```python
# all columns
display(df.style.format('{0:,.2f}'))
# selected columns
display(df_agg.style.format({'A': '{0:,.2f}', 'B': '{0:,.2f}'}))
```
https://pbpython.com/styling-pandas.htmlv

# reorder columns
```python
cols = df_agg.columns.tolist()
    cols.insert(0, cols.pop(cols.index('rel')))
    df_agg = self.df_agg.reindex(columns=cols)
```

# legend outside
ax.legend(loc='center left', bbox_to_anchor=(1, 0.5))


# Save as HTML report
in the rnd of notebook put:

```bash
%%bash
# Ensure that you saved the notebook before generating HTML report
now=$(date +"%Y_%m_%d__%H_%M")
jupyter nbconvert --output ../../reports/subsystems/${now}_experiment_result_analysis.html ./experiment_result_analysis_Essential.ipynb --no-input
```