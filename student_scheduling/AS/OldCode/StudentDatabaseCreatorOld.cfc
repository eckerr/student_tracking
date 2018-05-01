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
(1, '371228', 'UNDG', 'GAD', '  ', 'ART100', 'ART100   ', 'SU11', 'IP'),
(2, '371228', 'UNDG', 'GAD', '  ', 'ART110', '_________', '    ', '  '),
(3, '371228', 'UNDG', 'GAD', '  ', 'MAA116', '_________', '    ', '  '),
(4, '371228', 'UNDG', 'GAD', '  ', 'MAA221', '_________', '    ', '  '),
(5, '371228', 'UNDG', 'GAD', '  ', 'GAD233', '_________', '    ', '  '),
(6, '371228', 'UNDG', 'GAD', '  ', 'GAD211', '_________', '    ', '  '),
(7, '371228', 'UNDG', 'GAD', '  ', 'GAD338', '_________', '    ', '  '),
(8, '371228', 'UNDG', 'GAD', '  ', 'GAD357', '_________', '    ', '  '),
(9, '371228', 'UNDG', 'GAD', '  ', 'GAD467', '_________', '    ', '  '),
(10, '371228', 'UNDG', 'GAD', '  ', 'MAA451', '_________', '    ', '  '),
(11, '371228', 'UNDG', 'GAD', '  ', 'MAA461', '_________', '    ', '  '),
(12, '371228', 'UNDG', 'GAD', '  ', 'MAA471', '_________', '    ', '  '),
(13, '371228', 'UNDG', 'GAD', '  ', 'ART102', 'ART102   ', 'SU11', 'IP'),
(14, '371228', 'UNDG', 'GAD', '  ', 'ART111', '_________', '    ', '  '),
(15, '371228', 'UNDG', 'GAD', '  ', 'MAA123', '_________', '    ', '  '),
(16, '371228', 'UNDG', 'GAD', '  ', 'MAA224', '_________', '    ', '  '),
(17, '371228', 'UNDG', 'GAD', '  ', 'MAA228', '_________', '    ', '  '),
(18, '371228', 'UNDG', 'GAD', '  ', 'MAA337', '_________', '    ', '  '),
(19, '371228', 'UNDG', 'GAD', '  ', 'GAD325', '_________', '    ', '  '),
(20, '371228', 'UNDG', 'GAD', '  ', 'GAD335', '_________', '    ', '  '),
(21, '371228', 'UNDG', 'GAD', '  ', 'GAD445', '_________', '    ', '  '),
(22, '371228', 'UNDG', 'GAD', '  ', 'GAD448', '_________', '    ', '  '),
(23, '371228', 'UNDG', 'GAD', '  ', 'GAD455', '_________', '    ', '  '),
(24, '371228', 'UNDG', 'GAD', '  ', 'GEN340', '_________', '    ', '  '),
(25, '371228', 'UNDG', 'GAD', '  ', 'GEN345', '_________', '    ', '  '),
(26, '371228', 'UNDG', 'GAD', '  ', 'GEN101', '_________', '    ', '  '),
(27, '371228', 'UNDG', 'GAD', '  ', 'GAD101', '_________', '    ', '  '),
(28, '371228', 'UNDG', 'GAD', '  ', 'DPH242', '_________', '    ', '  '),
(29, '371228', 'UNDG', 'GAD', '  ', 'MAA217', '_________', '    ', '  '),
(30, '371228', 'UNDG', 'GAD', '  ', 'MAA227', '_________', '    ', '  '),
(31, '371228', 'UNDG', 'GAD', '  ', 'MAA347', '_________', '    ', '  '),
(32, '371228', 'UNDG', 'GAD', '  ', 'GAD356', '_________', '    ', '  '),
(33, '371228', 'UNDG', 'GAD', '  ', 'GAD466', '_________', '    ', '  '),
(34, '371228', 'UNDG', 'GAD', '  ', 'GEN241', '_________', '    ', '  '),
(35, '371228', 'UNDG', 'GAD', '  ', 'GEN244', '_________', '    ', '  '),
(36, '371228', 'UNDG', 'GAD', '  ', 'GEN247', '_________', '    ', '  '),
(37, '371228', 'UNDG', 'GAD', '  ', 'GEN248', '_________', '    ', '  '),
(38, '371228', 'UNDG', 'GAD', '  ', 'GEN310', '_________', '    ', '  '),
(39, '371228', 'UNDG', 'GAD', '  ', 'GEN325', '_________', '    ', '  '),
(40, '371228', 'UNDG', 'GAD', '  ', 'GEN329', '_________', '    ', '  '),
(41, '371228', 'UNDG', 'GAD', '  ', 'GEN360', '_________', '    ', '  '),
(42, '371228', 'UNDG', 'GAD', '  ', 'GEN380', '_________', '    ', '  '),
(43, '371228', 'UNDG', 'GAD', '  ', 'GEN399', '_________', '    ', '  '),
(44, '371228', 'UNDG', 'GAD', '  ', 'GEN150', 'GEN150   ', 'SU11', 'IP'),
(45, '371228', 'UNDG', 'GAD', '  ', 'GEN102', '_________', '    ', '  '),
(46, '371228', 'UNDG', 'GAD', '  ', 'GEN105', 'GEN105   ', 'SU11', 'IP'),
(47, '371228', 'UNDG', 'GAD', '  ', 'GEN205', '_________', '    ', '  '),
(48, '371228', 'UNDG', 'GAD', '  ', 'GEN211', '_________', '    ', '  '),
(49, '371228', 'UNDG', 'GAD', '  ', 'GEN212', '_________', '    ', '  '),
(50, '371228', 'UNDG', 'GAD', '  ', 'GEN250', '_________', '    ', '  '),
(51, '371228', 'UNDG', 'GAD', '  ', 'GEN257', '_________', '    ', '  '),
(52, '371228', 'UNDG', 'GAD', '  ', 'GEN253', '_________', '    ', '  '),
(53, '371228', 'UNDG', 'GAD', '  ', 'GEN260', '_________', '    ', '  '),
(54, '371228', 'UNDG', 'GAD', '  ', 'GEN228', '_________', '    ', '  '),
(55, '371228', 'UNDG', 'GAD', '  ', 'GEN223', '_________', '    ', '  '),
(56, '371228', 'UNDG', 'GAD', '  ', 'GEN225', '_________', '    ', '  '),
(57, '371228', 'UNDG', 'GAD', '  ', 'GEN230', '_________', '    ', '  '),
(58, '371228', 'UNDG', 'GAD', '  ', 'GEN231', '_________', '    ', '  '),
(59, '371228', 'UNDG', 'GAD', '  ', 'GEN286', '_________', '    ', '  ')
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
(1, '371228', 'Shaer', 'Jake E.        ', 1, 28, 13, 'Freshman', 1, 2, 2, 4)
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