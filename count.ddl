/*********************************************************************/
/* author: vldb                                                      */
/* date: 31/08/2021                                                  */
/* version: 1.0                                                      */
/* description: drops and creates target table(s)                    */
/*********************************************************************/

set search_path to mis,mis_load
;

drop table count
;

create table count  
(area       varchar
,count      varchar
,id         varchar
,samplefile varchar
,audit_ts   timestamp(0)) -- audit timestamp from system clock
;  