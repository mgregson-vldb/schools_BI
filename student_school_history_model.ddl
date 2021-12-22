set search_path to mis_model,mis_load
;

drop table student_school_history
;

create table student_school_history   
(id                 integer not null primary key
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
,audit_ts           timestamp(0) -- audit timestamp from system clock
,constraint fk_student_school_history foreign key(studentid) references students(id) 
)
; 