


<CFSET Maj2Get = 'ADV'>
<CFQUERY NAME = "prlist" datasource="AllSchoolAudit">
SELECT RecKey, MajorCode, CourseCode, PrereqCode FROM PrereqInfo
WHERE MajorCode = '#Maj2Get#'
ORDER BY CourseCode
</CFQUERY>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Show Prereq Items</title>
</head>

<body>
<!---<CFDUMP VAR="#prlist#">--->

<TABLE ALIGN="center" BORDER="1" CELLPADDING = "5" bgcolor="#00FFFF">
<CFOUTPUT>
<B><center> Course Prerequistites for Major:  #Maj2Get# </center></B>
</CFOUTPUT>
<TR>
   <TH COLSPAN = "1">Course</TH>
   <TH COLSPAN = "1">PreRequisite</TH>
   <TH COLSPAN = "1"></TH>
    <TH COLSPAN = "1">Course</TH>
   <TH COLSPAN = "1">PreRequisite</TH>
   <TH COLSPAN = "1"></TH>
    <TH COLSPAN = "1">Course</TH>
   <TH COLSPAN = "1">PreRequisite</TH>
   <TH COLSPAN = "1"></TH>
    <TH COLSPAN = "1">Course</TH>
   <TH COLSPAN = "1">PreRequisite</TH>
</TR>
<CFSET colCtr = 1>
<TR>
<CFOUTPUT QUERY="prlist">

<TD><A HREF="ASEditClassPrereq_action.cfm?RK=#URLEncodedFormat(Trim(RecKey))#"><b>#CourseCode#</b></A></TD>
<TD>
#PreReqCode#
</TD>
<TD></TD>
<CFSET colCtr = colCtr + 1>
	<CFIF colCtr GT 4>
	</TR><TR>
	<CFSET colCtr = 1>
</CFIF>



</CFOUTPUT>
</TABLE>

</body>
</html>