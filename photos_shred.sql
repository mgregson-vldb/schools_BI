set search_path to mis_work,mis_load
;

drop table photos_varchar
;

create table photos_varchar   
(id          varchar
,lastupdated varchar
,personid    varchar
,personname  varchar
,persontype  varchar
,photos      varchar
,rowhash     varchar
,xid         varchar
,samplefile  varchar
,audit_ts    timestamp(0)) -- audit timestamp from system clock
;     

insert into photos_varchar
(id          
,lastupdated 
,personid    
,personname  
,persontype  
,photos      
,rowhash     
,xid         
,samplefile  
,audit_ts)
select jsonb_array_elements(Photos) ->> 'Id' as Id, 
       jsonb_array_elements(Photos) ->> 'LastUpdated' as LastUpdated, 
       jsonb_array_elements(Photos) ->> 'PersonId' as PersonId, 
       jsonb_array_elements(Photos) ->> 'PersonName' as PersonName, 
       jsonb_array_elements(Photos) ->> 'PersonType' as PersonType, 
       jsonb_array_elements(Photos) ->> 'Photo' as Photo, 
       jsonb_array_elements(Photos) ->> 'RowHash' as RowHash, 
       jsonb_array_elements(Photos) ->> 'XID'  as XID, 
       'Sample File',
       current_timestamp(0)
       from
(select photos -> 'Photos' as Photos from photos_load) dt1
;

drop table photos_meta_varchar
;

create table photos_meta_varchar 
(datetime   varchar
,id         varchar
,mis        varchar
,version    varchar
,samplefile varchar
,audit_ts   timestamp(0)) -- audit timestamp from system clock
;     

insert into photos_meta_varchar
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
(select photos -> 'meta' as meta from photos_load) dt1
;
