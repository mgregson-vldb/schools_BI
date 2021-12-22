/*********************************************************************/
/* author: vldb                                                      */
/* date: 31/08/2021                                                  */
/* version: 1.0                                                      */
/* description: drops and creates target table(s)                    */
/*********************************************************************/

set search_path to mis,mis_load
;

drop table photos
;

create table photos  
(id          integer not null
,lastupdated timestamp not null
,personid    integer not null
,personname  varchar not null
,persontype  varchar not null
,photos      varchar not null
,rowhash     varchar not null
,xid         varchar not null
,samplefile  varchar not null
,audit_ts    timestamp(0)) -- audit timestamp from system clock
; 