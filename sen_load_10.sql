/*********************************************************************/
/* author: vldb                                                      */
/* date: 31/08/2021                                                  */
/* version: 1.0                                                      */
/* description: inserts json into load table                         */
/*********************************************************************/

\set content `py pseudocat.py sen.json`

insert into mis_load.sen_load values (:'content')
;