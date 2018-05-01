<!---
Name:        movie_delete.cfm
Author:      Ben Forta (ben@forta.com)
Description: Delete a movie
Created:     4/20/02
--->

<!--- Check that FilmID was provided --->
<cfif NOT IsDefined("MajorID")>
 <h1>You did not specify the MajorID</h1>
 <cfabort>
</cfif>

<!--- Delete a movie --->
<cfquery datasource="csrmain">
DELETE FROM Majors
WHERE MajorID=#MajorID#
</cfquery>

<!--- When done go back to movie list --->
<cflocation url="show_majors.cfm">