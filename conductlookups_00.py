###########################################################################
# author: vldb                                                            #
# date: 31/08/2021                                                        #
# version: 1.0                                                            #
# description: count no. of rows inserted into target table               #
###########################################################################

# Import libraries
import os
from datetime import datetime

import psycopg2

print("")
print("*** conductlookups_00.py started at", datetime.now())
print("")

###########################################################################
# 1 - establish connection to Postgres - credentials in pgpass.conf file  #
###########################################################################
try:
    conn = psycopg2.connect("dbname=schools user=postgres password=postgres")
    cur = conn.cursor()
    print("OK 1 : connected to Postgres.")
except:
    print("ERROR 1 : connection to Postgres failed.")
    quit()

###########################################################################
# 2 - drop/create load table (endpoint_load.ddl)                          #  
###########################################################################
try:
    sqlfile = open('conductlookups_load_05.ddl', 'r')
    try:
        cur.execute(sqlfile.read())
        conn.commit()
    except psycopg2.Error as e:
        e.pgcode
        print(e.pgerror)
        conn.commit()

    print("OK 2 : load table created.")
except:
    print("ERROR 2 : load table create failed.")
    quit()

###########################################################################
# 3 - copy data into load table (reads endpoint.json)                     #
###########################################################################
try:
    os.system('psql -f conductlookups_load_10.sql -d schools -U postgres')
    print("OK 3 : insert to load table.")
except:
    print(" ERROR 3 : insert to load table failed.")
    quit()

###########################################################################
# 4 - insert into target table from load table                            #
###########################################################################
try:
    sqlfile = open('conductlookups_insert_15.sql', 'r')
    try:
        cur.execute(sqlfile.read())
        conn.commit()
    except psycopg2.Error as e:
        e.pgcode
        print(e.pgerror)
    # cur.execute(sqlfile.read())

    print("OK 4 : insert to target table.")
except:
    print(" ERROR 4 : insert to target table failed.")
    quit()

###########################################################################
# 5 - check target table is populated                                     #
###########################################################################
try:
    sqlfile = open('conductlookups_count_20.sql', 'r')
    cur.execute(sqlfile.read())
    rows = cur.fetchall()
    conn.commit()
except:
    print("ERROR 5 : target row count failed.")

for row in rows:
    if int(row[0]) == 0:
        print("ERROR 5 : target table empty.")
        quit()
    else:
        print(row)
        print("OK 5 : target table contains ", row[0], "rows.")

print("")
print("*** conductlookups_00.py finished at", datetime.now())
print("")
quit()
