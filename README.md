# AI Watch and Org Watch

[AI Watch](https://aiwatch.issarice.com/) is a website designed to track people and organizations working in AI
safety.

[Org Watch](https://orgwatch.issarice.com/) is a generalization of AI Watch
that covers positions outside of AI safety.

Both sites use the same code and database, stored in this repository.

## Project layout

- `access-portal/` contains the PHP code for the website.
- `sql/` contains the data stored in MySQL format.

## Setting up

This section is only relevant to people who want to run a local instance of AI
Watch (e.g. for development purposes).

First, clone the repo and set up the database:

```bash
git clone https://github.com/riceissa/aiwatch.git
cd aiwatch
mysql -e "create database aiwatch"
make read  # read in data from sql/
```

Now set up the password file to allow PHP to log in to the database:

```bash
cp access-portal/backend/globalVariables/{dummyPasswordFile.inc,passwordFile.inc}
vi access-portal/backend/globalVariables/passwordFile.inc  # change to add database login info
```

If you're hosting this on a server, make sure to disable public access to the
password file.

Finally start the service:

```bash
cd access-portal
php -S localhost:8000
```

To get AnchorJS and tablesorter, run:

```bash
make fetch_anchorjs
make fetch_tablesorter
```

You can now visit `http://localhost:8000/` in your browser.

## Contributing

All contributions are welcome.  Contributions might take the form of:

- Data collection
- Code contributions to the website
- Feature requests/finding bugs
- Feedback

## License

All code and data released to the public domain according to
[CC0 1.0 Public Domain Dedication](https://creativecommons.org/publicdomain/zero/1.0/).

## Notes to self

To export some organization data from the donations database:

```bash
mysql donations -e "select donee,former_name,website,contact_email,country, \
    key_people,launch_date,launch_date_precision,launch_date_url, \
    facebook_username,instagram_username,medium_username,pinterest_username, \
    timelines_wiki_page,tumblr_subdomain,twitter_username,wikipedia_page, \
    youtube_username from donees where cause_area REGEXP 'ai risk';" \
    > temp.tsv
```

Find uncategorized interns:

```mysql
select person,title,employment_type from positions
where title regexp 'intern' and (employment_type != 'intern' or employment_type is null);
```
