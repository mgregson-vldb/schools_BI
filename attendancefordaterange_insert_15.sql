/*********************************************************************/
/* author: vldb                                                      */
/* date: 31/08/2021                                                  */
/* version: 1.0                                                      */
/* description: shreds json from load table into target table(s)     */
/*********************************************************************/

set search_path to mis,mis_load
;


truncate table attendance
;

insert into attendance
(date       
,externalid 
,id         
,mark       
,session    
,studentid  
,type       
,samplefile 
,audit_ts)
select cast(json_array_elements(Attendance) ->> 'Date' as varchar),
       cast(json_array_elements(Attendance) ->> 'ExternalId' as varchar),
       cast(json_array_elements(Attendance) ->> 'Id' as varchar),
       cast(json_array_elements(Attendance) ->> 'Mark' as varchar),
       cast(json_array_elements(Attendance) ->> 'Session' as varchar),
       cast(json_array_elements(Attendance) ->> 'StudentId' as varchar),
       cast(json_array_elements(Attendance) ->> 'Type' as varchar),
       cast('Sample File' as varchar),
       current_timestamp(0)
       from
(select attendancefordaterange -> 'Attendance' as Attendance from attendancefordaterange_load) dt1
;