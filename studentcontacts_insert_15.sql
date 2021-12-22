/*********************************************************************/
/* author: vldb                                                      */
/* date: 31/08/2021                                                  */
/* version: 1.0                                                      */
/* description: shreds json from load table into target table(s)     */
/*********************************************************************/

set search_path to mis,mis_load
;

truncate table studentcontacts
; 

insert into studentcontacts
(contactid    
,id           
,lastupdated  
,parresp      
,priority     
,relationship 
,rowhash      
,studentid    
,samplefile        
,audit_ts)
select cast(json_array_elements(StudentContact) ->> 'ContactId' as integer),
       cast(json_array_elements(StudentContact) ->> 'Id' as varchar),
       cast(json_array_elements(StudentContact) ->> 'LastUpdated' as timestamp),
       cast(json_array_elements(StudentContact) ->> 'ParResp' as smallint),
       cast(json_array_elements(StudentContact) ->> 'Priority' as smallint),
       cast(json_array_elements(StudentContact) ->> 'Relationship' as varchar),
       cast(json_array_elements(StudentContact) ->> 'RowHash' as varchar),
       cast(json_array_elements(StudentContact) ->> 'StudentId' as integer),
       cast('Sample File' as varchar),
       current_timestamp(0)
       from
(select studentcontacts -> 'StudentContact' as StudentContact from studentcontacts_load) dt1
;