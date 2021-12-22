/*********************************************************************/
/* author: vldb                                                      */
/* date: 31/08/2021                                                  */
/* version: 1.0                                                      */
/* description: drops and creates target table(s)                    */
/*********************************************************************/

set search_path to mis,mis_load
;

drop table attendancecodes
;

create table attendancecodes   
(description             varchar not null
,id                      varchar not null
,mark                    varchar not null
,meaningdescription      varchar not null
,physicalmeaning         varchar not null
,shortmeaningdescription varchar not null
,samplefile              varchar not null
,audit_ts                timestamp(0)) -- audit timestamp from system clock
;     
