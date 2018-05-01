<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>
		<cfquery datasource="StudentsAudit">
		INSERT INTO AuditRecs 
		(StuID, Prog, MajID, Spec, CourseCode, CourseDone, FlagDone, DateDone, Grade) 
		VALUES
('225715', 'UNDG', 'GAD ', '  ', 'GEN098', 'GE098    ', 1, 'SU08', 'C '),
('225715', 'UNDG', 'GAD ', '  ', 'ART100', 'FC101    ', 1, 'SU08', 'A '),
('225715', 'UNDG', 'GAD ', '  ', 'ART110', 'FC112    ', 1, 'FA08', 'C '),
('225715', 'UNDG', 'GAD ', '  ', 'MAA116', 'VP102    ', 1, 'WI09', 'B '),
('225715', 'UNDG', 'GAD ', '  ', 'MAA221', 'CAM212   ', 1, 'WI09', 'A-')
 </cfquery>
</body>
</html>