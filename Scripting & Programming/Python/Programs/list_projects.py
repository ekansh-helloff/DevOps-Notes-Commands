# This code sample uses the 'requests' library:
# http://docs.python-requests.org

import requests
from requests.auth import HTTPBasicAuth
import json
import os

# Set your API token here or use environment variable

os.environ['API_TOKEN'] = "5vqXI0yuQ6YPMUPsLrr669VA6Jn63ejnQKcHaz2pcq7LOtJXBlBZJQQJ99BJACAAAAAAAAAAAAASAZDO4Ybs"
API_TOKEN = os.getenv('API_TOKEN')

url = "https://dev.azure.com/EkanshPortfolio/_apis/projects?api-version=7.0"

auth = HTTPBasicAuth('', API_TOKEN)
headers = {
   "Accept": "application/json"
 }
response = requests.request("GET",url,headers=headers,auth=auth)

# Check response

if response.status_code == 200:
    output = json.loads(response.text)
    print(json.dumps(output, indent=2))
else:
    print(f"Error: {response.status_code} - {response.text}")