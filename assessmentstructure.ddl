/*********************************************************************/
/* author: vldb                                                      */
/* date: 31/08/2021                                                  */
/* version: 1.0                                                      */
/* description: drops and creates target table(s)                    */
/*********************************************************************/

set search_path to mis,mis_load
;

drop table aspects
;

create table aspects
(aspecttype  varchar
,description varchar
,externalid  varchar
,gradesetid  varchar
,id          varchar
,ks1         varchar
,ks2         varchar
,ks3         varchar
,lastupdated varchar
,name        varchar
,rowhash     varchar
,supplier    varchar
,samplefile  varchar
,audit_ts    timestamp(0)) -- audit timestamp from system clock
;  

drop table resultsets
;

create table resultsets   
(externalid  varchar
,id          varchar
,lastupdated varchar
,name        varchar
,rowhash     varchar
,supplier    varchar
,samplefile  varchar
,audit_ts    timestamp(0)) -- audit timestamp from system clock
; 

drop table categories
;

create table categories   
(id           varchar
,lastupdated  varchar
,rowhash      varchar
,categoryname varchar
,samplefile   varchar
,audit_ts     timestamp(0)) -- audit timestamp from system clock
;     