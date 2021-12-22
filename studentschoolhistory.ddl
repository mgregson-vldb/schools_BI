/*********************************************************************/
/* author: vldb                                                      */
/* date: 31/08/2021                                                  */
/* version: 1.0                                                      */
/* description: drops and creates target table(s)                    */
/*********************************************************************/

set search_path to mis,mis_load
;

drop table studentschoolhistory
;

create table studentschoolhistory   
(id                 integer not null
,studentid          integer not null
,forename           varchar not null
,surname            varchar not null
,previousschoolname varchar not null
,lea                integer not null
,estabid            integer not null
,leavingdate        date  
,leavingreason      varchar  
,lastupdated        timestamp not null
,rowhash            varchar not null
,samplefile         varchar not null
,audit_ts           timestamp(0)) -- audit timestamp from system clock
; 