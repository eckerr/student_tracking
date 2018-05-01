<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Confirm Delete Courses</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../../main.css" rel="stylesheet" type="text/css">
</head>

<body>
<div id="wrapper">

<div id="logo">&nbsp;</div>
<div class="indentmenu">
<ul>
<li><a href="../../logoff.cfm">Log Off</a></li>
<li><a href="show_courses.cfm">Go Back</a></li>
</ul>
</div>
<h3>Confirm Deletion</h3>
<div id="table_position">

          <!--- Check that AdvisorID was provided --->
          <!--- If yes, edit, else add --->
          <cfset EditMode=IsDefined("URL.CourseID")>

          <!--- If edit mode then get row to edit --->
          <cfif EditMode>
            
            <!--- Get the film record --->
            <cfquery datasource="csrmain" name="getcourses">
              SELECT *
              FROM Courses
              WHERE CourseID=#URL.CourseID#
              </cfquery>
            
            <!--- Save to variables --->
            <cfset CourseCode=Trim(getcourses.CourseCode)>
            <cfset CourseName= Trim(getcourses.CourseName)>

                  
            
            <!--- Form text --->
            <cfset FormTitle="Update Course">
            <cfset ButtonText="Update">
            
  <cfelse>
            
            <!--- Save to variables --->
            <cfset CourseCode="">
            <cfset CourseName="">
            
            
            <!--- Form text --->
            <cfset FormTitle="Add a Course">
            <cfset ButtonText="Add">
          </cfif>


          <!--- Add/update movie form --->


          <cfform action="delete_courses.cfm">
            
  <cfif EditMode>
    <!--- Embed primary key as a hidden field --->
    <cfoutput>
      <input type="hidden" name="CourseID" value="#getcourses.CourseID#">
      </cfoutput>
  </cfif>
<fieldset><legend>Confirm Deletion</legend> 
        
<p><label>Course Code:</label>
       		<cfinput type="Text"
                     name="CourseCode"
                     value="#CourseCode#"
                     message="Code is required!"
                     required="Yes"
                     size="20"
                     maxlength="20"></p>                

		 

<p class="submit"><label>Submit:</label><input type="submit" value="Confirm Deletion"></p>

          </cfform>
</div>

<div id="footer">&nbsp;<br> </div>
</div>    
</body>
</html>
