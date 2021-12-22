/*********************************************************************/
/* author: vldb                                                      */
/* date: 31/08/2021                                                  */
/* version: 1.0                                                      */
/* description: shreds json from load table into target table(s)     */
/*********************************************************************/

set search_path to mis,mis_load
;

truncate table students
;

insert into students
(addressblock
,admissionno
,apartment
,asylumstatus
,boarder
,boardinghouse
,country
,county
,dateofbirth
,destination
,destinationstartdate
,displayname
,district
,eal
,englishproficiencylevel
,enrolmentstatus
,entrydate
,ethnicity
,ethnicitycode
,ethnicitysource
,everincare
,externalid
,fsmever6
,firstlanguage
,firstlanguagecode
,firstlanguagesource
,forename
,fsmeligible
,fsmenddate
,fsmstartdate
,gender
,gifted
,homelanguage
,homelanguagecode
,housegroup
,housegroupid
,housename
,houseno
,id
,idaasemail
,idaasid
,inleacare
,istraveller
,isyoungcarer
,keystage
,lastupdated
,leacareauthority
,leavingdate
,legalforename
,legalsurname
,middlename
,modeoftravel
,nationalidentity
,nationality
,onreport
,parentalsalutation
,parttime
,postcode
,pupilpremium
,reasonforleaving
,reggroup
,reggroupid
,religion
,religioncode
,rowhash
,senprovision
,servicechild
,servicechildsource
,standardyeargroupcode
,standardyeargroupname
,street
,studentstatus
,surname
,townorcity
,travellersource
,upn
,uniformallowance
,uniquelearnernumber
,workemail
,xid
,yssa
,yeargroup
,yeargroupid
,yeartaughtin
,formerupn
,samplefile         
,audit_ts)
select cast(json_array_elements(Students) ->> 'AddressBlock' as varchar),
       cast(json_array_elements(Students) ->> 'AdmissionNo' as varchar),
       cast(json_array_elements(Students) ->> 'Apartment' as varchar),
       cast(json_array_elements(Students) ->> 'AsylumStatus' as varchar),
       cast(json_array_elements(Students) ->> 'Boarder' as boolean),
       cast(json_array_elements(Students) ->> 'BoardingHouse' as varchar),
       cast(json_array_elements(Students) ->> 'Country' as varchar),
       cast(json_array_elements(Students) ->> 'County' as varchar),
       cast(json_array_elements(Students) ->> 'DateofBirth' as date),
       cast(json_array_elements(Students) ->> 'Destination' as varchar),
       cast(json_array_elements(Students) ->> 'DestinationStartDate' as varchar),
       cast(json_array_elements(Students) ->> 'DisplayName' as varchar),
       cast(json_array_elements(Students) ->> 'District' as varchar),
       cast(json_array_elements(Students) ->> 'EAL' as boolean),
       cast(json_array_elements(Students) ->> 'EnglishProficiencyLevel' as varchar),
       cast(json_array_elements(Students) ->> 'EnrolmentStatus' as varchar),
       cast(json_array_elements(Students) ->> 'EntryDate' as date),
       cast(json_array_elements(Students) ->> 'Ethnicity' as varchar),
       cast(json_array_elements(Students) ->> 'EthnicityCode' as varchar),
       cast(json_array_elements(Students) ->> 'EthnicitySource' as varchar),
       cast(json_array_elements(Students) ->> 'EverInCare' as boolean),
       cast(json_array_elements(Students) ->> 'ExternalId' as varchar),
       cast(json_array_elements(Students) ->> 'FSMEver6' as smallint),
       cast(json_array_elements(Students) ->> 'FirstLanguage' as varchar),
       cast(json_array_elements(Students) ->> 'FirstLanguageCode' as varchar),
       cast(json_array_elements(Students) ->> 'FirstLanguageSource' as varchar),
       cast(json_array_elements(Students) ->> 'Forename' as varchar),
       cast(json_array_elements(Students) ->> 'FsmEligible' as varchar),
       cast(json_array_elements(Students) ->> 'FsmEndDate' as date),
       cast(json_array_elements(Students) ->> 'FsmStartDate' as date),
       cast(json_array_elements(Students) ->> 'Gender' as varchar),
       cast(json_array_elements(Students) ->> 'Gifted' as boolean),
       cast(json_array_elements(Students) ->> 'HomeLanguage' as varchar),
       cast(json_array_elements(Students) ->> 'HomeLanguageCode' as varchar),
       cast(json_array_elements(Students) ->> 'HouseGroup' as varchar),
       cast(json_array_elements(Students) ->> 'HouseGroupId' as smallint),
       cast(json_array_elements(Students) ->> 'HouseName' as varchar),
       cast(json_array_elements(Students) ->> 'HouseNo' as varchar),
       cast(json_array_elements(Students) ->> 'Id' as integer),
       cast(json_array_elements(Students) ->> 'IdaasEmail' as varchar),
       cast(json_array_elements(Students) ->> 'IdaasId' as varchar),
       cast(json_array_elements(Students) ->> 'InLeaCare' as boolean),
       cast(json_array_elements(Students) ->> 'IsTraveller' as boolean),
       cast(json_array_elements(Students) ->> 'IsYoungCarer' as boolean),
       cast(json_array_elements(Students) ->> 'KeyStage' as varchar),
       cast(json_array_elements(Students) ->> 'LastUpdated' as timestamp),
       cast(json_array_elements(Students) ->> 'LeaCareAuthority' as varchar),
       cast(json_array_elements(Students) ->> 'LeavingDate' as varchar),
       cast(json_array_elements(Students) ->> 'LegalForename' as varchar),
       cast(json_array_elements(Students) ->> 'LegalSurname' as varchar),
       cast(json_array_elements(Students) ->> 'MiddleName' as varchar),
       cast(json_array_elements(Students) ->> 'ModeOfTravel' as varchar),
       cast(json_array_elements(Students) ->> 'NationalIdentity' as varchar),
       cast(json_array_elements(Students) ->> 'Nationality' as varchar),
       cast(json_array_elements(Students) ->> 'OnReport' as boolean),
       cast(json_array_elements(Students) ->> 'ParentalSalutation' as varchar),
       cast(json_array_elements(Students) ->> 'PartTime' as boolean),
       cast(json_array_elements(Students) ->> 'PostCode' as varchar),
       cast(json_array_elements(Students) ->> 'PupilPremium' as boolean),
       cast(json_array_elements(Students) ->> 'ReasonForLeaving' as varchar),
       cast(json_array_elements(Students) ->> 'RegGroup' as varchar),
       cast(json_array_elements(Students) ->> 'RegGroupId' as integer),
       cast(json_array_elements(Students) ->> 'Religion' as varchar),
       cast(json_array_elements(Students) ->> 'ReligionCode' as varchar),
       cast(json_array_elements(Students) ->> 'RowHash' as varchar),
       cast(json_array_elements(Students) ->> 'SENProvision' as varchar),
       cast(json_array_elements(Students) ->> 'ServiceChild' as boolean),
       cast(json_array_elements(Students) ->> 'ServiceChildSource' as varchar),
       cast(json_array_elements(Students) ->> 'StandardYearGroupCode' as smallint),
       cast(json_array_elements(Students) ->> 'StandardYearGroupName' as varchar),
       cast(json_array_elements(Students) ->> 'Street' as varchar),
       cast(json_array_elements(Students) ->> 'StudentStatus' as varchar),
       cast(json_array_elements(Students) ->> 'Surname' as varchar),
       cast(json_array_elements(Students) ->> 'TownOrCity' as varchar),
       cast(json_array_elements(Students) ->> 'TravellerSource' as varchar),
       cast(json_array_elements(Students) ->> 'UPN' as varchar),
       cast(json_array_elements(Students) ->> 'UniformAllowance' as boolean),
       cast(json_array_elements(Students) ->> 'UniqueLearnerNumber' as bigint),
       cast(json_array_elements(Students) ->> 'WorkEmail' as varchar),
       cast(json_array_elements(Students) ->> 'XID' as varchar),
       cast(json_array_elements(Students) ->> 'YSSA' as varchar),
       cast(json_array_elements(Students) ->> 'YearGroup' as varchar),
       cast(json_array_elements(Students) ->> 'YearGroupId' as smallint),
       cast(json_array_elements(Students) ->> 'YearTaughtIn' as smallint),
       cast(json_array_elements(Students) ->> 'formerUPN' as varchar),
       cast('Sample File' as varchar),
       current_timestamp(0)
       from
(select Students -> 'Students' as Students from students_load) dt1
;