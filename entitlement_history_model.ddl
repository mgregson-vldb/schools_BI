set search_path to mis_model,mis_load
;

drop table mis_model.entitlement_groups
;

create table mis_model.entitlement_groups   
(fullname   varchar not null
,id         smallint not null primary key   
,shortname  varchar not null
,samplefile varchar not null
,audit_ts   timestamp(0) not null) -- audit timestamp from system clock
; 

drop table mis_model.entitlement_group_students
;

create table mis_model.entitlement_group_students   
(enddate            date
,entitlementgroupid smallint not null
,id                 varchar not null primary key
,startdate          date not null
,studentid          integer not null
,samplefile         varchar not null
,audit_ts           timestamp(0) not null -- audit timestamp from system clock
,constraint fk_entitlement_groups foreign key(entitlementgroupid) references entitlementgroups(id) 
,constraint fk_entitlement_group_students foreign key(studentid) references students(id) 
)
;  