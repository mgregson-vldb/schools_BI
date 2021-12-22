
select jsonb_array_elements(SchoolInfo) ->> 'Address' as Address,
       jsonb_array_elements(SchoolInfo) ->> 'CurrentAcademicYear' as CurrentAcademicYear,
       jsonb_array_elements(SchoolInfo) ->> 'DeniNo' as DeniNo,
       jsonb_array_elements(SchoolInfo) ->> 'Email' as Email,
       jsonb_array_elements(SchoolInfo) ->> 'EstabId' as EstabId,
       jsonb_array_elements(SchoolInfo) ->> 'ExamCentre' as ExamCentre,
       jsonb_array_elements(SchoolInfo) ->> 'Governance' as Governance,
       jsonb_array_elements(SchoolInfo) ->> 'Head' as Head,
       jsonb_array_elements(SchoolInfo) ->> 'Id' as Id,
       jsonb_array_elements(SchoolInfo) ->> 'LastUpdated' as LastUpdated,
       jsonb_array_elements(SchoolInfo) ->> 'MainContact' as MainContact,
       jsonb_array_elements(SchoolInfo) ->> 'Name' as Name,
       jsonb_array_elements(SchoolInfo) ->> 'Phase' as Phase,
       jsonb_array_elements(SchoolInfo) ->> 'RowHash' as RowHash,
       jsonb_array_elements(SchoolInfo) ->> 'SchoolLogoAlternateUrl' as SchoolLogoAlternateUrl,
       jsonb_array_elements(SchoolInfo) ->> 'SchoolLogoUrl' as SchoolLogoUrl,
       jsonb_array_elements(SchoolInfo) ->> 'Telephone' as Telephone,
       jsonb_array_elements(SchoolInfo) ->> 'Web' as Web,
       'Sample File'
       from
(select j -> 'SchoolInfo' as SchoolInfo from schoolinfo_load) dt1

select jsonb_array_elements(meta) ->> 'DateTime' as DateTime,
       jsonb_array_elements(meta) ->> 'Id' as Id,
       jsonb_array_elements(meta) ->> 'MIS' as MIS,
       jsonb_array_elements(meta) ->> 'Version' as Version,
       'Sample File'
       from
(select j -> 'meta' as meta from schoolinfo_load) dt1
;
