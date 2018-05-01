<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Student Download</title>

<script src="../Scripts/AC_RunActiveContent.js" type="text/javascript"></script><style type="text/css">
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
<cfquery datasource="csrmaintest" name="getstudents">
SELECT *
FROM Students, Levels, Majors
WHERE Students.LevelID = Levels.LevelID AND Students.MajorID = Majors.MajorID
ORDER BY SName
</cfquery>
<br />
<table width="576"border="1" cellpadding="1" cellspacing="0">
<cfoutput>
<tr><td colspan="2" align="left"><a href="../admin/edit_students/show_students.cfm">Back to Student</a></td><td colspan="2"align="center"><a href="../logoff.cfm">LogOff</a></td><td colspan="2" align="right">#getstudents.recordcount# Students</td></tr>
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
<tr align="center">
	<td>#SName#</td>
	<td>#SIDNumber#</td>
	<td>&nbsp;#MajorCode#</td>
	<td>&nbsp;#LevelName#</td>
    <td>&nbsp;#Scodecurrent#</td>
    <td>&nbsp;#Scodenext#</td>
</tr>
</cfoutput>
</table>
</center>
</body>
</html>
