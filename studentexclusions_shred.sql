set search_path to mis_work,mis_load
;

drop table studentexclusions_varchar
;

create table studentexclusions_varchar   
(enddate             varchar         
,endsession          varchar
,exclusiondays       varchar
,exclusionreason     varchar
,exclusionreasoncode varchar
,exclusionsessions   varchar
,exclusiontype       varchar
,exclusiontypecode   varchar
,forename            varchar
,id                  varchar
,lastupdated         varchar
,rowhash             varchar
,startdate           varchar
,startsession        varchar
,studentid           varchar
,surname             varchar
,samplefile          varchar
,audit_ts            timestamp(0)) -- audit timestamp from system clock
;     

insert into studentexclusions_varchar
(enddate                
,endsession       
,exclusiondays
,exclusionreason
,exclusionreasoncode
,exclusionsessions
,exclusiontype
,exclusiontypecode
,forename
,id
,lastupdated
,rowhash
,startdate
,startsession
,studentid
,surname
,samplefile
,audit_ts)    
select jsonb_array_elements(StudentExclusions) ->> 'EndDate' as EndDate,
       jsonb_array_elements(StudentExclusions) ->> 'EndSession' as EndSession,
       jsonb_array_elements(StudentExclusions) ->> 'ExclusionDays' as ExclusionDays,
       jsonb_array_elements(StudentExclusions) ->> 'ExclusionReason' as ExclusionReason,
       jsonb_array_elements(StudentExclusions) ->> 'ExclusionReasonCode' as ExclusionReasonCode,
       jsonb_array_elements(StudentExclusions) ->> 'ExclusionSessions' as ExclusionSessions,
       jsonb_array_elements(StudentExclusions) ->> 'ExclusionType' as ExclusionType,
       jsonb_array_elements(StudentExclusions) ->> 'ExclusionTypeCode' as ExclusionTypeCode,
       jsonb_array_elements(StudentExclusions) ->> 'Forename' as Forename,
       jsonb_array_elements(StudentExclusions) ->> 'Id' as Id,
       jsonb_array_elements(StudentExclusions) ->> 'LastUpdated' as LastUpdated,
       jsonb_array_elements(StudentExclusions) ->> 'RowHash' as RowHash,
       jsonb_array_elements(StudentExclusions) ->> 'StartDate' as StartDate,
       jsonb_array_elements(StudentExclusions) ->> 'StartSession' as StartSession,
       jsonb_array_elements(StudentExclusions) ->> 'StudentId' as StudentId,
       jsonb_array_elements(StudentExclusions) ->> 'Surname' as Surname,
       'Sample File',
       current_timestamp(0)
       from
(select studentexclusions -> 'StudentExclusions' as StudentExclusions from studentexclusions_load) dt1
;

drop table studentexclusionreasons_varchar
;

create table studentexclusionreasons_varchar   
(reasonid           varchar         
,studentexclusionid varchar
,samplefile         varchar
,audit_ts           timestamp(0)) -- audit timestamp from system clock
;     

insert into studentexclusionreasons_varchar 
(reasonid               
,studentexclusionid
,samplefile
,audit_ts)    
select jsonb_array_elements(StudentExclusionReasons) ->> 'ReasonId' as ReasonId,
       jsonb_array_elements(StudentExclusionReasons) ->> 'StudentExclusionId' as StudentExclusionId,
       'Sample File',
       current_timestamp(0)
       from
(select studentexclusions -> 'StudentExclusionReasons' as StudentExclusionReasons from studentexclusions_load) dt1
;



drop table exclusionreasons_varchar
;

create table exclusionreasons_varchar   
(id                varchar         
,reasoncode        varchar
,reasondescription varchar
,samplefile        varchar
,audit_ts          timestamp(0)) -- audit timestamp from system clock
;     

insert into exclusionreasons_varchar 
(id               
,reasoncode
,reasondescription
,samplefile
,audit_ts)    
select jsonb_array_elements(ExclusionReasons) ->> 'Id' as Id,
       jsonb_array_elements(ExclusionReasons) ->> 'ReasonCode' as ReasonCode,
       jsonb_array_elements(ExclusionReasons) ->> 'ReasonDescription' as ReasonDescription,
       'Sample File',
       current_timestamp(0)
       from
(select studentexclusions -> 'ExclusionReasons' as ExclusionReasons from studentexclusions_load) dt1
;



drop table studentexclusions_meta_varchar
;

create table studentexclusions_meta_varchar   
(date_time  varchar
,id         varchar
,mis        varchar
,version    varchar
,samplefile varchar
,audit_ts   timestamp(0)) -- audit timestamp from system clock
;     

insert into studentexclusions_meta_varchar 
(date_time              
,id
,mis
,version
,samplefile
,audit_ts)   
select jsonb_array_elements(meta) ->> 'DateTime' as DateTime,
       jsonb_array_elements(meta) ->> 'Id' as Id,
       jsonb_array_elements(meta) ->> 'MIS' as MIS,
       jsonb_array_elements(meta) ->> 'Version' as Version,
       'Sample File',
       current_timestamp(0)
       from
(select studentexclusions -> 'meta' as meta from studentexclusions_load) dt1
;