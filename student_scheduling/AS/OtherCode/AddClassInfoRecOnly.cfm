
	<cfset this.datasource = "StudentsAudit">
	
	
		<cfquery datasource="#this.datasource#">
		INSERT INTO ClassInfo 
		(CourseCode, CoursePre, CourseNum, CourseName, IQu, IPR, CLevel, GEGrp, NPR1, NPR2, NPR3, PRM)  
		VALUES
   
      ('AUD430', 'AUD', '430', 'Internship II', 12, 0, 400, 0, ' ', ' ', ' ', 0)
    


    </cfquery>
Successfully added records to ClassInfo
