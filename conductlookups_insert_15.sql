/*********************************************************************/
/* author: vldb                                                      */
/* date: 31/08/2021                                                  */
/* version: 1.0                                                      */
/* description: shreds json from load table into target table(s)     */
/*********************************************************************/

set search_path to mis,mis_load
;

truncate table conducttypes
;

insert into conducttypes
(description
,displayorder
,id
,lastupdated
,localid
,points
,rowhash
,subtypelookup
,type
,samplefile
,audit_ts)
select cast(json_array_elements(ConductTypes) ->> 'Description' as varchar),
       cast(json_array_elements(ConductTypes) ->> 'DisplayOrder' as smallint),
       cast(json_array_elements(ConductTypes) ->> 'Id' as varchar),
       cast(json_array_elements(ConductTypes) ->> 'LastUpdated' as timestamp),
       cast(json_array_elements(ConductTypes) ->> 'LocalId' as smallint),
       cast(json_array_elements(ConductTypes) ->> 'Points' as smallint),
       cast(json_array_elements(ConductTypes) ->> 'RowHash' as varchar),
       cast(json_array_elements(ConductTypes) ->> 'SubTypeLookup' as varchar),
       cast(json_array_elements(ConductTypes) ->> 'Type' as varchar),
       cast('Sample File' as varchar),
       current_timestamp(0) 
       from
(select conductlookups -> 'ConductTypes' as ConductTypes from conductlookups_load) dt1
;

truncate table conductlookups
;

insert into conductlookups
(code
,description
,displayorder
,id
,lastupdated
,localid
,lookuptype
,rowhash
,samplefile
,audit_ts)
select cast(json_array_elements(ConductLookups) ->> 'Code' as varchar),
       cast(json_array_elements(ConductLookups) ->> 'Description' as varchar),
       cast(json_array_elements(ConductLookups) ->> 'DisplayOrder' as smallint),
       cast(json_array_elements(ConductLookups) ->> 'Id' as varchar),
       cast(json_array_elements(ConductLookups) ->> 'LastUpdated' as timestamp),
       cast(json_array_elements(ConductLookups) ->> 'LocalId' as smallint),
       cast(json_array_elements(ConductLookups) ->> 'LookupType' as varchar),
       cast(json_array_elements(ConductLookups) ->> 'RowHash' as varchar),
       cast('Sample File' as varchar),
       current_timestamp(0)
       from
(select conductlookups -> 'ConductLookups' as ConductLookups from conductlookups_load) dt1
;

/*
create table public.conductlookups_ as 
select jsonb_array_elements(__pagination__) ->> 'NextPage' as NextPage,
       jsonb_array_elements(__pagination__) ->> 'PageCount' as PageCount,
       jsonb_array_elements(__pagination__) ->> 'PageNumber' as PageNumber,
       jsonb_array_elements(__pagination__) ->> 'PageSize' as PageSize,
       jsonb_array_elements(__pagination__) ->> 'RowCount' as RowCount,
       'Sample File'
       from
(select j -> '__pagination__' as __pagination__ from conductlookups_load) dt1
;
*/