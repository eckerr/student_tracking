		</cfquery>
		
		<cfreturn "AuditRecs table created">
	</cffunction>
	
	<cffunction name="createStudentTab" access="public" returntype="string">
		
		<cfset dropTable('StudentTab')>
		
		<cfquery datasource="#this.datasource#">
		CREATE TABLE StudentTab(
            StuKey INTEGER
				NOT NULL
		        GENERATED BY DEFAULT AS IDENTITY (START WITH 2)
		        CONSTRAINT StudentTab_PK PRIMARY KEY,
            StuID VARCHAR(6),
			StuLastName VARCHAR(23),
			StuFirstName VARCHAR(23),
            DayEv INTEGER,
            MajNeed INTEGER,
            GenNeed INTEGER,
            StuStat VARCHAR(8),
            PerComp INTEGER,
            MajComp INTEGER,
            GenComp INTEGER,
            InProg INTEGER)
		</cfquery>
		
		<cfquery datasource="#this.datasource#">
		INSERT INTO StudentTab
			(StuKey, StuID, StuLastName, StuFirstName, DayEv, MajNeed, GenNeed, StuStat, PerComp, MajComp, GenComp, Inprog)
		VALUES