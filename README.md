# AI Watch and Org Watch

This is the repository for two related websites:

* [AI Watch](https://aiwatch.issarice.com/) is a website designed to track people and organizations working in AI
safety.
* [Org Watch](https://orgwatch.issarice.com/) is a generalization of AI Watch
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

## Basic steps for adding new data

Before running commands in Git Bash, make sure you are in the AI Watch directory.
If you cloned the git repo from your home directory, you can go to the AI Watch
directory by typing the following:

```
cd ~/aiwatch
```

This only needs to be done once every time you open Git Bash, whereas the other
commands below must be done every time you want to save changes to git.

1. Open an existing .sql file or make a new .sql file in which to add new data.
   For example, to add data to 80,000 Hours positions, you can open
   `sql/positions/80000hours-positions.sql`.

2. Add data to the file (using a text editor such as Notepad) by looking at
   sources like Wayback Machine for the team
   page, LinkedIn, blog posts, Facebook, etc.  For the data format, look at the
   other files in the same directory and copy the format.

   A few things to keep in mind:

   - Date fields must include year, month, and day, so for example
     `'2016-02-01'`. MySQL will complain if you only add year or month.
   - The first row of a file shouldn't start with a comma, but all the
     subsequent rows must start with a comma because of the way rows are
     separated in MySQL.

3. Once you reach a good stopping point, check for errors in the MySQL syntax.
   Type:

   ```bash
   ./reload-db.sh
   ```

   This will reload all of the data in MySQL. MySQL will complain if there are
   any errors, and you can fix them. If MySQL says nothing, that means all the
   data has correct syntax.

   (One tricky point: `reload-db.sh` only reloads files that are explicitly
   listed in the script, so if you made a new file, you will need to add it to
   the script.)

4. Stage the file in git. Type

   ```bash
   git add FILENAME
   ```

   where `FILENAME` is the name of the file you have been editing. If there are
   multiple files, you can either type `git add FILENAME1 FILENAME2` or you can
   type one line for each file.

   To find all files with changes, you can type:

   ```bash
   git status
   ```

   Then you can copy the path that is shown there.

5. Commit your changes. There are two ways to do this:

   - Simple way. You can type:

     ```bash
     git commit -m "your message here"
     ```

     where `your message here` is a summary of the changes you made. For
     example, you might type:

     ```bash
     git commit -m "Add 80,000 Hours team from 2012"
     ```

   - Using a text editor. You can type:

     ```bash
     git commit
     ```

     This will open a text editor for you to type your commit message. In Git
     Bash, the default text editor is Vim. You can press `i` (which enters
     insert mode) and then type in your message (e.g. "Add 80,000 Hours team
     from 2012") and then press `Escape`. Then press `:wq` followed by `Enter`
     (this will save the file and close Vim).

6. Upload your changes to GitHub. You can type:

   ```bash
   git push
   ```

Some tricky things to keep in mind:

- An organization might change its team page location, so you might need to
  find its old team page location in Wayback Machine. To do this, go to the
  _homepage_ for the organization within Wayback Machine, find an old snapshot,
  then find the team page within that snapshot.
- A person might have changed their name over the years. In this case, you will
  want to use their newest name.

The very first time you set up Git, you will need to do the following:

- Set name and email for Git.
- `git checkout -b BRANCHNAME` to start a new branch.
- `git push --set-upstream origin BRANCHNAME` to set the branch to push to on
  origin (GitHub).

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
