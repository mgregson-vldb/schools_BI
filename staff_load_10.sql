/*********************************************************************/
/* author: vldb                                                      */
/* date: 31/08/2021                                                  */
/* version: 1.0                                                      */
/* description: inserts json into load table                         */
/*********************************************************************/

\set content `py pseudocat.py staff.json`

insert into mis_load.staff_load values (:'content')
;