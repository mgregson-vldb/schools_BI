set search_path to mis_work,mis_load
;

drop table attendancecodes_varchar
;

create table attendancecodes_varchar   
(description             varchar
,id                      varchar
,mark                    varchar
,meaningdescription      varchar
,physicalmeaning         varchar
,shortmeaningdescription varchar
,samplefile              varchar
,audit_ts                timestamp(0)) -- audit timestamp from system clock
;     

insert into attendancecodes_varchar
(description             
,id                      
,mark                    
,meaningdescription      
,physicalmeaning         
,shortmeaningdescription 
,samplefile              
,audit_ts)
select jsonb_array_elements(AttendCodes) ->> 'Description' as Description,
       jsonb_array_elements(AttendCodes) ->> 'Id' as Id,
       jsonb_array_elements(AttendCodes) ->> 'Mark' as Mark,
       jsonb_array_elements(AttendCodes) ->> 'MeaningDescription' as MeaningDescription,
       jsonb_array_elements(AttendCodes) ->> 'PhysicalMeaning' as PhysicalMeaning,
       jsonb_array_elements(AttendCodes) ->> 'ShortMeaningDescription' as ShortMeaningDescription,
       'Sample File',
       current_timestamp(0)
       from
(select attendancecodes -> 'AttendCodes' as AttendCodes from attendancecodes_load) dt1
;