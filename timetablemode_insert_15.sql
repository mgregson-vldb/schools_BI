/*********************************************************************/
/* author: vldb                                                      */
/* date: 31/08/2021                                                  */
/* version: 1.0                                                      */
/* description: shreds json from load table into target table(s)     */
/*********************************************************************/

set search_path to mis,mis_load
;

truncate table timetables
;

insert into timetables
(dayspercycle
,description
,enddate
,id
,periodspercycle
,startdate
,teachingperiodspercycle
,samplefile
,audit_ts)
select cast(json_array_elements(Timetables) ->> 'DaysPerCycle' as varchar),
       cast(json_array_elements(Timetables) ->> 'Description' as varchar),
       cast(json_array_elements(Timetables) ->> 'EndDate' as varchar),
       cast(json_array_elements(Timetables) ->> 'Id' as varchar),
       cast(json_array_elements(Timetables) ->> 'PeriodsPerCycle' as varchar),
       cast(json_array_elements(Timetables) ->> 'StartDate' as varchar),
       cast(json_array_elements(Timetables) ->> 'TeachingPeriodsPerCycle' as varchar),
       cast('Sample File' as varchar),
       current_timestamp(0)
       from
(select timetablemode -> 'Timetables' as Timetables from timetablemode_load) dt1
;

truncate table timetabledays
;

insert into timetabledays
(dayname
,id
,sequence
,timetableid
,samplefile
,audit_ts)
select cast(json_array_elements(TimetableDays) ->> 'DayName' as varchar),
       cast(json_array_elements(TimetableDays) ->> 'Id' as varchar),
       cast(json_array_elements(TimetableDays) ->> 'Sequence' as varchar),
       cast(json_array_elements(TimetableDays) ->> 'TimetableId' as varchar),
       cast('Sample File' as varchar),
       current_timestamp(0)
       from
(select timetablemode -> 'TimetableDays' as TimetableDays from timetablemode_load) dt1
;

truncate table timetableperiods
;

insert into timetableperiods
(endtime
,id
,periodname
,sequence
,starttime
,timetabledayid
,samplefile
,audit_ts)
select cast(json_array_elements(TimetablePeriods) ->> 'EndTime' as varchar),
       cast(json_array_elements(TimetablePeriods) ->> 'Id' as varchar),
       cast(json_array_elements(TimetablePeriods) ->> 'PeriodName' as varchar),
       cast(json_array_elements(TimetablePeriods) ->> 'Sequence' as varchar),
       cast(json_array_elements(TimetablePeriods) ->> 'StartTime' as varchar),
       cast(json_array_elements(TimetablePeriods) ->> 'TimetableDayId' as varchar),
       cast('Sample File' as varchar),
       current_timestamp(0)
       from
(select timetablemode -> 'TimetablePeriods' as TimetablePeriods from timetablemode_load) dt1
;

truncate table timetablelessons
;

insert into timetablelessons
(id
,timetableperiodid
,samplefile
,audit_ts)
select cast(json_array_elements(TimetableLessons) ->> 'Id' as varchar),
       cast(json_array_elements(TimetableLessons) ->> 'TimetablePeriodId' as varchar),
       cast('Sample File' as varchar),
       current_timestamp(0)
       from
(select timetablemode -> 'TimetableLessons' as TimetableLessons from timetablemode_load) dt1
;

truncate table lessonclasses
;

insert into lessonclasses
(groupid
,groupname
,id
,subjectid
,subjectname
,timetablelessonid
,samplefile
,audit_ts)
select cast(json_array_elements(LessonClasses) ->> 'GroupId' as varchar),
       cast(json_array_elements(LessonClasses) ->> 'GroupName' as varchar),
       cast(json_array_elements(LessonClasses) ->> 'Id' as varchar),
       cast(json_array_elements(LessonClasses) ->> 'SubjectId' as varchar),
       cast(json_array_elements(LessonClasses) ->> 'SubjectName' as varchar),
       cast(json_array_elements(LessonClasses) ->> 'TimetableLessonId' as varchar),
       cast('Sample File' as varchar),
       current_timestamp(0)
       from
(select timetablemode -> 'LessonClasses' as LessonClasses from timetablemode_load) dt1
;

truncate table lessonstaff
;

insert into lessonstaff
(id
,staffid
,timetablelessonid
,samplefile
,audit_ts)
select cast(json_array_elements(LessonStaff) ->> 'Id' as varchar),
       cast(json_array_elements(LessonStaff) ->> 'StaffId' as varchar),
       cast(json_array_elements(LessonStaff) ->> 'TimetableLessonId' as varchar),
       cast('Sample File' as varchar),
       current_timestamp(0)
       from
(select timetablemode -> 'LessonStaff' as LessonStaff from timetablemode_load) dt1
;

truncate table lessonrooms
;

insert into lessonrooms
(id
,roomcode
,roomid
,roomname
,timetablelessonid
,samplefile
,audit_ts)
select cast(json_array_elements(LessonRooms) ->> 'Id' as varchar),
       cast(json_array_elements(LessonRooms) ->> 'RoomCode' as varchar),
       cast(json_array_elements(LessonRooms) ->> 'RoomId' as varchar),
       cast(json_array_elements(LessonRooms) ->> 'RoomName' as varchar),
       cast(json_array_elements(LessonRooms) ->> 'TimetableLessonId' as varchar),
       cast('Sample File' as varchar),
       current_timestamp(0) 
       from
(select timetablemode -> 'LessonRooms' as LessonRooms from timetablemode_load) dt1
;

truncate table rooms
;

insert into rooms
(id
,roomcode
,roomname
,samplefile
,audit_ts)
select cast(json_array_elements(Rooms) ->> 'Id' as varchar),
       cast(json_array_elements(Rooms) ->> 'RoomCode' as varchar),
       cast(json_array_elements(Rooms) ->> 'RoomName' as varchar),
       cast('Sample File' as varchar),
       current_timestamp(0)
       from
(select timetablemode -> 'Rooms' as Rooms from timetablemode_load) dt1
;

truncate table timetabledayinstances
;

insert into timetabledayinstances
(date
,id
,timetabledayid
,samplefile
,audit_ts)
select cast(json_array_elements(TimetableDayInstances) ->> 'Date' as varchar),
       cast(json_array_elements(TimetableDayInstances) ->> 'Id' as varchar),
       cast(json_array_elements(TimetableDayInstances) ->> 'TimetableDayId' as varchar),
       cast('Sample File' as varchar),
       current_timestamp(0) 
       from
(select timetablemode -> 'TimetableDayInstances' as TimetableDayInstances from timetablemode_load) dt1
;

truncate table lessoninstances
;

insert into lessoninstances
(enddate
,id
,startdate
,timetablelessonid
,samplefile
,audit_ts)
select cast(json_array_elements(LessonInstances) ->> 'EndDate' as varchar),
       cast(json_array_elements(LessonInstances) ->> 'Id' as varchar),
       cast(json_array_elements(LessonInstances) ->> 'StartDate' as varchar),
       cast(json_array_elements(LessonInstances) ->> 'TimetableLessonId' as varchar),
       cast('Sample File' as varchar),
       current_timestamp(0)
       from
(select timetablemode -> 'LessonInstances' as LessonInstances from timetablemode_load) dt1
;