<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Search Results</title>
<link href="../main.css" rel="stylesheet" type="text/css" />
</head>

<cfquery datasource="csrmain" name="getevent">
SELECT *
FROM Events, Students, Instructors, Courses, Majors, Levels
WHERE 0=0 AND Events.StudentID=Students.StudentID AND Events.InstructorID=Instructors.InstructorID
AND Events.CourseID=Courses.CourseID AND Students.MajorID=Majors.MajorID AND Students.LevelID=Levels.LevelID

<!--- add quarter if selected --->
<cfif SESSION.CQuarter IS NOT "">
    AND Qtr = #SESSION.CQuarter#
</cfif>

<!--- add year if selected --->
<cfif SESSION.CYear IS NOT "">
    AND YearStamp = #SESSION.CYear#
</cfif>

<!--- add student if selected --->
<cfif SESSION.StudentID IS NOT "">
    AND Events.StudentID = #SESSION.StudentID#
</cfif>

<!--- add advisor if selected --->
<cfif SESSION.Assignedto IS NOT "">
    AND Assignedto = '#SESSION.Assignedto#'
</cfif>

<!--- add week if selected --->
<cfif SESSION.WeekID IS NOT "">
    AND WeekID = #SESSION.WeekID#
</cfif>

<!--- add major if selected --->
<cfif SESSION.MajorID IS NOT "">
    AND Students.MajorID = #SESSION.MajorID#
</cfif>

<!--- add level if selected --->
<cfif SESSION.LevelID IS NOT "">
    AND Students.LevelID = #SESSION.LevelID#
</cfif>

<!--- add instructor if selected --->
<cfif SESSION.InstructorID IS NOT "">
    AND Events.InstructorID = #SESSION.InstructorID#
</cfif>

<!--- add course if selected --->
<cfif SESSION.CourseID IS NOT "">
    AND Events.CourseID = #SESSION.CourseID#
</cfif>

<!---ORDER BY SName, InputDate DESC--->
ORDER BY Events.WeekID DESC
</cfquery>



<body>
<div id="wrapper">



<div id="logo">&nbsp;</div>
<div class="indentmenu">
<ul>
<li><a href="../logoff.cfm">Log Off</a></li>
<li><a href="search_events.cfm">Go Back</a></li>
</ul>
</div>

<h3><cfoutput>Search Results - #SESSION.Auth.Aname#, there are #getevent.recordcount# records </h3>
</cfoutput></h3>

<cfoutput query="getevent">

<table width="950" border="1" cellpadding="1" cellspacing="0">
			<!--- Decrption starts here --->
			<cfset decr_sname = Decrypt("#SName#","snamILIS0720")>
            <cfset decr_sidnumber = Decrypt("#SIDNumber#","sidnILIS0720")>
			<!--- Decrption finishes here --->
            <cfset lname = ListFirst(#decr_sname#)>
			<cfset fname = ListLast(#decr_sname#)>
			<cfset fullname = fname&" "&lname>
 <cfif CurrentRow Mod 2 EQ 1>
	<tr bgcolor="##ecdfdf">
	<cfelse>
	<tr>
	</cfif>
    
<td colspan="9" class="left">Student: #fullname# --- #decr_sidnumber#</td><td colspan="5" class="left">Instructor: #IName#</td><td colspan="4" align="right"><a href="advisor_update.cfm?eventID=#Trim(eventid)#">[Update]</a></td>
 <cfif CurrentRow Mod 2 EQ 1>
	<tr bgcolor="##ecdfdf">
	<cfelse>
	<tr>
	</cfif>
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
 <cfif CurrentRow Mod 2 EQ 1>
	<tr bgcolor="##ecdfdf">
	<cfelse>
	<tbody  ><tbody  ><tbody  ><tbody  ><tbody  ><tbody  ><tbody  ><tbody  ><tbody  ><tr>
	</cfif>
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
   <cfif CurrentRow Mod 2 EQ 1>
	<tr bgcolor="##ecdfdf">
	<cfelse>
	<tr>
	</cfif>
  <td colspan="9" class="left" style="width: 473px;">&nbsp;#AdvisorNote#</td>
  <td colspan="9" class="left" style="width: 473px;">&nbsp;#InstructorNote#</td>
  </tr>
</table>
<hr width="100%" size="3" style="color:grey;" />
</cfoutput>

<div id="footer">&nbsp;<br> </div>
</div>
</body>
</html>
