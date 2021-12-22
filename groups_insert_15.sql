/*********************************************************************/
/* author: vldb                                                      */
/* date: 31/08/2021                                                  */
/* version: 1.0                                                      */
/* description: shreds json from load table into target table(s)     */
/*********************************************************************/

set search_path to mis,mis_load
;

truncate table groups
;

insert into groups
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
select cast(json_array_elements("Group") ->> 'Code' as varchar),
       cast(json_array_elements("Group") ->> 'ExternalId' as varchar),
       cast(json_array_elements("Group") ->> 'Id' as integer),
       cast(json_array_elements("Group") ->> 'IdaasId' as varchar),
       cast(json_array_elements("Group") ->> 'LastUpdated' as timestamp),
       cast(json_array_elements("Group") ->> 'Name' as varchar),
       cast(json_array_elements("Group") ->> 'NumStudents' as smallint),
       cast(json_array_elements("Group") ->> 'PrimaryStaffId' as smallint),
       cast(json_array_elements("Group") ->> 'RowHash' as varchar),
       cast(json_array_elements("Group") ->> 'Staff' as varchar),
       cast(json_array_elements("Group") ->> 'Type' as varchar),
       cast(json_array_elements("Group") ->> 'XID' as varchar),
       cast('Sample File' as varchar),
       current_timestamp(0)
       from (select groups -> 'Group' as "Group" 
             from   groups_load) dt1
;