from os import listdir
from os.path import isfile, join, abspath
import os
dir = "s0"


for i in range(1, 10):
        path = abspath(dir + str(i))
        for f in listdir(path):
                if isfile(join(path, f)) and ".c" in f or ".cpp" in f:
                        os.system( "./go " + join(path, f))