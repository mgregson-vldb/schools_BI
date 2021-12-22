set search_path to mis_model,mis_load
;

drop table student_contacts
;

create table student_contacts   
(contactid    integer not null
,id           varchar not null primary key
,lastupdated  timestamp not null
,parresp      smallint not null
,priority     smallint
,relationship varchar not null
,rowhash      varchar not null
,studentid    integer not null
,samplefile   varchar not null
,audit_ts     timestamp(0) -- audit timestamp from system clock
,constraint fk_student_contacts foreign key(studentid) references students(id) 
)
; 