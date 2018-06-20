#!/usr/bin/env python3

import pdb

import csv
import requests
import sys
from bs4 import BeautifulSoup

def main():
    writer = csv.DictWriter(sys.stdout, fieldnames=["person", "title", "date"])
    writer.writeheader()

    url = "https://web.archive.org/web/20171021041649/http://www.openphilanthropy.org:80/about/team"
    r = requests.get(url)
    soup = BeautifulSoup(r.content, "lxml")

    # Sometimes the Internet Archive moves forward or backward to a different
    # snapshot than the one requested, so we need to check r.url to see which
    # one we got.
    snap_id = r.url.split('/')[4][:8]
    snap_date = snap_id[:4] + "-" + snap_id[4:6] + "-" + snap_id[6:]

    for role_tag in soup.find_all("div", {"class": "company-role"}):
        role = role_tag.text
        tag = role_tag.previous_sibling

        # Move back to find the person's name.
        while tag.name != "div":
            tag = tag.previous_sibling

        name = tag.text

        writer.writerow({"person": name, "title": role, "date": snap_date})

if __name__ == "__main__":
    main()
