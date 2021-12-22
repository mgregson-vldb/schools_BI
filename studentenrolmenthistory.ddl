/*********************************************************************/
/* author: vldb                                                      */
/* date: 31/08/2021                                                  */
/* version: 1.0                                                      */
/* description: drops and creates target table(s)                    */
/*********************************************************************/

set search_path to mis,mis_load
;

drop table studentenrolmenthistory
;

create table studentenrolmenthistory   
(enddate             date
,enrolmentstatuscode varchar not null
,id                  varchar not null
,lastupdated         timestamp not null
,rowhash             varchar not null
,startdate           date not null
,studentidaasid      varchar not null
,studentxid          varchar
,studentmisid        integer not null
,samplefile          varchar not null
,audit_ts            timestamp(0)) -- audit timestamp from system clock
; 