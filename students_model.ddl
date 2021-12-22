/*********************************************************************/
/* author: vldb                                                      */
/* date: 31/08/2021                                                  */
/* version: 1.0                                                      */
/* description: drops and creates target table(s)                    */
/*********************************************************************/

set search_path to mis_model,mis_load
;

drop table students 
;

create table students
(addressblock varchar  
,admissionno varchar not null
,apartment varchar
,asylumstatus varchar
,boarder boolean not null
,boardinghouse varchar
,country varchar  
,county varchar
,dateofbirth date not null
,destination varchar
,destinationstartdate varchar
,displayname varchar not null
,district varchar
,eal boolean not null
,englishproficiencylevel varchar
,enrolmentstatus varchar not null
,entrydate date not null
,ethnicity varchar
,ethnicitycode varchar
,ethnicitysource varchar
,everincare boolean not null
,externalid varchar not null
,fsmever6 smallint not null
,firstlanguage varchar
,firstlanguagecode varchar
,firstlanguagesource varchar
,forename varchar not null
,fsmeligible varchar
,fsmenddate date
,fsmstartdate date
,gender varchar not null
,gifted boolean not null
,homelanguage varchar
,homelanguagecode varchar
,housegroup varchar  
,housegroupid smallint  
,housename varchar
,houseno varchar
,id integer not null primary key
,idaasemail varchar
,idaasid varchar not null
,inleacare boolean not null
,istraveller boolean not null
,isyoungcarer boolean not null
,keystage varchar not null
,lastupdated timestamp not null
,leacareauthority varchar
,leavingdate varchar
,legalforename varchar not null
,legalsurname varchar not null
,middlename varchar
,modeoftravel varchar
,nationalidentity varchar
,nationality varchar  
,onreport boolean not null
,parentalsalutation varchar
,parttime boolean not null
,postcode varchar
,pupilpremium boolean not null
,reasonforleaving varchar
,reggroup varchar not null
,reggroupid integer not null
,religion varchar
,religioncode varchar
,rowhash varchar not null
,senprovision varchar
,servicechild boolean not null
,servicechildsource varchar
,standardyeargroupcode smallint not null
,standardyeargroupname varchar not null
,street varchar
,studentstatus varchar
,surname varchar not null
,townorcity varchar
,travellersource varchar
,upn varchar
,uniformallowance boolean not null
,uniquelearnernumber bigint  
,workemail varchar
,xid varchar not null
,yssa varchar
,yeargroup varchar not null
,yeargroupid smallint not null
,yeartaughtin smallint not null
,formerupn varchar 
,samplefile    varchar not null     
,audit_ts                  timestamp(0)
)
;