<cfcomponent>

	<cfset this.datasource = "AllSchoolAudit">
	
	<cffunction name="createProgramInfo" access="public" returntype="string">
	
		<cfset dropTable('ProgramInfo')>
	
		<cfquery datasource="#this.datasource#">
		CREATE TABLE
			ProgramInfo(RecKey INT
				NOT NULL
			    GENERATED BY DEFAULT AS IDENTITY
		    	CONSTRAINT ProgramInfo_PK PRIMARY KEY,
			ProgramCode CHAR(5) NOT NULL,
			ProgramName CHAR(40),
            DegreeCode CHAR(4),
			MajorCode CHAR(5) NOT NULL,
			MajorName CHAR(40),
            MajReq SMALLINT,
            GenReq SMALLINT,
            CONSTRAINT ProgMaj_UK UNIQUE (ProgramCode, MajorCode))
		</cfquery>
		
		<cfquery datasource="#this.datasource#">
		INSERT INTO ProgramInfo 
		(ProgramCode, ProgramName, DegreeCode, MajorCode, MajorName, MajReq, GenReq) 
		VALUES
('UNDG', 'Undergraduate','BFA', 'MAA', 'Media Arts & Animation', 45, 15)
		</cfquery>
		
		<cfreturn "ProgramInfo table created">
	</cffunction>
	
	
	<!--- function to drop a table if it exists --->
	<cffunction name="dropTable" access="private" returntype="void">
		<cfargument name="tablename" type="String" required="true">
		<cftry>
			<cfquery datasource="#this.datasource#">
			DROP TABLE #arguments.tablename#
			</cfquery>
		<cfcatch></cfcatch>
		</cftry>
	</cffunction>

</cfcomponent>