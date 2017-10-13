#!/usr/bin/env python3
import shlex
import sys
from pprint import pprint

import os

CMAKE_MARKER = ' cmake -DCMAKE_MODULE_PATH'
tokenlist = {}
for line in sys.stdin:
    if line.startswith(CMAKE_MARKER):
        tokens = shlex.split(line)
        tokenlist[os.path.basename(tokens[-1])] = tokens
    print(line, end='')

basedir = os.path.join(os.getcwd(), 'clion')
os.makedirs(basedir, exist_ok=True)
for module, tokens in tokenlist.items():
    with open(os.path.join(basedir, module), 'wt') as out:
        # first is always 'cmake' last is module location
        for token in tokens[1:-2]:
            out.write('"{}"\n'.format(token))
