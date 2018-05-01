<cfcomponent>

	<cfset this.datasource = "AllSchoolAudit">
	
	<cffunction name="createDegreeTypeInfo" access="public" returntype="string">
	
		<cfset dropTable('DegreeTypeInfo')>
	
		<cfquery datasource="#this.datasource#">
		CREATE TABLE
			DegreeTypeInfo(RecKey INT
				NOT NULL
			    GENERATED BY DEFAULT AS IDENTITY
		    	CONSTRAINT DegreeTypeInfo_PK PRIMARY KEY,
			DegreeType CHAR(40) NOT NULL,
            DegreeCode Char(4) NOT NULL UNIQUE)
		</cfquery>
		
		<cfquery datasource="#this.datasource#">
		INSERT INTO DegreeTypeInfo 
		(DegreeType, DegreeCode) 
		VALUES
('Bachelor of Arts', 'BA'),
('Bachelor of Fine Arts', 'BFA'),
('Bachelor of Science', 'BS')
		</cfquery>
		
		<cfreturn "DegreeTypeInfo table created">
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