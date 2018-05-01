<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Weekly Report</title>
<link href="../../main.css" rel="stylesheet" type="text/css" />
</head>
<cfquery datasource="csrmain" name="getevent">
SELECT *
FROM Events, Students, Instructors, Courses, Majors, Levels
WHERE Events.StudentID = Students.StudentID 
AND Events.InstructorID = Instructors.InstructorID AND Events.CourseID = Courses.CourseID AND Students.LevelID = Levels.LevelID AND Students.MajorID = Majors.MajorID AND Qtr = #Quarter(Now())# AND YearStamp = #Year(Now())# AND Students.LevelID = 4
ORDER BY first2
</cfquery>

<body>
<div id="wrapper">

<div id="logo">&nbsp;</div>
<div class="indentmenu">
<ul>
<li><a href="../../logoff.cfm">Log Off</a></li>
<li><a href="../select_reports.cfm">Go Back</a></li>
<li><a href="../select_reports.cfm">Academic Progress Reports</a></li>
<li><a href="../eventsbyquarter/search_stats.cfm">Events by Quarter</a></li>
<li><a href="../eventsbymajor/major_results.cfm">Events by Major</a></li>
<li class="selected"><a href="../weekly_report/weekly_report.cfm">Weekly Report</a></li>
<li><a href="../Instructor_Usage/Instructor_usage.cfm">Instructor Usage</a></li>
</ul>
</div>
<br />


<cfif getevent.RecordCount EQ 0>
<h3>Weekly Report: There are no S1 students to display</h3>
<cfelse>
<cfoutput>
<h3>Weekly Report:&nbsp;&nbsp;Quarter: #Quarter(Now())# &nbsp;&nbsp;&nbsp; Year: #Year(Now())#</h3>
</cfoutput>
</cfif>


<cfoutput query="getevent">

<table width="955" border="1" cellpadding="1" cellspacing="0">
	        <!--- Decrption starts here --->
			<cfset decr_sname = Decrypt("#SName#","snamILIS0720")>
			<cfset decr_sidnumber = Decrypt("#SIDNumber#","sidnILIS0720")>
			<!--- Decrption finishes here --->
<tr bgcolor="##ecdfdf"><td colspan="9" class="left" width="477">Student: #decr_sname# --- #decr_sidnumber#</td><td colspan="9" class="left" width="477">Instructor: #IName#</td></tr>
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
  <td width="477" height="15" colspan="18" class="left">&nbsp;#AdvisorNote#</td>
  </tr>
</table>
</cfoutput>

<div id="footer">&nbsp;<br> </div>
</div>

</body>
</html>