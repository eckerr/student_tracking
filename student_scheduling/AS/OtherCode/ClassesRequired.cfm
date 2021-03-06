<!--- Classes required - student counts and classes required over next four quarters --->

<CFQUERY NAME="GetStuCounts1Q" DATASOURCE="StudentsAudit">
SELECT COUNT(COURSECODE) AS STUDENTS1, COURSECODE, COURSENAME FROM SchedOut 
WHERE QUOUT = 1
GROUP By COURSECODE, COURSENAME
ORDER BY COURSECODE DESC
</CFQUERY>
<!--- Four Quarter Temporary Database.cfm --->
	<cfset this.datasource = "StudentsAudit">
          <cftry>
			<cfquery datasource="#this.datasource#">
			DROP TABLE FourQuarterTemp
       		</cfquery>	
		<cfcatch></cfcatch>
		</cftry>
 
	
		<cfquery datasource="#this.datasource#">
		CREATE TABLE
			FourQuarterTemp(RecKey BIGINT
				NOT NULL
			    GENERATED BY DEFAULT AS IDENTITY
		    	CONSTRAINT FourQuarterTemp_PK PRIMARY KEY,
       			courseCode CHAR(6),
       			courseName CHAR(40),
                Q1Count smallInt)
		</cfquery>	
		<cfOutput> "FourQuarterTemp table created"</cfoutput>
 <CFLOOP STARTROW="1" QUERY="GetStuCounts1Q">
 	<CFQUERY NAME = "FourQStuff" datasource="StudentsAudit">
     	 INSERT INTO FourQuarterTemp
      		(courseCode, courseName, Q1Count)
      	VALUES
      		('#courseCode#', '#courseName#', #students1#)
    	</cfquery> 
</CFLOOP>
		<CFQUERY NAME = "ShowFourQuarters" DATASOURCE="StudentsAudit" >
        select * from FourQuarterTemp
        </CFQUERY>
        <CFDUMP VAR="#ShowFourQuarters#">
        
        <CFQUERY NAME="GetStuCounts2Q" DATASOURCE="StudentsAudit">
SELECT COUNT(COURSECODE) AS STUDENTS2, COURSECODE, COURSENAME FROM SchedOut 
WHERE QUOUT = 2
GROUP By COURSECODE, COURSENAME
ORDER BY COURSECODE DESC
</CFQUERY>

<!--- Four Quarter Temporary Database2.cfm --->
	<cfset this.datasource = "StudentsAudit">
          <cftry>
			<cfquery datasource="#this.datasource#">
			DROP TABLE FourQuarterTemp2
			</cfquery>
		<cfcatch></cfcatch>
		</cftry>
	
		<cfquery datasource="#this.datasource#">
		CREATE TABLE
			FourQuarterTemp2(RecKey BIGINT
				NOT NULL
			    GENERATED BY DEFAULT AS IDENTITY
		    	CONSTRAINT FourQuarterTemp2_PK PRIMARY KEY,
       			courseCode CHAR(6),
       			courseName CHAR(40),
                Q2Count smallInt)
		</cfquery>	
		<cfOutput> "FourQuarterTemp2 table created"</cfoutput>
 <CFLOOP STARTROW="1" QUERY="GetStuCounts2Q">
 	<CFQUERY NAME = "FourQStuff2" datasource="StudentsAudit">
     	 INSERT INTO FourQuarterTemp2
      		(courseCode, courseName, Q2Count)
      	VALUES
      		('#courseCode#', '#courseName#', #students2#)
    	</cfquery> 
</CFLOOP>
        
        	<CFQUERY NAME = "ShowFourQuarters2" DATASOURCE="StudentsAudit" >
        select * from FourQuarterTemp2
        </CFQUERY>
        <CFDUMP VAR="#ShowFourQuarters2#">
<!--- =======================================================================--->		
        <CFQUERY NAME="GetStuCounts3Q" DATASOURCE="StudentsAudit">
			SELECT COUNT(COURSECODE) AS STUDENTS3, COURSECODE, COURSENAME FROM SchedOut 
			WHERE QUOUT = 3
			GROUP By COURSECODE, COURSENAME
			ORDER BY COURSECODE DESC
		</CFQUERY>

<!--- Four Quarter Temporary Database3.cfm --->
	<cfset this.datasource = "StudentsAudit">
          <cftry>
			<cfquery datasource="#this.datasource#">
			DROP TABLE FourQuarterTemp3
			</cfquery>
		<cfcatch></cfcatch>
		</cftry>
	
		<cfquery datasource="#this.datasource#">
		CREATE TABLE
			FourQuarterTemp3(RecKey BIGINT
				NOT NULL
			    GENERATED BY DEFAULT AS IDENTITY
		    	CONSTRAINT FourQuarterTemp3_PK PRIMARY KEY,
       			courseCode CHAR(6),
       			courseName CHAR(40),
                Q3Count smallInt)
		</cfquery>	
		<cfOutput> "FourQuarterTemp3 table created"</cfoutput>
 <CFLOOP STARTROW="1" QUERY="GetStuCounts3Q">
 	<CFQUERY NAME = "FourQStuff3" datasource="StudentsAudit">
     	 INSERT INTO FourQuarterTemp3
      		(courseCode, courseName, Q3Count)
      	VALUES
      		('#courseCode#', '#courseName#', #students3#)
    	</cfquery> 
</CFLOOP>
       	<CFQUERY NAME = "ShowFourQuarters3" DATASOURCE="StudentsAudit" >
        select * from FourQuarterTemp3
        </CFQUERY>
        <CFDUMP VAR="#ShowFourQuarters3#">
<!--- =======================================================================--->		


<CFQUERY NAME="GetStuCounts4Q" DATASOURCE="StudentsAudit">
		SELECT COUNT(COURSECODE) AS STUDENTS4, COURSECODE, COURSENAME FROM SchedOut 
		WHERE QUOUT = 4
		GROUP By COURSECODE, COURSENAME
		ORDER BY COURSECODE DESC
</CFQUERY>


<!--- Four Quarter Temporary Database4.cfm --->
	<cfset this.datasource = "StudentsAudit">
          <cftry>
			<cfquery datasource="#this.datasource#">
			DROP TABLE FourQuarterTemp4
			</cfquery>
		<cfcatch></cfcatch>
		</cftry>
	
		<cfquery datasource="#this.datasource#">
		CREATE TABLE
			FourQuarterTemp4(RecKey BIGINT
				NOT NULL
			    GENERATED BY DEFAULT AS IDENTITY
		    	CONSTRAINT FourQuarterTemp4_PK PRIMARY KEY,
       			courseCode CHAR(6),
       			courseName CHAR(40),
                Q4Count smallInt)
		</cfquery>	
		<cfOutput> "FourQuarterTemp4 table created"</cfoutput>
 <CFLOOP STARTROW="1" QUERY="GetStuCounts4Q">
 	<CFQUERY NAME = "FourQStuff4" datasource="StudentsAudit">
     	 INSERT INTO FourQuarterTemp4
      		(courseCode, courseName, Q4Count)
      	VALUES
      		('#courseCode#', '#courseName#', #students4#)
    	</cfquery> 
</CFLOOP>
       	<CFQUERY NAME = "ShowFourQuarters4" DATASOURCE="StudentsAudit" >
        select * from FourQuarterTemp4
        </CFQUERY>
        <CFDUMP VAR="#ShowFourQuarters4#">
