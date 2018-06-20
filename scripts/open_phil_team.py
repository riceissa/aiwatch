#!/usr/bin/env python3

import pdb

import csv
import requests
import sys
from bs4 import BeautifulSoup


URLS = [
        "https://web.archive.org/web/20160111014138/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20160112052008/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20160308024115/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20160320064723/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20160325223631/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20160331110427/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20160402012159/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20160425132044/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20160520175424/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20160609030739/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20160709141810/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20160724055939/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20160811163839/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20160813070557/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20160823053312/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20160824201031/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20160904221148/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20160910010309/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20160915073048/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20160925055101/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20161001200845/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20161016210815/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20161023040418/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20161025121822/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20161105042613/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20161120053638/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20161205215349/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20170105220050/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20170123021812/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20170204203106/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20170205200203/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20170220032720/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20170309052932/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20170318215922/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20170319225800/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20170326191708/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20170406051254/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20170420171637/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20170505170243/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20170519154502/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20170523202105/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20170601195238/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20170605162258/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20170606123317/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20170610224522/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20170611221950/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20170615161811/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20170705163813/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20170714141919/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20170725183330/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20170805183153/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20170814135150/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20170906163735/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20170915232608/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20170917121647/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20170919015853/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20171001062038/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20171008170258/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20171030003430/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20171106024946/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20171205183329/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20180129115615/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20180206072438/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20180226190244/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20180306174027/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20180327214144/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20180406001944/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20180505212341/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20180605194037/http://www.openphilanthropy.org:80/about/team",
        "https://web.archive.org/web/20180620002809/http://www.openphilanthropy.org:80/about/team",
        ]

def main():
    writer = csv.DictWriter(sys.stdout, fieldnames=["person", "title", "date", "url"])
    writer.writeheader()

    for url in URLS:
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

            if role == "Reseach Analyst":
                role = "Research Analyst"
            elif role == "SCIENTIFIC ADVISOR":
                role = "Scientific Advisor"

            if name != "\u00a0":
                writer.writerow({"person": name, "title": role, "date": snap_date,
                                 "url": r.url})

if __name__ == "__main__":
    main()
