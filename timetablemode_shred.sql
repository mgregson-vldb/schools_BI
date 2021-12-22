

select jsonb_array_elements(Timetables) ->> 'DaysPerCycle' as DaysPerCycle,
       jsonb_array_elements(Timetables) ->> 'Description' as Description,
       jsonb_array_elements(Timetables) ->> 'EndDate' as EndDate,
       jsonb_array_elements(Timetables) ->> 'Id' as Id,
       jsonb_array_elements(Timetables) ->> 'PeriodsPerCycle' as PeriodsPerCycle,
       jsonb_array_elements(Timetables) ->> 'StartDate' as StartDate,
       jsonb_array_elements(Timetables) ->> 'TeachingPeriodsPerCycle' as TeachingPeriodsPerCycle,
       'Sample File'
       from
(select j -> 'Timetables' as Timetables from timetablemode_load) dt1

select jsonb_array_elements(TimetableDays) ->> 'DayName' as DayName,
       jsonb_array_elements(TimetableDays) ->> 'Id' as Id,
       jsonb_array_elements(TimetableDays) ->> 'Sequence' as Sequence,
       jsonb_array_elements(TimetableDays) ->> 'TimetableId' as TimetableId,
       'Sample File'
       from
(select j -> 'TimetableDays' as TimetableDays from timetablemode_load) dt1
;

select jsonb_array_elements(TimetablePeriods) ->> 'EndTime' as EndTime,
       jsonb_array_elements(TimetablePeriods) ->> 'Id' as Id,
       jsonb_array_elements(TimetablePeriods) ->> 'PeriodName' as PeriodName,
       jsonb_array_elements(TimetablePeriods) ->> 'Sequence' as Sequence,
       jsonb_array_elements(TimetablePeriods) ->> 'StartTime' as StartTime,
       jsonb_array_elements(TimetablePeriods) ->> 'TimetableDayId' as TimetableDayId,
       'Sample File'
       from
(select j -> 'TimetablePeriods' as TimetablePeriods from timetablemode_load) dt1
;

select jsonb_array_elements(TimetableLessons) ->> 'Id' as Id,
       jsonb_array_elements(TimetableLessons) ->> 'TimetablePeriodId' as TimetablePeriodId,
       'Sample File'
       from
(select j -> 'TimetableLessons' as TimetableLessons from timetablemode_load) dt1
;

select jsonb_array_elements(LessonClasses) ->> 'GroupId' as GroupId,
       jsonb_array_elements(LessonClasses) ->> 'GroupName' as GroupName,
       jsonb_array_elements(LessonClasses) ->> 'Id' as Id,
       jsonb_array_elements(LessonClasses) ->> 'SubjectId' as SubjectId,
       jsonb_array_elements(LessonClasses) ->> 'SubjectName' as SubjectName,
       jsonb_array_elements(LessonClasses) ->> 'TimetableLessonId' as TimetableLessonId,
       'Sample File'
       from
(select j -> 'LessonClasses' as LessonClasses from timetablemode_load) dt1
;

select jsonb_array_elements(LessonStaff) ->> 'Id' as Id,
       jsonb_array_elements(LessonStaff) ->> 'StaffId' as StaffId,
       jsonb_array_elements(LessonStaff) ->> 'TimetableLessonId' as TimetableLessonId,
       'Sample File'
       from
(select j -> 'LessonStaff' as LessonStaff from timetablemode_load) dt1
;

select jsonb_array_elements(LessonRooms) ->> 'Id' as Id,
       jsonb_array_elements(LessonRooms) ->> 'RoomCode' as RoomCode,
       jsonb_array_elements(LessonRooms) ->> 'RoomId' as RoomId,
       jsonb_array_elements(LessonRooms) ->> 'RoomName' as RoomName,
       jsonb_array_elements(LessonRooms) ->> 'TimetableLessonId' as TimetableLessonId,
       'Sample File'
       from
(select j -> 'LessonRooms' as LessonRooms from timetablemode_load) dt1
;

select jsonb_array_elements(Rooms) ->> 'Id' as Id,
       jsonb_array_elements(Rooms) ->> 'RoomCode' as RoomCode,
       jsonb_array_elements(Rooms) ->> 'RoomName' as RoomName,
       'Sample File'
       from
(select j -> 'Rooms' as Rooms from timetablemode_load) dt1
;

select jsonb_array_elements(TimetableDayInstances) ->> 'Date' as Date,
       jsonb_array_elements(TimetableDayInstances) ->> 'Id' as Id,
       jsonb_array_elements(TimetableDayInstances) ->> 'TimetableDayId' as TimetableDayId,
       'Sample File'
       from
(select j -> 'TimetableDayInstances' as TimetableDayInstances from timetablemode_load) dt1
;

select jsonb_array_elements(LessonInstances) ->> 'EndDate' as EndDate,
       jsonb_array_elements(LessonInstances) ->> 'Id' as Id,
       jsonb_array_elements(LessonInstances) ->> 'StartDate' as StartDate,
       jsonb_array_elements(LessonInstances) ->> 'TimetableLessonId' as TimetableLessonId,
       'Sample File'
       from
(select j -> 'LessonInstances' as LessonInstances from timetablemode_load) dt1
;

select jsonb_array_elements(meta) ->> 'DateTime' as DateTime,
       jsonb_array_elements(meta) ->> 'Id' as Id,
       jsonb_array_elements(meta) ->> 'MIS' as MIS,
       jsonb_array_elements(meta) ->> 'Version' as Version,
       'Sample File'
       from
(select j -> 'meta' as meta from timetablemode_load) dt1
;