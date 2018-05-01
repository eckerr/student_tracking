<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Advisor Detail</title>

<link href="../main.css" rel="stylesheet" type="text/css">
</head>

<cfquery datasource="csrmain" name="getevent">
SELECT *
FROM Events, Students, Instructors, Courses, Majors, Levels
WHERE Events.eventID=#URL.EventID# AND Events.StudentID = Students.StudentID 
AND Events.InstructorID = Instructors.InstructorID AND Events.CourseID = Courses.CourseID AND Students.LevelID = Levels.LevelID AND Students.MajorID = Majors.MajorID 
</cfquery>

<body>
<div id="wrapper">

<div id="logo">&nbsp;</div>
<div class="indentmenu">
<ul>
<li><a href="../logoff.cfm">Log Off</a></li>
<!--- need a history back here --->
<li><a href="javascript:history.back()">Go Back</a></li>


</ul>
</div>

<cfoutput query="getevent">
<p>&nbsp;</p>
<table width="955" border="1" cellpadding="1" cellspacing="0">
	        <!--- Decrption starts here --->
			<cfset decr_sname = Decrypt("#SName#","snamILIS0720")>
			<cfset decr_sidnumber = Decrypt("#SIDNumber#","sidnILIS0720")>
			<!--- Decrption finishes here --->
<tr bgcolor="##ecdfdf"><td colspan="9" class="left">Student: #decr_sname# --- #decr_sidnumber#</td><td colspan="9" class="left">Instructor: #IName#</td></tr>
<tr>
	<td>Student<br />Input<br />Date</td>
	<td>Week</td>
      <td>Absence</td>
      <td>Tardi<br />
          -ness</td>
      <td>Not<br />
          Prepared</td>
      <td>Missing<br />
          Work</td>
      <td>Poor<br />
          Qlty<br />
          Work</td>
      <td>Failed<br />Mid Term</td>
      <td>Personal<br />Issues</td>
      <td>Financial<br />Issues</td>
      <td>Behavior</td>
      <td>Plag-<br />
          airism</td>
      <td>Talked<br />to<br />Student</td>
    <td>Assigned<br />to</td>
    <td>Assigned<br />
    Date</td>
	<td>Level<br />
	<td>Course<br />
	<td>Major<br />
  </tr>
<tr bgcolor="##ecdfdf">
	    <td>&nbsp;#DateFormat(InputDate, "mm/dd/yy")#</td>
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
         <cfif Assignedto IS '0'>
        <td>&nbsp;</td>
        <cfelse>
        <td class="left">&nbsp;#Assignedto#</td>
        </cfif>
	    <td>&nbsp;#DateFormat(AssignedDate, "MM/DD/YY")#</td>
	    <td>&nbsp;#LevelName#</td>
	    <td>&nbsp;#CourseCode#</td>
	    <td>&nbsp;#MajorCode#</td>
  </tr>
  <tr>
  <td width="477" colspan="9" class="left">#AdvisorNote#</td>
  <td width="477" colspan="9" class="left">#InstructorNote#</td>
  </tr>
</table>
</cfoutput>
<div id="footer">&nbsp;<br> </div>
</div>
</body>
</html>
