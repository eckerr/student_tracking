<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Search Events</title>
<link href="../../main.css" rel="stylesheet" type="text/css">
</head>

<!--- Search tables for drop downs --->
<cfquery datasource="csrmain" name="getstudents">
SELECT *
FROM Students
ORDER BY first2
</cfquery>
<cfquery datasource="csrmain" name="getadvisors">
SELECT *
FROM Advisors
ORDER BY AName
</cfquery>
<cfquery datasource="csrmain" name="getweeks">
SELECT *
FROM Weeks
</cfquery>
<cfquery datasource="csrmain" name="getmajors">
SELECT *
FROM Majors
ORDER BY MajorCode
</cfquery>
<cfquery datasource="csrmain" name="getlevels">
SELECT *
FROM Levels
</cfquery>
<cfquery datasource="csrmain" name="getcourses">
SELECT *
FROM Courses
ORDER BY CourseCode
</cfquery>
<cfquery datasource="csrmain" name="getInstructors">
SELECT *
FROM Instructors
ORDER BY IName
</cfquery>
<cfquery datasource="csrmain" name="getYears">
SELECT DISTINCT YearStamp
FROM Events
ORDER BY YearStamp DESC
</cfquery>

<body>
<div id="wrapper">

<div id="logo">&nbsp;</div>
<div class="indentmenu">
<ul>
<li><a href="../../logoff.cfm">Log Off</a></li>
<li><a href="../select_reports.cfm">Go Back</a></li>
<li><a href="../select_reports.cfm">Academic Progress Reports</a></li>
<li class="selected"><a href="../eventsbyquarter/search_stats.cfm">Events by Quarter</a></li>
<li><a href="../eventsbymajor/major_results.cfm">Events by Major</a></li>
<li><a href="../weekly_report/weekly_report.cfm">Weekly Report</a></li>
<li><a href="../instructor_usage/instructor_usage.cfm">Instructor Usage</a></li>
</ul>
</div>
<h4>Search Events for the Last 4 Quarters</h4>

<!--- Start the Form and use a table to align text fields and drop downs --->
<cfform action="stat_results.cfm">
<table width="100%" border="0" cellpadding="1" cellspacing="5">


<!--- headers --->
<tr>
  <td>Quarter</td><td>Year</td><td>Students</td><td>Advisors</td><td>Weeks</td><td>Majors</td><td>Levels</td><td>Courses</td><td>Instructors</td></tr>
<tr>
<td>
<select name="Quarter">
<cfoutput><option value="#Quarter(Now())#">#Quarter(Now())#</option></cfoutput>
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
</select>
</td>
<td>
<select name="Year">
<cfoutput query="getYears">
<option value="#YearStamp#">#YearStamp#</option>
</cfoutput>
</select></td>
<td>
<select name="StudentID">
<option value="">Select All</option>
<cfoutput query="getstudents">
			<!--- Decrption starts here --->
			<cfset decr_sname = Decrypt("#SName#","snamILIS0720")>
			<!--- Decrption finishes here --->

<option value="#studentID#">#decr_sname#</option>
</cfoutput>
</select></td>
<td>
<select name="Assignedto">
<option value="">Select All</option>
<cfoutput query="getadvisors">
<option value="#AName#">#AName#</option>
</cfoutput>
</select></td>
<td>
<select name="WeekID">
<option value="">Select All</option>
<cfoutput query="getweeks">
<option value="#WeekID#">#WeekName#</option>
</cfoutput>
</select>	  </td> 
<td>
<select name="MajorID">
<option value="">Select All</option>
<cfoutput query="getmajors">
<option value="#MajorID#">#MajorCode#</option>
</cfoutput>
</select></td>
 <td>
 <select name="LevelID">
<option value="">Select All</option>
<cfoutput query="getlevels">
<option value="#LevelID#">#LevelName#</option>
</cfoutput>
</select></td>
<td> 
<select name="CourseID">
<option value="">Select All</option>
<cfoutput query="getcourses">
<option value="#CourseID#">#CourseCode#</option>
</cfoutput>
</select></td>  
<td>	  
<select name="InstructorID">
<option value="">Select All</option>
<cfoutput query="getinstructors">
<option value="#InstructorID#">#IName#</option>
</cfoutput>
</select></td>
</tr>
<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr> 

<!--- Jump to event_results.cfm when submit button is pressed --->
<tr>
<td colspan="9" class="submit"><input type="submit" value="Submit"></td>
</tr>


</table>
</cfform>

<div id="footer" style="margin-top:80px;">&nbsp;<br> </div>
</div>
</body>
</html>
