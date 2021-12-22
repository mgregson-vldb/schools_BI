/*********************************************************************/
/* author: vldb                                                      */
/* date: 31/08/2021                                                  */
/* version: 1.0                                                      */
/* description: shreds json from load table into target table(s)     */
/*********************************************************************/

set search_path to mis,mis_load
;

truncate table attendancecodes
;

insert into attendancecodes
(description             
,id                      
,mark                    
,meaningdescription      
,physicalmeaning         
,shortmeaningdescription 
,samplefile              
,audit_ts)
select cast(json_array_elements(AttendCodes) ->> 'Description' as varchar),
       cast(json_array_elements(AttendCodes) ->> 'Id' as varchar),
       cast(json_array_elements(AttendCodes) ->> 'Mark' as varchar),
       cast(json_array_elements(AttendCodes) ->> 'MeaningDescription' as varchar),
       cast(json_array_elements(AttendCodes) ->> 'PhysicalMeaning' as varchar),
       cast(json_array_elements(AttendCodes) ->> 'ShortMeaningDescription' as varchar),
       cast('Sample File' as varchar),
       current_timestamp(0)
       from
(select attendancecodes -> 'AttendCodes' as AttendCodes from attendancecodes_load) dt1
;