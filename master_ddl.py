###########################################################################
# author: vldb                                                            #
# date: 01/09/2021                                                        #
# version: 1.0                                                            #
# description: run each endpoint.ddl file                                 #
###########################################################################

import os

# creating list of endpoints
f = open("endpoints.txt", "r")
endpoints = f.readlines()

# looping through endpoints list to run ddl file
n = 0
while n < len(endpoints):
    filename = endpoints[n].rstrip('\n') + '.ddl'
    print('Running ' + filename)
    os.system('psql -f ' + filename + ' -d schools -U postgres')
    n += 1
