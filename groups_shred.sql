set search_path to mis_work,mis_load
;

drop table groups_varchar
;

create table groups_varchar   
(code           varchar
,externalid     varchar    
,id             varchar          
,idaasid        varchar   
,lastupdated    varchar  
,name           varchar 
,numstudents    varchar 
,primarystaffid varchar
,rowhash        varchar      
,staff          varchar         
,type           varchar        
,xid            varchar           
,filename       varchar
,audit_ts       timestamp(0)) -- audit timestamp from system clock
;     

insert into groups_varchar
(code
,externalid    
,id            
,idaasid       
,lastupdated   
,name          
,numstudents   
,primarystaffid
,rowhash       
,staff         
,type          
,xid           
,filename
,audit_ts)
select jsonb_array_elements("Group") ->> 'Code' as Code,
       jsonb_array_elements("Group") ->> 'ExternalId' as ExternalId,
       jsonb_array_elements("Group") ->> 'Id' as Id,
       jsonb_array_elements("Group") ->> 'IdaasId' as IdaasId,
       jsonb_array_elements("Group") ->> 'LastUpdated' as LastUpdated,
       jsonb_array_elements("Group") ->> 'Name' as Name,
       jsonb_array_elements("Group") ->> 'NumStudents' as NumStudents,
       jsonb_array_elements("Group") ->> 'PrimaryStaffId' as PrimaryStaffId,
       jsonb_array_elements("Group") ->> 'RowHash' as RowHash,
       jsonb_array_elements("Group") ->> 'Staff' as Staff,
       jsonb_array_elements("Group") ->> 'Type' as Type,
       jsonb_array_elements("Group") ->> 'XID' as XID,
       'Sample File' as FileName,
       current_timestamp(0)
       from (select groups -> 'Group' as "Group" 
             from   groups_load) dt1
;