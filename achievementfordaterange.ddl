/*********************************************************************/
/* author: vldb                                                      */
/* date: 31/08/2021                                                  */
/* version: 1.0                                                      */
/* description: drops and creates target table(s)                    */
/*********************************************************************/

set search_path to mis,mis_load
;

drop table achievements
;

create table achievements
(achievementtype varchar not null
,activity        varchar
,category        varchar not null
,conductid       varchar not null
,date            date not null
,description     varchar
,id              integer not null
,lastupdated     timestamp not null
,recordedby      varchar not null
,recordedon      date not null
,rowhash         varchar not null
,staffids        varchar
,studentids      varchar
,subject         varchar
,samplefile      varchar not null
,audit_ts        timestamp(0))
;

drop table studentachievements
;

create table studentachievements
(achievementid integer not null
,id            varchar not null
,lastupdated   timestamp not null
,outcome       varchar
,outcomecode   varchar
,points        smallint not null
,rowhash       varchar not null
,studentid     integer not null
,samplefile    varchar not null
,audit_ts      timestamp(0))
;

drop table staffachievements
;

create table staffachievements
(achievementid integer not null
,id            varchar not null
,lastupdated   timestamp not null
,rowhash       varchar not null
,staffid       smallint not null
,staffrole     varchar
,samplefile    varchar not null
,audit_ts      timestamp(0))
;