/*********************************************************************/
/* author: vldb                                                      */
/* date: 31/08/2021                                                  */
/* version: 1.0                                                      */
/* description: drops and creates target table(s)                    */
/*********************************************************************/

set search_path to mis,mis_load
;

drop table attendance
;

create table attendance  
(date       varchar
,externalid varchar
,id         varchar
,mark       varchar
,session    varchar
,studentid  varchar
,type       varchar
,samplefile varchar
,audit_ts   timestamp(0)) -- audit timestamp from system clock
; 