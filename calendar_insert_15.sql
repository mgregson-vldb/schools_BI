/*********************************************************************/
/* author: vldb                                                      */
/* date: 31/08/2021                                                  */
/* version: 1.0                                                      */
/* description: shreds json from load table into target table(s)     */
/*********************************************************************/

set search_path to mis,mis_load
;   

insert into calendar
(category
,description
,enddate
,endtime
,id
,lastupdated
,rowhash
,startdate
,starttime
,type
,samplefile
,audit_ts)
select cast(json_array_elements(SchoolCalendar) ->> 'Category' as varchar),
       cast(json_array_elements(SchoolCalendar) ->> 'Description' as varchar),
       cast(json_array_elements(SchoolCalendar) ->> 'EndDate' as date),
       cast(json_array_elements(SchoolCalendar) ->> 'EndTime' as varchar),
       cast(json_array_elements(SchoolCalendar) ->> 'Id' as varchar),
       cast(json_array_elements(SchoolCalendar) ->> 'LastUpdated' as timestamp),
       cast(json_array_elements(SchoolCalendar) ->> 'RowHash' as varchar),
       cast(json_array_elements(SchoolCalendar) ->> 'StartDate' as date),
       cast(json_array_elements(SchoolCalendar) ->> 'StartTime' as varchar),
       cast(json_array_elements(SchoolCalendar) ->> 'Type' as varchar),
       cast('Sample File' as varchar),
       current_timestamp(0)
       from
(select calendar -> 'SchoolCalendar' as SchoolCalendar from calendar_load) dt1
;