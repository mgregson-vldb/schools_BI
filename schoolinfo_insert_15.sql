/*********************************************************************/
/* author: vldb                                                      */
/* date: 31/08/2021                                                  */
/* version: 1.0                                                      */
/* description: shreds json from load table into target table(s)     */
/*********************************************************************/

set search_path to mis,mis_load
;

truncate table schoolinfo
;

insert into schoolinfo
(address
,currentacademicyear
,denino
,email
,estabid
,examcentre
,governance
,head
,id
,lastupdated
,maincontact
,name
,phase
,rowhash
,schoollogoalternateurl
,schoollogourl
,telephone
,web
,samplefile
,audit_ts)
select cast(json_array_elements(SchoolInfo) ->> 'Address' as varchar),
       cast(json_array_elements(SchoolInfo) ->> 'CurrentAcademicYear' as smallint),
       cast(json_array_elements(SchoolInfo) ->> 'DeniNo' as varchar),
       cast(json_array_elements(SchoolInfo) ->> 'Email' as varchar),
       cast(json_array_elements(SchoolInfo) ->> 'EstabId' as integer),
       cast(json_array_elements(SchoolInfo) ->> 'ExamCentre' as integer),
       cast(json_array_elements(SchoolInfo) ->> 'Governance' as varchar),
       cast(json_array_elements(SchoolInfo) ->> 'Head' as varchar),
       cast(json_array_elements(SchoolInfo) ->> 'Id' as smallint),
       cast(json_array_elements(SchoolInfo) ->> 'LastUpdated' as timestamp),
       cast(json_array_elements(SchoolInfo) ->> 'MainContact' as varchar),
       cast(json_array_elements(SchoolInfo) ->> 'Name' as varchar),
       cast(json_array_elements(SchoolInfo) ->> 'Phase' as varchar),
       cast(json_array_elements(SchoolInfo) ->> 'RowHash' as varchar),
       cast(json_array_elements(SchoolInfo) ->> 'SchoolLogoAlternateUrl' as varchar),
       cast(json_array_elements(SchoolInfo) ->> 'SchoolLogoUrl' as varchar),
       cast(json_array_elements(SchoolInfo) ->> 'Telephone' as varchar),
       cast(json_array_elements(SchoolInfo) ->> 'Web' as varchar),
       cast('Sample File' as varchar),
       current_timestamp(0)
       from
(select schoolinfo -> 'SchoolInfo' as SchoolInfo from schoolinfo_load) dt1
;