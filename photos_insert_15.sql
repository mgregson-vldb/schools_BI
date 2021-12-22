/*********************************************************************/
/* author: vldb                                                      */
/* date: 31/08/2021                                                  */
/* version: 1.0                                                      */
/* description: shreds json from load table into target table(s)     */
/*********************************************************************/

set search_path to mis,mis_load
;

truncate table photos    
;

insert into photos
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
select cast(json_array_elements(Photos) ->> 'Id' as integer), 
       cast(json_array_elements(Photos) ->> 'LastUpdated' as timestamp), 
       cast(json_array_elements(Photos) ->> 'PersonId' as integer), 
       cast(json_array_elements(Photos) ->> 'PersonName' as varchar), 
       cast(json_array_elements(Photos) ->> 'PersonType' as varchar), 
       cast(json_array_elements(Photos) ->> 'Photo' as varchar), 
       cast(json_array_elements(Photos) ->> 'RowHash' as varchar), 
       cast(json_array_elements(Photos) ->> 'XID'  as varchar), 
       cast('Sample File' as varchar),
       current_timestamp(0)
       from
(select photos -> 'Photos' as Photos from photos_load) dt1
;