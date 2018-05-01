<!--- 
Name: classesDD.cfm
Author: Ed Kerr
Description: Data Drill down details of classes
Created: 9/14/2011 --->

<!---Get Classes from database--->
<cfquery name="classRecs" datasource="StudentsAudit">
SELECT RecKey, StuID, Spec, CourseCode, CourseDone, DateDone, Grade
FROM AuditRecs
WHERE StuID = #URL.S2G#
</cfquery>
<!---Create HTML page--->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Class listings for student</title>
</head>
<body>
<cfoutput query="classRecs">
<table>
<tr>
<td>
<b>#CourseCode#</b>
</td>
<td>
<b>#CourseDone#</b>
</td>
<td>
<b>#DateDone#</b>
</td>
<td>
<b>#Grade#</b>
</td>

</tr>
</table>
</cfoutput>


</body>
</html>