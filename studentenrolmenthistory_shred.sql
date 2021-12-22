set search_path to mis_work,mis_load
;

drop table studentenrolmenthistory_varchar
;

create table studentenrolmenthistory_varchar   
(enddate             varchar
,enrolmentstatuscode varchar
,id                  varchar
,lastupdated         varchar
,rowhash             varchar
,startdate           varchar
,studentidaasid      varchar
,studentxid          varchar
,studentmisid        varchar
,samplefile          varchar
,audit_ts            timestamp(0)) -- audit timestamp from system clock
;     

insert into studentenrolmenthistory_varchar
(enddate            
,enrolmentstatuscode
,id                 
,lastupdated        
,rowhash            
,startdate          
,studentidaasid     
,studentxid         
,studentmisid       
,samplefile         
,audit_ts)
select jsonb_array_elements(StudentEnrolmentHistory) ->> 'EndDate' as EndDate,
       jsonb_array_elements(StudentEnrolmentHistory) ->> 'EnrolmentStatusCode' as EnrolmentStatusCode,
       jsonb_array_elements(StudentEnrolmentHistory) ->> 'Id' as Id,
       jsonb_array_elements(StudentEnrolmentHistory) ->> 'LastUpdated' as LastUpdated,
       jsonb_array_elements(StudentEnrolmentHistory) ->> 'RowHash' as RowHash,
       jsonb_array_elements(StudentEnrolmentHistory) ->> 'StartDate' as StartDate,
       jsonb_array_elements(StudentEnrolmentHistory) ->> 'StudentIdaasId' as StudentIdaasId,
       jsonb_array_elements(StudentEnrolmentHistory) ->> 'StudentXid' as StudentXid,
       jsonb_array_elements(StudentEnrolmentHistory) ->> 'Student_MisId' as Student_MisId,
       'Sample File',
       current_timestamp(0)
       from
(select studentenrolmenthistory -> 'StudentEnrolmentHistory' as StudentEnrolmentHistory from studentenrolmenthistory_load) dt1
;

drop table studentenrolmenthistory_meta_varchar
;

create table studentenrolmenthistory_meta_varchar   
(datetime   varchar
,id         varchar
,mis        varchar
,version    varchar
,samplefile varchar
,audit_ts   timestamp(0)) -- audit timestamp from system clock
;     

insert into studentenrolmenthistory_meta_varchar
(datetime   
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
(select studentenrolmenthistory -> 'meta' as meta from studentenrolmenthistory_load) dt1
;