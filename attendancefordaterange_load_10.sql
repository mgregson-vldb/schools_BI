set search_path to mis_work,mis_load
;

drop table attendancefordaterange_attendance_varchar
;

create table attendancefordaterange_attendance_varchar   
(date       varchar
,externalid varchar
,id         varchar
,mark       varchar
,session    varchar
,studentid  varchar
,type       varchar
,samplefile varchar
,audit_ts   timestamp(0)) -- audit timestamp from system clock
;     

insert into attendancefordaterange_attendance_varchar
(date       
,externalid 
,id         
,mark       
,session    
,studentid  
,type       
,samplefile 
,audit_ts)
select jsonb_array_elements(Attendance) ->> 'Date' as Date,
       jsonb_array_elements(Attendance) ->> 'ExternalId' as ExternalId,
       jsonb_array_elements(Attendance) ->> 'Id' as Id,
       jsonb_array_elements(Attendance) ->> 'Mark' as Mark,
       jsonb_array_elements(Attendance) ->> 'Session' as Session,
       jsonb_array_elements(Attendance) ->> 'StudentId' as StudentId,
       jsonb_array_elements(Attendance) ->> 'Type' as Type,
       'Sample File',
       current_timestamp(0)
       from
(select attendancefordaterange -> 'Attendance' as Attendance from attendancefordaterange_load) dt1
;

drop table attendancefordaterange_pagination_varchar
;

create table attendancefordaterange_pagination_varchar  
(nextpage   varchar
,pagecount  varchar
,pagenumber varchar
,pagesize   varchar
,rowcount   varchar
,samplefile varchar
,audit_ts   timestamp(0)) -- audit timestamp from system clock
;     

insert into attendancefordaterange_pagination_varchar
(nextpage   
,pagecount  
,pagenumber 
,pagesize   
,rowcount   
,samplefile 
,audit_ts)
select jsonb_array_elements(__pagination__) ->> 'NextPage' as NextPage,
       jsonb_array_elements(__pagination__) ->> 'PageCount' as PageCount,
       jsonb_array_elements(__pagination__) ->> 'PageNumber' as PageNumber,
       jsonb_array_elements(__pagination__) ->> 'PageSize' as PageSize,
       jsonb_array_elements(__pagination__) ->> 'RowCount' as RowCount,
       'Sample File',
       current_timestamp(0)
       from
(select attendancefordaterange -> '__pagination__' as __pagination__ from attendancefordaterange_load) dt1
;