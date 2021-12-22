/*********************************************************************/
/* author: vldb                                                      */
/* date: 31/08/2021                                                  */
/* version: 1.0                                                      */
/* description: drops and creates target table(s)                    */
/*********************************************************************/

set search_path to mis,mis_load
;

drop table studentcontacts
;

create table studentcontacts   
(contactid    integer not null
,id           varchar not null
,lastupdated  timestamp not null
,parresp      smallint not null
,priority     smallint
,relationship varchar not null
,rowhash      varchar not null
,studentid    integer not null
,samplefile   varchar not null
,audit_ts     timestamp(0)) -- audit timestamp from system clock
; 