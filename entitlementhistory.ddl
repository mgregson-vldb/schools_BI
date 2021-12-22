/*********************************************************************/
/* author: vldb                                                      */
/* date: 31/08/2021                                                  */
/* version: 1.0                                                      */
/* description: drops and creates target table(s)                    */
/*********************************************************************/

set search_path to mis,mis_load
;

drop table entitlementgroups
;

create table entitlementgroups   
(fullname   varchar not null
,id         smallint not null   
,shortname  varchar not null
,samplefile varchar not null
,audit_ts   timestamp(0) not null) -- audit timestamp from system clock
; 

drop table entitlementgroupstudents
;

create table entitlementgroupstudents   
(enddate            date 
,entitlementgroupid smallint not null
,id                 varchar not null
,startdate          date not null
,studentid          integer not null
,samplefile         varchar not null
,audit_ts           timestamp(0) not null) -- audit timestamp from system clock
;  