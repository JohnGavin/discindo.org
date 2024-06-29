# https://lorentzen.ch/index.php/2024/06/28/shap-values-of-additive-models/

# https://github.com/pyenv/pyenv/blob/master/COMMANDS.md
# pyenv --help
# which python is activated (in pyenv) where * is placed
# !pyenv versions 
# !pyenv version
# !python --version
# !pyenv which python 
# local there are global and shell levels too. 
#   shell overrides local and global, 
#   local overrides global
# set locally which python in pyenv to use
# !pyenv versions 
# !pyenv global 3.10.9
# path to which python is activated in pyenv 
# !pyenv which python 
# list all packages 
# !pyenv exec pip list
# install pkg1 pkg2 then repeat list command above
# !sudo pyenv exec pip install duckdb
# !pyenv exec pip install lightgbm shap
# run helloworld.py using pyenv
# !pyenv exec python helloworld.py

import duckdb

# connect to MotherDuck using 'md:' or 'motherduck:'
con = duckdb.connect('md:')
