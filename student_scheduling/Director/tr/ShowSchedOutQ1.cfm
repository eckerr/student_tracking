<!--- ShowSchedOut.cfm --->
<CFQUERY NAME = "classCnt" datasource="AllSchoolAudit">
SELECT QuOut,CourseCode, CourseName, stuID, stuFirstName, stuLastName, Graduating, MajorID FROM SchedOut
WHERE CourseCode = 'MAA471' AND QuOut = 1
ORDER BY CourseCode, STUID, IQU, IPR

</CFQUERY>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Show Schedule Out Information</title>
</head>

<body>
<CFOUTPUT QUERY="classCnt" GROUP="CourseCode">
<TABLE border="1" width="400">
<TR></TR>
<TH colspan="2">#courseCode# </TH><TH colspan="3">#courseName#</TH>
    <CFSET mRCount = 0>
  
    <CFOUTPUT>
    <TR>
    <CFSET mRCount = mRCount + 1>
    	<TD>#mRCount#)</TD><TD>
   		#stuId#  </TD><TD >#stuFirstName# #stuLastName#  </TD><TD>#MajorID#</TD><TD> <CFIF Graduating EQ 1> *** </CFIF> </TD>
    </TR>
    </CFOUTPUT>    
</CFOUTPUT>     
</body>
</html>