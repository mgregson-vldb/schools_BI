set search_path to mis_work,mis_load
;

drop table studentsentypehistory_varchar
;

create table studentsentypehistory_varchar   
(active              varchar
,id                  varchar
,lastupdated         varchar
,needenddate         varchar
,neednotes           varchar
,needstartdate       varchar
,needtypecode        varchar
,needtypedescription varchar
,rank                varchar
,rowhash             varchar
,studentid           varchar
,samplefile          varchar
,audit_ts            timestamp(0)) -- audit timestamp from system clock
;     

insert into studentsentypehistory_varchar
(active
,id
,lastupdated
,needenddate
,neednotes
,needstartdate
,needtypecode
,needtypedescription
,rank
,rowhash
,studentid
,samplefile
,audit_ts)
select jsonb_array_elements(StudentSENTypeHistory) ->> 'Active' as Active,
       jsonb_array_elements(StudentSENTypeHistory) ->> 'Id' as Id,
       jsonb_array_elements(StudentSENTypeHistory) ->> 'LastUpdated' as LastUpdated,
       jsonb_array_elements(StudentSENTypeHistory) ->> 'NeedEndDate' as NeedEndDate,
       jsonb_array_elements(StudentSENTypeHistory) ->> 'NeedNotes' as NeedNotes,
       jsonb_array_elements(StudentSENTypeHistory) ->> 'NeedStartDate' as NeedStartDate,
       jsonb_array_elements(StudentSENTypeHistory) ->> 'NeedTypeCode' as NeedTypeCode,
       jsonb_array_elements(StudentSENTypeHistory) ->> 'NeedTypeDescription' as NeedTypeDescription,
       jsonb_array_elements(StudentSENTypeHistory) ->> 'Rank' as Rank,
       jsonb_array_elements(StudentSENTypeHistory) ->> 'RowHash' as RowHash,
       jsonb_array_elements(StudentSENTypeHistory) ->> 'StudentId' as StudentId,
       'Sample File',
       current_timestamp(0)
       from
(select sen -> 'StudentSENTypeHistory' as StudentSENTypeHistory from sen_load) dt1
;

drop table studentsenprovisionhistory_varchar
;

create table studentsenprovisionhistory_varchar   
(active                  varchar
,id                      varchar
,lastupdated             varchar
,rowhash                 varchar
,senprovisioncode        varchar
,senprovisiondescription varchar
,senprovisionenddate     varchar
,senprovisionstartdate   varchar
,studentid               varchar 
,samplefile              varchar
,audit_ts                timestamp(0)) -- audit timestamp from system clock
;   

insert into studentsenprovisionhistory_varchar
(active                  
,id                      
,lastupdated             
,rowhash                 
,senprovisioncode        
,senprovisiondescription 
,senprovisionenddate     
,senprovisionstartdate   
,studentid
,samplefile               
,audit_ts)
select jsonb_array_elements(StudentSENProvisionHistory) ->> 'Active' as Active, 
       jsonb_array_elements(StudentSENProvisionHistory) ->> 'Id' as Id, 
       jsonb_array_elements(StudentSENProvisionHistory) ->> 'LastUpdated' as LastUpdated, 
       jsonb_array_elements(StudentSENProvisionHistory) ->> 'RowHash' as RowHash, 
       jsonb_array_elements(StudentSENProvisionHistory) ->> 'SENProvisionCode' as SENProvisionCode, 
       jsonb_array_elements(StudentSENProvisionHistory) ->> 'SENProvisionDescription' as SENProvisionDescription, 
       jsonb_array_elements(StudentSENProvisionHistory) ->> 'SENProvisionEndDate' as SENProvisionEndDate, 
       jsonb_array_elements(StudentSENProvisionHistory) ->> 'SENProvisionStartDate' as SENProvisionStartDate,
       jsonb_array_elements(StudentSENProvisionHistory) ->> 'StudentId' as StudentId, 
       'Sample File',
       current_timestamp(0)
       from
(select sen -> 'StudentSENProvisionHistory' as StudentSENProvisionHistory from sen_load) dt1
;


drop table studentdisabilities_varchar
;

create table studentdisabilities_varchar   
(active              varchar
,disability          varchar
,disabilityenddate   varchar
,disabilitystartdate varchar
,id                  varchar
,lastupdated         varchar
,rowhash             varchar
,studentid           varchar
,samplefile          varchar
,audit_ts            timestamp(0)) -- audit timestamp from system clock
;   

insert into studentdisabilities_varchar
(active              
,disability         
,disabilityenddate  
,disabilitystartdate
,id                 
,lastupdated        
,rowhash            
,studentid          
,samplefile         
,audit_ts)           
select jsonb_array_elements(StudentDisabilities) ->> 'Active' as Active,
       jsonb_array_elements(StudentDisabilities) ->> 'Disability' as Disability,
       jsonb_array_elements(StudentDisabilities) ->> 'DisabilityEndDate' as DisabilityEndDate,
       jsonb_array_elements(StudentDisabilities) ->> 'DisabilityStartDate' as DisabilityStartDate,
       jsonb_array_elements(StudentDisabilities) ->> 'Id' as Id,
       jsonb_array_elements(StudentDisabilities) ->> 'LastUpdated' as LastUpdated, 
       jsonb_array_elements(StudentDisabilities) ->> 'RowHash' as RowHash,
       jsonb_array_elements(StudentDisabilities) ->> 'StudentId' as StudentId,
       'Sample File',
       current_timestamp(0)
       from
(select sen -> 'StudentDisabilities' as StudentDisabilities from sen_load) dt1
;