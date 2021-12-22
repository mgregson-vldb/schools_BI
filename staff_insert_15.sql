/*********************************************************************/
/* author: vldb                                                      */
/* date: 31/08/2021                                                  */
/* version: 1.0                                                      */
/* description: shreds json from load table into target table(s)     */
/*********************************************************************/

set search_path to mis,mis_load
;

truncate table staff
;

insert into staff
(addressblock
,apartment
,country
,county
,dateofbirth
,displayname
,district
,employmentend
,employmentstart
,externalid
,forename
,gender
,homeemail
,homephone
,housename
,houseno
,id
,idaasemail
,idaasid
,issupply
,issupport
,isteacher
,lastupdated
,legalforename
,legalsurname
,middlename
,mobilephone
,postcode
,reggroup
,rolecodes
,roles
,rowhash
,staffcode
,staffstatus
,street
,suffix
,surname
,teachercategory
,teachernumber
,title
,townorcity
,workemail
,workphone
,xid
,samplefile         
,audit_ts)
select cast(json_array_elements(Staff) ->> 'AddressBlock' as varchar),
       cast(json_array_elements(Staff) ->> 'Apartment' as varchar),
       cast(json_array_elements(Staff) ->> 'Country' as varchar),
       cast(json_array_elements(Staff) ->> 'County' as varchar),
       cast(json_array_elements(Staff) ->> 'DateOfBirth' as date),
       cast(json_array_elements(Staff) ->> 'DisplayName' as varchar),
       cast(json_array_elements(Staff) ->> 'District' as varchar),
       cast(json_array_elements(Staff) ->> 'EmploymentEnd' as date),
       cast(json_array_elements(Staff) ->> 'EmploymentStart' as date),
       cast(json_array_elements(Staff) ->> 'ExternalId' as varchar),
       cast(json_array_elements(Staff) ->> 'Forename' as varchar),
       cast(json_array_elements(Staff) ->> 'Gender' as varchar),
       cast(json_array_elements(Staff) ->> 'HomeEmail' as varchar),
       cast(json_array_elements(Staff) ->> 'HomePhone' as varchar),
       cast(json_array_elements(Staff) ->> 'HouseName' as varchar),
       cast(json_array_elements(Staff) ->> 'HouseNo' as smallint),
       cast(json_array_elements(Staff) ->> 'Id' as integer),
       cast(json_array_elements(Staff) ->> 'IdaasEmail' as varchar),
       cast(json_array_elements(Staff) ->> 'IdaasId' as varchar),
       cast(json_array_elements(Staff) ->> 'IsSupply' as varchar),
       cast(json_array_elements(Staff) ->> 'IsSupport' as smallint),
       cast(json_array_elements(Staff) ->> 'IsTeacher' as smallint),
       cast(json_array_elements(Staff) ->> 'LastUpdated' as timestamp),
       cast(json_array_elements(Staff) ->> 'LegalForename' as varchar),
       cast(json_array_elements(Staff) ->> 'LegalSurname' as varchar),
       cast(json_array_elements(Staff) ->> 'MiddleName' as varchar),
       cast(json_array_elements(Staff) ->> 'MobilePhone' as varchar),
       cast(json_array_elements(Staff) ->> 'PostCode' as varchar),
       cast(json_array_elements(Staff) ->> 'RegGroup' as varchar),
       cast(json_array_elements(Staff) ->> 'RoleCodes' as varchar),
       cast(json_array_elements(Staff) ->> 'Roles' as varchar),
       cast(json_array_elements(Staff) ->> 'RowHash' as varchar),
       cast(json_array_elements(Staff) ->> 'StaffCode' as varchar),
       cast(json_array_elements(Staff) ->> 'StaffStatus' as varchar),
       cast(json_array_elements(Staff) ->> 'Street' as varchar),
       cast(json_array_elements(Staff) ->> 'Suffix' as varchar),
       cast(json_array_elements(Staff) ->> 'Surname' as varchar),
       cast(json_array_elements(Staff) ->> 'TeacherCategory' as varchar),
       cast(json_array_elements(Staff) ->> 'TeacherNumber' as varchar),
       cast(json_array_elements(Staff) ->> 'Title' as varchar),
       cast(json_array_elements(Staff) ->> 'TownOrCity' as varchar),
       cast(json_array_elements(Staff) ->> 'WorkEmail' as varchar),
       cast(json_array_elements(Staff) ->> 'WorkPhone' as varchar),
       cast(json_array_elements(Staff) ->> 'XID' as varchar),
       cast('Sample File' as varchar),
       current_timestamp(0)
from   (select staff -> 'Staff' as Staff 
        from   staff_load) dt1

;