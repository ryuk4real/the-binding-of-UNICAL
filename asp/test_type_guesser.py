# Make a post request to 127.0.0.1:8000
# with a json body containing a list of strings

import requests
import json

url = 'http://127.0.0.1'
port = '8000'
endpoint = '/run'

#read room_type_guesser.asp from file
with open('room_type_guesser.asp', 'r') as file:
    content = file.read()

data = {
    "program": content
    }

for i in range(0, 10):
    response = requests.post(url + ':' + port + endpoint, json=data)
    print(response.text)
