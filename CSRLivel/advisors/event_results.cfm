<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Event_Results</title>
<link href="../main.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div id="toplogo">&nbsp;</div><br />

<cfquery datasource="csrmain" name="getevent">
SELECT *
FROM Events, Students, Instructors, Courses, Majors, Levels
WHERE 0=0 AND Events.StudentID=Students.StudentID AND Events.InstructorID=Instructors.InstructorID
AND Events.CourseID=Courses.CourseID AND Students.MajorID=Majors.MajorID AND Students.LevelID=Levels.LevelID AND Qtr = #Form.Quarter# AND YearStamp = #Form.Year# 
<!--- Search by StudentID --->
<cfif FORM.StudentID IS NOT "">
    AND Events.StudentID = #FORM.StudentID#
</cfif>
<!--- Search by tag line --->
<cfif FORM.Assignedto IS NOT "">
    AND Assignedto = '#FORM.Assignedto#'
</cfif>
<!--- Search by rating --->
<cfif FORM.WeekID IS NOT "">
    AND WeekID = #FORM.WeekID#
</cfif>
<cfif FORM.MajorID IS NOT "">
    AND Students.MajorID = #FORM.MajorID#
</cfif>
<cfif FORM.LevelID IS NOT "">
    AND Students.LevelID = #FORM.LevelID#
</cfif>
<cfif FORM.InstructorID IS NOT "">
    AND Events.InstructorID = #FORM.InstructorID#
</cfif>
<cfif FORM.CourseID IS NOT "">
    AND Events.CourseID = #FORM.CourseID#
</cfif>
ORDER BY SName, InputDate DESC
</cfquery>
<cfoutput><h5>#SESSION.Auth.Aname#, there are #getevent.recordcount# entries </h5>
</cfoutput>
<a href="search_events.cfm">Return<a>
<cfoutput query="getevent">
<tr >
<table width="950" border="1" cellpadding="1" cellspacing="0">
			<!--- Decrption starts here --->
			<cfset decr_sname = Decrypt("#SName#","snamILIS0720")>
            <cfset decr_sidnumber = Decrypt("#SIDNumber#","sidnILIS0720")>
			<!--- Decrption finishes here --->
            <cfset lname = ListFirst(#decr_sname#)>
			<cfset fname = ListLast(#decr_sname#)>
			<cfset fullname = fname&" "&lname>
<tr bgcolor="###iif(CurrentRow mod 2 is 0,DE('CCCCCC'), DE('999999'))#"><td colspan="9">Student: #fullname# --- #decr_sidnumber#</td><td colspan="5">Instructor: #IName#</td><td colspan="4" align="right"><a href="advisor_update.cfm?eventID=#Trim(eventid)#"><span id="blacklink">[Update]</span></a></td>
<tr bgcolor="###iif(CurrentRow mod 2 is 0,DE('CCCCCC'), DE('999999'))#">
	<td>Student<br />Input<br />Date</td>
	<td><div align="center">Week</div></td>
    <td><div align="center">Absence</div></td>
    <td><div align="center">Tardiness</div></td>
    <td><div align="center">Not<br />
    Prepared</div></td>
    <td><div align="center">Missing<br />
    Work</div></td>
    <td><div align="center">Poor<br />
    QltyWork</div></td>
    <td><div align="center">Failed<br />Mid Term</div></td>
	<td><div align="center">Personal<br />
    <td><div align="center">Financial</div></td>
    <td><div align="center">Behavior</div></td>
    <td><div align="center">Plagiarism</div></td>
    <td><div align="center">Talked<br />to<br />
    Student</div></td>
    <td><div align="center">Assigned<br />to</div></td>
    <td><div align="center">Assigned<br />
    Date</div></td>
	<td><div align="center">Level<br />
	<td><div align="center">Course<br />
	<td><div align="center">Major<br />
  </tr>
<tr align="center" bgcolor="###iif(CurrentRow mod 2 is 0,DE('CCCCCC'), DE('999999'))#">
	<td>#DateFormat(InputDate, "mm/dd/yy")#</td>
	<td>&nbsp;#WeekID#</td>
	<td>&nbsp;#Absence#</td>
    <td>&nbsp;#Tardiness#</td>
    <td>&nbsp;#NotPrepared#</td>
    <td>&nbsp;#MissingWork#</td>
    <td>&nbsp;#PoorQltyWork#</td>
    <td>&nbsp;#Other#</td>
    <td>&nbsp;#Personal#</td>
    <td>&nbsp;#Financial#</td>
    <td>&nbsp;#Behavior#</td>
    <td>&nbsp;#Plagerism#</td>
    <td>&nbsp;#TalkedtoStudent#</td> 
    <td>&nbsp;#Assignedto#</td>
	<td>&nbsp;#DateFormat(AssignedDate, "MM/DD/YY")#</td>
	<td>&nbsp;#LevelName#</td>
	<td>&nbsp;#CourseCode#</td>
	<td>&nbsp;#MajorCode#</td>
  </tr>
  <tr bgcolor="###iif(CurrentRow mod 2 is 0,DE('CCCCCC'), DE('999999'))#">
  <td colspan="9">&nbsp;#AdvisorNote#</td>
  <td colspan="9">&nbsp;#InstructorNote#</td>
  </tr>
</table>

</cfoutput>
<a href="search_events.cfm">Return<a>
</body>
</html>
