/*********************************************************************/
/* author: vldb                                                      */
/* date: 31/08/2021                                                  */
/* version: 1.0                                                      */
/* description: drops and creates load table                         */
/*********************************************************************/

set search_path to mis_load,mis
;

drop table if exists detentionlookups_load
;

create table detentionlookups_load
(detentionlookups json not null)
;