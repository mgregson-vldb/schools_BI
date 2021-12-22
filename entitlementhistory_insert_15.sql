/*********************************************************************/
/* author: vldb                                                      */
/* date: 31/08/2021                                                  */
/* version: 1.0                                                      */
/* description: shreds json from load table into target table(s)     */
/*********************************************************************/

set search_path to mis,mis_load
;

insert into entitlementgroups
(fullname    
,id
,shortname
,samplefile
,audit_ts)
select cast(json_array_elements(EntitlementGroups) ->> 'FullName' as varchar),
       cast(json_array_elements(EntitlementGroups) ->> 'Id' as smallint),
       cast(json_array_elements(EntitlementGroups) ->> 'ShortName' as varchar),
       cast('Sample File' as varchar),
       current_timestamp(0)
       from
(select entitlementhistory -> 'EntitlementGroups' as EntitlementGroups from entitlementhistory_load) dt1
;  

insert into entitlementgroupstudents
(enddate            
,entitlementgroupid 
,id                 
,startdate          
,studentid          
,samplefile                   
,audit_ts)
select cast(json_array_elements(EntitlementGroupStudents) ->> 'EndDate' as date),
       cast(json_array_elements(EntitlementGroupStudents) ->> 'EntitlementGroupId' as smallint),
       cast(json_array_elements(EntitlementGroupStudents) ->> 'Id' as varchar),
       cast(json_array_elements(EntitlementGroupStudents) ->> 'StartDate' as date),
       cast(json_array_elements(EntitlementGroupStudents) ->> 'StudentId' as integer),
       cast('Sample File' as varchar),
       current_timestamp(0)
       from
(select entitlementhistory -> 'EntitlementGroupStudents' as EntitlementGroupStudents from entitlementhistory_load) dt1
;