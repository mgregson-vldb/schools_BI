/*********************************************************************/
/* author: vldb                                                      */
/* date: 31/08/2021                                                  */
/* version: 1.0                                                      */
/* description: drops and creates target table(s)                    */
/*********************************************************************/

set search_path to mis,mis_load
;

drop table calendar
;

create table calendar   
(category    varchar not null
,description varchar not null
,enddate     date not null
,endtime     varchar
,id          varchar not null
,lastupdated timestamp not null
,rowhash     varchar not null
,startdate   date not null
,starttime   varchar  
,type        varchar not null
,samplefile  varchar not null
,audit_ts    timestamp(0) not null) -- audit timestamp from system clock
;  