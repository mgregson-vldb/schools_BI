/*********************************************************************/
/* author: vldb                                                      */
/* date: 31/08/2021                                                  */
/* version: 1.0                                                      */
/* description: shreds json from load table into target table(s)     */
/*********************************************************************/

set search_path to mis,mis_load
;

truncate table detentionattendedlookup
;

insert into detentionattendedlookup
(code
,description       
,displayorder
,id
,samplefile 
,audit_ts)
select cast(json_array_elements(DetentionAttendedLookup) ->> 'Code' as varchar),
       cast(json_array_elements(DetentionAttendedLookup) ->> 'Description' as varchar),
       cast(json_array_elements(DetentionAttendedLookup) ->> 'DisplayOrder' as smallint),
       cast(json_array_elements(DetentionAttendedLookup) ->> 'Id' as smallint),
       cast('Sample File' as varchar),
       current_timestamp(0)
       from
(select detentionlookups -> 'DetentionAttendedLookup' as DetentionAttendedLookup from detentionlookups_load) dt1
;

truncate table detentiontypelookup
;

insert into detentiontypelookup
(code
,dayofweeknumber
,defaultendtime
,defaultlocationid
,defaultlocationname
,defaultstarttime
,description
,frequency
,id
,yeargroup
,samplefile 
,audit_ts)
select cast(json_array_elements(DetentionTypeLookup) ->> 'Code' as varchar),
       cast(json_array_elements(DetentionTypeLookup) ->> 'DayOfWeekNumber' as smallint),
       cast(json_array_elements(DetentionTypeLookup) ->> 'DefaultEndTime' as time),
       cast(json_array_elements(DetentionTypeLookup) ->> 'DefaultLocationId' as smallint),
       cast(json_array_elements(DetentionTypeLookup) ->> 'DefaultLocationName' as varchar),
       cast(json_array_elements(DetentionTypeLookup) ->> 'DefaultStartTime' as time),
       cast(json_array_elements(DetentionTypeLookup) ->> 'Description' as varchar),
       cast(json_array_elements(DetentionTypeLookup) ->> 'Frequency' as varchar),
       cast(json_array_elements(DetentionTypeLookup) ->> 'Id' as smallint),
       cast(json_array_elements(DetentionTypeLookup) ->> 'YearGroup' as varchar),
       cast('Sample File' as varchar),
       current_timestamp(0)
       from
(select detentionlookups -> 'DetentionTypeLookup' as DetentionTypeLookup from detentionlookups_load) dt1
;    

truncate table detentionLocationLookup
;

insert into detentionlocationlookup
(code
,description
,id
,samplefile 
,audit_ts)
select cast(json_array_elements(DetentionLocationLookup) ->> 'Code' as varchar),
       cast(json_array_elements(DetentionLocationLookup) ->> 'Description' as varchar),
       cast(json_array_elements(DetentionLocationLookup) ->> 'Id' as smallint),
       cast('Sample File' as varchar),
       current_timestamp(0)
       from
(select detentionlookups -> 'DetentionLocationLookup' as DetentionLocationLookup from detentionlookups_load) dt1
;    

truncate table detentionreasonlookup
;

insert into detentionreasonlookup
(code
,description
,id
,samplefile 
,audit_ts)
select cast(json_array_elements(DetentionReasonLookup) ->> 'Code' as varchar),
       cast(json_array_elements(DetentionReasonLookup) ->> 'Description' as varchar),
       cast(json_array_elements(DetentionReasonLookup) ->> 'Id' as smallint),
       cast('Sample File' as varchar),
       current_timestamp(0)
       from
(select detentionlookups -> 'DetentionReasonLookup' as DetentionReasonLookup from detentionlookups_load) dt1
;