###########################################################################
# author: vldb                                                            #
# date: 01/09/2021                                                        #
# version: 1.0                                                            #
# description: run each endpoint_load.py file                             #
###########################################################################

import os

# creating list of endpoints
f = open("endpoints.txt", "r")
endpoints = f.readlines()

# looping through endpoints list to run each py file
n = 0
while n < len(endpoints):
    filename = endpoints[n].rstrip('\n') + '_00.py'
    print('Running ' + filename)
    os.system('py ' + filename)
    n += 1
