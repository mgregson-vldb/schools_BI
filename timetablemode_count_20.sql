/*********************************************************************/
/* author: vldb                                                      */
/* date: 31/08/2021                                                  */
/* version: 1.0                                                      */
/* description: count no. of rows inserted into target table         */
/*********************************************************************/

select count(*)
from   mis.timetables
;

select count(*)
from    mis.timetabledays
;

select count(*)
from    mis.timetableperiods
;

select count(*)
from    mis.timetablelessons
;

select count(*)
from    mis.lessonclasses
;

select count(*)
from    mis.lessonstaff
;

select count(*)
from    mis.lessonrooms
;

select count(*)
from    mis.rooms
;

select count(*)
from    mis.timetabledayinstances
;

select count(*)
from    mis.lessoninstances
;