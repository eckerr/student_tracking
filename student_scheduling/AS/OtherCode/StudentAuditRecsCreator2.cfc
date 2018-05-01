<cfcomponent>

	<cfset this.datasource = "StudentsAudit">
	
	<cffunction name="createAuditRecs" access="public" returntype="string">
	
		<cfset dropTable('AuditRecs')>
	
		<cfquery datasource="#this.datasource#">
		CREATE TABLE
			AuditRecs(RecKey BIGINT
				NOT NULL
			    GENERATED BY DEFAULT AS IDENTITY (START WITH 10175)
		    	CONSTRAINT AuditRecs_PK PRIMARY KEY,
            StuID CHAR(6) CONSTRAINT StuID_FK REFERENCES StudentTab(StuID),    
            Prog CHAR(4),    
            MajID CHAR(4),
		    Spec CHAR(2),
			CourseCode CHAR(6) CONSTRAINT CourseCode_FK REFERENCES ClassInfo(CourseCode),
			CourseDone CHAR(9),
            FlagDone SMALLINT,
            DateDone CHAR(4),
            Grade CHAR(2))
		</cfquery>
		
		<cfquery datasource="#this.datasource#">
		INSERT INTO AuditRecs 
		(RecKey, StuID, Prog, MajID, Spec, CourseCode, CourseDone, FlagDone, DateDone, Grade) 
		VALUES
(1, '225715', 'UNDG', 'GAD ', '  ', 'GEN098', 'GE098    ', 1, 'SU08', 'C '),
(2, '225715', 'UNDG', 'GAD ', '  ', 'ART100', 'FC101    ', 1, 'SU08', 'A '),
(3, '225715', 'UNDG', 'GAD ', '  ', 'ART110', 'FC112    ', 1, 'FA08', 'C '),
(4, '225715', 'UNDG', 'GAD ', '  ', 'MAA116', 'VP102    ', 1, 'WI09', 'B '),
(5, '225715', 'UNDG', 'GAD ', '  ', 'MAA221', 'CAM212   ', 1, 'WI09', 'A-'),
(6, '225715', 'UNDG', 'GAD ', '  ', 'GAD233', 'GAD304   ', 1, 'SU10', 'B+'),
(7, '225715', 'UNDG', 'GAD ', '  ', 'GAD211', 'GAD120   ', 1, 'SP09', 'A '),
(8, '225715', 'UNDG', 'GAD ', '  ', 'GAD338', 'GAD338   ', 1, 'FA11', 'IP'),
(9, '225715', 'UNDG', 'GAD ', '  ', 'GAD357', 'GAD204   ', 1, 'SU10', 'B+'),
(10, '225715', 'UNDG', 'GAD ', '  ', 'GAD467', 'GAD320   ', 1, 'SP10', 'C-')
		</cfquery>
		
		<cfreturn "AuditRecs table created">
	</cffunction>
	
	<cffunction name="createStudentTab" access="public" returntype="string">
		<cfset dropTable('AuditRecs')>
		<cfset dropTable('StudentTab')>
		
		<cfquery datasource="#this.datasource#">
		CREATE TABLE StudentTab(
            StuKey BIGINT
				NOT NULL
		        GENERATED BY DEFAULT AS IDENTITY (START WITH 180)
		        CONSTRAINT StudentTab_PK PRIMARY KEY,
            StuID CHAR(6) CONSTRAINT StuID_UK UNIQUE,
			StuLastName CHAR(23), 
			StuFirstName CHAR(23),
            DayEv SMALLINT,
            MajNeed SMALLINT,
            GenNeed SMALLINT,
            StuStat CHAR(8),
            PerComp SMALLINT,
            MajComp SMALLINT,
            GenComp SMALLINT,
            InProg SMALLINT,
            MajorID CHAR(4),
            SchProgram CHAR(4),
            M2L SMALLINT,
            H2L SMALLINT,
            F2L SMALLINT,
            S2L SMALLINT,
            L3L SMALLINT,
            F3L SMALLINT,
            S3L SMALLINT,
            GenSav CHAR(6))
		</cfquery>
		
		<cfquery datasource="#this.datasource#">
		INSERT INTO StudentTab
			(StuKey, StuID, StuLastName, StuFirstName, DayEv, MajNeed, GenNeed, StuStat, PerComp, MajComp, GenComp, Inprog, MajorID, SchProgram, M2L, H2L, F2L, S2L, L3L, F3L, S3L, GenSav)
		VALUES
