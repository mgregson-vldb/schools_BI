/*********************************************************************/
/* author: vldb                                                      */
/* date: 31/08/2021                                                  */
/* version: 1.0                                                      */
/* description: shreds json from load table into target table(s)     */
/*********************************************************************/

set search_path to mis,mis_load
;

truncate table conductpoints
;

insert into conductpoints
(id
,lastupdated  
,numberofdetentions           
,numberofinterventions   
,numberofreportcards  
,rowhash 
,totalachievementincidents 
,totalachievementpoints
,totalbehaviourincidents      
,totalbehaviourpoints         
,totalconductincidents        
,totalconductpoints            
,samplefile 
,audit_ts)
select cast(json_array_elements(ConductPoints) ->> 'Id' as integer),
       cast(json_array_elements(ConductPoints) ->> 'LastUpdated' as timestamp),
       cast(json_array_elements(ConductPoints) ->> 'NumberofDetentions' as smallint),
       cast(json_array_elements(ConductPoints) ->> 'NumberofInterventions' as smallint),
       cast(json_array_elements(ConductPoints) ->> 'NumberofReportCards' as smallint),
       cast(json_array_elements(ConductPoints) ->> 'RowHash' as varchar),
       cast(json_array_elements(ConductPoints) ->> 'TotalAchievementIncidents' as smallint),
       cast(json_array_elements(ConductPoints) ->> 'TotalAchievementPoints' as smallint),
       cast(json_array_elements(ConductPoints) ->> 'TotalBehaviourIncidents' as smallint),
       cast(json_array_elements(ConductPoints) ->> 'TotalBehaviourPoints' as smallint),
       cast(json_array_elements(ConductPoints) ->> 'TotalConductIncidents' as smallint),
       cast(json_array_elements(ConductPoints) ->> 'TotalConductPoints' as smallint),
       cast('Sample File' as varchar),
       current_timestamp(0)
       from
(select conductpoints -> 'ConductPoints' as ConductPoints from conductpoints_load) dt1
;
  
truncate table weeklystats
;

insert into weeklystats
(id 
,weekinterventions    
,weeklyachievementevents 
,weeklyachievementpoints  
,weeklybehaviourincidents 
,weeklybehaviourpoints 
,weeklydetentionsfuture
,weeklydetentionstotal               
,samplefile
,audit_ts)
select cast(json_array_elements(WeeklyStats) ->> 'Id' as varchar),
       cast(json_array_elements(WeeklyStats) ->> 'WeekInterventions' as varchar),
       cast(json_array_elements(WeeklyStats) ->> 'WeeklyAchievementEvents' as varchar),
       cast(json_array_elements(WeeklyStats) ->> 'WeeklyAchievementPoints' as varchar),
       cast(json_array_elements(WeeklyStats) ->> 'WeeklyBehaviourIncidents' as varchar),
       cast(json_array_elements(WeeklyStats) ->> 'WeeklyBehaviourPoints' as varchar),
       cast(json_array_elements(WeeklyStats) ->> 'WeeklyDetentionsFuture' as varchar),
       cast(json_array_elements(WeeklyStats) ->> 'WeeklyDetentionsTotal' as varchar),
       cast('Sample File' as varchar),
       current_timestamp(0)
       from
(select conductpoints -> 'WeeklyStats' as WeeklyStats from conductpoints_load) dt1
;   

truncate table termlystats
;

insert into termlystats
(id 
,term    
,termachievementevents 
,termachievementpoints    
,termbehaviourincidents 
,termbehaviourpoints 
,termdetentions
,terminterventions             
,samplefile
,audit_ts)
select cast(json_array_elements(TermlyStats) ->> 'Id' as varchar),
       cast(json_array_elements(TermlyStats) ->> 'Term' as varchar),
       cast(json_array_elements(TermlyStats) ->> 'TermAchievementEvents' as varchar),
       cast(json_array_elements(TermlyStats) ->> 'TermAchievementPoints' as varchar),
       cast(json_array_elements(TermlyStats) ->> 'TermBehaviourIncidents' as varchar),
       cast(json_array_elements(TermlyStats) ->> 'TermBehaviourPoints' as varchar),
       cast(json_array_elements(TermlyStats) ->> 'TermDetentions' as varchar),
       cast(json_array_elements(TermlyStats) ->> 'TermInterventions' as varchar),
       cast('Sample File' as varchar),
       current_timestamp(0)
       from
(select conductpoints -> 'TermlyStats' as TermlyStats from conductpoints_load) dt1
;