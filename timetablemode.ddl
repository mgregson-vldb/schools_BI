/*********************************************************************/
/* author: vldb                                                      */
/* date: 31/08/2021                                                  */
/* version: 1.0                                                      */
/* description: drops and creates target table(s)                    */
/*********************************************************************/

set search_path to mis,mis_load
;

drop table timetables
;

create table timetables
(dayspercycle            varchar
,description             varchar
,enddate                 varchar
,id                      varchar
,periodspercycle         varchar
,startdate               varchar
,teachingperiodspercycle varchar
,samplefile			     varchar
,audit_ts                timestamp(0))  
;             

drop table timetabledays
;

create table timetabledays
(dayname     varchar
,id          varchar
,sequence    varchar
,timetableid varchar
,samplefile  varchar
,audit_ts    timestamp(0))
;

drop table timetableperiods
;

create table timetableperiods
(endtime        varchar
,id             varchar
,periodname     varchar
,sequence       varchar
,starttime      varchar
,timetabledayid varchar
,samplefile     varchar
,audit_ts       timestamp(0))
;

drop table timetablelessons
;

create table timetablelessons
(id                varchar
,timetableperiodid varchar
,samplefile        varchar
,audit_ts          timestamp(0))
;

drop table lessonclasses
;

create table lessonclasses
(groupid           varchar
,groupname         varchar
,id                varchar
,subjectid         varchar
,subjectname 	   varchar
,timetablelessonid varchar
,samplefile        varchar
,audit_ts          timestamp(0))
;

drop table lessonstaff
;

create table lessonstaff
(id                varchar
,staffid           varchar
,timetablelessonid varchar
,samplefile        varchar
,audit_ts          timestamp(0))
;

drop table lessonrooms
;

create table lessonrooms
(id                varchar
,roomcode          varchar
,roomid            varchar
,roomname          varchar
,timetablelessonid varchar
,samplefile        varchar
,audit_ts          timestamp(0))
;

drop table rooms
;

create table rooms
(id         varchar
,roomcode   varchar
,roomname   varchar
,samplefile varchar
,audit_ts   timestamp(0))
;


drop table timetabledayinstances
;

create table timetabledayinstances
(date           varchar
,id             varchar
,timetabledayid varchar
,samplefile     varchar
,audit_ts       timestamp(0))
;

drop table lessoninstances
;

create table lessoninstances
(enddate           varchar
,id                varchar
,startdate         varchar
,timetablelessonid varchar
,samplefile        varchar
,audit_ts          timestamp(0))
;