/*********************************************************************/
/* author: vldb                                                      */
/* date: 31/08/2021                                                  */
/* version: 1.0                                                      */
/* description: shreds json from load table into target table(s)     */
/*********************************************************************/

set search_path to mis,mis_load
;

truncate table studentsentypehistory
;

insert into studentsentypehistory
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
select cast(json_array_elements(StudentSENTypeHistory) ->> 'Active' as boolean),
       cast(json_array_elements(StudentSENTypeHistory) ->> 'Id' as integer),
       cast(json_array_elements(StudentSENTypeHistory) ->> 'LastUpdated' as timestamp),
       cast(json_array_elements(StudentSENTypeHistory) ->> 'NeedEndDate' as date),
       cast(json_array_elements(StudentSENTypeHistory) ->> 'NeedNotes' as varchar),
       cast(json_array_elements(StudentSENTypeHistory) ->> 'NeedStartDate' as date),
       cast(json_array_elements(StudentSENTypeHistory) ->> 'NeedTypeCode' as varchar),
       cast(json_array_elements(StudentSENTypeHistory) ->> 'NeedTypeDescription' as varchar),
       cast(json_array_elements(StudentSENTypeHistory) ->> 'Rank' as smallint),
       cast(json_array_elements(StudentSENTypeHistory) ->> 'RowHash' as varchar),
       cast(json_array_elements(StudentSENTypeHistory) ->> 'StudentId' as integer),
       cast('Sample File' as varchar),
       current_timestamp(0)
       from
(select sen -> 'StudentSENTypeHistory' as StudentSENTypeHistory from sen_load) dt1
;

truncate table studentsenprovisionhistory
;

insert into studentsenprovisionhistory
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
select cast(json_array_elements(StudentSENProvisionHistory) ->> 'Active' as boolean), 
       cast(json_array_elements(StudentSENProvisionHistory) ->> 'Id' as bigint), 
       cast(json_array_elements(StudentSENProvisionHistory) ->> 'LastUpdated' as timestamp), 
       cast(json_array_elements(StudentSENProvisionHistory) ->> 'RowHash' as varchar), 
       cast(json_array_elements(StudentSENProvisionHistory) ->> 'SENProvisionCode' as varchar), 
       cast(json_array_elements(StudentSENProvisionHistory) ->> 'SENProvisionDescription' as varchar), 
       cast(json_array_elements(StudentSENProvisionHistory) ->> 'SENProvisionEndDate' as date), 
       cast(json_array_elements(StudentSENProvisionHistory) ->> 'SENProvisionStartDate' as date),
       cast(json_array_elements(StudentSENProvisionHistory) ->> 'StudentId' as integer), 
       cast('Sample File' as varchar),
       current_timestamp(0)
       from
(select sen -> 'StudentSENProvisionHistory' as StudentSENProvisionHistory from sen_load) dt1
;

truncate table studentdisabilities
;   

insert into studentdisabilities
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
select cast(json_array_elements(StudentDisabilities) ->> 'Active' as boolean),
       cast(json_array_elements(StudentDisabilities) ->> 'Disability' as varchar),
       cast(json_array_elements(StudentDisabilities) ->> 'DisabilityEndDate' as date),
       cast(json_array_elements(StudentDisabilities) ->> 'DisabilityStartDate' as date),
       cast(json_array_elements(StudentDisabilities) ->> 'Id' as integer),
       cast(json_array_elements(StudentDisabilities) ->> 'LastUpdated' as timestamp), 
       cast(json_array_elements(StudentDisabilities) ->> 'RowHash' as varchar),
       cast(json_array_elements(StudentDisabilities) ->> 'StudentId' as integer),
       cast('Sample File' as varchar),
       current_timestamp(0)
       from
(select sen -> 'StudentDisabilities' as StudentDisabilities from sen_load) dt1
;