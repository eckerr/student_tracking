<!---
Name:        movie_delete.cfm
Author:      Ben Forta (ben@forta.com)
Description: Delete a movie
Created:     4/20/02
--->

<!--- Check that FilmID was provided --->
<cfif NOT IsDefined("InstructorID")>
 <h1>You did not specify the InstructorID</h1>
 <cfabort>
</cfif>

<!--- Delete a movie --->
<cfquery datasource="csrmain">
DELETE FROM Instructors
WHERE InstructorID=#InstructorID#
</cfquery>

<!--- When done go back to movie list --->
<cflocation url="show_instructors.cfm" addtoken="no">