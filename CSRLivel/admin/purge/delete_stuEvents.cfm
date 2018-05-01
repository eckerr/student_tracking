<!---
Name:        delete_stuEvents.cfm
Author:      Ed Kerr (eckerr@aii.edu)
Description: Delete students and associated events
Created:     11/11/14
--->
<cfset thisDataSource = "csrmain"/>

<!--- Check that StudentID was provided --->
<title>Delete Student and Associated Events</title>
<cfif NOT IsDefined("StudentID")>
 <h1>You did not specify the StudentID</h1>
 <cfabort>
</cfif>

<!--- Delete students predating selected student --->
<cfquery datasource="#thisDataSource#">
DELETE FROM Students
WHERE StudentID < #StudentID#
</cfquery>
<cfquery DATASOURCE="#thisDataSource#">
DELETE FROM Events
WHERE StudentID < #StudentID#
</cfquery>

Records deleted from Students and Events
<!--- When done go back to movie list --->
<cflocation url="../edit_events/show_events.cfm" addtoken="no">