/*********************************************************************/
/* author: vldb                                                      */
/* date: 31/08/2021                                                  */
/* version: 1.0                                                      */
/* description: drops and creates target table(s)                    */
/*********************************************************************/

set search_path to mis,mis_load
;

drop table conducttypes
;

create table conducttypes
(description   varchar not null
,displayorder  smallint not null
,id            varchar not null
,lastupdated   timestamp not null
,localid       smallint not null
,points        smallint not null
,rowhash       varchar not null
,subtypelookup varchar
,type          varchar not null
,samplefile    varchar not null
,audit_ts      timestamp(0))
;

drop table conductlookups
;

create table conductlookups
(code         varchar not null
,description  varchar not null
,displayorder smallint not null
,id           varchar not null
,lastupdated  timestamp not null
,localid      smallint not null
,lookuptype   varchar not null
,rowhash      varchar not null
,samplefile   varchar not null
,audit_ts     timestamp(0))
;