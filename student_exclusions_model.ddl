set search_path to mis_model,mis_load
;

drop table student_exclusions
;

create table student_exclusions  
(enddate             date         
,endsession          varchar
,exclusiondays       varchar not null
,exclusionreason     varchar
,exclusionreasoncode varchar
,exclusionsessions   varchar not null
,exclusiontype       varchar not null
,exclusiontypecode   varchar not null
,forename            varchar not null
,id                  smallint not null primary key
,lastupdated         timestamp not null
,rowhash             varchar not null
,startdate           date not null
,startsession        varchar
,studentid           integer not null
,surname             varchar not null
,samplefile          varchar not null
,audit_ts           timestamp(0) -- audit timestamp from system clock
,constraint fk_student_exclusions foreign key(studentid) references students(id) 
)
; 

drop table student_exclusion_reasons
;

create table student_exclusion_reasons   
(reasonid           varchar not null        
,studentexclusionid smallint not null
,samplefile         varchar not null
,audit_ts           timestamp(0) -- audit timestamp from system clock
,constraint fk_student_exclusion_reasons foreign key(studentexclusionid) references studentexclusions(id) 
)
; 

drop table exclusion_reasons
;

create table exclusion_reasons   
(id                varchar not null primary key    
,reasoncode        varchar not null
,reasondescription varchar not null
,samplefile        varchar not null
,audit_ts          timestamp(0)) -- audit timestamp from system clock
;     