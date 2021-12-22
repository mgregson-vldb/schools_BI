set search_path to mis_work,mis_load
;

drop table entitlementgroups_varchar
;

create table entitlementgroups_varchar   
(fullname   varchar
,id         varchar    
,shortname  varchar
,samplefile varchar
,audit_ts   timestamp(0)) -- audit timestamp from system clock
;     

insert into entitlementgroups_varchar
(fullname    
,id
,shortname
,samplefile
,audit_ts)
select jsonb_array_elements(EntitlementGroups) ->> 'FullName' as FullName,
       jsonb_array_elements(EntitlementGroups) ->> 'Id' as Id,
       jsonb_array_elements(EntitlementGroups) ->> 'ShortName' as ShortName,
       'Sample File',
       current_timestamp(0)
       from
(select entitlementhistory -> 'EntitlementGroups' as EntitlementGroups from entitlementhistory_load) dt1
;


drop table entitlementgroupstudents_varchar
;

create table entitlementgroupstudents_varchar   
(enddate            varchar
,entitlementgroupid varchar
,id                 varchar
,startdate          varchar
,studentid          varchar
,samplefile         varchar
,audit_ts           timestamp(0)) -- audit timestamp from system clock
;     

insert into entitlementgroupstudents_varchar
(enddate            
,entitlementgroupid 
,id                 
,startdate          
,studentid          
,samplefile                   
,audit_ts)
select jsonb_array_elements(EntitlementGroupStudents) ->> 'EndDate' as EndDate,
       jsonb_array_elements(EntitlementGroupStudents) ->> 'EntitlementGroupId' as EntitlementGroupId,
       jsonb_array_elements(EntitlementGroupStudents) ->> 'Id' as Id,
       jsonb_array_elements(EntitlementGroupStudents) ->> 'StartDate' as StartDate,
       jsonb_array_elements(EntitlementGroupStudents) ->> 'StudentId' as StudentId,
       'Sample File',
       current_timestamp(0)
       from
(select entitlementhistory -> 'EntitlementGroupStudents' as EntitlementGroupStudents from entitlementhistory_load) dt1
;

