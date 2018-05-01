<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Statistical Results</title>
<link href="../../main.css" rel="stylesheet" type="text/css" />

</head>
<!--- Set a Variable for "ALL" if no selection or to  Name of Instructor selected  --->

<cfset Instructor = 'ALL'>
<cfset Advisor = 'ALL'>
<cfset Student = 'ALL'>
<cfset Major = 'ALL'>
<cfset Week = 'ALL'>
<cfset Level = 'ALL'>


<!--- get all majors to loop around --->
<cfquery datasource="csrmain" name="getallmaj">
SELECT *
FROM Majors
ORDER BY MajorID
</cfquery>

<!--- get all events for this quarter --->
<cfquery datasource="csrmain" name="getevents">
SELECT eventID
FROM Events
WHERE Qtr = #Quarter(Now())# AND YearStamp = #Year(Now())#
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
<li class="selected"><a href="eventsbymajor/major_results.cfm">Events by Major</a></li>
<li><a href="../weekly_report/weekly_report.cfm">Weekly Report</a></li>


</ul>
</div>

<!--- set a variable with a comma separated list of all majorID's  and codes--->
<cfset major_list = ValueList(getallmaj.majorID)>
<cfset major_codes = ValueList(getallmaj.majorcode)>
<cfset count = 0>


   <cfoutput>
    <h4>Events by Major:&nbsp;
    <cfif getevents.RecordCount IS 0>
    There are no events as of
    <cfelse>
    There are #getevents.recordcount# events as of
    </cfif>
    
    	<cfif SESSION.currentweek IS 0>
		a week that is not a class week
		<cfelse>
	 	Quarter: #SESSION.currentquarter#, &nbsp; Week: #SESSION.currentweek# &nbsp;&nbsp;  </h4><br />
		</cfif>
      
  </cfoutput>



<table width="955" border="1" cellpadding="1" cellspacing="0" > 

<!--- Loop around for all majors --->
<cfloop list="#major_list#" index="i">

<!--- isolate the first and sunsequest major code and take care of last item in the list--->
<cfif count lt getallmaj.RecordCount - 1>
<cfset count = count+1>
<cfset this_major_code = ListGetAt(major_codes,count)>
</cfif>

<cfquery datasource="csrmain" name="getevent">
SELECT Count(absence) AS abs, Count(tardiness) AS tardy, Count(NotPrepared) AS notprep, Count(MissingWork) AS missing, Count(PoorQltyWork) AS poorqlty, Count(other) AS other, Count(Personal) AS personal, Count(Financial) AS financial, Count(Behavior) AS behavior, Count(Plagerism) AS plagerism, Count(TalkedtoStudent) AS talked
FROM  Events, Students, Instructors, Courses, Majors, Levels
WHERE 0=0 AND Events.StudentID=Students.StudentID AND Events.InstructorID=Instructors.InstructorID
AND Events.CourseID=Courses.CourseID AND Students.MajorID=Majors.MajorID AND Students.LevelID=Levels.LevelID AND Qtr = #Quarter(Now())# AND YearStamp = #Year(Now())#
<!--- loop around setting majorID to all majors in the list --->
AND Majors.MajorID = #i#
</cfquery>


<!--- Write the agrigate values  --->
<cfoutput query="getevent">

<cfif i lt 2>
<thead>
	<tr> 
	<th width="200">&nbsp;</th>
    <th>Absence</th>
    <th>Tardiness</th>
    <th>Not<br />
    Prepared</th>
    <th>Missing<br />
    Work</th>
    <th>Poor<br />
    QltyWork</th>
    <th>Failed<br />Mid Term</th>
	<th>Personal</th>
    <th>Financial</th>
    <th>Behavior</th>
    <th>Plagiarism</th>
    <th>Talked<br />to<br />
    Student</th>
  </tr>
</thead>
</cfif>

      <cfif i Mod 2 EQ 1>
	<tr bgcolor="##ecdfdf">
	<cfelse>
	<tr>
	</cfif>
	
	<td><strong>#this_major_code#</strong> </td>
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


</cfloop>
</table>

<div id="footer">&nbsp;<br> </div>
</div>  
</body>
</html>
