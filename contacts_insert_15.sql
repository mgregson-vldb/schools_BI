/*********************************************************************/
/* author: vldb                                                      */
/* date: 31/08/2021                                                  */
/* version: 1.0                                                      */
/* description: shreds json from load table into target table(s)     */
/*********************************************************************/

set search_path to mis,mis_load
;

truncate table contacts
;

insert into contacts
(addressblock
,apartment
,childidaasids
,childxids
,country
,county
,displayname
,district
,externalid
,forename
,homeemail
,homelanguage
,homelanguagecode
,homephone
,housename
,houseno
,id
,idaasid
,lastupdated
,mobilephone
,postcode
,rowhash
,street
,suffix
,surname
,title
,townorcity
,translatorrequired
,workemail
,workphone
,xid
,samplefile         
,audit_ts)
select cast(json_array_elements(Contacts) ->> 'AddressBlock' as varchar),
       cast(json_array_elements(Contacts) ->> 'Apartment' as varchar),
       cast(json_array_elements(Contacts) ->> 'ChildIdaasIds' as varchar),
       cast(json_array_elements(Contacts) ->> 'ChildXids' as varchar),
       cast(json_array_elements(Contacts) ->> 'Country' as varchar),
       cast(json_array_elements(Contacts) ->> 'County' as varchar),
       cast(json_array_elements(Contacts) ->> 'DisplayName' as varchar),
       cast(json_array_elements(Contacts) ->> 'District' as varchar),
       cast(json_array_elements(Contacts) ->> 'ExternalId' as varchar),
       cast(json_array_elements(Contacts) ->> 'Forename' as varchar),
       cast(json_array_elements(Contacts) ->> 'HomeEmail' as varchar),
       cast(json_array_elements(Contacts) ->> 'HomeLanguage' as varchar),
       cast(json_array_elements(Contacts) ->> 'HomeLanguageCode' as varchar),
       cast(json_array_elements(Contacts) ->> 'HomePhone' as varchar),
       cast(json_array_elements(Contacts) ->> 'HouseName' as varchar),
       cast(json_array_elements(Contacts) ->> 'HouseNo' as varchar),
       cast(json_array_elements(Contacts) ->> 'Id' as integer),
       cast(json_array_elements(Contacts) ->> 'IdaasId' as varchar),
       cast(json_array_elements(Contacts) ->> 'LastUpdated' as timestamp),
       cast(json_array_elements(Contacts) ->> 'MobilePhone' as varchar),
       cast(json_array_elements(Contacts) ->> 'PostCode' as varchar),
       cast(json_array_elements(Contacts) ->> 'RowHash' as varchar),
       cast(json_array_elements(Contacts) ->> 'Street' as varchar),
       cast(json_array_elements(Contacts) ->> 'Suffix' as varchar),
       cast(json_array_elements(Contacts) ->> 'Surname' as varchar),
       cast(json_array_elements(Contacts) ->> 'Title' as varchar),
       cast(json_array_elements(Contacts) ->> 'TownOrCity' as varchar),
       cast(json_array_elements(Contacts) ->> 'TranslatorRequired' as smallint),
       cast(json_array_elements(Contacts) ->> 'WorkEmail' as varchar),
       cast(json_array_elements(Contacts) ->> 'WorkPhone' as varchar),
       cast(json_array_elements(Contacts) ->> 'XID' as varchar),
       cast('Sample File' as varchar),
       current_timestamp(0)
       from
(select contacts -> 'Contacts' as Contacts from contacts_load) dt1
;