#!/usr/bin/env python3

import pdb

import csv
import sys

from itertools import groupby
from collections import OrderedDict
from typing import List


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


def person_in_list(person: OrderedDict, lst: List[OrderedDict]):
    """Check if ``person`` is in ``lst``. If ``person`` is in ``lst``, return
    that ``person``. Otherwise return None. This assumes there is only one
    position for ``person`` in ``lst``; if there are multiple, the first one is
    returned."""
    for p in filter(lambda x: x["person"] == person["person"], lst):
        return p
    return None


def print_position(person, title, start_date, end_date, urls, first=True):
    print(("    " if first else "    ,") + "(" + ",".join([
        mysql_quote(person),  # person
        mysql_quote("Open Philanthropy Project"),  # organization
        mysql_quote(title),  # title
        mysql_quote(start_date),  # start_date
        mysql_quote("month"),  # start_date_precision
        mysql_quote(end_date),  # end_date
        mysql_quote("month" if end_date else ""),  # end_date_precision
        mysql_quote(urls),  # urls
        mysql_quote(""),  # notes
        mysql_quote("full-time"),  # employment_type
        mysql_quote(""),  # cause_area
    ]) + ")")


def main():

    print("insert into positions(person, organization, title, start_date, "
          "start_date_precision, end_date, end_date_precision, urls, notes, "
          "employment_type, cause_area) values")

    first = True

    # This list tracks the positions that are "live", i.e. have not ended.
    live_positions = []

    with open("open-phil.csv", "r") as f:
        reader = csv.DictReader(f)

        groups = []
        uniquekeys = []

        for k, g in groupby(reader, lambda x: x["date"]):
            groups.append(list(g))
            uniquekeys.append(k)

        for snapshot_date, group in zip(uniquekeys, groups):
            new_live_positions = []
            # We assume that every group is nonempty
            snapshot_url = group[0]["url"]
            for position in live_positions:
                if person_in_list(position, group):
                    new_live_positions.append(position)
                else:
                    # The person has left the organization, so record their
                    # position
                    print_position(position["person"],
                                   position["title"],
                                   position["date"],
                                   snapshot_date,
                                   position["url"] + " " + snapshot_url,
                                   first)
                    first = False
            live_positions = new_live_positions

            for position in group:
                existing_position = person_in_list(position, live_positions)
                if not existing_position:
                    live_positions.append(position)
                else:
                    if position["title"] != existing_position["title"]:
                        # The person is still at the organization, but their
                        # position title has changed, so record the old
                        # position
                        print_position(existing_position["person"],
                                       existing_position["title"],
                                       existing_position["date"],
                                       snapshot_date,
                                       existing_position["url"] + " " + position["url"],
                                       first)
                        first = False
                        live_positions = [x for x in live_positions
                                          if x["person"] != position["person"]]
                        # live_positions.remove(existing_position)
                        live_positions.append(position)


        # We are done going through the snapshots so all the positions left are
        # live
        for position in live_positions:
            print_position(position["person"], position["title"],
                           position["date"], "", position["url"], first)
            first = False

    print(";")


if __name__ == "__main__":
    main()
