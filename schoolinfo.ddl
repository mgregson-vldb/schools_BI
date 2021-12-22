/*********************************************************************/
/* author: vldb                                                      */
/* date: 31/08/2021                                                  */
/* version: 1.0                                                      */
/* description: drops and creates target table(s)                    */
/*********************************************************************/

set search_path to mis,mis_load
;

drop table schoolinfo
;

create table schoolinfo 
(address                varchar not null
,currentacademicyear    smallint not null
,denino                 varchar not null
,email                  varchar not null
,estabid                integer not null
,examcentre             integer not null
,governance             varchar not null
,head                   varchar not null
,id                     smallint not null
,lastupdated            timestamp not null
,maincontact            varchar not null
,name                   varchar not null
,phase                  varchar not null
,rowhash                varchar not null
,schoollogoalternateurl varchar
,schoollogourl          varchar
,telephone              varchar not null
,web                    varchar
,samplefile             varchar not null
,audit_ts               timestamp(0))
;