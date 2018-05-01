<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Events By Quarter</title>
<link href="../../main.css" rel="stylesheet" type="text/css" />

</head>
<!--- Set a Variable for "ALL" if no selection or to  Name of Instructor selected  --->
<cfif FORM.InstructorID IS "">
<cfset Instructor = 'ALL'>
<cfelse>
<!--- OR --->
<cfquery datasource="csrmain" name="getinst">
SELECT IName
FROM Instructors
WHERE InstructorID=#FORM.InstructorID#
</cfquery>
<cfset Instructor = getinst.IName>
</cfif>

<!--- Set a Variable for "ALL" if no selection or to  Name of Advisor selected  --->
<cfif FORM.Assignedto IS "">
<cfset Advisor = 'ALL'>
<cfelse>
<!--- OR --->
<cfset Advisor = FORM.Assignedto>
</cfif>

<!--- Set a Variable for "ALL" if no selection or to  Name of Student selected  --->
<cfif FORM.StudentID IS "">
<cfset Student = 'ALL'>
<cfelse>
<!--- OR --->
<cfquery datasource="csrmain" name="getstu">
SELECT SName
FROM Students
WHERE StudentID=#FORM.StudentID#
</cfquery>
<cfset Student = Decrypt("#getstu.SName#","snamILIS0720")>
</cfif>

<!--- Set a Variable for "ALL" if no selection or to  Name of Major selected  --->
<cfif FORM.MajorID IS "">
<cfset Major = 'ALL'>
<cfelse>
<!--- OR --->
<cfquery datasource="csrmain" name="getmaj">
SELECT MajorCode
FROM Majors
WHERE MajorID=#FORM.MajorID#
</cfquery>
<cfset Major = #getmaj.MajorCode#>
</cfif>

<!--- Set a Variable for "ALL" if no selection or to  Name of Week selected  --->
<cfif FORM.WeekID IS "">
<cfset Week = 'ALL'>
<cfelse>
<!--- OR --->
<cfset Week = #FORM.WeekID#>
</cfif>

<!--- Set a Variable for "ALL" if no selection or to  Name of Level selected  --->
<cfif FORM.LevelID IS "">
<cfset Level = 'ALL'>
<cfelse>
<!--- OR --->
<cfquery datasource="csrmain" name="getlev">
SELECT LevelName
FROM Levels
WHERE LevelID=#FORM.LevelID#
</cfquery>
<cfset Level = #getlev.LevelName#>
</cfif>
<body>
<div id="wrapper">

<div id="logo">&nbsp;</div>
<div class="indentmenu">
<ul>
<li><a href="../../logoff.cfm">Log Off</a></li>
<li><a href="search_stats.cfm">Go Back</a></li>
<li><a href="../select_reports.cfm">Accademic Progress Reports</a></li>
<li class="selected"><a href="search_stats.cfm">Events by Quarter</a></li>
<li><a href="../eventsbymajor/major_results.cfm">Events by Major</a></li>
<li><a href="../weekly_report/weekly_report.cfm">Weekly Report</a></li>
<li><a href="../instructor_usage/instructor_usage.cfm">Instructor Usage</a></li>
</ul>
</div>
<!--- Loop around three more time to go back over three previous quarters --->
<cfloop from="1" to="4" index="i">
<cfquery datasource="csrmain" name="getevent">
SELECT Count(absence) AS abs, Count(tardiness) AS tardy, Count(NotPrepared) AS notprep, Count(MissingWork) AS missing, Count(PoorQltyWork) AS poorqlty, Count(other) AS other, Count(Personal) AS personal, Count(Financial) AS financial, Count(Behavior) AS behavior, Count(Plagerism) AS plagerism, Count(TalkedtoStudent) AS talked
FROM  Events, Students, Instructors, Courses, Majors, Levels
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
</cfquery>


<p>&nbsp;</p>
<table width="950" border="0" cellpadding="1" cellspacing="0">
<cfoutput>

<tr><td>Quarter: #FORM.quarter#</td><td>Year: #FORM.year#</td><td>Student: #Student# </td><td>Instructor: #Instructor# </td><td>Week: #Week# </td><td>Major: #Major# </td><td>Level: #Level# </td><td>Advisor: #Advisor# </td></tr>
</cfoutput>
</table>

<!--- Write the agrigate values  --->
<table width="950" border="1" cellpadding="1" cellspacing="0">
<cfoutput query="getevent">


<tr bgcolor="##ecdfdf">
    <td><div align="center">Absence</div></td>
    <td><div align="center">Tardiness</div></td>
    <td><div align="center">Not<br />
    Prepared</div></td>
    <td><div align="center">Missing<br />
    Work</div></td>
    <td><div align="center">Poor<br />
    QltyWork</div></td>
    <td><div align="center">Failed<br />Mid Term</div></td>
	<td><div align="center">Personal</div></td>
    <td><div align="center">Financial</div></td>
    <td><div align="center">Behavior</div></td>
    <td><div align="center">Plagiarism</div></td>
    <td><div align="center">Talked<br />to<br />
    Student</div></td>
  </tr>
<tr>
	
	
	<td>&nbsp;#abs#</td>
    <td>&nbsp;#tardy#</td>
    <td>&nbsp;#notprep#</td>
    <td>&nbsp;#missing#</td>
    <td>&nbsp;#poorqlty#</td>
    <td>&nbsp;#other#</td>
    <td>&nbsp;#personal#</td>
    <td>&nbsp;#financial#</td>
    <td>&nbsp;#behavior#</td> 
    <td>&nbsp;#Plagerism#</td>
    <td>&nbsp;#talked#</td>

  </tr>

  </tr>


</cfoutput>
</table>
<br />
<!--- Set up new date parameters --->
<cfif form.quarter EQ 1>
<cfset form.year = form.year -1>
<cfset form.quarter = 4>
<cfelse>
<cfset form.quarter = form.quarter -1>
</cfif>

</cfloop>
<div id="footer">&nbsp;<br> </div>
</div>
</body>
</html>
