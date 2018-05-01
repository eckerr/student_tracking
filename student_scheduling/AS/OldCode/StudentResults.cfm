<!--- StudentResults.cfm 
Author: Ed Kerr
Date: 10/2/11
Description: Data drill down listing page
--->

<!---select list of students --->
<CFQUERY NAME ="StuList" DATASOURCE="StudentsAudit">
SELECT StuId, StuLastName, StuFirstName, DayEv, MajNeed, GenNeed, StuStat, PerComp FROM StudentTab
ORDER BY MajNeed ASC
</CFQUERY>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Student Listing</title>
</head>

<body>
<!---<CFDUMP VAR=#StuList#>--->
<H2> List by Remaining Classes </H2>
<UL>
<CFOUTPUT QUERY="StuList">
   <LI> <A HREF="StudentDetail.cfm?Sid=#URLEncodedFormat(Trim(StuId))#">
	M:#MajNeed#...G:#GenNeed#...#StuStat#...#StuID#...#(Trim(StuLastName))#, #(Trim(StuFirstName))#</A></LI>
</CFOUTPUT>
</UL>
</body>
</html>