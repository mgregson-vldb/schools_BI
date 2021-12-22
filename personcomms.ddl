/*********************************************************************/
/* author: vldb                                                      */
/* date: 31/08/2021                                                  */
/* version: 1.0                                                      */
/* description: drops and creates target table(s)                    */
/*********************************************************************/

set search_path to mis,mis_load
;

drop table personcomms
;

create table personcomms  
(commstype    varchar not null
,id           varchar not null
,isdefault    smallint
,lastupdated  timestamp not null
,locationcode varchar not null
,notes        varchar
,personid     integer not null
,persontype   varchar not null
,priority     smallint not null
,rowhash      varchar not null
,value        varchar not null
,samplefile   varchar not null
,audit_ts     timestamp(0)) -- audit timestamp from system clock
; 