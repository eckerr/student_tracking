<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Show S Students</title>
<link href="../../main.css" rel="stylesheet" type="text/css" />
</head>
<!--- get all s students  --->
<cfquery datasource="csrmain" name="getses">
SELECT *
FROM Students, Levels
WHERE Students.LevelID = Levels.LevelID AND Students.LevelID IN (4,5,6)
ORDER BY LevelName
</cfquery>

<body>
<cfoutput query="getses">

<cfif getses.students.levelID EQ 4>
<cfset Form.levelID = 5>
<cfelseif getses.students.levelID EQ 5>
<cfset Form.levelID = 6>
<cfelseif getses.students.levelID EQ 6>
<cfset Form.levelID = 3>
</cfif>

<cfset Form.StudentID = #studentID#>

<cfupdate datasource="csrmain" tablename="Students">

</cfoutput>

<cflocation url="view_s.cfm" addtoken="no">
</body>
</html>