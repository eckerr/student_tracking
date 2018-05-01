<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<cfset thisDataSource = "csrmain"/>
<title>Show Events</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../../main.css" rel="stylesheet" type="text/css">

</head>
<!--- get all students --->
<cfquery datasource="#thisDataSource#" name="getEvents">
SELECT *
FROM Events
ORDER BY EventID DESC
</cfquery>
<body>
<!---<cfdump VAR="#getEvents#" />--->
<div id="wrapper">

<div id="logo">&nbsp;</div>
<div class="indentmenu">
<ul>
<li><a href="../../logoff.cfm">Log Off</a></li>
<li><a href="../select_path.cfm">Show Advisors</a></li>
<li><a href="../edit_instructors/show_instructors.cfm">Show Instructors</a></li>
<li  class="selected"><a href="../edit_students/show_students.cfm">Show Students</a></li>
<li><a href="../edit_majors/show_majors.cfm">Show Majors</a></li>
<li><a href="../edit_courses/show_courses.cfm">Show Courses</a></li>
<li><a href="show_new_students.cfm">Show New Students</a></li>
<li><a href="../purge/selectStuEvents2Delete.cfm">Purge Students</a></li>
</ul>
</div>
<h3><CENTER>Show <cfoutput>#getEvents.RecordCount#</cfoutput> Events</CENTER></h3>
<div id="table_position">

  <table  border="1" cellpadding="1" cellspacing="0" width="600" align="center" >

<!---   Loop through events 
--->
 <cfoutput query="getEvents">
    <tr>
<!---      EventID--->
      <td class="left"> #eventID#</td>
      <td>#studentID#</td>
      <td>#assignedTo#</td>
      <td>#MajorID#</td>
      <td>#InstructorID#</td>
      <td>#CourseID#</td>
      <td>#WeekID#</td>
      <td>#Qtr#</td>
      <td>#YearStamp#</td>      
      	

              <!--- Edit link --->
      <td><a href="edit_events.cfm?EventID=#EventID#">[Edit]</a></td>
          </tr>
    </cfoutput>
          
</table>
</div>

<div id="footer">&nbsp;<br> </div>
</div> 
        
</body>
</html>
