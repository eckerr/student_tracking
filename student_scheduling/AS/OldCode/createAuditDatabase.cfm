<cfset dbComp = createObject("component", "StudentDatabaseCreator")>

<cfoutput>
	#dbComp.createAuditRecs()#<br>
	#dbComp.createStudentTab()#<br>
</cfoutput>
