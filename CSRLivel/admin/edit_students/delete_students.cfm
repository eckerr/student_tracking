<!---
Name:        movie_delete.cfm
Author:      Ben Forta (ben@forta.com)
Description: Delete a movie
Created:     4/20/02
--->

<!--- Check that FilmID was provided ---><title>Delete Advisors</title>
<cfif NOT IsDefined("StudentID")>
 <h1>You did not specify the StudentID</h1>
 <cfabort>
</cfif>

<!--- Delete a movie --->
<cfquery datasource="csrmain">
DELETE FROM Students
WHERE StudentID=#StudentID#
</cfquery>

<!--- When done go back to movie list --->
<cflocation url="show_students.cfm" addtoken="no">