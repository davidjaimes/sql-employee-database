### 1. Remove existing installation of PostgreSQL
**Open a Terminal window and uninstall PostgreSQL by following these steps (adapted from https://www.enterprisedb.com/edb-docs/d/postgresql/installation-getting-started/installation-guide-installers/11/PostgreSQL_Installation_Guide.1.12.html ).**
1. `cd`
    *Make sure you are in your root directory.*
2. `cd ..`
    *Go up a level.*
3. `cd ..`
    *Go up another level. (Note: your Mac probably has two 'Library' folders, one associated only with your user account, the other for your entire Macintosh HD; if you installed PostgreSQL using the instructions in the couse GitLab repository, then you installed it for all users, and you need to run the uninstaller from the topmost Library folder.)*
4. `cd /Library/PostgreSQL/12`
    *Navigate into the directory containing the PostgreSQL uninstaller. (Note: These instructions are for __version 12__. If you installed __version 11__, then you will need to navigate to folder '/Library/PostgreSQL/11' instead of '/Library/PostgreSQL/12'*
5. `open uninstall-postgres.app`
   *Run the uninstaller. When asked whether to uninstall entire application or individual components, choose 'Entire application' and follow the prompts.*
6. `sudo rm /etc/postgres-reg.ini`
    *Remove .ini file.*
7. `sudo rm -rf /Library/PostgreSQL`
    *Remove PostgreSQL folder from system library.*
8. Finally, remove the 'PostgreSQL' user from your Mac. Click System Preferences → Users & Groups → Lock icon [enter administrator password] → select 'PostgreSQL' from user list → click the '-' icon to remove.
### 2. Install PostgreSQL from command line using Homebrew
**Restart your computer. Verify that 'PostgreSQL' is no longer listed as a user on your machine. Then, run the following commands in your Terminal window to (re)install PostgreSQL.**
1. `brew update`
    *Updates Homebrew system to current version.*
2. `brew upgrade`
    *Upgrade outdated packages you have installed with Homebrew to their current versions.*
3. `brew install postgresql`
    *Download and install the current version of PostgreSQL for Mac OS.*
4. `brew postgresql-upgrade-database`
    *Upgrade any existing PostgreSQL databases on your computer to work with the newly installed, current version of PostgreSQL. (Note: for most users, this step is unneccesary; do not worry if you get an error message.)*
5. `brew services start postgresql`
    *Launch local background instance of PostgreSQL server. (Note: postgresql will run indefinitely until disabled with command `brew services postgresql stop`.)*
6. `/usr/local/opt/postgres/bin/createuser -s postgres`
    *Create a PostgreSQL user account with name 'postgres'. (**Important. Without this account, you will be unable to connect to your local server instance.**)*
### 3. Download and install pgAdmin 4.14 for Mac OS
**Open a browser tab/window, navigate to https://www.pgadmin.org/download/pgadmin-4-macos/ and follow these steps to install pgAdmin 4 v.4.14.**
1. Click the link for 'pgAdmin 4 v4.14 (released Oct. 17, 2019)'.
2. On the next page, click the 'pgadmin4-4.14.dmg' link to download pgAdmin 4.14 for Mac OS.
   *(Note: **do not download the most recent version**. The .CSV data import issues students are experiencing seem to be caused by a bug in pgAdmin version 4.17 and/or a compatibility issue between pgAdmin 4.17 and macOS Catalina; we have found that rolling back from 4.17 to 4.14 generally solves the problem.)*
3. Once the download is complete, open the disk image file in Finder, and drag the 'pgAdmin' icon to your 'Applications' folder. (Installing in a different location is not recommended.)
### 4. Import .CSV data
**PostgreSQL and pgAdmin should now work as expected.**
1. Double-click the elephant icon to launch pgAdmin.
2. Create/connect to a server (host name: 'localhost', port: 5432, maintenance database: 'postgres', username: 'postgres'.)
3. Right-click on the database name in the list at left, open the Query Tool, and CREATE TABLE....
4. Once you have defined a table schema, the table you just created will appear in the list at left (if it doesn't show up right away, right-click on 'Tables' then click 'Refresh').
5. Right-click on the table name, then click 'Import/Export...'; a dialogue box will pop up.
6. You should now be able to import .CSV data! (Remember to set 'Header' to 'Yes' if your .CSV file has a header row. Delimiter is ',' and encoding is almost always UTF-8.)
