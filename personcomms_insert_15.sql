/*********************************************************************/
/* author: vldb                                                      */
/* date: 31/08/2021                                                  */
/* version: 1.0                                                      */
/* description: shreds json from load table into target table(s)     */
/*********************************************************************/

set search_path to mis,mis_load
;

truncate table personcomms
;

insert into personcomms
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
select cast(json_array_elements(PersonComms) ->> 'CommsType' as varchar),
       cast(json_array_elements(PersonComms) ->> 'Id' as varchar),
       cast(json_array_elements(PersonComms) ->> 'IsDefault' as smallint),
       cast(json_array_elements(PersonComms) ->> 'LastUpdated' as timestamp),
       cast(json_array_elements(PersonComms) ->> 'LocationCode' as varchar),
       cast(json_array_elements(PersonComms) ->> 'Notes' as varchar),
       cast(json_array_elements(PersonComms) ->> 'PersonId' as integer),
       cast(json_array_elements(PersonComms) ->> 'PersonType' as varchar),
       cast(json_array_elements(PersonComms) ->> 'Priority' as smallint),
       cast(json_array_elements(PersonComms) ->> 'RowHash' as varchar),
       cast(json_array_elements(PersonComms) ->> 'Value' as varchar),
       cast('Sample File' as varchar),
       current_timestamp(0)
       from
(select personcomms -> 'PersonComms' as PersonComms from personcomms_load) dt1
;