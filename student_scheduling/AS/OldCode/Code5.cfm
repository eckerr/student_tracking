		</cfquery>
		<cfreturn "StudentTab table created">
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

</cfcomponent>