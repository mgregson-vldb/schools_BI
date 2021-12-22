set search_path to mis_work,mis_load
;

drop table count_varchar
;

create table count_varchar   
(area       varchar
,count      varchar
,id         varchar
,samplefile varchar
,audit_ts   timestamp(0)) -- audit timestamp from system clock
;     

insert into count_varchar
(area
,count
,id
,samplefile
,audit_ts)
select jsonb_array_elements(counts) ->> 'Area' as Area,
       jsonb_array_elements(counts) ->> 'Count' as Count,
       jsonb_array_elements(counts) ->> 'Id' as Id,
       'Sample File',
       current_timestamp(0)
       from
(select count -> 'counts' as counts from count_load) dt1
;