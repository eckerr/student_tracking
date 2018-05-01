<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Select Path</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../../main.css" rel="stylesheet" type="text/css">

</head>
<!--- Here you retrieve the data that's going to be printed --->
<cfquery datasource="csrmain" name="qGetRecords">
SELECT *
FROM Events, Students, Instructors, Courses
WHERE (Absence = 'x' OR Tardiness = 'x' OR PoorQltyWork = 'x' OR MissingWork = 'x' OR NotPrepared = 'x' OR Other = 'x' ) AND Events.CourseID = Courses.CourseID AND Events.StudentID = Students.StudentID AND Events.InstructorID = Instructors.InstructorID AND Qtr = #Quarter(Now())# AND YearStamp = #Year(Now())#
<cfif #FORM.weekrangeID# IS 1>
AND WeekID BETWEEN 1 AND 3
</cfif>
<cfif #FORM.weekrangeID# IS 4>
AND WeekID BETWEEN 4 AND 6
</cfif> 
<cfif #FORM.weekrangeID# IS 7>
AND WeekID BETWEEN 7 AND 9
</cfif>
ORDER BY IName, InputDate DESC
</cfquery>

<body>
<div id="wrapper">

<div id="logo">&nbsp;</div>
<div class="indentmenu">
<ul>
<li><a href="../../logoff.cfm">Log Off</a></li>
<li><a href="../select_reports.cfm">Go Back</a></li>
</ul>
</div>


 
 
<cfoutput>
<h3>You are about to print #qGetRecords.RecordCount# pages</h3>
</cfoutput>


  <cfform action="print_feedback.cfm">
  <fieldset><legend> Confirm Print</legend>
  <cfoutput>
  <input type="hidden" name="weekrangeID" value="#FORM.weekrangeID#">
  </cfoutput>
  <p class="submit"><label>Confirm</label><input type="submit" value="Confirm"></p>
  
 </fieldset>
  
  </cfform>
      
 <div id="footer">&nbsp;<br> </div>
</div>      
</body>
</html>
