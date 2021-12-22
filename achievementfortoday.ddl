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
(id              varchar
,conductid       varchar
,achievementtype varchar 
,date            varchar
,activity        varchar
,recordedby      varchar
,recordedon      varchar
,description     varchar
,category        varchar
,lastupdated     varchar
,rowhash         varchar
,samplefile      varchar
,audit_ts        timestamp(0)) -- audit timestamp from system clock
;     

drop table studentachievements
;

create table studentachievements   
(id            varchar
,studentid     varchar
,achievementid varchar
,points        varchar
,outcome       varchar
,outcomecode   varchar
,lastupdated   varchar
,rowhash       varchar
,samplefile    varchar
,audit_ts      timestamp(0)) -- audit timestamp from system clock
;     

drop table staffachievements
;

create table staffachievements  
(id            varchar
,staffid       varchar
,achievementid varchar
,staffrole     varchar
,lastupdated   varchar
,rowhash       varchar
,samplefile    varchar
,audit_ts      timestamp(0)) -- audit timestamp from system clock
;     
