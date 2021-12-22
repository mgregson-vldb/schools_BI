#######################################################################
# author: vldb                                                        #
# date: 31/08/2021                                                    #
# version: 1.0                                                        #
# description: makes api call to recieve one json file per endpoint   #
#######################################################################

# Imports
import json
import time
import requests
from datetime import date
import os
from pathlib import Path

# Directories
main_dir = Path('.')
params_dir = Path.cwd() / 'params'
print(params_dir.cwd())
json_dir = main_dir  # / 'json'

# Token authentication
xporter_auth_url = 'https://login.groupcall.com/idaas/sts/STS/GetToken'
auth_data = {
    "estab": ""########,
    "relyingParty": "enter your login here",
    "password": "enter your api password here",
    "thirdpartyid": "XporterOnDemand"
}

# Grab token from response
r = requests.post(xporter_auth_url, data=auth_data)
jsonResponse = r.json()
token = jsonResponse['token']

# Create current date string
current_date = str(date.today())

# Xporter Variables
xporter_curl_url = 'https://xporter.groupcall.com/api/v1/School/'
estab = '3281102'
headers = {'Authorization': 'Idaas ' + token}

# Define generic file reader to list
def read_file_to_list(f):
    file = open(f)
    line = file.read().split('\n')
    file.close()
    return line


# Define read params file to a multi-line string - Must be blank params file
# for object even if no parameters for endpoint

params_list = params_dir.glob('*.params')

def read_params_file(x):
    for p in params_list:
        with open(p, 'r') as file: ########
            text = file.read()
        return text


# Remove json files if exist
json_list = json_dir.glob('*.json')
for j in json_list:
    try:
        os.remove(j)
    except OSError:
        pass


def json_endpoints():
    # Run get endpoints for current date, by creating a list of end points and calling get response
    # to create json files for the day
    endpoints = read_file_to_list('endpoints.txt')

    for endpoint in endpoints:

        try:
            start = time.time()
            params = read_params_file(endpoint)
            params = eval(params)
            curl_line = xporter_curl_url + estab + '/' + endpoint
            response = requests.get(curl_line, headers=headers, params=params)
            ###
            json_file_name = endpoint
            with open(str(json_dir) + '/' + json_file_name + '.json', 'a') as file:
                file.write(json.dumps(response.json()))
                print(f'{response} {endpoint} working, took ' + str(round((time.time() - start), 3)) + 's')
        except FileNotFoundError:
            print(endpoint + ' params file invalid or not found')


# error handling
# checks if endpoints file exists
if os.path.isfile('endpoints.txt') == False:
    print('endpoints file not found')
else:

    # checks if params folder exists
    if os.path.isdir('params') == False:
        print('params folder not found')
    else:

        # checks if jsons folder already exists, creates it if not
        if os.path.isdir('json') == True:
            json_endpoints()
        else:
            json_endpoints()
