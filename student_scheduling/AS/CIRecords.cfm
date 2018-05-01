<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>ClassInfo Records</title>
<CFQUERY NAME="Cinf" DATASOURCE="AllSchoolAudit">
	SELECT * FROM CLASSINFORECS
</CFQUERY>
</head>

<body>
<CFOUTPUT QUERY="Cinf">
( '#CourseCode#', '#CoursePre#', '#CourseNum#', '#CourseName#', #IQu#, #BFDIQu#, #MAAIQu#, #VFXIQu#, #WDIMIQu#, #GADIQu#, #BILDIQu#, #IDIQu#, #BHMIQu#, #BGDIQu#, #BAPIQu#, #ADVIQu#, #BDPHIQu#, #DFVPIQu#, #FMMIQu#, #IPR#, #CLevel#, #GEGrp#, #BFDGrp#, #MAAGrp#, #VFXGrp#, #WDIMGrp#, #GADGrp#, #BILDGrp#, #IDGrp#, #BHMGrp#, #BGDGrp#, #BAPGrp#, #ADVGrp#, #BDPHGrp#, #DFVPGrp#, #FMMGrp#, '#NPR1#', '#NPR2#', '#NPR3#', ' ', ' ', #PRM#),<br/>
           
</CFOUTPUT>            
</body>
</html>