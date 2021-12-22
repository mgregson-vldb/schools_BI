/*********************************************************************/
/* author: vldb                                                      */
/* date: 31/08/2021                                                  */
/* version: 1.0                                                      */
/* description: shreds json from load table into target table(s)     */
/*********************************************************************/

set search_path to mis,mis_load
;

truncate table studentschoolhistory
;

insert into studentschoolhistory
(id                
,studentid         
,forename          
,surname           
,previousschoolname
,lea               
,estabid           
,leavingdate       
,leavingreason     
,lastupdated       
,rowhash           
,samplefile
,audit_ts)
select cast(json_array_elements(StudentSchoolHistory) ->> 'Id' as integer),
       cast(json_array_elements(StudentSchoolHistory) ->> 'StudentId' as integer),
       cast(json_array_elements(StudentSchoolHistory) ->> 'Forename' as varchar),
       cast(json_array_elements(StudentSchoolHistory) ->> 'Surname' as varchar),
       cast(json_array_elements(StudentSchoolHistory) ->> 'PreviousSchoolName' as varchar),
       cast(json_array_elements(StudentSchoolHistory) ->> 'LEA' as integer),
       cast(json_array_elements(StudentSchoolHistory) ->> 'EstabId' as integer),
       cast(json_array_elements(StudentSchoolHistory) ->> 'LeavingDate' as date),
       cast(json_array_elements(StudentSchoolHistory) ->> 'LeavingReason' as varchar),
       cast(json_array_elements(StudentSchoolHistory) ->> 'LastUpdated' as timestamp),
       cast(json_array_elements(StudentSchoolHistory) ->> 'RowHash' as varchar),
       cast('Sample File' as varchar),
       current_timestamp(0)
       from
(select studentschoolhistory -> 'StudentSchoolHistory' as StudentSchoolHistory from studentschoolhistory_load) dt1
;