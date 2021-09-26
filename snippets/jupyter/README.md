# Snippet definitions location for the notebook snippets extension:
```bash
echo $(jupyter --data-dir)
```
Can be e.g.: `./local/share/jupyter/nbextensions/snippets` or `/usr/local/share/jupyter/nbextensions/snippets`


# Adding snippets
Add new snippets to `snippets_from_extension.py`
then sync python script with notebook:
```bash
jupytext --sync experiments/evaluation_for_business/predict_and_eval_for_business.py
```
