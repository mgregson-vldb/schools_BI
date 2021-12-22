import sys

fname = sys.argv[1]

with open(fname, 'r') as fin:
    print(fin.read())
