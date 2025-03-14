#!/bin/bash

PYTHON_VERSION="3.12"

tmp_dir=$(mktemp -d)

cmd="uv init --quiet --python $PYTHON_VERSION $tmp_dir"
echo "Running $cmd"
eval $cmd

cmd="uv add --directory $tmp_dir ipykernel ipywidgets $@"
echo "Running $cmd"
eval $cmd

notebook_contents=$(cat <<EOF
{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": []
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": ".venv",
   "language": "python",
   "name": "python3"
  },
  "language_info": {
   "codemirror_mode": {
    "name": "ipython",
    "version": 3
   },
   "file_extension": ".py",
   "mimetype": "text/x-python",
   "name": "python",
   "nbconvert_exporter": "python",
   "pygments_lexer": "ipython3",
   "version": "3.13.2"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 2
}
EOF
)
echo $notebook_contents > $tmp_dir/notebook.ipynb

code --new-window $tmp_dir
sleep 1  # wait for VS Code to start before we request to open the notebook
code --reuse-window $tmp_dir/notebook.ipynb
