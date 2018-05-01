<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title></title>
<link href="../main.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div id="wrapper">

<div id="logo">&nbsp;</div>
<div class="indentmenu">
<ul>
<li><a href="../logoff.cfm">Log Off</a></li>
<li><a href="input_student.cfm">Go Back</a></li>
<li><a href="add_student.cfm">Add New Student</a></li>
</ul>
</div>
<cfif IsDefined("Form.SIDNumber")>

  <cfquery name="getstudent" datasource="csrmain">
    SELECT *
    FROM Students

    
  <!--- Edit Out 
  <cfif FORM.Name IS NOT "">
    AND SName LIKE '%#FORM.Name#%'
  </cfif>
  --->
  
  <!--- Search by StudentID --->
  <cfif Form.SIDNumber IS NOT "">
  <!--- Encrption starts here --->
<cfset Form.SIDNumber = Encrypt("#Form.SIDNumber#", "sidnILIS0720")>
<!--- Encrption finishes here --->
WHERE SIDNumber = '#Form.SIDNumber#'
</cfif>
ORDER BY first2
  </cfquery>
</cfif>
  <!--- If student is not in the database send to add student page --->
<cfoutput>
  <cfif #getstudent.recordcount# EQ 0> 
  <h3> The Student you are looking for is not in the Database.</h3>  <h3> Click on [Add New Student] to add the student to the Database yourself<br />The correct format is Last name, First name for the student name field and Student ID for the next field. Once added by any Faculty, the student will be in the Database from then on. </h3>
 
  
  <!--- If student is in the database load studentID and send to add event page --->
  <cfelseif #getstudent.recordcount# EQ 1>
	<cflocation url="add_new_event.cfm?StudentID=#getstudent.StudentID#" addtoken="no">
  </cfif>
 	</cfoutput> 
  
  <!--- If more than one student is found show all students as links so selection 
  cab be made and jump to same add event page --->
  <cfif #getstudent.recordcount# GT 1>
  <h3> Select the student you are looking for by clicking on the student name. If the student does not appear in the list you will need to add the student to the Database yourself by clicking on [Add New Student]<br />The correct format is Last name, First name name for the student name field and Student ID for the next field. Once added by any Faculty, the student will be in the Database from then on. </h3><br />

  <cfoutput query="getstudent">
  <!--- Decrption starts here --->
<cfset decr_sname = Decrypt("#SName#","snamILIS0720")>
<cfset decr_sidnumber = Decrypt("#SIDNumber#","sidnILIS0720")>
<!--- Decrption finishes here --->
  <a href="add_new_event.cfm?StudentID=#getstudent.StudentID#">#decr_sname#&nbsp;&nbsp;&nbsp;#decr_sidnumber#</a><br />
  </cfoutput>
</cfif>

<div id="footer">&nbsp;</div> 

</div>  
</body>
</html>
