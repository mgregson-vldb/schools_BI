/*********************************************************************/
/* author: vldb                                                      */
/* date: 31/08/2021                                                  */
/* version: 1.0                                                      */
/* description: drops and creates target table(s)                    */
/*********************************************************************/

set search_path to mis,mis_load
;

drop table contacts
;

create table contacts   
(addressblock       varchar
,apartment          varchar
,childidaasids      varchar
,childxids          varchar
,country            varchar
,county             varchar
,displayname        varchar not null
,district           varchar
,externalid         varchar not null
,forename           varchar
,homeemail          varchar
,homelanguage       varchar
,homelanguagecode   varchar
,homephone          varchar
,housename          varchar
,houseno            varchar
,id                 integer not null
,idaasid            varchar not null
,lastupdated        timestamp not null
,mobilephone        varchar
,postcode           varchar
,rowhash            varchar not null
,street             varchar
,suffix             varchar
,surname            varchar not null
,title              varchar
,townorcity         varchar
,translatorrequired smallint not null
,workemail          varchar
,workphone          varchar
,xid                varchar not null
,samplefile         varchar not null
,audit_ts           timestamp(0)) -- audit timestamp from system clock
;   