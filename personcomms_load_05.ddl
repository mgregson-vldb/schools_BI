/*********************************************************************/
/* author: vldb                                                      */
/* date: 31/08/2021                                                  */
/* version: 1.0                                                      */
/* description: drops and creates load table                         */
/*********************************************************************/

set search_path to mis_load,mis
;

drop table if exists personcomms_load
;

create table personcomms_load
(personcomms json not null)
;