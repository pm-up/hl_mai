import argparse
import json
import requests


# Create a parser
parser = argparse.ArgumentParser()

# Add arguments to the parser
parser.add_argument('--file', help='Path to JSON files with user data', 
required=True)
parser.add_argument('--url', help='URL of the auth service', 
required=True)

# Parse the arguments
args = parser.parse_args()

# Open the JSON file and load the data
with open(args.file, 'r') as f:
    users = json.load(f)['objects']

# Create a dict to store the results
results = dict()

# Iterate over the users
for user in users:
    # Send a POST request to the auth service
    resp = requests.post(args.url, data=user)

    # Add the status code to the dict
    if resp.status_code not in results:
        results[resp.status_code] = 0
    results[resp.status_code] += 1

    # Print a message if the status code is not 201
    login = user['login']
    if resp.status_code != 201:
        print(f'Status code {resp.status_code} for user with login 
{login}')

# Print the results
print('Results by response code:')
print(results)
