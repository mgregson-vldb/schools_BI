/*********************************************************************/
/* author: vldb                                                      */
/* date: 31/08/2021                                                  */
/* version: 1.0                                                      */
/* description: shreds json from load table into target table(s)     */
/*********************************************************************/

set search_path to mis,mis_load
;

truncate table achievements
;

insert into achievements
(id
,conductid
,achievementtype
,date
,activity
,recordedby
,recordedon
,description
,category
,lastupdated
,rowhash
,samplefile
,audit_ts)
select cast(json_array_elements(Achievements) ->> 'Id' as varchar),
       cast(json_array_elements(Achievements) ->> 'ConductId' as varchar),
       cast(json_array_elements(Achievements) ->> 'AchievementType' as varchar),
       cast(json_array_elements(Achievements) ->> 'Date' as varchar),
       cast(json_array_elements(Achievements) ->> 'Activity' as varchar),
       cast(json_array_elements(Achievements) ->> 'RecordedBy' as varchar),
       cast(json_array_elements(Achievements) ->> 'RecordedOn' as varchar),
       cast(json_array_elements(Achievements) ->> 'Desription' as varchar),
       cast(json_array_elements(Achievements) ->> 'Category' as varchar),
       cast(json_array_elements(Achievements) ->> 'LastUpdated' as varchar),
       cast(json_array_elements(Achievements) ->> 'RowHash' as varchar),
       cast('Sample File' as varchar),
       current_timestamp(0)
       from
(select achievementfortoday -> 'Achievements' as Achievements from achievementfortoday_load) dt1
;

truncate table studentachievements
;

insert into studentachievements
(id           
,studentid    
,achievementid
,points       
,outcome      
,outcomecode  
,lastupdated  
,rowhash
,samplefile   
,audit_ts)
select cast(json_array_elements(StudentAchievements) ->> 'Id' as varchar),
       cast(json_array_elements(StudentAchievements) ->> 'StudentId' as varchar),
       cast(json_array_elements(StudentAchievements) ->> 'AchievementId' as varchar),
       cast(json_array_elements(StudentAchievements) ->> 'Points' as varchar),
       cast(json_array_elements(StudentAchievements) ->> 'Outcome' as varchar),
       cast(json_array_elements(StudentAchievements) ->> 'OutcomeCode' as varchar),
       cast(json_array_elements(StudentAchievements) ->> 'LastUpdated' as varchar),
       cast(json_array_elements(StudentAchievements) ->> 'RowHash' as varchar),
       cast('Sample File' as varchar),
       current_timestamp(0)
       from
(select achievementfortoday -> 'StudentAchievements' as StudentAchievements from achievementfortoday_load) dt1
;

truncate table staffachievements
;

insert into staffachievements
(id            
,staffid       
,achievementid 
,staffrole     
,lastupdated    
,rowhash       
,samplefile   
,audit_ts)
select cast(json_array_elements(StaffAchievements) ->> 'Id' as varchar),
       cast(json_array_elements(StaffAchievements) ->> 'StaffId' as varchar),
       cast(json_array_elements(StaffAchievements) ->> 'AchievementId' as varchar),
       cast(json_array_elements(StaffAchievements) ->> 'StaffRole' as varchar),
       cast(json_array_elements(StaffAchievements) ->> 'LastUpdated' as varchar),
       cast(json_array_elements(StaffAchievements) ->> 'RowHash' as varchar),
       cast('Sample File' as varchar),
       current_timestamp(0)
       from
(select achievementfortoday -> 'StaffAchievements' as StaffAchievements from achievementfortoday_load) dt1
;