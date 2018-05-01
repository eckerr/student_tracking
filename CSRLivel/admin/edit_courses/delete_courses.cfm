<!---
Name:        delete_sourse.cfm
Author:      Terry Lunn
Description: Delete a course
Created:     2/10/11
--->

<!--- Check that CourseID was provided --->
<cfif NOT IsDefined("CourseID")>
 <h1>You did not specify the CourseID</h1>
 <cfabort>
</cfif>

<!--- Delete a movie --->
<cfquery datasource="csrmain">
DELETE FROM Courses
WHERE CourseID=#CourseID#
</cfquery>

<!--- When done go back to movie list --->
<cflocation url="show_courses.cfm" addtoken="no">