(1, '225715', 'Alessi', 'Angela K.     ', 0, -4, 13, 'Senior', 9, 34, 2, 3, 'GAD ', 'UNDG', 0, 0, 0, 0, 0, 0, 1, ''),
(2, '358449', 'ustria', 'Jeffrey D.    ', 0, 9, 14, 'Sophmore', 5, 21, 1, 3, 'GAD ', 'UNDG', 1, 0, 0, 0, 0, 0, 0, ''),
(3, '362210', 'tinger', 'Nicholas P.   ', 0, 21, 13, 'Freshman', 2, 9, 2, 3, 'GAD ', 'UNDG', 0, 1, 0, 0, 0, 0, 1, ''),
(4, '361099', 'edeker', 'Bradley T.    ', 0, 24, 8, 'Sophmore', 3, 6, 7, 4, 'GAD ', 'UNDG', 0, 0, 1, 2, 0, 0, 0, 'GEN247'),
(5, '315071', ' Bown', 'Alison M.      ', 0, 16, 12, 'Sophmore', 4, 14, 3, 4, 'GAD ', 'UNDG', 1, 1, 0, 1, 0, 0, 0, 'GEN241'),
(6, '224186', 'Breyer', 'Allen A.      ', 0, 0, 14, 'Junior', 7, 30, 1, 3, 'GAD ', 'UNDG', 0, 0, 0, 0, 1, 0, 0, ''),
(7, '363493', 'renka', 'Alexander A.   ', 0, 12, 14, 'Sophmore', 4, 18, 1, 3, 'GAD ', 'UNDG', 0, 0, 0, 1, 0, 0, 0, 'GEN244'),
(8, '346019', ' Clark', 'Alex C.       ', 0, 26, 11, 'Freshman', 2, 4, 4, 4, 'GAD ', 'UNDG', 0, 0, 1, 0, 0, 0, 0, ''),
(9, '288613', 'ugherty', 'Justin W.    ', 0, 2, 13, 'Junior', 7, 28, 2, 4, 'GAD ', 'UNDG', 0, 0, 0, 0, 1, 0, 1, ''),
(10, '314662', 'Duenk', 'Jordan E.      ', 0, 14, 13, 'Sophmore', 4, 16, 2, 4, 'GAD ', 'UNDG', 0, 1, 0, 0, 0, 0, 0, ''),
(11, '326151', 'Egerer', 'Rachel A.     ', 0, 14, 13, 'Sophmore', 4, 16, 2, 4, 'GAD ', 'UNDG', 1, 0, 0, 0, 0, 0, 0, ''),
(12, '319032', 'ornoff', 'Steven W.     ', 0, 14, 15, 'Sophmore', 4, 16, 0, 3, 'GAD ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(13, '399070', 'nzley', 'Nicholas J.    ', 0, 22, 8, 'Sophmore', 3, 8, 7, 4, 'GAD ', 'UNDG', 0, 0, 0, 2, 0, 0, 0, 'GEN244'),
(14, '220672', 'ardner', 'Daniel P.     ', 0, 9, 13, 'Sophmore', 5, 21, 2, 4, 'GAD ', 'UNDG', 1, 0, 0, 0, 0, 0, 1, ''),
(15, '218763', 'Geerts', 'Brandon L     ', 0, -7, 15, 'Senior', 9, 37, 0, 0, 'GAD ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(16, '314136', 'rzevske', 'Crista K.    ', 0, 11, 13, 'Sophmore', 5, 19, 2, 4, 'GAD ', 'UNDG', 0, 0, 1, 0, 0, 0, 1, ''),
(17, '172451', 'Gieser', 'Trevor J.     ', 0, -3, 15, 'Junior', 8, 33, 0, 4, 'GAD ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(18, '272699', '  Green', 'Jarret       ', 0, 1, 12, 'Junior', 8, 29, 3, 4, 'GAD ', 'UNDG', 0, 1, 0, 0, 1, 0, 0, ''),
(19, '245602', 'Grundy', 'Aaron M.      ', 0, -6, 12, 'Senior', 9, 36, 3, 3, 'GAD ', 'UNDG', 1, 0, 0, 0, 1, 0, 0, ''),
(20, '257062', 'armsen', 'Adrian J.     ', 0, -9, 14, 'Senior', 10, 39, 1, 0, 'GAD ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(21, '291754', 'eaven', 'Jonathan T.    ', 0, -4, 14, 'Junior', 8, 34, 1, 3, 'GAD ', 'UNDG', 0, 0, 0, 0, 1, 0, 0, ''),
(22, '181068', 'nandez', 'Benjamin R.   ', 0, -2, 13, 'Junior', 8, 32, 2, 4, 'GAD ', 'UNDG', 1, 0, 0, 0, 0, 0, 0, ''),
(23, '260014', ' Jankee', 'Adam J.      ', 0, 5, 11, 'Junior', 7, 25, 4, 3, 'GAD ', 'UNDG', 1, 0, 0, 0, 1, 0, 0, ''),
(24, '214713', 'nson', 'Mitchell Wayne  ', 0, -7, 12, 'Senior', 10, 37, 3, 4, 'GAD ', 'UNDG', 1, 0, 0, 0, 0, 0, 1, ''),
(25, '382425', ' Kelley', 'Sean T.      ', 0, 25, 12, 'Freshman', 2, 5, 3, 4, 'GAD ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(26, '305434', 'Knapp', 'Daniel P.      ', 0, 13, 14, 'Sophmore', 4, 17, 1, 4, 'GAD ', 'UNDG', 0, 0, 0, 1, 0, 0, 0, 'GEN247'),
(27, '347796', 'osturik', 'Daniel M.    ', 0, 10, 14, 'Sophmore', 5, 20, 1, 4, 'GAD ', 'UNDG', 1, 0, 0, 0, 0, 0, 0, ''),
(28, '280752', ' Koth', 'Zachary C      ', 0, -2, 14, 'Junior', 8, 32, 1, 4, 'GAD ', 'UNDG', 0, 0, 0, 0, 0, 0, 1, ''),
(29, '274442', 'auth', 'Kayla Marie     ', 0, -5, 12, 'Senior', 9, 35, 3, 4, 'GAD ', 'UNDG', 1, 1, 0, 0, 0, 0, 1, ''),
(30, '227546', 'awrence', 'Blake M.     ', 0, 2, 13, 'Junior', 7, 28, 2, 4, 'GAD ', 'UNDG', 0, 0, 0, 0, 1, 0, 1, ''),
(31, '325742', 'ehrman', 'Olivia S.     ', 0, 24, 13, 'Freshman', 2, 6, 2, 4, 'GAD ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(32, '285288', 'eigh', 'Alexandra S.    ', 0, 18, 13, 'Sophmore', 3, 12, 2, 3, 'GAD ', 'UNDG', 0, 0, 0, 1, 0, 0, 0, 'GEN244'),
(33, '346365', 'Martin', 'Darius T.     ', 0, 14, 12, 'Sophmore', 4, 16, 3, 4, 'GAD ', 'UNDG', 0, 0, 1, 0, 0, 0, 0, ''),
(34, '304521', 'arzouca', 'Kristina     ', 0, -6, 13, 'Senior', 9, 36, 2, 3, 'GAD ', 'UNDG', 0, 0, 0, 0, 0, 1, 1, ''),
(35, '295702', 'McClure', 'Corey M.     ', 0, 25, 12, 'Freshman', 2, 5, 3, 4, 'GAD ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(36, '245438', ' McQueen', 'Kellen      ', 0, 11, 13, 'Sophmore', 5, 19, 2, 3, 'GAD ', 'UNDG', 1, 0, 0, 1, 0, 0, 0, 'GEN241'),
(37, '301901', '  Menke', 'Kevin        ', 0, 0, 13, 'Junior', 8, 30, 2, 3, 'GAD ', 'UNDG', 1, 0, 0, 0, 0, 0, 0, ''),
(38, '167213', 'es De Oca', 'Anthony K. ', 0, -5, 13, 'Senior', 9, 35, 2, 0, 'GAD ', 'UNDG', 0, 0, 1, 0, 1, 0, 0, ''),
(39, '218933', 'Moore', 'Jarrett R.     ', 0, -8, 13, 'Senior', 10, 38, 2, 0, 'GAD ', 'UNDG', 1, 0, 0, 0, 0, 0, 0, ''),
(40, '364963', ' Moran', 'Brian E.      ', 0, 22, 14, 'Freshman', 2, 8, 1, 3, 'GAD ', 'UNDG', 0, 1, 0, 0, 0, 0, 0, ''),
(41, '132738', 'Mueller', 'Ryan D.      ', 0, -6, 13, 'Senior', 9, 36, 2, 0, 'GAD ', 'UNDG', 1, 0, 0, 0, 0, 0, 0, ''),
(42, '246692', 'Muszynski', 'Kamil      ', 0, 0, 14, 'Junior', 7, 30, 1, 3, 'GAD ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(43, '282165', 'ewski', 'Alexander J.   ', 0, -4, 13, 'Senior', 9, 34, 2, 3, 'GAD ', 'UNDG', 1, 0, 0, 0, 0, 0, 0, ''),
(44, '246697', 'esola', 'Michael V.     ', 0, 3, 14, 'Junior', 7, 27, 1, 4, 'GAD ', 'UNDG', 0, 0, 0, 0, 1, 0, 0, ''),
(45, '354961', ' Petty', 'Douglas       ', 0, 12, 15, 'Sophmore', 4, 18, 0, 0, 'GAD ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(46, '243188', 'zenreuter', 'Melissa A  ', 0, -7, 14, 'Senior', 9, 37, 1, 0, 'GAD ', 'UNDG', 0, 0, 0, 0, 1, 0, 0, ''),
(47, '294869', ' Picardi', 'Jon T.      ', 0, 20, 11, 'Sophmore', 3, 10, 4, 4, 'GAD ', 'UNDG', 0, 1, 0, 1, 0, 0, 0, 'GEN248'),
(48, '333760', 'Priester', 'Ian A.      ', 0, 17, 13, 'Sophmore', 3, 13, 2, 4, 'GAD ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(49, '376457', 'ichardson', 'Bobbie     ', 0, 26, 11, 'Freshman', 2, 4, 4, 4, 'GAD ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(50, '281920', ' Rojas', 'Benjamin      ', 0, 7, 12, 'Junior', 6, 23, 3, 4, 'GAD ', 'UNDG', 0, 0, 1, 1, 0, 0, 0, 'GEN247'),
(51, '381604', 'senberger', 'Allen B.   ', 0, 28, 14, 'Freshman', 0, 2, 1, 4, 'GAD ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(52, '339733', 'Sabo', 'William W.      ', 0, 7, 14, 'Junior', 6, 23, 1, 4, 'GAD ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(53, '332712', 'Scalise', 'David B.     ', 0, -5, 15, 'Junior', 8, 35, 0, 3, 'GAD ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(54, '305478', 'Schuster', 'Jaston      ', 0, 15, 13, 'Sophmore', 4, 15, 2, 3, 'GAD ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(55, '184608', 'Schwiesow', 'Stacey     ', 0, -2, 13, 'Junior', 8, 32, 2, 2, 'GAD ', 'UNDG', 0, 0, 0, 0, 0, 1, 0, ''),
(56, '371228', ' Shaer', 'Jake E.       ', 0, 26, 11, 'Freshman', 2, 4, 4, 4, 'GAD ', 'UNDG', 0, 0, 0, 1, 0, 0, 0, 'GEN244'),
(57, '307065', 'ievers', 'Shannon R.    ', 0, 17, 11, 'Sophmore', 4, 13, 4, 4, 'GAD ', 'UNDG', 0, 2, 0, 1, 0, 0, 0, 'GEN247'),
(58, '212360', 'rica', 'Titus Benjamin  ', 0, -7, 15, 'Senior', 9, 37, 0, 0, 'GAD ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(59, '240810', ' Smith', 'Cody M.       ', 0, 1, 14, 'Junior', 7, 29, 1, 4, 'GAD ', 'UNDG', 0, 0, 0, 0, 0, 1, 0, ''),
(60, '297853', '  Smith', 'Kevin        ', 0, -6, 14, 'Senior', 9, 36, 1, 2, 'GAD ', 'UNDG', 1, 0, 0, 0, 0, 0, 0, ''),
(61, '220579', 'Smith', 'Shannon A      ', 0, 5, 13, 'Junior', 6, 25, 2, 4, 'GAD ', 'UNDG', 1, 0, 0, 1, 0, 0, 0, 'GEN248'),
(62, '243447', 'nodgrass', 'Neal B.     ', 0, -7, 14, 'Senior', 9, 37, 1, 3, 'GAD ', 'UNDG', 0, 0, 0, 0, 0, 0, 1, ''),
(63, '307353', 'demann', 'Victoria L.   ', 0, 18, 13, 'Sophmore', 3, 12, 2, 3, 'GAD ', 'UNDG', 1, 0, 0, 0, 0, 0, 0, ''),
(64, '163982', 'pencer', 'Derrick S.    ', 0, -5, 14, 'Senior', 9, 35, 1, 3, 'GAD ', 'UNDG', 0, 0, 0, 0, 1, 0, 0, ''),
(65, '233096', ' Stamm', 'Kyle C.       ', 0, 17, 12, 'Sophmore', 4, 13, 3, 4, 'GAD ', 'UNDG', 1, 0, 1, 1, 0, 0, 0, 'GEN247'),
(66, '139815', 'ankowicz', 'David G.    ', 0, 4, 15, 'Junior', 6, 26, 0, 4, 'GAD ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(67, '280056', ' Strehlow', 'Scott      ', 0, -1, 11, 'Junior', 8, 31, 4, 5, 'GAD ', 'UNDG', 1, 0, 0, 0, 0, 1, 1, ''),
(68, '324812', 'an', 'Evangeline C.     ', 0, 12, 15, 'Sophmore', 4, 18, 0, 3, 'GAD ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(69, '361421', ' Thieman', 'Tracy       ', 0, 14, 12, 'Sophmore', 4, 16, 3, 4, 'GAD ', 'UNDG', 0, 0, 0, 1, 0, 0, 0, 'GEN248'),
(70, ' 81820', 'Tinsley', 'M. Gina      ', 0, -3, 13, 'Junior', 8, 33, 2, 2, 'GAD ', 'UNDG', 1, 0, 0, 0, 0, 0, 0, ''),
(71, '330363', ' Verden', 'Jana L.      ', 0, 13, 13, 'Sophmore', 4, 17, 2, 4, 'GAD ', 'UNDG', 0, 0, 0, 0, 0, 0, 1, ''),
(72, '320586', ' Voss', 'Darius L.      ', 0, 3, 14, 'Junior', 7, 27, 1, 3, 'GAD ', 'UNDG', 0, 0, 0, 0, 0, 0, 1, ''),
(73, '333526', 'Waite', 'Jeremy J.      ', 0, 19, 13, 'Sophmore', 3, 11, 2, 3, 'GAD ', 'UNDG', 0, 0, 0, 1, 0, 0, 0, 'GEN241'),
(74, '320245', 'ychowicz', 'Patrick J.  ', 0, 23, 14, 'Freshman', 2, 7, 1, 2, 'GAD ', 'UNDG', 1, 0, 0, 0, 0, 0, 0, ''),
(75, '245872', 'illiams', 'James R.     ', 0, 3, 15, 'Junior', 6, 27, 0, 4, 'GAD ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(76, '382718', 'arlile', 'Timothy W.    ', 1, 13, 15, 'Sophmore', 4, 17, 0, 2, 'GADE', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(77, '397080', '  Wahl', 'Brad M.       ', 1, 25, 12, 'Freshman', 2, 5, 3, 3, 'GADE', 'UNDG', 0, 0, 0, 0, 0, 0, 1, ''),
(78, '387430', 'etta', 'Christopher S.  ', 0, 24, 5, 'Sophmore', 4, 6, 10, 2, 'GAD ', 'UNDG', 1, 1, 1, 2, 0, 0, 0, 'GEN247'),
(79, '315855', 'ystrom', 'Philip A.     ', 0, 30, 13, 'Freshman', 0, 0, 2, 2, 'GAD ', 'UNDG', 0, 0, 0, 0, 0, 1, 1, ''),
(80, '266124', ' Wells', 'Kevin B.      ', 0, 26, 5, 'Sophmore', 3, 4, 10, 4, 'GAD ', 'UNDG', 0, 1, 0, 2, 0, 0, 0, 'GEN248'),
(81, '376639', 'Wilk', 'Jeremiah A.     ', 0, 29, 14, 'Freshman', 0, 1, 1, 2, 'GAD ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(82, '329658', '  Yohe', 'Nick M.       ', 0, 28, 13, 'Freshman', 1, 2, 2, 4, 'GAD ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(83, '264564', 'ngleton', 'Dustin W.    ', 0, 21, 13, 'Freshman', 2, 9, 2, 4, 'GAD ', 'UNDG', 0, 0, 0, 1, 0, 0, 0, 'GEN241'),
(84, '255850', '  Flores', 'Zoila       ', 0, 4, 14, 'Junior', 6, 26, 1, 3, 'GAD ', 'UNDG', 0, 0, 0, 0, 1, 0, 0, ''),
(85, '308848', '  Kleiser', 'Ryan       ', 0, 18, 13, 'Sophmore', 3, 12, 2, 4, 'GAD ', 'UNDG', 0, 1, 0, 0, 0, 0, 0, ''),
(86, '263140', 'oestner', 'Sarah A.     ', 0, 26, 15, 'Freshman', 1, 4, 0, 2, 'GAD ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(87, '307919', ' Wenzel', 'Emilie       ', 0, 16, 14, 'Sophmore', 3, 14, 1, 4, 'GAD ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(88, '375562', '  Achebo', 'Nubi        ', 0, 25, 13, 'Freshman', 1, 5, 2, 4, 'MAA ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(89, '254409', 'Aguilar', 'Diego G      ', 0, 0, 13, 'Junior', 8, 30, 2, 4, 'MAA ', 'UNDG', 0, 0, 0, 0, 1, 0, 0, ''),
(90, '371500', 'Aguilar', 'Emmanuel     ', 0, 26, 11, 'Freshman', 2, 4, 4, 4, 'MAA ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(91, '220373', 'ele', 'Babajide Akinyole', 0, -7, 14, 'Senior', 9, 37, 1, 0, 'MAA ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(92, '223532', 'Alhosini', 'Assmaa      ', 0, -4, 15, 'Junior', 8, 34, 0, 2, 'MAA ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(93, '347760', 'derson', 'Brandon D.    ', 0, 25, 12, 'Freshman', 2, 5, 3, 4, 'MAA ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(94, '274959', 'rson', 'Christopher R.  ', 0, 7, 15, 'Sophmore', 5, 23, 0, 2, 'MAA ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(95, '275857', 'Andres', 'Jake H.F.     ', 0, 1, 14, 'Junior', 7, 29, 1, 3, 'MAA ', 'UNDG', 0, 0, 0, 0, 1, 0, 0, ''),
(96, '350466', 'prile', 'Dominic A.     ', 0, 28, 13, 'Freshman', 1, 2, 2, 3, 'MAA ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(97, '366327', 'viles', 'Cristian X.    ', 0, 20, 13, 'Sophmore', 3, 10, 2, 4, 'MAA ', 'UNDG', 0, 1, 0, 0, 0, 0, 0, ''),
(98, '376508', 'Ayres', 'Maxwell P.     ', 0, 18, 12, 'Sophmore', 3, 12, 3, 4, 'MAA ', 'UNDG', 0, 0, 0, 1, 0, 0, 0, 'GEN244'),
(99, '398189', 'Bardales', 'Luis A.     ', 0, 26, 12, 'Freshman', 1, 4, 3, 4, 'MAA ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(100, '313417', ' Basco', 'Ryan J.       ', 0, 20, 14, 'Freshman', 2, 10, 1, 3, 'MAA ', 'UNDG', 0, 0, 1, 0, 0, 0, 0, ''),
(101, '395032', 'Bauer', 'Nicole M.      ', 0, 28, 14, 'Freshman', 0, 2, 1, 3, 'MAA ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(102, '310388', ' Bengtson', 'Kevin      ', 0, -5, 14, 'Senior', 9, 35, 1, 2, 'MAA ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(103, '261155', 'erta', 'Caroline E.     ', 0, 16, 11, 'Sophmore', 4, 14, 4, 4, 'MAA ', 'UNDG', 1, 1, 1, 0, 0, 0, 0, ''),
(104, '261167', 'lack', 'Ryan Thomas     ', 0, 3, 13, 'Junior', 7, 27, 2, 4, 'MAA ', 'UNDG', 0, 0, 0, 0, 1, 1, 0, ''),
(105, '276508', '  Bowles', 'Sara        ', 0, 3, 13, 'Junior', 7, 27, 2, 3, 'MAA ', 'UNDG', 1, 0, 0, 0, 0, 1, 0, ''),
(106, '366372', 'Bryant', 'Ricky Jr      ', 0, 14, 14, 'Sophmore', 4, 16, 1, 4, 'MAA ', 'UNDG', 0, 0, 0, 0, 0, 1, 0, ''),
(107, '366933', 'Burton', 'Daniel Q.     ', 0, 28, 14, 'Freshman', 0, 2, 1, 3, 'MAA ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(108, '359299', 'uttstadt', 'Erich R.    ', 0, 13, 13, 'Sophmore', 4, 17, 2, 3, 'MAA ', 'UNDG', 0, 0, 0, 0, 1, 0, 1, ''),
(109, '378990', 'Buyco', 'Hamill S.      ', 0, 25, 14, 'Freshman', 1, 5, 1, 3, 'MAA ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(110, '160056', 'arlson', 'Matthew B.    ', 0, 1, 13, 'Junior', 7, 29, 2, 3, 'MAA ', 'UNDG', 0, 0, 0, 1, 0, 0, 1, 'GEN241'),
(111, '244160', 'Castro', 'Jesus E.      ', 0, 18, 11, 'Sophmore', 4, 12, 4, 4, 'MAA ', 'UNDG', 0, 1, 0, 1, 0, 0, 0, 'GEN247'),
(112, '262867', 'hambers', 'Coty R.T.    ', 0, 7, 12, 'Junior', 6, 23, 3, 4, 'MAA ', 'UNDG', 0, 1, 0, 0, 0, 0, 0, ''),
(113, '378382', 'hattic', 'Cameron G.    ', 0, 29, 15, 'Freshman', 0, 1, 0, 0, 'MAA ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(114, '328002', 'Chmiel', 'Diana M.      ', 0, 27, 15, 'Freshman', 0, 3, 0, 3, 'MAA ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(115, '400656', 'istensen', 'Michael D.  ', 0, 23, 6, 'Sophmore', 4, 7, 9, 3, 'MAA ', 'UNDG', 1, 1, 1, 2, 0, 0, 0, 'GEN247'),
(116, '322163', 'Cikesh', 'Sarah M.      ', 0, 21, 13, 'Freshman', 2, 9, 2, 2, 'MAA ', 'UNDG', 0, 0, 0, 1, 0, 0, 0, 'GEN244'),
(117, '266001', 'ehoorn', 'Michael E.    ', 0, -2, 13, 'Junior', 8, 32, 2, 3, 'MAA ', 'UNDG', 1, 0, 0, 0, 0, 0, 0, ''),
(118, '225204', 'Cook', 'Michael A.      ', 0, -2, 12, 'Junior', 8, 32, 3, 4, 'MAA ', 'UNDG', 1, 0, 0, 0, 1, 0, 0, ''),
(119, '270465', ' Cooper', 'Alan T.      ', 0, 18, 12, 'Sophmore', 3, 12, 3, 4, 'MAA ', 'UNDG', 0, 0, 1, 0, 0, 0, 0, ''),
(120, '271863', 'onel', 'Christopher J.  ', 0, 26, 13, 'Freshman', 1, 4, 2, 3, 'MAA ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(121, '402988', '  Cosio', 'Ismael       ', 0, 28, 14, 'Freshman', 0, 2, 1, 4, 'MAA ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(122, '351050', ' Crespo', 'Anibal       ', 0, 23, 14, 'Freshman', 2, 7, 1, 2, 'MAA ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(123, '300634', 'ystrunk', 'DaLisa M.    ', 0, 27, 14, 'Freshman', 1, 3, 1, 3, 'MAA ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(124, '324160', 'De Filippo', 'Mark      ', 0, 27, 13, 'Freshman', 1, 3, 2, 3, 'MAA ', 'UNDG', 0, 0, 0, 0, 0, 0, 1, ''),
(125, '377419', 'Dean', 'Clayton P.      ', 0, 25, 14, 'Freshman', 1, 5, 1, 4, 'MAA ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(126, '328829', 'DiBattista', 'Alex      ', 0, 27, 15, 'Freshman', 0, 3, 0, 3, 'MAA ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(127, '313614', ' Dolin', 'Joree L.      ', 0, 2, 12, 'Junior', 7, 28, 3, 4, 'MAA ', 'UNDG', 1, 0, 0, 0, 1, 0, 0, ''),
(128, '362955', ' Duran', 'Michael       ', 0, 22, 13, 'Freshman', 2, 8, 2, 3, 'MAA ', 'UNDG', 0, 0, 0, 1, 0, 0, 0, 'GEN244'),
(129, '370996', 'Easson', 'Bailey J.     ', 0, 13, 14, 'Sophmore', 4, 17, 1, 3, 'MAA ', 'UNDG', 1, 0, 0, 0, 0, 0, 0, ''),
(130, '194668', 'ckler', 'Victoria R.    ', 0, -6, 13, 'Senior', 9, 36, 2, 3, 'MAA ', 'UNDG', 0, 0, 0, 0, 0, 0, 1, ''),
(131, '102668', '  Elrayes', 'Nora       ', 0, 24, 15, 'Freshman', 1, 6, 0, 2, 'MAA ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(132, '313646', 'Esqueda', 'Raul F.      ', 0, 24, 14, 'Freshman', 1, 6, 1, 2, 'MAA ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(133, '302811', 'ernandez', 'Egan C.     ', 0, 17, 12, 'Sophmore', 4, 13, 3, 4, 'MAA ', 'UNDG', 0, 1, 0, 0, 0, 0, 0, ''),
(134, '218728', 'Fix', 'Brandon Paul     ', 0, -8, 13, 'Senior', 10, 38, 2, 3, 'MAA ', 'UNDG', 0, 0, 0, 0, 1, 1, 0, ''),
(135, '274977', 'Flatt', 'Angela C.      ', 0, 16, 12, 'Sophmore', 4, 14, 3, 4, 'MAA ', 'UNDG', 0, 1, 0, 1, 0, 1, 0, 'GEN247'),
(136, '359294', 'Foote', 'Andrew M.      ', 0, 25, 9, 'Freshman', 2, 5, 6, 4, 'MAA ', 'UNDG', 0, 1, 0, 1, 0, 0, 0, 'GEN244'),
(137, '313875', 'Francis', 'Ryan G.      ', 0, 8, 13, 'Junior', 6, 22, 2, 4, 'MAA ', 'UNDG', 0, 0, 1, 0, 0, 0, 1, ''),
(138, '336013', 'raser', 'Richard K.     ', 0, 21, 13, 'Freshman', 2, 9, 2, 3, 'MAA ', 'UNDG', 0, 0, 0, 0, 0, 1, 0, ''),
(139, '252092', 'rench', 'Douglas S.     ', 0, -5, 15, 'Junior', 8, 35, 0, 3, 'MAA ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(140, '348499', 'Frye', 'Michael L.      ', 0, 24, 14, 'Freshman', 1, 6, 1, 2, 'MAA ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(141, '386093', 'Garrison', 'Kristen     ', 0, 17, 15, 'Sophmore', 3, 13, 0, 4, 'MAA ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(142, '325673', 'Gash', 'Brandon M.      ', 0, 28, 15, 'Freshman', 0, 2, 0, 3, 'MAA ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(143, '360454', 'audette', 'James M.     ', 0, 26, 13, 'Freshman', 1, 4, 2, 3, 'MAA ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(144, '195525', 'llmeister', 'Jessica    ', 0, 3, 12, 'Junior', 7, 27, 3, 4, 'MAA ', 'UNDG', 0, 0, 0, 1, 0, 1, 1, 'GEN241'),
(145, '230588', 'leason', 'Katlyn E.     ', 0, 24, 13, 'Freshman', 2, 6, 2, 4, 'MAA ', 'UNDG', 0, 0, 0, 0, 0, 0, 1, ''),
(146, '265145', 'Golenia', 'Sarah A.     ', 0, 0, 12, 'Junior', 8, 30, 3, 3, 'MAA ', 'UNDG', 1, 0, 0, 0, 1, 0, 1, ''),
(147, '236883', 'Gurbal', 'Molly J.      ', 0, -5, 14, 'Senior', 9, 35, 1, 3, 'MAA ', 'UNDG', 1, 0, 0, 0, 0, 0, 0, ''),
(148, '384535', 'uzman', 'Eduardo D.     ', 0, 25, 12, 'Freshman', 2, 5, 3, 4, 'MAA ', 'UNDG', 0, 1, 0, 0, 0, 0, 0, ''),
(149, '371851', 'Halter', 'Rachel M.     ', 0, 25, 12, 'Freshman', 2, 5, 3, 4, 'MAA ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(150, '383441', 'alverson', 'Micah E.    ', 0, 21, 14, 'Freshman', 2, 9, 1, 3, 'MAA ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(151, '270230', ' Harms', 'Emily S.      ', 0, 25, 12, 'Freshman', 2, 5, 3, 4, 'MAA ', 'UNDG', 0, 0, 1, 0, 0, 0, 0, ''),
(152, '249246', ' Harper', 'Austin       ', 0, 4, 13, 'Junior', 7, 26, 2, 3, 'MAA ', 'UNDG', 1, 0, 0, 0, 0, 1, 0, ''),
(153, '327493', 'idbreder', 'Robert D.   ', 0, 7, 14, 'Junior', 6, 23, 1, 3, 'MAA ', 'UNDG', 0, 0, 0, 0, 0, 0, 1, ''),
(154, '320555', 'Heiler', 'Andrew J.     ', 0, 25, 12, 'Freshman', 2, 5, 3, 4, 'MAA ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(155, '383200', 'nderson', 'Timothy C.   ', 0, 26, 12, 'Freshman', 1, 4, 3, 4, 'MAA ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(156, '348434', '  Heo', 'Jee Hoon       ', 0, 14, 14, 'Sophmore', 4, 16, 1, 3, 'MAA ', 'UNDG', 0, 0, 0, 0, 0, 1, 0, ''),
(157, '229467', 'eraty', 'Melissa S.     ', 0, 4, 13, 'Junior', 7, 26, 2, 4, 'MAA ', 'UNDG', 0, 1, 0, 0, 0, 0, 0, ''),
(158, '313665', 'nandez', 'Christina M.  ', 0, -3, 13, 'Junior', 8, 33, 2, 3, 'MAA ', 'UNDG', 1, 0, 0, 0, 0, 0, 0, ''),
(159, '318052', 'Hernandez', 'Felipe     ', 0, 16, 13, 'Sophmore', 4, 14, 2, 2, 'MAA ', 'UNDG', 0, 1, 0, 0, 0, 0, 0, ''),
(160, '313536', 'Hernandez', 'Olivia     ', 0, 14, 13, 'Sophmore', 4, 16, 2, 4, 'MAA ', 'UNDG', 0, 0, 1, 0, 0, 0, 0, ''),
(161, '310136', 'Hernandez', 'Yvonne     ', 0, 7, 14, 'Junior', 6, 23, 1, 0, 'MAA ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(162, '307417', 'Hiser', 'Carson J.      ', 0, 15, 13, 'Sophmore', 4, 15, 2, 4, 'MAA ', 'UNDG', 1, 1, 0, 0, 0, 0, 0, ''),
(163, '310115', 'olmes', 'Matthew D.     ', 0, -4, 13, 'Senior', 9, 34, 2, 3, 'MAA ', 'UNDG', 0, 0, 0, 0, 1, 0, 0, ''),
(164, '230271', 'Houge', 'Brandon J      ', 0, -6, 14, 'Senior', 9, 36, 1, 0, 'MAA ', 'UNDG', 0, 0, 0, 0, 0, 0, 1, ''),
(165, '343802', 'mphrey', 'William K.    ', 0, 14, 13, 'Sophmore', 4, 16, 2, 4, 'MAA ', 'UNDG', 0, 0, 0, 1, 0, 1, 0, 'GEN247'),
(166, '266233', '  Idris', 'Lateef       ', 0, 16, 12, 'Sophmore', 4, 14, 3, 4, 'MAA ', 'UNDG', 0, 0, 0, 0, 0, 1, 0, ''),
(167, '236319', '   Ites', 'Katie        ', 0, -3, 13, 'Junior', 8, 33, 2, 3, 'MAA ', 'UNDG', 1, 0, 0, 0, 1, 0, 0, ''),
(168, '199811', ' Jacobs', 'Phil R.      ', 0, -7, 15, 'Senior', 9, 37, 0, 4, 'MAA ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(169, '268964', 'ohnson', 'Darnell M.    ', 0, 29, 15, 'Freshman', 0, 1, 0, 0, 'MAA ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(170, '142156', 'ones', 'Christine E.    ', 0, 19, 13, 'Sophmore', 3, 11, 2, 3, 'MAA ', 'UNDG', 1, 1, 0, 0, 0, 0, 0, ''),
(171, '397859', 'Jones', 'Michael L.     ', 0, 25, 12, 'Freshman', 2, 5, 3, 4, 'MAA ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(172, '328895', 'Jones', 'Victor D.      ', 0, 19, 14, 'Sophmore', 3, 11, 1, 3, 'MAA ', 'UNDG', 0, 0, 1, 0, 0, 0, 0, ''),
(173, '337226', 'chelmuss', 'Jevin S.    ', 0, 14, 13, 'Sophmore', 4, 16, 2, 4, 'MAA ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(174, '166271', 'Kasiba', 'Alyssa D.     ', 0, 0, 14, 'Junior', 7, 30, 1, 4, 'MAA ', 'UNDG', 1, 0, 0, 0, 0, 0, 0, ''),
(175, '372555', 'Kasten', 'Kevin W.      ', 0, 18, 13, 'Sophmore', 3, 12, 2, 4, 'MAA ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(176, '241572', 'Kester', 'Nadia Lea     ', 0, -6, 12, 'Senior', 9, 36, 3, 4, 'MAA ', 'UNDG', 1, 0, 0, 0, 1, 0, 0, ''),
(177, '235076', ' Khan', 'Mayra A.       ', 0, -7, 15, 'Senior', 9, 37, 0, 0, 'MAA ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),
(178, '352256', 'Knight', 'David R.      ', 0, 28, 14, 'Freshman', 0, 2, 1, 2, 'MAA ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, '')

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

</cfcomponent>