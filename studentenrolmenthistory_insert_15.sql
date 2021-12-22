/*********************************************************************/
/* author: vldb                                                      */
/* date: 31/08/2021                                                  */
/* version: 1.0                                                      */
/* description: shreds json from load table into target table(s)     */
/*********************************************************************/

set search_path to mis,mis_load
;

truncate table studentenrolmenthistory
;

insert into studentenrolmenthistory
(enddate            
,enrolmentstatuscode
,id                 
,lastupdated        
,rowhash            
,startdate          
,studentidaasid     
,studentxid         
,studentmisid       
,samplefile         
,audit_ts)
select cast(json_array_elements(StudentEnrolmentHistory) ->> 'EndDate' as date),
       cast(json_array_elements(StudentEnrolmentHistory) ->> 'EnrolmentStatusCode' as varchar),
       cast(json_array_elements(StudentEnrolmentHistory) ->> 'Id' as varchar),
       cast(json_array_elements(StudentEnrolmentHistory) ->> 'LastUpdated' as timestamp),
       cast(json_array_elements(StudentEnrolmentHistory) ->> 'RowHash' as varchar),
       cast(json_array_elements(StudentEnrolmentHistory) ->> 'StartDate' as date),
       cast(json_array_elements(StudentEnrolmentHistory) ->> 'StudentIdaasId' as varchar),
       cast(json_array_elements(StudentEnrolmentHistory) ->> 'StudentXid' as varchar),
       cast(json_array_elements(StudentEnrolmentHistory) ->> 'Student_MisId' as integer),
       cast('Sample File'as varchar),
       current_timestamp(0)
       from
(select studentenrolmenthistory -> 'StudentEnrolmentHistory' as StudentEnrolmentHistory from studentenrolmenthistory_load) dt1
;