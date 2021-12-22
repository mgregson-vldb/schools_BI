/*********************************************************************/
/* author: vldb                                                      */
/* date: 31/08/2021                                                  */
/* version: 1.0                                                      */
/* description: drops and creates target table(s)                    */
/*********************************************************************/

set search_path to mis_model,mis_load
;

drop table student_sen_typehistory
;

create table student_sen_typehistory   
(active              boolean not null
,id                  integer not null primary key
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
,audit_ts            timestamp(0) -- audit timestamp from system clock
,constraint fk_student_sen_typehistory foreign key(studentid) references students(id) 
)
;   

drop table student_sen_provision_history
;

create table student_sen_provision_history   
(active                  boolean not null
,id                      bigint not null primary key
,lastupdated             timestamp not null
,rowhash                 varchar not null
,senprovisioncode        varchar not null
,senprovisiondescription varchar not null
,senprovisionenddate     date
,senprovisionstartdate   date not null
,studentid               integer not null 
,samplefile              varchar not null
,audit_ts                timestamp(0) -- audit timestamp from system clock
,constraint fk_student_sen_provision_history foreign key(studentid) references students(id) 
)
;

drop table student_disabilities
;

create table student_disabilities   
(active              boolean not null
,disability          varchar not null
,disabilityenddate   date
,disabilitystartdate date not null
,id                  integer not null primary key
,lastupdated         timestamp not null
,rowhash             varchar not null
,studentid           integer not null
,samplefile          varchar not null
,audit_ts            timestamp(0) -- audit timestamp from system clock
,constraint fk_student_disabilities foreign key(studentid) references students(id) 
)
;