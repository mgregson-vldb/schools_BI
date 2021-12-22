/*********************************************************************/
/* author: vldb                                                      */
/* date: 31/08/2021                                                  */
/* version: 1.0                                                      */
/* description: drops and creates target table(s)                    */
/*********************************************************************/

set search_path to mis,mis_load
;

drop table studentexclusions
;

create table studentexclusions  
(enddate             date         
,endsession          varchar
,exclusiondays       varchar not null
,exclusionreason     varchar
,exclusionreasoncode varchar
,exclusionsessions   varchar not null
,exclusiontype       varchar not null
,exclusiontypecode   varchar not null
,forename            varchar not null
,id                  smallint not null
,lastupdated         timestamp not null
,rowhash             varchar not null
,startdate           date not null
,startsession        varchar
,studentid           integer not null
,surname             varchar not null
,samplefile          varchar not null
,audit_ts            timestamp(0)) -- audit timestamp from system clock
; 

drop table studentexclusionreasons
;

create table studentexclusionreasons   
(reasonid           varchar not null        
,studentexclusionid smallint not null
,samplefile         varchar not null
,audit_ts           timestamp(0)) -- audit timestamp from system clock
; 

drop table exclusionreasons
;

create table exclusionreasons   
(id                varchar not null      
,reasoncode        varchar not null
,reasondescription varchar not null
,samplefile        varchar not null
,audit_ts          timestamp(0)) -- audit timestamp from system clock
;     