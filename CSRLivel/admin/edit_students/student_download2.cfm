<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Search Events</title>

<style type="text/css">
<!--
body,td,th {
	width: 920px;
	margin-left: 0px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 10px;
	color: #000000;
}
body {
	margin-left: 15px;
	margin-top: 10px;
	margin-right: Auto;
	margin-bottom: 0px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 10px;
	color: #000000;
}
-->
</style>
</head>

<body>

<cfif isDefined("Form.Quarter")>
<cfquery datasource="csrmain" name="getstudents">
SELECT DISTINCT SName, Students.LevelID, Levels.LevelID, Students.MajorID, Majors.MajorID, Scodecurrent, Scodenext, Events.StudentID, Students.StudentID, SIDNumber, LevelName, MajorCode, Qtr, YearStamp
FROM Students, Levels, Majors, Events 
WHERE Students.LevelID = Levels.LevelID AND Students.MajorID = Majors.MajorID AND Students.StudentID = Events.StudentID AND Qtr = #Form.Quarter# AND YearStamp = #Form.Year#
ORDER BY SName
</cfquery>
<!--- Decrypt Names and Passwords --->

<br />
<table width="576"border="1" cellpadding="1" cellspacing="0">
<cfoutput>
<tr><td colspan="2" align="left"><a href="show_students.cfm">Back to Student</a></td><td colspan="2"align="center"><a href="../../logoff.cfm">LogOff</a></td><td colspan="2" align="right">#getstudents.recordcount# Students</td></tr>
</cfoutput>
<tr>
	<th width="102"><div align="center">Student Name</div></th>
    <th width="90"><div align="center">StudentID</div></th>
    <th width="90"><div align="center">Major</div></th>
    <th width="94"><div align="center">Level</div></th>
    <th width="94"><div align="center">Current Code</div></th>
    <th width="94"><div align="center">Next Code</div></th>
  </tr>
<cfoutput query="getstudents">
<cfset decr_sname=Decrypt(#SName#, "snamILIS0720")>
<cfset decr_sidnum=Decrypt(#SIDNumber#, "sidnILIS0720")>
<tr align="center">
	<td>#decr_sname#</td>
	<td>#decr_sidnum#</td>
	<td>&nbsp;#MajorCode#</td>
	<td>&nbsp;#LevelName#</td>
    <td>&nbsp;#Scodecurrent#</td>
    <td>&nbsp;#Scodenext#</td>
</tr>

</cfoutput>
</table>
<cfelse>
<cfquery datasource="csrmain" name="getYears">
SELECT DISTINCT YearStamp
FROM Events
ORDER BY YearStamp DESC
</cfquery>
<cfform action="student_download2.cfm">
<tr>
<td>Quarter</td>
<td>  
<select name="Quarter">
<cfoutput><option value="#Quarter(Now())#">#Quarter(Now())#</option></cfoutput>
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
</select></td>
</tr>
<tr><td colspan="7"><span align="left">Year</span></td></tr>
<tr> 
<td colspan="7">	  
<select name="Year">
<cfoutput query="getYears">
<option value="#YearStamp#">#YearStamp#</option>
</cfoutput>
</select></td>  
</tr>
<!--- Jump to event_results.cfm when submit button is pressed --->
<tr>
<td colspan="7" align="left"><input type="submit" value="Submit"></td></tr>
</table>
</cfform>
</cfif>
<a href="../../advisors/advisor_page.cfm"> Return </a>
</center>
</body>
</html>
