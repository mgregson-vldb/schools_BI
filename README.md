# Schools_BI
Initial version of schools_bi export code for Xporter Groupcall MIS data


This project aims to assist in bulk exporting MIS data from Groupcall Xporter and loading it into a local PostgreSQL database for further use. Currently in this alpha version only certain endpoints are supported for testing purposes. Those in scope are currently:

```
achievementfordaterange
calendar
conductlookups
conductpoints
contacts
detentionlookups
entitlementhistory
groups
personcomms
photos
schoolinfo
sen
staff
studentcontacts
studentenrolmenthistory
students
studentschoolhistory
```


# 1 - How it works - Explanation of scripts

- 'xporter_json_download.py' calls the Xporter API and generates one JSON file per 'endpoint’, with additional elements defined within the endpoints parameter file contained within the params directory. 

- /params/{endpoint}.params details additional elements (extra data, date ranges etc) for each given endpoint where applicable

- {endpoint}.ddl is the table definition sql for each endpoints resulting target table(s)

- endpoints.txt defines which endpoints are in currently in scope for the master run scrips below

- master_ddl.py creates/refreshes all target tables for each endpoint at once

- master_load.py runs all of the below {endpoint}_00.py at once if needed.

- {endpoint}_00.py runs the below scrips in order as a process

	-{endpoint}_load_05.ddl scripts create Postgres json ‘load' tables (called 'endpoint_load', one per endpoint)

	-{endpoint}_load_10.sql scripts then load the JSON file into the load table. 

	-{endpoint}_insert_15.sql scripts then parse/pivot the json data from the load table and insert into 'target' table or tables. 

	-{endpoint}_count_20.sql shows counts of rows within resulting target tables 


# 2 - Prerequisites **(Important)**

## Xporter license and API credentials

These details need to be entered into xporter_json_download.py at lines 25 to 27 in order for downloads to work. 

## Python3 (latest version)

https://www.python.org/downloads/ 

## Psycopg2 and Requests Python packages

From terminal or windows windows commandline/powershell
```
py -m pip install requests
py -m pip install psycopg2
```

## PostgreSQL database set up (hosted locally on the same machine) 

With the following credentials:
```
Username: postgres
Password: postgres
```
To download and install: https://www.postgresql.org/download/ 

## Psql command line tool adding into windows path. 

Once installed verify that psql is within your windows path. Follow this guide to do so. https://sqlbackupandftp.com/blog/setting-windows-path-for-postgres-tools 

## Database created and Schemas created within

Once downloaded and set up, within postgreSQL there needs be a database called schools with two schemas; mis and mis_load.

Either open pgAdmin and right click on databases within the left hand pane and click create database, name it schools. Schools should now appear under databases in the left hand pane. Right click schools and select create schema, create one called ‘mis’ and one called ‘mis_load’

Or with psql now defined within your windows path, from the windows command line/powershell run

```
psql -U postgres
```
From within run 
```
create database schools;
```
Now exit with \q

Now run
```
psql -U postgres -d schools
```
From within run
```
create schema mis;
create schema mis_load;
```
Exit psql again with \q

# 3 - Getting started

- Download all code to your machine 

- Install PostgreSQL and open pgAdmin. Open a new query tool window and 

- Edit xporter_json_download.py and add your correct Xporter API credentials and school ESTAB code

- Run xporter_json_download.py via windows command line/powershell or *nix terminal with command ‘py xporter_json_download.py’

- Run ‘py master_ddl.py' via command line/powershell to create the target tables for all endpoints within the mis schema (this only needs to be done once), or run the desired 'endpoint.ddl' files individually via ‘psql -U postgres -d schools -f {endpoint}.ddl’

- From within pgAdmin (postgres client tool installed with postgres you should now see the target tables created within the mis schema 

- Run desired endpoint_load.py scripts individually or run all by running ‘py master_load.py’. Load tables for each endpoint should now be created within mis_load, with a single row containing the JSON data, and each resulting target table(s) within mis should have data. 


### NOTE: 
When running the master_ddl.py and master_load.py scripts, as psql is called in a loop for each batch of scripts, it will ask for a password for the user postgres each time it initiates a command. To avoid this, I recommend editing your pg_hba.conf file to allow passwordless local access for the postgres user so the scripts run seamlessly.

The pg_hba.conf file can be found at C:\Program Files\PostgreSQL\14\data if you installed postgres to the default windows location. Within that file at the bottom at lines 82 onwards it will look like the below:

```
# TYPE  DATABASE        USER            ADDRESS                 METHOD

# "local" is for Unix domain socket connections only
local   all             all                                     scram-sha-256
# IPv4 local connections:
host    all             all             127.0.0.1/32            scram-sha-256
# IPv6 local connections:
host    all             all             ::1/128                 scram-sha-256
# Allow replication connections from localhost, by a user with the
# replication privilege.
local   replication     all                                     scram-sha-256
host    replication     all             127.0.0.1/32            scram-sha-256
host    replication     all             ::1/128                 scram-sha-256
```
Change it so that ‘scram-sha-256’ becomes ‘trust’ like the below:
```
# TYPE  DATABASE        USER            ADDRESS                 METHOD

# "local" is for Unix domain socket connections only
local   all             all                                     trust
# IPv4 local connections:
host    all             all             127.0.0.1/32            trust
# IPv6 local connections:
host    all             all             ::1/128                 trust
# Allow replication connections from localhost, by a user with the
# replication privilege.
local   replication     all                                     trust
host    replication     all             127.0.0.1/32            trust
host    replication     all             ::1/128                 trust
```
Now save pg_hba.conf and restart your machine. A restart is essential to restart the database with the new settings

### NOTE:

Date ranges for endpoints are currently hardcoded within each params file and will need to be changed if needed with date format YYYY-MM-DD
