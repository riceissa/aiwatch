#!/usr/bin/env python3

import datetime
import time
import requests
import mysql.connector
import os

SLACK_URL = None

print(f"========== {timestamp()} NEW RUN ==========")

with open("slack-url.txt", "r") as f:
    line = f.readline()
    if line.strip():
        SLACK_URL = line.strip()

def print_and_slack(message):
    if SLACK_URL:
        requests.post(SLACK_URL, headers={"Content-type": "application/json"},
                      json={"text": message})
    print(message)

def timestamp():
    return datetime.datetime.utcnow().isoformat() + " (UTC)"

if os.path.isfile('my.cnf'):
    with open('my.cnf', 'r') as f:
        for line in f:
            if line.startswith('user='):
                user = line.strip()[len('user='):]
            if line.startswith('password='):
                password = line.strip()[len('password='):]
        cnx = mysql.connector.connect(user=user, password=password,
                                      database='aiwatch')
else:
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
    try:
        response = requests.get("https://web.archive.org/save/" + url)
    except requests.exceptions.ConnectionError:
        print_and_slack(f"{timestamp()} Got a connection error. Waiting a bit.")
        time.sleep(30)
        continue
    if response.status_code == 200:
        print(f"{timestamp()} Archived {url}")
    elif response.status_code == 429:
        # We're sending too many requests, so wait a bit
        print(f"{timestamp()} ERROR: We got a 429 so we're sending too many requests; will try {url} again at the end")
        try_again.append(url)
        time.sleep(20)
    else:
        print_and_slack(f"{timestamp()} ERROR: {response.status_code} when trying to archive {url}")
    time.sleep(2)

for url in try_again:
    try:
        response = requests.get("https://web.archive.org/save/" + url)
    except requests.exceptions.ConnectionError:
        print_and_slack("{timestamp()} Got a connection error. Waiting a bit.")
        time.sleep(30)
        continue
    if response.status_code == 200:
        print(f"{timestamp()} Archived {url}")
    elif response.status_code == 429:
        # We're sending too many requests, so wait a bit
        print_and_slack(f"{timestamp()} ERROR: We got a 429 so we're sending too many requests; giving up on {url}")
        time.sleep(20)
    else:
        print_and_slack(f"{timestamp()} ERROR: {response.status_code} when trying to archive {url}")
    time.sleep(10)
