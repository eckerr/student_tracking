<cfset this.datasource = "StudentsAudit">
	
		
		<cfquery name="ClassInfoList" datasource="#this.datasource#">
		SELECT CourseCode, CoursePre, CourseNum, CourseName, IQu, IPR, CLevel, GEGrp, NPR1, NPR2, NPR3, PRM FROM CLASSINFO
		</cfquery>


		<CFLOOP QUERY="ClassInfoList" >
<!---<CFOUTPUT QUERY="Class Info">--->

<CFOUTPUT>

 ('#(Trim(CourseCode))#', '#(Trim(CoursePre))#', '#CourseNum#', '#(Trim(CourseName))#', #IQu#, #IPR#, #CLevel#, #GEGrp#, '#NPR1#', '#NPR2#', '#NPR3#', #PRM#), <br>

</CFOUTPUT>
</CFLOOP>


		
