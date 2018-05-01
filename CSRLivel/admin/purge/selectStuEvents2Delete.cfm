<!---
Name:        selectStuEvents2Delete.cfm
Author:      Ed Kerr (eckerr@aii.edu
Description: Selects students to be deleted
Created:     11/9/2014
--->
<cfset thisDataSource = "csrmain" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Delete Students and Events</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../../main.css" rel="stylesheet" type="text/css">

</head>
<!--- get all students --->
<cfquery datasource="#thisDataSource#" name="getstudents4Deletion">
SELECT *
FROM Students
ORDER BY StudentID DESC
</cfquery>
<body>
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
<li><a href="student_download2.cfm">Download Students</a></li>
</ul>
</div>
<h3>Selecting a Student from this list will purge all Student and Event records predating this Student</h3>
<div id="table_position">

  <table  border="1" cellpadding="1" cellspacing="0" width="600" align="center" >

  <!--- Loop through people --->
  <cfoutput query="getstudents4Deletion">
    <tr>
      <!--- StudentID --->
      <td class="left">#studentID#</td>
      	    <!--- Decryption starts here --->
			<cfset decr_sname = Decrypt("#SName#","snamILIS0720")>
            <cfset decr_sidnum = Decrypt("#SIDNumber#","snamILIS0720")>
			<!--- Decryption finishes here --->
      <td class="left">#decr_sname#</td>
      <td class="left">#decr_sidnum#</td>
              <!--- Delete link --->
      <td><a href="confirm_delete_stuEvents.cfm?StudentID=#StudentID#">[Delete All Below]</a></td>
          </tr>
    </cfoutput>
  
</table>
</div>

<div id="footer">&nbsp;<br> </div>
</div> 
        
</body>
</html>
