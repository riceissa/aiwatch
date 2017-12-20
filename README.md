# AI Watch

[AI Watch](https://aiwatch.issarice.com/) is a website designed to track people and organizations working in AI
safety.

## Project layout

- `access-portal/` contains the PHP code for the website.
- `sql/` contains the data stored in MySQL format.

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
