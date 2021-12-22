/*********************************************************************/
/* author: vldb                                                      */
/* date: 31/08/2021                                                  */
/* version: 1.0                                                      */
/* description: shreds json from load table into target table(s)     */
/*********************************************************************/

set search_path to mis,mis_load
;  

truncate table studentexclusions 
; 

insert into studentexclusions
(enddate                
,endsession       
,exclusiondays
,exclusionreason
,exclusionreasoncode
,exclusionsessions
,exclusiontype
,exclusiontypecode
,forename
,id
,lastupdated
,rowhash
,startdate
,startsession
,studentid
,surname
,samplefile
,audit_ts)    
select cast(json_array_elements(StudentExclusions) ->> 'EndDate' as date),
       cast(json_array_elements(StudentExclusions) ->> 'EndSession' as varchar),
       cast(json_array_elements(StudentExclusions) ->> 'ExclusionDays' as varchar),
       cast(json_array_elements(StudentExclusions) ->> 'ExclusionReason' as varchar),
       cast(json_array_elements(StudentExclusions) ->> 'ExclusionReasonCode' as varchar),
       cast(json_array_elements(StudentExclusions) ->> 'ExclusionSessions' as varchar),
       cast(json_array_elements(StudentExclusions) ->> 'ExclusionType' as varchar),
       cast(json_array_elements(StudentExclusions) ->> 'ExclusionTypeCode' as varchar),
       cast(json_array_elements(StudentExclusions) ->> 'Forename' as varchar),
       cast(json_array_elements(StudentExclusions) ->> 'Id' as smallint),
       cast(json_array_elements(StudentExclusions) ->> 'LastUpdated' as timestamp),
       cast(json_array_elements(StudentExclusions) ->> 'RowHash' as varchar),
       cast(json_array_elements(StudentExclusions) ->> 'StartDate' as date),
       cast(json_array_elements(StudentExclusions) ->> 'StartSession' as varchar),
       cast(json_array_elements(StudentExclusions) ->> 'StudentId' as integer),
       cast(json_array_elements(StudentExclusions) ->> 'Surname' as varchar),
       cast('Sample File'as varchar),
       current_timestamp(0)
       from
(select studentexclusions -> 'StudentExclusions' as StudentExclusions from studentexclusions_load) dt1
;

truncate table studentexclusionreasons
; 

insert into studentexclusionreasons
(reasonid               
,studentexclusionid
,samplefile
,audit_ts)    
select cast(json_array_elements(StudentExclusionReasons) ->> 'ReasonId' as varchar),
       cast(json_array_elements(StudentExclusionReasons) ->> 'StudentExclusionId' as smallint),
       cast('Sample File' as varchar),
       current_timestamp(0)
       from
(select studentexclusions -> 'StudentExclusionReasons' as StudentExclusionReasons from studentexclusions_load) dt1
;

truncate table exclusionreasons 
; 

insert into exclusionreasons 
(id               
,reasoncode
,reasondescription
,samplefile
,audit_ts)    
select cast(json_array_elements(ExclusionReasons) ->> 'Id' as varchar),
       cast(json_array_elements(ExclusionReasons) ->> 'ReasonCode' as varchar),
       cast(json_array_elements(ExclusionReasons) ->> 'ReasonDescription' as varchar),
       cast('Sample File' as varchar),
       current_timestamp(0)
       from
(select studentexclusions -> 'ExclusionReasons' as ExclusionReasons from studentexclusions_load) dt1
;