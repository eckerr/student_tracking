<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Show Students</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../../main.css" rel="stylesheet" type="text/css">

</head>
<!--- get all students --->
<cfquery datasource="csrmain" name="getstudents">
SELECT *
FROM Students
ORDER BY StudentID DESC
<!---ORDER BY first2--->
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
<li><a href="../update_s/view_s.cfm">Update Ss</a></li>
</ul>
</div>

<h3><CENTER>Show <cfoutput>#getStudents.RecordCount#</cfoutput> Students</CENTER></h3>
<div id="table_position">

  <table  border="1" cellpadding="1" cellspacing="0" width="600" align="center" >

  <!--- Loop through students --->
  <cfoutput query="getstudents">
    <tr>
      <!--- StudentID --->
      <td class="left">#studentID#</td>
      	    <!--- Decrption starts here --->
			<cfset decr_sname = Decrypt("#SName#","snamILIS0720")>
            <cfset decr_sidnum = Decrypt("#SIDNumber#","snamILIS0720")>
			<!--- Decrption finishes here --->
      <td class="left">#decr_sname#</td>
      <td class="left">#decr_sidnum#</td>
              <!--- Edit link --->
      <td><a href="edit_students.cfm?StudentID=#StudentID#">[Edit]</a></td>
              <!--- Delete link --->
      <td><a href="confirm_delete_students.cfm?StudentID=#StudentID#">[Delete]</a></td>
          </tr>
    </cfoutput>
  
</table>
</div>

<div id="footer">&nbsp;<br> </div>
</div> 
        
</body>
</html>
