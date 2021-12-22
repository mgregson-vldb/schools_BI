set search_path to mis_work,mis_load
;

drop table aspects_varchar
;

create table aspects_varchar   
(aspecttype  varchar
,description varchar
,externalid  varchar
,gradesetid  varchar
,id          varchar
,ks1         varchar
,ks2         varchar
,ks3         varchar
,lastupdated varchar
,name        varchar
,rowhash     varchar
,supplier    varchar
,samplefile  varchar
,audit_ts    timestamp(0)) -- audit timestamp from system clock
;     

insert into aspects_varchar
(aspecttype 
,description
,externalid 
,gradesetid 
,id         
,ks1        
,ks2        
,ks3        
,lastupdated
,name       
,rowhash    
,supplier   
,samplefile
,audit_ts)
select json_array_elements(Aspects) ->> 'AspectType' as AspectType,
       json_array_elements(Aspects) ->> 'Description' as Description,
       json_array_elements(Aspects) ->> 'ExternalId' as ExternalId,
       json_array_elements(Aspects) ->> 'GradeSetId' as GradeSetId,
       json_array_elements(Aspects) ->> 'Id' as Id,
       json_array_elements(Aspects) ->> 'KS1' as KS1,
       json_array_elements(Aspects) ->> 'KS2' as KS2,
       json_array_elements(Aspects) ->> 'KS3' as KS3,
       json_array_elements(Aspects) ->> 'LastUpdated' as LastUpdated,
       json_array_elements(Aspects) ->> 'Name' as Name,
       json_array_elements(Aspects) ->> 'RowHash' as RowHash,
       json_array_elements(Aspects) ->> 'Supplier' as Supplier,
       'Sample File',
       current_timestamp(0)
       from
(select assessmentstructure -> 'Aspects' as Aspects from assessmentstructure_load) dt1
;

drop table resultsets_varchar
;

create table resultsets_varchar   
(externalid  varchar
,id          varchar
,lastupdated varchar
,name        varchar
,rowhash     varchar
,supplier    varchar
,samplefile  varchar
,audit_ts    timestamp(0)) -- audit timestamp from system clock
;     

insert into resultsets_varchar
(externalid 
,id         
,lastupdated
,name       
,rowhash    
,supplier   
,samplefile
,audit_ts)
select json_array_elements(ResultSets) ->> 'ExternalId' as ExternalId,
       json_array_elements(ResultSets) ->> 'Id' as Id,
       json_array_elements(ResultSets) ->> 'LastUpdated' as LastUpdated,
       json_array_elements(ResultSets) ->> 'Name' as Name,
       json_array_elements(ResultSets) ->> 'RowHash' as RowHash,
       json_array_elements(ResultSets) ->> 'Supplier' as Supplier,
       'Sample File',
       current_timestamp(0)
       from
(select assessmentstructure -> 'ResultSets' as ResultSets from assessmentstructure_load) dt1
;

drop table categories_varchar
;

create table categories_varchar   
(id           varchar
,lastupdated  varchar
,rowhash      varchar
,categoryname varchar
,samplefile   varchar
,audit_ts     timestamp(0)) -- audit timestamp from system clock
;     

insert into categories_varchar
(id          
,lastupdated 
,rowhash     
,categoryname
,samplefile
,audit_ts)
select json_array_elements(Categories) ->> 'Id' as Id,
       json_array_elements(Categories) ->> 'LastUpdated' as LastUpdated,
       json_array_elements(Categories) ->> 'RowHash' as RowHash,
       json_array_elements(Categories) ->> 'categoryName' as categoryName,
       'Sample File',
       current_timestamp(0)
       from
(select assessmentstructure -> 'Categories' as Categories from assessmentstructure_load) dt1
;



/*
select json_array_elements(meta) ->> 'DateTime' as DateTime,
       json_array_elements(meta) ->> 'Id' as Id,
       json_array_elements(meta) ->> 'MIS' as MIS,
       json_array_elements(meta) ->> 'Version' as Version,
       'Sample File',
       current_timestamp(0)
       from
(select assessmentstructure -> 'meta' as meta from assessmentstructure_load) dt1
;

select json_array_elements(meta) ->> 'NextPage' as NextPage,
       json_array_elements(meta) ->> 'PageCount' as PageCount,
       json_array_elements(meta) ->> 'PageNumber' as PageNumber,
       json_array_elements(meta) ->> 'PageSize' as PageSize,
       json_array_elements(meta) ->> 'RowCount' as RowCount,
       'Sample File',
       current_timestamp(0)
       from
(select assessmentstructure -> '__pagination__' as __pagination__ from assessmentstructure_load) dt1
;
*/