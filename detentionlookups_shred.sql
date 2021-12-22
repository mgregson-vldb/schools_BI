set search_path to mis_work,mis_load
;

drop table detentionattendedlookup_varchar
;

create table detentionattendedlookup_varchar   
(code           varchar
,description    varchar
,displayorder   varchar
,id             varchar
,samplefile     varchar
,audit_ts       timestamp(0)) -- audit timestamp from system clock
;     

insert into detentionattendedlookup_varchar
(code
,description       
,displayorder
,id
,samplefile 
,audit_ts)
select jsonb_array_elements(DetentionAttendedLookup) ->> 'Code' as Code,
       jsonb_array_elements(DetentionAttendedLookup) ->> 'Description' as Description,
       jsonb_array_elements(DetentionAttendedLookup) ->> 'DisplayOrder' as DisplayOrder,
       jsonb_array_elements(DetentionAttendedLookup) ->> 'Id' as Id,
       'Sample File',
       current_timestamp(0)
       from
(select detentionlookups -> 'DetentionAttendedLookup' as DetentionAttendedLookup from detentionlookups_load) dt1
;



drop table detentiontypelookup_varchar
;

create table detentiontypelookup_varchar   
(code                varchar
,dayofweeknumber     varchar
,defaultendtime      varchar
,defaultlocationid   varchar
,defaultlocationname varchar
,defaultstarttime    varchar
,description         varchar
,frequency           varchar
,id                  varchar
,yeargroup           varchar
,samplefile          varchar
,audit_ts            timestamp(0)) -- audit timestamp from system clock
;     

insert into detentiontypelookup_varchar
(code
,dayofweeknumber
,defaultendtime
,defaultlocationid
,defaultlocationname
,defaultstarttime
,description
,frequency
,id
,yeargroup
,samplefile 
,audit_ts)
select jsonb_array_elements(DetentionTypeLookup) ->> 'Code' as Code,
       jsonb_array_elements(DetentionTypeLookup) ->> 'DayOfWeekNumber' as DayOfWeekNumber,
       jsonb_array_elements(DetentionTypeLookup) ->> 'DefaultEndTime' as DefaultEndTime,
       jsonb_array_elements(DetentionTypeLookup) ->> 'DefaultLocationId' as DefaultLocationId,
       jsonb_array_elements(DetentionTypeLookup) ->> 'DefaultLocationName' as DefaultLocationName,
       jsonb_array_elements(DetentionTypeLookup) ->> 'DefaultStartTime' as DefaultStartTime,
       jsonb_array_elements(DetentionTypeLookup) ->> 'Description' as Description,
       jsonb_array_elements(DetentionTypeLookup) ->> 'Frequency' as Frequency,
       jsonb_array_elements(DetentionTypeLookup) ->> 'Id' as Id,
       jsonb_array_elements(DetentionTypeLookup) ->> 'YearGroup' as YearGroup,
       'Sample File',
       current_timestamp(0)
       from
(select detentionlookups -> 'DetentionTypeLookup' as DetentionTypeLookup from detentionlookups_load) dt1
;




drop table detentionlocationlookup_varchar
;

create table detentionlocationlookup_varchar   
(code       varchar
,description varchar
,id         varchar
,samplefile varchar
,audit_ts   timestamp(0)) -- audit timestamp from system clock
;     

insert into detentionlocationlookup_varchar
(code
,description
,id
,samplefile 
,audit_ts)
select jsonb_array_elements(DetentionLocationLookup) ->> 'Code' as Code,
       jsonb_array_elements(DetentionLocationLookup) ->> 'Description' as Description,
       jsonb_array_elements(DetentionLocationLookup) ->> 'Id' as Id,
       'Sample File',
       current_timestamp(0)
       from
(select detentionlookups -> 'DetentionLocationLookup' as DetentionLocationLookup from detentionlookups_load) dt1
;



drop table detentionreasonlookup_varchar
;

create table detentionreasonlookup_varchar   
(code       varchar
,description varchar
,id         varchar
,samplefile varchar
,audit_ts   timestamp(0)) -- audit timestamp from system clock
;     

insert into detentionreasonlookup_varchar
(code
,description
,id
,samplefile 
,audit_ts)
select jsonb_array_elements(DetentionReasonLookup) ->> 'Code' as Code,
       jsonb_array_elements(DetentionReasonLookup) ->> 'Description' as Description,
       jsonb_array_elements(DetentionReasonLookup) ->> 'Id' as Id,
       'Sample File',
       current_timestamp(0)
       from
(select detentionlookups -> 'DetentionReasonLookup' as DetentionReasonLookup from detentionlookups_load) dt1
;
