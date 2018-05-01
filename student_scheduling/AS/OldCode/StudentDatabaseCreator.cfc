<cfcomponent>

	<cfset this.datasource = "StudentsAudit">
	
	<cffunction name="createAuditRecs" access="public" returntype="string">
	
		<cfset dropTable('AuditRecs')>
	
		<cfquery datasource="#this.datasource#">
		CREATE TABLE
			AuditRecs(RecKey INT
				NOT NULL
			    GENERATED BY DEFAULT AS IDENTITY (START WITH 239)
		    	CONSTRAINT AuditRecs_PK PRIMARY KEY,
            StuID VARCHAR(6),    
            Prog VARCHAR(4),    
            MajID VARCHAR(4),
		    Spec VARCHAR(2),
			CourseCode VARCHAR(6),
			CourseDone VARCHAR(9),
            FlagDone INTEGER,
            DateDone VARCHAR(4),
            Grade VARCHAR(2))
		</cfquery>
		
		<cfquery datasource="#this.datasource#">
		INSERT INTO AuditRecs 
		(RecKey, StuID, Prog, MajID, Spec, CourseCode, CourseDone, FlagDone, DateDone, Grade) 
		VALUES
(1, '371228', 'UNDG', 'GADE', '  ', 'ART100', 'ART100   ', 1, 'SU11', 'IP'),
(2, '371228', 'UNDG', 'GADE', '  ', 'ART110', '_________', 0, '    ', '  '),
(3, '371228', 'UNDG', 'GADE', '  ', 'MAA116', '_________', 0, '    ', '  '),
(4, '371228', 'UNDG', 'GADE', '  ', 'MAA221', '_________', 0, '    ', '  '),
(5, '371228', 'UNDG', 'GADE', '  ', 'GAD233', '_________', 0, '    ', '  '),
(6, '371228', 'UNDG', 'GADE', '  ', 'GAD211', '_________', 0, '    ', '  '),
(7, '371228', 'UNDG', 'GADE', '  ', 'GAD338', '_________', 0, '    ', '  '),
(8, '371228', 'UNDG', 'GADE', '  ', 'GAD357', '_________', 0, '    ', '  '),
(9, '371228', 'UNDG', 'GADE', '  ', 'GAD467', '_________', 0, '    ', '  '),
(10, '371228', 'UNDG', 'GADE', '  ', 'MAA451', '_________', 0, '    ', '  '),
(11, '371228', 'UNDG', 'GADE', '  ', 'MAA461', '_________', 0, '    ', '  '),
(12, '371228', 'UNDG', 'GADE', '  ', 'MAA471', '_________', 0, '    ', '  '),
(13, '371228', 'UNDG', 'GADE', '  ', 'ART102', 'ART102   ', 1, 'SU11', 'IP'),
(14, '371228', 'UNDG', 'GADE', '  ', 'ART111', '_________', 0, '    ', '  '),
(15, '371228', 'UNDG', 'GADE', '  ', 'MAA123', '_________', 0, '    ', '  '),
(16, '371228', 'UNDG', 'GADE', '  ', 'MAA224', '_________', 0, '    ', '  '),
(17, '371228', 'UNDG', 'GADE', '  ', 'MAA228', '_________', 0, '    ', '  '),
(18, '371228', 'UNDG', 'GADE', '  ', 'MAA337', '_________', 0, '    ', '  '),
(19, '371228', 'UNDG', 'GADE', '  ', 'GAD325', '_________', 0, '    ', '  '),
(20, '371228', 'UNDG', 'GADE', '  ', 'GAD335', '_________', 0, '    ', '  '),
(21, '371228', 'UNDG', 'GADE', '  ', 'GAD445', '_________', 0, '    ', '  '),
(22, '371228', 'UNDG', 'GADE', '  ', 'GAD448', '_________', 0, '    ', '  '),
(23, '371228', 'UNDG', 'GADE', '  ', 'GAD455', '_________', 0, '    ', '  '),
(24, '371228', 'UNDG', 'GADE', '  ', 'GEN340', '_________', 0, '    ', '  '),
(25, '371228', 'UNDG', 'GADE', '  ', 'GEN345', '_________', 0, '    ', '  '),
(26, '371228', 'UNDG', 'GADE', '  ', 'GEN101', '_________', 0, '    ', '  '),
(27, '371228', 'UNDG', 'GADE', '  ', 'GAD101', '_________', 0, '    ', '  '),
(28, '371228', 'UNDG', 'GADE', '  ', 'DPH242', '_________', 0, '    ', '  '),
(29, '371228', 'UNDG', 'GADE', '  ', 'MAA217', '_________', 0, '    ', '  '),
(30, '371228', 'UNDG', 'GADE', '  ', 'MAA227', '_________', 0, '    ', '  '),
(31, '371228', 'UNDG', 'GADE', '  ', 'MAA347', '_________', 0, '    ', '  '),
(32, '371228', 'UNDG', 'GADE', '  ', 'GAD356', '_________', 0, '    ', '  '),
(33, '371228', 'UNDG', 'GADE', '  ', 'GAD466', '_________', 0, '    ', '  '),
(34, '371228', 'UNDG', 'GADE', '  ', 'GEN241', '_________', 0, '    ', '  '),
(35, '371228', 'UNDG', 'GADE', '  ', 'GEN244', '_________', 0, '    ', '  '),
(36, '371228', 'UNDG', 'GADE', '  ', 'GEN247', '_________', 0, '    ', '  '),
(37, '371228', 'UNDG', 'GADE', '  ', 'GEN248', '_________', 0, '    ', '  '),
(38, '371228', 'UNDG', 'GADE', '  ', 'GEN310', '_________', 0, '    ', '  '),
(39, '371228', 'UNDG', 'GADE', '  ', 'GEN325', '_________', 0, '    ', '  '),
(40, '371228', 'UNDG', 'GADE', '  ', 'GEN329', '_________', 0, '    ', '  '),
(41, '371228', 'UNDG', 'GADE', '  ', 'GEN360', '_________', 0, '    ', '  '),
(42, '371228', 'UNDG', 'GADE', '  ', 'GEN380', '_________', 0, '    ', '  '),
(43, '371228', 'UNDG', 'GADE', '  ', 'GEN399', '_________', 0, '    ', '  '),
(44, '371228', 'UNDG', 'GADE', '  ', 'GEN150', 'GEN150   ', 1, 'SU11', 'IP'),
(45, '371228', 'UNDG', 'GADE', '  ', 'GEN102', '_________', 0, '    ', '  '),
(46, '371228', 'UNDG', 'GADE', '  ', 'GEN105', 'GEN105   ', 1, 'SU11', 'IP'),
(47, '371228', 'UNDG', 'GADE', '  ', 'GEN205', '_________', 0, '    ', '  '),
(48, '371228', 'UNDG', 'GADE', '  ', 'GEN211', '_________', 0, '    ', '  '),
(49, '371228', 'UNDG', 'GADE', '  ', 'GEN212', '_________', 0, '    ', '  '),
(50, '371228', 'UNDG', 'GADE', '  ', 'GEN250', '_________', 0, '    ', '  '),
(51, '371228', 'UNDG', 'GADE', '  ', 'GEN257', '_________', 0, '    ', '  '),
(52, '371228', 'UNDG', 'GADE', '  ', 'GEN253', '_________', 0, '    ', '  '),
(53, '371228', 'UNDG', 'GADE', '  ', 'GEN260', '_________', 0, '    ', '  '),
(54, '371228', 'UNDG', 'GADE', '  ', 'GEN228', '_________', 0, '    ', '  '),
(55, '371228', 'UNDG', 'GADE', '  ', 'GEN223', '_________', 0, '    ', '  '),
(56, '371228', 'UNDG', 'GADE', '  ', 'GEN225', '_________', 0, '    ', '  '),
(57, '371228', 'UNDG', 'GADE', '  ', 'GEN230', '_________', 0, '    ', '  '),
(58, '371228', 'UNDG', 'GADE', '  ', 'GEN231', '_________', 0, '    ', '  '),
(59, '371228', 'UNDG', 'GADE', '  ', 'GEN286', '_________', 0, '    ', '  '),
(60, '377419', 'UNDG', 'MAAE', '  ', 'GEN095', '_________', 0, '    ', '  '),
(61, '377419', 'UNDG', 'MAAE', '  ', 'GEN098', 'GEN098   ', 1, 'SU11', 'IP'),
(62, '377419', 'UNDG', 'MAAE', '  ', 'ART100', 'ART100   ', 1, 'SU11', 'IP'),
(63, '377419', 'UNDG', 'MAAE', '  ', 'ART110', '_________', 0, '    ', '  '),
(64, '377419', 'UNDG', 'MAAE', '  ', 'MAA116', '_________', 0, '    ', '  '),
(65, '377419', 'UNDG', 'MAAE', '  ', 'MAA221', '_________', 0, '    ', '  '),
(66, '377419', 'UNDG', 'MAAE', '  ', 'GAD233', '_________', 0, '    ', '  '),
(67, '377419', 'UNDG', 'MAAE', '  ', 'MAA234', '_________', 0, '    ', '  '),
(68, '377419', 'UNDG', 'MAAE', '  ', 'GAD357', '_________', 0, '    ', '  '),
(69, '377419', 'UNDG', 'MAAE', '  ', 'MAA454', '_________', 0, '    ', '  '),
(70, '377419', 'UNDG', 'MAAE', '  ', 'GAD448', '_________', 0, '    ', '  '),
(71, '377419', 'UNDG', 'MAAE', '  ', 'MAA451', '_________', 0, '    ', '  '),
(72, '377419', 'UNDG', 'MAAE', '  ', 'MAA461', '_________', 0, '    ', '  '),
(73, '377419', 'UNDG', 'MAAE', '  ', 'MAA471', '_________', 0, '    ', '  '),
(74, '377419', 'UNDG', 'MAAE', '  ', 'ART102', 'ART102   ', 1, 'SU11', 'IP'),
(75, '377419', 'UNDG', 'MAAE', '  ', 'ART111', '_________', 0, '    ', '  '),
(76, '377419', 'UNDG', 'MAAE', '  ', 'MAA123', '_________', 0, '    ', '  '),
(77, '377419', 'UNDG', 'MAAE', '  ', 'MAA224', '_________', 0, '    ', '  '),
(78, '377419', 'UNDG', 'MAAE', '  ', 'MAA228', '_________', 0, '    ', '  '),
(79, '377419', 'UNDG', 'MAAE', '  ', 'MAA337', '_________', 0, '    ', '  '),
(80, '377419', 'UNDG', 'MAAE', '  ', 'MAA344', '_________', 0, '    ', '  '),
(81, '377419', 'UNDG', 'MAAE', '  ', 'MAA338', '_________', 0, '    ', '  '),
(82, '377419', 'UNDG', 'MAAE', '  ', 'MAA467', '_________', 0, '    ', '  '),
(83, '377419', 'UNDG', 'MAAE', '  ', 'MAA458', '_________', 0, '    ', '  '),
(84, '377419', 'UNDG', 'MAAE', '  ', 'MAA468', '_________', 0, '    ', '  '),
(85, '377419', 'UNDG', 'MAAE', '  ', 'GEN340', '_________', 0, '    ', '  '),
(86, '377419', 'UNDG', 'MAAE', '  ', 'GEN345', '_________', 0, '    ', '  '),
(87, '377419', 'UNDG', 'MAAE', '  ', 'GEN101', '_________', 0, '    ', '  '),
(88, '377419', 'UNDG', 'MAAE', '  ', 'MAA101', '_________', 0, '    ', '  '),
(89, '377419', 'UNDG', 'MAAE', '  ', 'DPH242', '_________', 0, '    ', '  '),
(90, '377419', 'UNDG', 'MAAE', '  ', 'MAA217', '_________', 0, '    ', '  '),
(91, '377419', 'UNDG', 'MAAE', '  ', 'MAA227', '_________', 0, '    ', '  '),
(92, '377419', 'UNDG', 'MAAE', '  ', 'MAA347', '_________', 0, '    ', '  '),
(93, '377419', 'UNDG', 'MAAE', '  ', 'MAA336', '_________', 0, '    ', '  '),
(94, '377419', 'UNDG', 'MAAE', '  ', 'MAA346', '_________', 0, '    ', '  '),
(95, '377419', 'UNDG', 'MAAE', '  ', 'GEN241', '_________', 0, '    ', '  '),
(96, '377419', 'UNDG', 'MAAE', '  ', 'GEN244', '_________', 0, '    ', '  '),
(97, '377419', 'UNDG', 'MAAE', '  ', 'GEN247', '_________', 0, '    ', '  '),
(98, '377419', 'UNDG', 'MAAE', '  ', 'GEN248', '_________', 0, '    ', '  '),
(99, '377419', 'UNDG', 'MAAE', '  ', 'GEN310', '_________', 0, '    ', '  '),
(100, '377419', 'UNDG', 'MAAE', '  ', 'GEN325', '_________', 0, '    ', '  '),
(101, '377419', 'UNDG', 'MAAE', '  ', 'GEN329', '_________', 0, '    ', '  '),
(102, '377419', 'UNDG', 'MAAE', '  ', 'GEN360', '_________', 0, '    ', '  '),
(103, '377419', 'UNDG', 'MAAE', '  ', 'GEN380', '_________', 0, '    ', '  '),
(104, '377419', 'UNDG', 'MAAE', '  ', 'GEN399', '_________', 0, '    ', '  '),
(105, '377419', 'UNDG', 'MAAE', '  ', 'GEN150', '_________', 0, '    ', '  '),
(106, '377419', 'UNDG', 'MAAE', '  ', 'GEN102', '_________', 0, '    ', '  '),
(107, '377419', 'UNDG', 'MAAE', '  ', 'GEN105', 'GEN105   ', 1, 'SU11', 'IP'),
(108, '377419', 'UNDG', 'MAAE', '  ', 'GEN211', '_________', 0, '    ', '  '),
(109, '377419', 'UNDG', 'MAAE', '  ', 'GEN212', '_________', 0, '    ', '  '),
(110, '377419', 'UNDG', 'MAAE', '  ', 'GEN253', '_________', 0, '    ', '  '),
(111, '377419', 'UNDG', 'MAAE', '  ', 'GEN250', '_________', 0, '    ', '  '),
(112, '377419', 'UNDG', 'MAAE', '  ', 'GEN257', '_________', 0, '    ', '  '),
(113, '377419', 'UNDG', 'MAAE', '  ', 'GEN260', '_________', 0, '    ', '  '),
(114, '377419', 'UNDG', 'MAAE', '  ', 'GEN228', '_________', 0, '    ', '  '),
(115, '377419', 'UNDG', 'MAAE', '  ', 'GEN223', '_________', 0, '    ', '  '),
(116, '377419', 'UNDG', 'MAAE', '  ', 'GEN225', '_________', 0, '    ', '  '),
(117, '377419', 'UNDG', 'MAAE', '  ', 'GEN230', '_________', 0, '    ', '  '),
(118, '377419', 'UNDG', 'MAAE', '  ', 'GEN231', '_________', 0, '    ', '  '),
(119, '377419', 'UNDG', 'MAAE', '  ', 'GEN286', '_________', 0, '    ', '  '),
(120, '111111', 'UNDG', 'GAD ', '  ', 'ART100', 'ART100   ', 1, 'SU11', 'IP'),
(121, '111111', 'UNDG', 'GAD ', '  ', 'ART110', '_________', 0, '    ', '  '),
(122, '111111', 'UNDG', 'GAD ', '  ', 'MAA116', '_________', 0, '    ', '  '),
(123, '111111', 'UNDG', 'GAD ', '  ', 'MAA221', '_________', 0, '    ', '  '),
(124, '111111', 'UNDG', 'GAD ', '  ', 'GAD233', '_________', 0, '    ', '  '),
(125, '111111', 'UNDG', 'GAD ', '  ', 'GAD211', '_________', 0, '    ', '  '),
(126, '111111', 'UNDG', 'GAD ', '  ', 'GAD338', '_________', 0, '    ', '  '),
(127, '111111', 'UNDG', 'GAD ', '  ', 'GAD357', '_________', 0, '    ', '  '),
(128, '111111', 'UNDG', 'GAD ', '  ', 'GAD467', '_________', 0, '    ', '  '),
(129, '111111', 'UNDG', 'GAD ', '  ', 'MAA451', '_________', 0, '    ', '  '),
(130, '111111', 'UNDG', 'GAD ', '  ', 'MAA461', '_________', 0, '    ', '  '),
(131, '111111', 'UNDG', 'GAD ', '  ', 'MAA471', '_________', 0, '    ', '  '),
(132, '111111', 'UNDG', 'GAD ', '  ', 'ART102', 'ART102   ', 1, 'SU11', 'IP'),
(133, '111111', 'UNDG', 'GAD ', '  ', 'ART111', '_________', 0, '    ', '  '),
(134, '111111', 'UNDG', 'GAD ', '  ', 'MAA123', '_________', 0, '    ', '  '),
(135, '111111', 'UNDG', 'GAD ', '  ', 'MAA224', '_________', 0, '    ', '  '),
(136, '111111', 'UNDG', 'GAD ', '  ', 'MAA228', '_________', 0, '    ', '  '),
(137, '111111', 'UNDG', 'GAD ', '  ', 'MAA337', '_________', 0, '    ', '  '),
(138, '111111', 'UNDG', 'GAD ', '  ', 'GAD325', '_________', 0, '    ', '  '),
(139, '111111', 'UNDG', 'GAD ', '  ', 'GAD335', '_________', 0, '    ', '  '),
(140, '111111', 'UNDG', 'GAD ', '  ', 'GAD445', '_________', 0, '    ', '  '),
(141, '111111', 'UNDG', 'GAD ', '  ', 'GAD448', '_________', 0, '    ', '  '),
(142, '111111', 'UNDG', 'GAD ', '  ', 'GAD455', '_________', 0, '    ', '  '),
(143, '111111', 'UNDG', 'GAD ', '  ', 'GEN340', '_________', 0, '    ', '  '),
(144, '111111', 'UNDG', 'GAD ', '  ', 'GEN345', '_________', 0, '    ', '  '),
(145, '111111', 'UNDG', 'GAD ', '  ', 'GEN101', '_________', 0, '    ', '  '),
(146, '111111', 'UNDG', 'GAD ', '  ', 'GAD101', '_________', 0, '    ', '  '),
(147, '111111', 'UNDG', 'GAD ', '  ', 'DPH242', '_________', 0, '    ', '  '),
(148, '111111', 'UNDG', 'GAD ', '  ', 'MAA217', '_________', 0, '    ', '  '),
(149, '111111', 'UNDG', 'GAD ', '  ', 'MAA227', '_________', 0, '    ', '  '),
(150, '111111', 'UNDG', 'GAD ', '  ', 'MAA347', '_________', 0, '    ', '  '),
(151, '111111', 'UNDG', 'GAD ', '  ', 'GAD356', '_________', 0, '    ', '  '),
(152, '111111', 'UNDG', 'GAD ', '  ', 'GAD466', '_________', 0, '    ', '  '),
(153, '111111', 'UNDG', 'GAD ', '  ', 'GEN241', '_________', 0, '    ', '  '),
(154, '111111', 'UNDG', 'GAD ', '  ', 'GEN244', '_________', 0, '    ', '  '),
(155, '111111', 'UNDG', 'GAD ', '  ', 'GEN247', '_________', 0, '    ', '  '),
(156, '111111', 'UNDG', 'GAD ', '  ', 'GEN248', '_________', 0, '    ', '  '),
(157, '111111', 'UNDG', 'GAD ', '  ', 'GEN310', '_________', 0, '    ', '  '),
(158, '111111', 'UNDG', 'GAD ', '  ', 'GEN325', '_________', 0, '    ', '  '),
(159, '111111', 'UNDG', 'GAD ', '  ', 'GEN329', '_________', 0, '    ', '  '),
(160, '111111', 'UNDG', 'GAD ', '  ', 'GEN360', '_________', 0, '    ', '  '),
(161, '111111', 'UNDG', 'GAD ', '  ', 'GEN380', '_________', 0, '    ', '  '),
(162, '111111', 'UNDG', 'GAD ', '  ', 'GEN399', '_________', 0, '    ', '  '),
(163, '111111', 'UNDG', 'GAD ', '  ', 'GEN150', 'GEN150   ', 1, 'SU11', 'IP'),
(164, '111111', 'UNDG', 'GAD ', '  ', 'GEN102', '_________', 0, '    ', '  '),
(165, '111111', 'UNDG', 'GAD ', '  ', 'GEN105', 'GEN105   ', 1, 'SU11', 'IP'),
(166, '111111', 'UNDG', 'GAD ', '  ', 'GEN205', '_________', 0, '    ', '  '),
(167, '111111', 'UNDG', 'GAD ', '  ', 'GEN211', '_________', 0, '    ', '  '),
(168, '111111', 'UNDG', 'GAD ', '  ', 'GEN212', '_________', 0, '    ', '  '),
(169, '111111', 'UNDG', 'GAD ', '  ', 'GEN250', '_________', 0, '    ', '  '),
(170, '111111', 'UNDG', 'GAD ', '  ', 'GEN257', '_________', 0, '    ', '  '),
(171, '111111', 'UNDG', 'GAD ', '  ', 'GEN253', '_________', 0, '    ', '  '),
(172, '111111', 'UNDG', 'GAD ', '  ', 'GEN260', '_________', 0, '    ', '  '),
(173, '111111', 'UNDG', 'GAD ', '  ', 'GEN228', '_________', 0, '    ', '  '),
(174, '111111', 'UNDG', 'GAD ', '  ', 'GEN223', '_________', 0, '    ', '  '),
(175, '111111', 'UNDG', 'GAD ', '  ', 'GEN225', '_________', 0, '    ', '  '),
(176, '111111', 'UNDG', 'GAD ', '  ', 'GEN230', '_________', 0, '    ', '  '),
(177, '111111', 'UNDG', 'GAD ', '  ', 'GEN231', '_________', 0, '    ', '  '),
(178, '111111', 'UNDG', 'GAD ', '  ', 'GEN286', '_________', 0, '    ', '  '),
(179, '123456', 'UNDG', 'MAAE', '  ', 'GEN095', '_________', 0, '    ', '  '),
(180, '123456', 'UNDG', 'MAAE', '  ', 'GEN098', 'GEN098   ', 1, 'SU11', 'IP'),
(181, '123456', 'UNDG', 'MAAE', '  ', 'ART100', 'ART100   ', 1, 'SU11', 'IP'),
(182, '123456', 'UNDG', 'MAAE', '  ', 'ART110', '_________', 0, '    ', '  '),
(183, '123456', 'UNDG', 'MAAE', '  ', 'MAA116', '_________', 0, '    ', '  '),
(184, '123456', 'UNDG', 'MAAE', '  ', 'MAA221', '_________', 0, '    ', '  '),
(185, '123456', 'UNDG', 'MAAE', '  ', 'GAD233', '_________', 0, '    ', '  '),
(186, '123456', 'UNDG', 'MAAE', '  ', 'MAA234', '_________', 0, '    ', '  '),
(187, '123456', 'UNDG', 'MAAE', '  ', 'GAD357', '_________', 0, '    ', '  '),
(188, '123456', 'UNDG', 'MAAE', '  ', 'MAA454', '_________', 0, '    ', '  '),
(189, '123456', 'UNDG', 'MAAE', '  ', 'GAD448', '_________', 0, '    ', '  '),
(190, '123456', 'UNDG', 'MAAE', '  ', 'MAA451', '_________', 0, '    ', '  '),
(191, '123456', 'UNDG', 'MAAE', '  ', 'MAA461', '_________', 0, '    ', '  '),
(192, '123456', 'UNDG', 'MAAE', '  ', 'MAA471', '_________', 0, '    ', '  '),
(193, '123456', 'UNDG', 'MAAE', '  ', 'ART102', 'ART102   ', 1, 'SU11', 'IP'),
(194, '123456', 'UNDG', 'MAAE', '  ', 'ART111', 'ART111___', 1, 'SP10', 'B+'),
(195, '123456', 'UNDG', 'MAAE', '  ', 'MAA123', 'ART111___', 1, 'SP10', 'B+'),
(196, '123456', 'UNDG', 'MAAE', '  ', 'MAA224', 'ART111___', 1, 'SP10', 'B+'),
(197, '123456', 'UNDG', 'MAAE', '  ', 'MAA228', 'ART111___', 1, 'SP10', 'B+'),
(198, '123456', 'UNDG', 'MAAE', '  ', 'MAA337', 'ART111___', 1, 'SP10', 'B+'),
(199, '123456', 'UNDG', 'MAAE', '  ', 'MAA344', 'ART111___', 1, 'SP10', 'B+'),
(200, '123456', 'UNDG', 'MAAE', '  ', 'MAA338', 'ART111___', 1, 'SP10', 'B+'),
(201, '123456', 'UNDG', 'MAAE', '  ', 'MAA467', 'ART111___', 1, 'SP10', 'B+'),
(202, '123456', 'UNDG', 'MAAE', '  ', 'MAA458', '_________', 0, '    ', '  '),
(203, '123456', 'UNDG', 'MAAE', '  ', 'MAA468', '_________', 0, '    ', '  '),
(204, '123456', 'UNDG', 'MAAE', '  ', 'GEN340', 'ART111___', 1, 'SP10', 'B+'),
(205, '123456', 'UNDG', 'MAAE', '  ', 'GEN345', '_________', 0, '    ', '  '),
(206, '123456', 'UNDG', 'MAAE', '  ', 'GEN101', 'ART111___', 1, 'SP10', 'B+'),
(207, '123456', 'UNDG', 'MAAE', '  ', 'MAA101', 'ART111___', 1, 'SP10', 'B+'),
(208, '123456', 'UNDG', 'MAAE', '  ', 'DPH242', 'ART111___', 1, 'SP10', 'B+'),
(209, '123456', 'UNDG', 'MAAE', '  ', 'MAA217', 'ART111___', 1, 'SP10', 'B+'),
(210, '123456', 'UNDG', 'MAAE', '  ', 'MAA227', 'ART111___', 1, 'SP10', 'B+'),
(211, '123456', 'UNDG', 'MAAE', '  ', 'MAA347', '_________', 0, '    ', '  '),
(212, '123456', 'UNDG', 'MAAE', '  ', 'MAA336', '_________', 0, '    ', '  '),
(213, '123456', 'UNDG', 'MAAE', '  ', 'MAA346', '_________', 0, '    ', '  '),
(214, '123456', 'UNDG', 'MAAE', '  ', 'GEN241', '_________', 0, 'SP10', 'B+'),
(215, '123456', 'UNDG', 'MAAE', '  ', 'GEN244', '_________', 0, '    ', '  '),
(216, '123456', 'UNDG', 'MAAE', '  ', 'GEN247', '_________', 0, 'SP10', 'B+'),
(217, '123456', 'UNDG', 'MAAE', '  ', 'GEN248', '_________', 0, '    ', '  '),
(218, '123456', 'UNDG', 'MAAE', '  ', 'GEN310', '_________', 0, 'SP10', 'B+'),
(219, '123456', 'UNDG', 'MAAE', '  ', 'GEN325', '_________', 0, '    ', '  '),
(220, '123456', 'UNDG', 'MAAE', '  ', 'GEN329', '_________', 0, '    ', '  '),
(221, '123456', 'UNDG', 'MAAE', '  ', 'GEN360', '_________', 0, 'SP10', 'B+'),
(222, '123456', 'UNDG', 'MAAE', '  ', 'GEN380', '_________', 0, '    ', '  '),
(223, '123456', 'UNDG', 'MAAE', '  ', 'GEN399', '_________', 0, '    ', '  '),
(224, '123456', 'UNDG', 'MAAE', '  ', 'GEN150', '_________', 0, '    ', '  '),
(225, '123456', 'UNDG', 'MAAE', '  ', 'GEN102', '_________', 0, '    ', '  '),
(226, '123456', 'UNDG', 'MAAE', '  ', 'GEN105', 'GEN105   ', 1, 'SU11', 'IP'),
(227, '123456', 'UNDG', 'MAAE', '  ', 'GEN211', '_________', 0, '    ', '  '),
(228, '123456', 'UNDG', 'MAAE', '  ', 'GEN212', '_________', 0, '    ', '  '),
(229, '123456', 'UNDG', 'MAAE', '  ', 'GEN253', '_________', 0, '    ', '  '),
(230, '123456', 'UNDG', 'MAAE', '  ', 'GEN250', '_________', 0, '    ', '  '),
(231, '123456', 'UNDG', 'MAAE', '  ', 'GEN257', '_________', 0, '    ', '  '),
(232, '123456', 'UNDG', 'MAAE', '  ', 'GEN260', '_________', 0, '    ', '  '),
(233, '123456', 'UNDG', 'MAAE', '  ', 'GEN228', '_________', 0, '    ', '  '),
(234, '123456', 'UNDG', 'MAAE', '  ', 'GEN223', '_________', 0, '    ', '  '),
(235, '123456', 'UNDG', 'MAAE', '  ', 'GEN225', '_________', 0, '    ', '  '),
(236, '123456', 'UNDG', 'MAAE', '  ', 'GEN230', '_________', 0, '    ', '  '),
(237, '123456', 'UNDG', 'MAAE', '  ', 'GEN231', '_________', 0, '    ', '  '),
(238, '123456', 'UNDG', 'MAAE', '  ', 'GEN286', '_________', 0, '    ', '  ')
		</cfquery>
		
		<cfreturn "AuditRecs table created">
	</cffunction>
	
	<cffunction name="createStudentTab" access="public" returntype="string">
		
		<cfset dropTable('StudentTab')>
		
		<cfquery datasource="#this.datasource#">
		CREATE TABLE StudentTab(
            StuKey INTEGER
				NOT NULL
		        GENERATED BY DEFAULT AS IDENTITY (START WITH 5)
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
(1, '371228', 'Sabcd', 'Jake E.        ', 1, 28, 13, 'Freshman', 1, 2, 2, 4),
(2, '377419', 'Dean', 'Sevenin P.      ', 1, 28, 13, 'Freshman', 1, 2, 2, 4),
(3, '111111', 'Edaer', 'Jake E.        ', 0, 28, 13, 'Freshman', 1, 2, 2, 4),
(4, '123456', 'Ekasa', 'Kewaton P.     ', 1, 14, 13, 'Sophmore', 4, 16, 2, 4)

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