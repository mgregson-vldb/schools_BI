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
(achievementtype
,activity
,category
,conductid
,date
,description
,id
,lastupdated
,recordedby
,recordedon
,rowhash
,staffids
,studentids
,subject
,samplefile
,audit_ts)
select cast(json_array_elements(Achievements) ->> 'AchievementType' as varchar),
       cast(json_array_elements(Achievements) ->> 'Activity' as varchar),
       cast(json_array_elements(Achievements) ->> 'Category' as varchar),
       cast(json_array_elements(Achievements) ->> 'ConductId' as varchar),
       cast(json_array_elements(Achievements) ->> 'Date' as date),
       cast(json_array_elements(Achievements) ->> 'Description' as varchar),
       cast(json_array_elements(Achievements) ->> 'Id' as integer),
       cast(json_array_elements(Achievements) ->> 'LastUpdated' as timestamp),
       cast(json_array_elements(Achievements) ->> 'RecordedBy' as varchar),
       cast(json_array_elements(Achievements) ->> 'RecordedOn' as date),
       cast(json_array_elements(Achievements) ->> 'RowHash' as varchar),
       cast(json_array_elements(Achievements) ->> 'StaffIds' as varchar),
       cast(json_array_elements(Achievements) ->> 'StudentIds' as varchar),
       cast(json_array_elements(Achievements) ->> 'Subject' as varchar),
       cast('Sample File' as varchar),
       current_timestamp(0)
       from
(select achievementfordaterange -> 'Achievements' as Achievements from achievementfordaterange_load) dt1
;

truncate table studentachievements
;

insert into studentachievements
(achievementid
,id
,lastupdated
,outcome
,outcomecode
,points
,rowhash
,studentid
,samplefile
,audit_ts)
select cast(json_array_elements(StudentAchievements) ->> 'AchievementId' as integer),
       cast(json_array_elements(StudentAchievements) ->> 'Id' as varchar),
       cast(json_array_elements(StudentAchievements) ->> 'LastUpdated' as timestamp),
       cast(json_array_elements(StudentAchievements) ->> 'Outcome' as varchar),
       cast(json_array_elements(StudentAchievements) ->> 'OutcomeCode' as varchar),
       cast(json_array_elements(StudentAchievements) ->> 'Points' as smallint),
       cast(json_array_elements(StudentAchievements) ->> 'RowHash' as varchar),
       cast(json_array_elements(StudentAchievements) ->> 'StudentId' as integer),
       cast('Sample File' as varchar),
       current_timestamp(0)
       from
(select achievementfordaterange -> 'StudentAchievements' as StudentAchievements from achievementfordaterange_load) dt1
;

truncate table staffachievements
;

insert into staffachievements
(achievementid
,id
,lastupdated
,rowhash
,staffid
,staffrole
,samplefile
,audit_ts)
select cast(json_array_elements(StaffAchievements) ->> 'AchievementId' as integer),
       cast(json_array_elements(StaffAchievements) ->> 'Id' as varchar),
       cast(json_array_elements(StaffAchievements) ->> 'LastUpdated' as timestamp),
       cast(json_array_elements(StaffAchievements) ->> 'RowHash' as varchar),
       cast(json_array_elements(StaffAchievements) ->> 'StaffId' as smallint),
       cast(json_array_elements(StaffAchievements) ->> 'StaffRole' as varchar),
       cast('Sample File' as varchar),
       current_timestamp(0)
       from
(select achievementfordaterange -> 'StaffAchievements' as StaffAchievements from achievementfordaterange_load) dt1
;