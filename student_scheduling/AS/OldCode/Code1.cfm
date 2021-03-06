<cfcomponent>

	<cfset this.datasource = "StudentsAudit">
	
	<cffunction name="createAuditRecs" access="public" returntype="string">
	
		<cfset dropTable('AuditRecs')>
	
		<cfquery datasource="#this.datasource#">
		CREATE TABLE
			AuditRecs(RecKey INT
				NOT NULL
			    GENERATED BY DEFAULT AS IDENTITY (START WITH 60)
		    	CONSTRAINT AuditRecs_PK PRIMARY KEY,
            StuID VARCHAR(6),    
            Prog VARCHAR(4),    
            MajID VARCHAR(3),
		    Spec VARCHAR(2),
			CourseCode VARCHAR(6),
			CourseDone VARCHAR(9),
            DateDone VARCHAR(4),
            Grade VARCHAR(2))
		</cfquery>
		
		<cfquery datasource="#this.datasource#">
		INSERT INTO AuditRecs 
			(RecKey, StuID, Prog, MajID, Spec, CourseCode, CourseDone, DateDone, Grade) 
		VALUES