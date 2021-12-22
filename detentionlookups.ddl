/*********************************************************************/
/* author: vldb                                                      */
/* date: 31/08/2021                                                  */
/* version: 1.0                                                      */
/* description: drops and creates target table(s)                    */
/*********************************************************************/

set search_path to mis,mis_load
;

drop table detentionattendedlookup
;

create table detentionattendedlookup 
(code         varchar not null
,description  varchar not null
,displayorder smallint not null
,id           smallint not null
,samplefile   varchar not null
,audit_ts     timestamp(0)) -- audit timestamp from system clock
;

drop table detentiontypelookup
;

create table detentiontypelookup   
(code                varchar not null
,dayofweeknumber     smallint
,defaultendtime      time not null
,defaultlocationid   smallint not null
,defaultlocationname varchar not null
,defaultstarttime    time not null
,description         varchar not null
,frequency           varchar not null
,id                  smallint not null
,yeargroup           varchar
,samplefile          varchar not null
,audit_ts            timestamp(0)) -- audit timestamp from system clock
;  

drop table detentionlocationlookup
;

create table detentionlocationlookup  
(code        varchar not null
,description varchar not null
,id          smallint not null
,samplefile  varchar not null
,audit_ts    timestamp(0)) -- audit timestamp from system clock
; 

drop table detentionreasonlookup
;

create table detentionreasonlookup  
(code        varchar not null
,description varchar not null
,id          smallint not null
,samplefile  varchar not null
,audit_ts    timestamp(0)) -- audit timestamp from system clock
; 