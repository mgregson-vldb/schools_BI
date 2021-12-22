/*********************************************************************/
/* author: vldb                                                      */
/* date: 31/08/2021                                                  */
/* version: 1.0                                                      */
/* description: drops and creates target table(s)                    */
/*********************************************************************/

set search_path to mis,mis_load
;

drop table studentsentypehistory
;

create table studentsentypehistory   
(active              boolean not null
,id                  integer not null
,lastupdated         timestamp not null
,needenddate         date
,neednotes           varchar
,needstartdate       date not null
,needtypecode        varchar not null
,needtypedescription varchar not null
,rank                smallint
,rowhash             varchar not null
,studentid           integer not null
,samplefile          varchar not null
,audit_ts            timestamp(0)) -- audit timestamp from system clock
;   

drop table studentsenprovisionhistory
;

create table studentsenprovisionhistory   
(active                  boolean not null
,id                      bigint not null
,lastupdated             timestamp not null
,rowhash                 varchar not null
,senprovisioncode        varchar not null
,senprovisiondescription varchar not null
,senprovisionenddate     date
,senprovisionstartdate   date not null
,studentid               integer not null 
,samplefile              varchar not null
,audit_ts                timestamp(0)) -- audit timestamp from system clock
;

drop table studentdisabilities
;

create table studentdisabilities   
(active              boolean not null
,disability          varchar not null
,disabilityenddate   date
,disabilitystartdate date not null
,id                  integer not null
,lastupdated         timestamp not null
,rowhash             varchar not null
,studentid           integer not null
,samplefile          varchar not null
,audit_ts            timestamp(0)) -- audit timestamp from system clock
;