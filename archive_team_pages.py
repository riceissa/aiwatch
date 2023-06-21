#!/usr/bin/env python3

import time
import requests
import mysql.connector

SLACK_URL = None

with open("slack-url.txt", "r") as f:
    line = f.readline()
    if line.strip():
        SLACK_URL = line.strip()

def print_and_slack(message):
    if SLACK_URL:
        requests.post(SLACK_URL, headers={"Content-type": "application/json"},
                      json={"text": message})
    print(message)

cnx = mysql.connector.connect(user='issa', database='aiwatch')
cursor = cnx.cursor()

cursor.execute("""select team_page from organizations where team_page is not NULL""")

URLS = []

for row in cursor.fetchall():
    urls = row[0]
    for url in urls.split():
        if "://web.archive.org" not in url:
            URLS.append(url)

cursor.close()
cnx.close()

try_again = []

# This part is modified from https://gitlab.com/orpheuslummis/archive-subwikis/-/blob/master/archive_subwikis.py#L27-36
for url in URLS:
    response = requests.get("https://web.archive.org/save/" + url)
    if response.status_code == 200:
        print(f"Archived {url}")
    elif response.status_code == 429:
        # We're sending too many requests, so wait a bit
        print(f"ERROR: We got a 429 so we're sending too many requests; will try {url} again at the end")
        try_again.append(url)
        time.sleep(20)
    else:
        print_and_slack(f"ERROR: {response.status_code} when trying to archive {url}")
    time.sleep(2)

for url in try_again:
    response = requests.get("https://web.archive.org/save/" + url)
    if response.status_code == 200:
        print(f"Archived {url}")
    elif response.status_code == 429:
        # We're sending too many requests, so wait a bit
        print_and_slack(f"ERROR: We got a 429 so we're sending too many requests; giving up on {url}")
        time.sleep(20)
    else:
        print_and_slack(f"ERROR: {response.status_code} when trying to archive {url}")
    time.sleep(10)
