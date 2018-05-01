<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Standard Output</title>
</head>
<!--- Get all the csr records for all the student --->
<cfquery name="getcsrs" datasource="csrtest">
SELECT *
FROM CSRs
ORDER BY Student
</cfquery>
<!--- Set the initial value of lastcourse --->
<cfparam name="lastcourse" default="0">
<body>
<!--- Start a Table with header--->
<table width="600" border="1">
<tr><th>Student</th><th>Absence</th><th>PQW</th><th>Tardiness</th><th>courseName</th></tr>
<!--- Start the output of all selected records --->
<cfoutput query="getcsrs">
<!--- Check to see if previous record was the same course, do it first time anyway --->
<cfif lastcourse NEQ #getcsrs.CourseID#>
<!--- if it wasn't go get new course name --->
<cfquery name="getcourse" datasource="csrtest">
SELECT *
FROM Courses
WHERE Courses.CourseID = #getcsrs.CourseID#
</cfquery>
<!--- Set variable corname to new course name or to a space character --->
<cfset corname = #getcourse.CourseName#>
<cfelse>
<cfset corname = '&nbsp;'>
</cfif>
<!--- Output CSR Tables with new course names only --->
<tr>
<td>#Student#</td><td>#Absence#</td><td>#PQW#</td><td>#Tardiness#</td><td>#corname#</td>
</tr>
<!--- Set variable lastcourse to previous course two check for similarity --->
<cfset lastcourse=#getcsrs.CourseID#>
</cfoutput>
</table>
</body>
</html>
