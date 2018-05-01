<!--- ScheduleOutDatabaseCreator.cfm --->
	<cfset this.datasource = "StudentsAudit">
          <cftry>
			<cfquery datasource="#this.datasource#">
			DROP TABLE SchedOut
			</cfquery>
		<cfcatch></cfcatch>
		</cftry>
	
		<cfquery datasource="#this.datasource#">
		CREATE TABLE
			SchedOut(RecKey BIGINT
				NOT NULL
			    GENERATED BY DEFAULT AS IDENTITY
		    	CONSTRAINT SchedOut_PK PRIMARY KEY,
		      	QuOut SMALLINT,
       			StuID CHAR(6),
       			StuLastName CHAR(23),
       			StuFirstName CHAR(23),
       			StuStat CHAR(8),
       			PerComp SMALLINT,
       			DayEv SMALLINT,
       			MajorID CHAR(4),
       			IQu SMALLINT,
       			courseCode CHAR(6),
       			courseName CHAR(40),
       			NPR1 CHAR(6),
       			NPR2 CHAR(6),
       			NPR3 CHAR(6))
		</cfquery>	
		<cfOutput> "SchedOut table created"</cfoutput>
		