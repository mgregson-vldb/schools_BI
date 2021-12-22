/*********************************************************************/
/* author: vldb                                                      */
/* date: 31/08/2021                                                  */
/* version: 1.0                                                      */
/* description: shreds json from load table into target table(s)     */
/*********************************************************************/

set search_path to mis,mis_load
;

truncate table aspects
;

insert into aspects
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
select cast(json_array_elements(Aspects) ->> 'AspectType' as varchar),
       cast(json_array_elements(Aspects) ->> 'Description' as varchar),
       cast(json_array_elements(Aspects) ->> 'ExternalId' as varchar),
       cast(json_array_elements(Aspects) ->> 'GradeSetId' as varchar),
       cast(json_array_elements(Aspects) ->> 'Id' as varchar),
       cast(json_array_elements(Aspects) ->> 'KS1' as varchar),
       cast(json_array_elements(Aspects) ->> 'KS2' as varchar),
       cast(json_array_elements(Aspects) ->> 'KS3' as varchar),
       cast(json_array_elements(Aspects) ->> 'LastUpdated' as varchar),
       cast(json_array_elements(Aspects) ->> 'Name' as varchar),
       cast(json_array_elements(Aspects) ->> 'RowHash' as varchar),
       cast(json_array_elements(Aspects) ->> 'Supplier' as varchar),
       cast('Sample File' as varchar),
       current_timestamp(0)
       from
(select assessmentstructure -> 'Aspects' as Aspects from assessmentstructure_load) dt1
;


truncate table resultsets
;

insert into resultsets
(externalid 
,id         
,lastupdated
,name       
,rowhash    
,supplier   
,samplefile
,audit_ts)
select cast(json_array_elements(ResultSets) ->> 'ExternalId' as varchar),
       cast(json_array_elements(ResultSets) ->> 'Id' as varchar),
       cast(json_array_elements(ResultSets) ->> 'LastUpdated' as varchar),
       cast(json_array_elements(ResultSets) ->> 'Name' as varchar),
       cast(json_array_elements(ResultSets) ->> 'RowHash' as varchar),
       cast(json_array_elements(ResultSets) ->> 'Supplier' as varchar),
       cast('Sample File' as varchar),
       current_timestamp(0)
       from
(select assessmentstructure -> 'ResultSets' as ResultSets from assessmentstructure_load) dt1
;

truncate table categories
;

insert into categories
(id          
,lastupdated 
,rowhash     
,categoryname
,samplefile
,audit_ts)
select cast(json_array_elements(Categories) ->> 'Id' as varchar),
       cast(json_array_elements(Categories) ->> 'LastUpdated' as varchar),
       cast(json_array_elements(Categories) ->> 'RowHash' as varchar),
       cast(json_array_elements(Categories) ->> 'categoryName' as varchar),
       cast('Sample File' as varchar),
       current_timestamp(0)
       from
(select assessmentstructure -> 'Categories' as Categories from assessmentstructure_load) dt1
;

/*
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