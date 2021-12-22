/*********************************************************************/
/* author: vldb                                                      */
/* date: 31/08/2021                                                  */
/* version: 1.0                                                      */
/* description: drops and creates target table(s)                    */
/*********************************************************************/

set search_path to mis,mis_load
;

drop table staff
;

create table staff   
(addressblock    varchar  
,apartment       varchar
,country         varchar
,county          varchar
,dateofbirth     date not null
,displayname     varchar not null
,district        varchar
,employmentend   date
,employmentstart date not null
,externalid      varchar not null
,forename        varchar not null
,gender          varchar not null
,homeemail       varchar
,homephone       varchar
,housename       varchar
,houseno         smallint
,id              integer
,idaasemail      varchar
,idaasid         varchar
,issupply        varchar
,issupport       smallint
,isteacher       smallint
,lastupdated     timestamp
,legalforename   varchar not null
,legalsurname    varchar not null
,middlename      varchar
,mobilephone     varchar
,postcode        varchar
,reggroup        varchar
,rolecodes       varchar
,roles           varchar
,rowhash         varchar
,staffcode       varchar
,staffstatus     varchar
,street          varchar
,suffix          varchar
,surname         varchar
,teachercategory varchar
,teachernumber   varchar
,title           varchar
,townorcity      varchar
,workemail       varchar
,workphone       varchar
,xid             varchar
,samplefile      varchar
,audit_ts        timestamp(0)) -- audit timestamp from system clock
;   