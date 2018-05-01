<!-----------  Start Student Records------------->
<cfset this.datasource = "AllSchoolAudit">
<cfquery datasource="#this.datasource#">
INSERT INTO StudentRecs
(StuID, StuLastName, StuFirstName, DayEv, totNeed, majNeed, emajNeed, genNeed, stuStat, perComp,
 compNGECount, compGECount, compEMNCount, inprogCount, compTransCount, majorID, schProgram, M2L, H2L, F2L, S2L, L3L, F3L, S3L, ME1F, ME2F, ME3F, TransF, GenSav)
VALUES
('456127', 'Amador', 'Daniel          ', 1, 29, 29, 0, 0, 'Freshman', 0, 1, 0, 0, 1, 0, 'MAAE', 'UNDG', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,''),
('401214', 'Cerrito', 'Mickey O.        ', 1, 25, 25, 0, 0, 'Freshman', 1, 5, 0, 0, 1, 0, 'MAAE', 'UNDG', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,''),
('384662', 'Chung', 'Brian James        ', 1, 26, 26, 0, 0, 'Freshman', 1, 4, 1, 0, 0, 0, 'MAAE', 'UNDG', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,''),
('320198', 'Cox', 'Thaddeus G.         ', 1, 22, 22, 0, 0, 'Sophmore', 3, 8, 6, 0, 3, 0, 'MAAE', 'UNDG', 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1,'GEN244'),
('398878', 'Schoenbeck', 'Mike         ', 1, 18, 18, 0, 0, 'Junior', 6, 12, 15, 0, 1, 0, 'MAAE', 'UNDG', 1, 1, 1, 2, 1, 1, 1, 0, 0, 0, 0,'GEN244'),
('201781', 'Tam', 'Diana            ', 1, 9, 9, 0, 0, 'Junior', 8, 21, 14, 0, 2, 0, 'MAAE', 'UNDG', 1, 1, 1, 2, 1, 1, 1, 0, 0, 0, 0,'GEN247'),
('392164', 'Groener', 'Kristin M.       ', 1, 17, 17, 0, 0, 'Sophmore', 4, 13, 6, 0, 3, 0, 'MAAE', 'UNDG', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1,'GEN244'),
('416772', 'Parsons', 'Olivia J.        ', 1, 24, 24, 0, 0, 'Sophmore', 3, 6, 6, 0, 3, 0, 'MAAE', 'UNDG', 1, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0,'GEN248')
</cfquery>
Successfully added 8 records to student file <Br />





