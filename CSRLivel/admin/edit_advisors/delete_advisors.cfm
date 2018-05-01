<!---
Name:        advisor_delete.cfm
Author:      Terry Lunn
Description: Delete an Advisor
Created:     4/05/10
--->

<!--- Check that FilmID was provided --->
<cfif NOT IsDefined("AdvisorID")>
 <h1>You did not specify the AdvisorID</h1>
 <cfabort>
</cfif>

<!--- Delete a movie --->
<cfquery datasource="csrmain">
DELETE FROM Advisors
WHERE AdvisorID=#AdvisorID#
</cfquery>

<!--- When done go back to movie list --->
<cflocation url="../select_path.cfm" addtoken="no">