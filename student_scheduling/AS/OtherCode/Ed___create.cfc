<cfcomponent>

	<cfset this.datasource = "EdTestChannel">
	
	<cffunction name="createAuditRecs" access="public" returntype="string">
	
		<cfset dropTable('Persons')>
	
		<cfquery datasource="#this.datasource#">
        CREATE TABLE Persons
		(
			P_Id int,
			LastName varchar(255),
			FirstName varchar(255),
			Address varchar(255),
			City varchar(255)
		)

		</cfquery>
		
	
		
		<cfreturn "AuditRecs table created">
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