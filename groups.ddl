/*********************************************************************/
/* author: vldb                                                      */
/* date: 31/08/2021                                                  */
/* version: 1.0                                                      */
/* description: drops and creates target table(s)                    */
/*********************************************************************/

set search_path to mis,mis_load
;

drop table groups
;

create table groups  
(code           varchar not null 
,externalid     varchar    
,id             integer not null        
,idaasid        varchar not null   
,lastupdated    timestamp not null  
,name           varchar not null 
,numstudents    smallint not null 
,primarystaffid smallint
,rowhash        varchar not null      
,staff          varchar         
,type           varchar not null       
,xid            varchar not null          
,filename       varchar not null
,audit_ts       timestamp(0)) -- audit timestamp from system clock
;  