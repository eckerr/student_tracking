<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Show Courses</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../../main.css" rel="stylesheet" type="text/css">

</head>

<cfquery datasource="csrmain" name="getcourses">
SELECT *
FROM Courses
ORDER BY CourseCode
</cfquery>

<body>
<div id="wrapper">

<div id="logo">&nbsp;</div>
<div class="indentmenu">
<ul>
<li><a href="../../logoff.cfm">Log Off</a></li>
<li><a href="../select_path.cfm">Go Back</a></li>
<li><a href="../select_path.cfm">Show Advisors</a></li>
<li><a href="../edit_instructors/show_instructors.cfm">Show Instructors</a></li>
<li><a href="../edit_students/show_students.cfm">Show Students</a></li>
<li><a href="../edit_majors/show_majors.cfm">Show Majors</a></li>
<li class="selected"><a href="edit_courses/show_courses.cfm">Show Courses</a></li>

</ul>
</div>
<h3>Show Courses</h3>
<div id="table_position">

<!--- Page header --->

<table width="350" border="1" cellpadding="1" cellspacing="0">

 <td colspan="3" align="center"><a href="edit_courses.cfm">[Add]</a></td>
      </tr>
  <!--- Loop through people --->
  <cfoutput query="getcourses">
    <tr>
      <!--- First and Last name --->
      <td class="left">#CourseCode#</div></td>
              <!--- Edit link --->
      <td><a href="edit_courses.cfm?CourseID=#CourseID#">[Edit]</a></td>
              <!--- Delete link --->
      <td><a href="confirm_delete_courses.cfm?CourseID=#CourseID#">[Delete]</a></td>
          </tr>
    </cfoutput>
  
  <tr>
          <!--- Add people link --->
    <td colspan="3" align="center"><a href="edit_courses.cfm">[Add]</a></td>
      </tr>
</table>

</div>

<div id="footer">&nbsp;<br> </div>
</div>      
</body>
</html>
