set search_path to mis_work,mis_load
;

drop table personcomms_varchar
;

create table personcomms_varchar   
(commstype    varchar
,id           varchar
,isdefault    varchar
,lastupdated  varchar
,locationcode varchar
,notes        varchar
,personid     varchar
,persontype   varchar
,priority     varchar
,rowhash      varchar
,value        varchar
,samplefile   varchar
,audit_ts     timestamp(0)) -- audit timestamp from system clock
;     

insert into personcomms_varchar
(commstype    
,id           
,isdefault    
,lastupdated  
,locationcode 
,notes        
,personid     
,persontype   
,priority     
,rowhash      
,value        
,samplefile     
,audit_ts)
select jsonb_array_elements(PersonComms) ->> 'CommsType' as CommsType,
       jsonb_array_elements(PersonComms) ->> 'Id' as Id,
       jsonb_array_elements(PersonComms) ->> 'IsDefault' as IsDefault,
       jsonb_array_elements(PersonComms) ->> 'LastUpdated' as LastUpdated,
       jsonb_array_elements(PersonComms) ->> 'LocationCode' as LocationCode,
       jsonb_array_elements(PersonComms) ->> 'Notes' as Notes,
       jsonb_array_elements(PersonComms) ->> 'PersonId' as PersonId,
       jsonb_array_elements(PersonComms) ->> 'PersonType' as PersonType,
       jsonb_array_elements(PersonComms) ->> 'Priority' as Priority,
       jsonb_array_elements(PersonComms) ->> 'RowHash' as RowHash,
       jsonb_array_elements(PersonComms) ->> 'Value' as Value,
       'Sample File',
       current_timestamp(0)
       from
(select personcomms -> 'PersonComms' as PersonComms from personcomms_load) dt1
;

drop table personcomms_meta_varchar
;

create table personcomms_meta_varchar   
(datetime   varchar
,id         varchar
,mis        varchar
,verision   varchar
,samplefile varchar
,audit_ts   timestamp(0)) -- audit timestamp from system clock
;     

insert into personcomms_meta_varchar
(datetime  
,id        
,mis       
,verision  
,samplefile
,audit_ts)  
select jsonb_array_elements(meta) ->> 'DateTime' as DateTime,
       jsonb_array_elements(meta) ->> 'Id' as Id,
       jsonb_array_elements(meta) ->> 'MIS' as MIS,
       jsonb_array_elements(meta) ->> 'Version' as Version,
       'Sample File',
       current_timestamp(0)
       from
(select personcomms -> 'meta' as meta from personcomms_load) dt1
;