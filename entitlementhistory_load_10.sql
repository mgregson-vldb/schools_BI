/*********************************************************************/
/* author: vldb                                                      */
/* date: 31/08/2021                                                  */
/* version: 1.0                                                      */
/* description: inserts json into load table                         */
/*********************************************************************/

\set content `py pseudocat.py entitlementhistory.json`

insert into mis_load.entitlementhistory_load values (:'content')
;