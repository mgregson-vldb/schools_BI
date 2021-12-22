/*********************************************************************/
/* author: vldb                                                      */
/* date: 31/08/2021                                                  */
/* version: 1.0                                                      */
/* description: shreds json from load table into target table(s)     */
/*********************************************************************/

set search_path to mis,mis_load
;

truncate table count 
;  

insert into count
(area
,count
,id
,samplefile
,audit_ts)
select cast(json_array_elements(counts) ->> 'Area' as varchar),
       cast(json_array_elements(counts) ->> 'Count' as varchar),
       cast(json_array_elements(counts) ->> 'Id' as varchar),
       cast('Sample File' as varchar),
       current_timestamp(0)
       from
(select count -> 'counts' as counts from count_load) dt1
;