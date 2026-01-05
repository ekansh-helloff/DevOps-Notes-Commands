import requests
from requests.auth import HTTPBasicAuth
import json
import os

# ------------------ Configuration ------------------

organization = "EkanshPortfolio"
project = "P1"
api_version = "7.0"
os.environ['API_TOKEN'] = "5vqXI0yuQ6YPMUPsLrr669VA6Jn63ejnQKcHaz2pcq7LOtJXBlBZJQQJ99BJACAAAAAAAAAAAAASAZDO4Ybs"
api_token = os.getenv("API_TOKEN")

if not api_token:
    print("❌ Error: Please set your AZURE_PAT environment variable.")
    exit(1)

auth = HTTPBasicAuth('', api_token)
headers = {"Accept": "application/json"}

# ------------------ Step 1: Get Work Item IDs using WIQL ------------------

# WIQL = Work Item Query Language (like SQL for Azure Boards)
wiql_query = {
    "query": f"SELECT [System.Id], [System.Title], [System.State], [System.WorkItemType] \
               FROM WorkItems WHERE [System.TeamProject] = '{project}' ORDER BY [System.ChangedDate] DESC"
}

wiql_url = f"https://dev.azure.com/{organization}/{project}/_apis/wit/wiql?api-version={api_version}"
wiql_response = requests.post(wiql_url, headers=headers, auth=auth, json=wiql_query)

if wiql_response.status_code != 200:
    print(f"❌ Failed to run WIQL query. Status: {wiql_response.status_code}")
    print(wiql_response.text)
    exit(1)

work_items = wiql_response.json()["workItems"]

if not work_items:
    print("⚠️ No Work Items found in this project.")
    exit(0)

print(f"✅ Found {len(work_items)} work items. Fetching details...\n")

# ------------------ Step 2: Fetch Details for Each Work Item ------------------

ids = ",".join(str(item["id"]) for item in work_items[:10])  # limit to first 10 for demo
details_url = f"https://dev.azure.com/{organization}/_apis/wit/workitems?ids={ids}&api-version={api_version}"

details_response = requests.get(details_url, headers=headers, auth=auth)
if details_response.status_code != 200:
    print(f"❌ Failed to fetch work item details: {details_response.status_code}")
    print(details_response.text)
    exit(1)

details = details_response.json()["value"]

# ------------------ Step 3: Filter and Print ------------------
for item in details:
    fields = item["fields"]
    work_type = fields.get("System.WorkItemType", "N/A")
    title = fields.get("System.Title", "N/A")
    state = fields.get("System.State", "N/A")

    if state.lower() != "closed":  # Example: show only open/active items
        print(f"🔹 [{work_type}] {title} — State: {state}")

print("\n✅ Script completed successfully!")
