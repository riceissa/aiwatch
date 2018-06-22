#!/usr/bin/env python3

import pdb

import requests
import re
import sys
import time
import csv
from bs4 import BeautifulSoup

URLS = ["https://web.archive.org/web/20160910005915/http://givewell.org/about/people",
        "https://web.archive.org/web/20170815000000/http://givewell.org/about/people"]

def main():
    writer = csv.DictWriter(sys.stdout, fieldnames=["person", "join_date", "url"])
    writer.writeheader()
    for url in URLS:
        r = requests.get(url)
        soup = BeautifulSoup(r.content, "lxml")
        staff = []

        # The people page uses both types of tags so we need to loop through
        # both
        for tag in soup.find_all("strong"):
            staff.append(bio_info(tag))
        for tag in soup.find_all("b"):
            staff.append(bio_info(tag))

        for s in staff:
            writer.writerow({"person": s[0], "join_date": s[1], "url": url})

def bio_info(tag):
    """Start with a 'b' or 'strong' tag and get the bio info for this
    employee."""
    name = tag.text.split("|")[0].strip()
    bio = tag.parent.text
    m = re.search(r"GiveWell in ((?:January|February|March|April|May|June|July|August|September|October|November|December) 20\d\d)", bio)
    if m:
        join_date = m.group(1)
    else:
        join_date = ""

    return (name, join_date)


if __name__ == "__main__":
    main()
