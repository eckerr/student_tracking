<cfset dbComp = createObject("component", "AllSchoolAuditRecsCreator")>

<cfoutput>
		#dbComp.createStudentRecs()#<br>
    	#dbComp.createAuditRecs()#<br>
</cfoutput>
