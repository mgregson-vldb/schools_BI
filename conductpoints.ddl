/*********************************************************************/
/* author: vldb                                                      */
/* date: 31/08/2021                                                  */
/* version: 1.0                                                      */
/* description: drops and creates target table(s)                    */
/*********************************************************************/

set search_path to mis,mis_load
;

drop table conductpoints
;

create table conductpoints   
(id 				  	   integer  
,lastupdated 		  	   timestamp      
,numberofdetentions    	   smallint            
,numberofinterventions	   smallint     
,numberofreportcards  	   smallint    
,rowhash			       varchar  
,totalachievementincidents smallint   
,totalachievementpoints    smallint  
,totalbehaviourincidents   smallint        
,totalbehaviourpoints      smallint           
,totalconductincidents 	   smallint          
,totalconductpoints 	   smallint   
,samplefile 	           varchar        
,audit_ts 				   timestamp(0)) -- audit timestamp from system clock
;     

drop table weeklystats
;

create table weeklystats  
(id varchar
,weekinterventions varchar    
,weeklyachievementevents varchar          
,weeklyachievementpoints varchar   
,weeklybehaviourincidents varchar  
,weeklybehaviourpoints varchar 
,weeklydetentionsfuture varchar 
,weeklydetentionstotal varchar
,samplefile varchar                
,audit_ts timestamp(0)) -- audit timestamp from system clock
;   

drop table termlystats
;

create table termlystats  
(id varchar
,term varchar    
,termachievementevents varchar          
,termachievementpoints varchar   
,termbehaviourincidents varchar  
,termbehaviourpoints varchar 
,termdetentions varchar 
,terminterventions varchar
,samplefile varchar                
,audit_ts timestamp(0)) -- audit timestamp from system clock
;  