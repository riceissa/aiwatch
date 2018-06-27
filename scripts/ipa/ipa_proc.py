#!/usr/bin/env python3

from bs4 import BeautifulSoup
import re


def mysql_quote(x):
    """Quote the string x using MySQL quoting rules. If x is the empty string,
    return "NULL". Probably not safe against maliciously formed strings, but
    our input is fixed and from a basically trustable source."""
    if not x:
        return "NULL"
    x = x.replace("\\", "\\\\")
    x = x.replace("'", "''")
    x = x.replace("\n", "\\n")
    return "'{}'".format(x)


def main():
    print("insert into positions(person, organization, title, start_date, "
          "start_date_precision, end_date, end_date_precision, urls, notes, "
          "employment_type, cause_area) values")
    first = True
    seen = set()
    with open("scripts/ipa/staff-directory-2018-06-27.html", "r") as f:
        soup = BeautifulSoup(f, "lxml")

        for h3 in soup.find_all("h3"):
            # Find the next table, which contains all the positions for the
            # heading
            table = h3.next_sibling
            while table.name != "table":
                table = table.next_sibling

            names = []
            titles = []
            for div in table.find_all("div", {"class": "views-field-title-1"}):
                names.append(div.text.strip().replace("\u200b", ""))
            for div in table.find_all("div", {"class": "views-field-field-position"}):
                titles.append(div.text.strip().replace("\u200b", ""))

            for name, title in zip(names, titles):
                if (name, title) in seen:
                    continue
                seen.add((name, title))
                if re.search(r"intern\b", title, re.IGNORECASE):
                    employment_type = "intern"
                else:
                    employment_type = "full-time"
                print(("    " if first else "    ,") + "(" + ",".join([
                    mysql_quote(name),  # person
                    mysql_quote("Innovations for Poverty Action"),  # organization
                    mysql_quote(h3.text.strip() + ": " + title),  # title
                    mysql_quote(""),  # start_date
                    mysql_quote(""),  # start_date_precision
                    mysql_quote(""),  # end_date
                    mysql_quote(""),  # end_date_precision
                    mysql_quote("https://web.archive.org/web/20180627194550/https://www.poverty-action.org/about/staff-directory?title="),  # urls
                    mysql_quote(""),  # notes
                    mysql_quote(employment_type),  # employment_type
                    mysql_quote("Global health and poverty"),  # cause_area
                ]) + ")")
                first = False
    print(";")


if __name__ == "__main__":
    main()
