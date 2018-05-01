<!--- ASFindStudentNames.cfm --->

<CFSET Name2Find = #URL.Nam# & '%'>

<CFQUERY NAME="sFindNameList" DATASOURCE="AllSchoolAudit">
Select StuLastName, StuFirstName, StuID, MajorID FROM StudentRecs
WHERE StuLastName LIKE  '#Name2Find#' <!---AND MajorID IN ('MAA', 'GAD', 'MAAE', 'GADE')--->
ORDER BY StuLastName, StuFirstName
</CFQUERY>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Find Student Name</title>
</head>

<body>

<CFOUTPUT>
<H3> List by Last Name </H3>
</CFOUTPUT>
<!--- row at Top of list for paging --->

<TABLE>
<CFOUTPUT QUERY="sFindNameList">
<TR>
 <TD>#MajorID#</TD>
  <TD><A HREF="ASEdFrames.cfm?Sid=#URLEncodedFormat(Trim(StuId))#">#StuID#</A></TD>
  <TD>#(Trim(StuLastName))#, #(Trim(StuFirstName))#</TD>
</TR>
</CFOUTPUT>
</TABLE>

<BR />
<BR />
<A HREF="ASMainMenu.cfm">Return to Main Menu</A>

</body>
</html>