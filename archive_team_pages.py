#!/usr/bin/env python3

import time
import requests
import mysql.connector

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

# This part is modified from https://gitlab.com/orpheuslummis/archive-subwikis/-/blob/master/archive_subwikis.py#L27-36
for url in URLS:
    response = requests.get("https://web.archive.org/save/" + url)
    if response.status_code == 200:
        print(f"Archived {url}")
    else:
        print(f"ERROR: {response.status_code} when trying to archive {url}")
    time.sleep(2)
