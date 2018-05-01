<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Edit Instructor</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../../main.css" rel="stylesheet" type="text/css">
</head>

<body>
<div id="wrapper">

<div id="logo">&nbsp;</div>
<div class="indentmenu">
<ul>
<li><a href="../../logoff.cfm">Log Off</a></li>
<li><a href="show_students.cfm">Go Back</a></li>
</ul>
</div>
<h3>Confirm Deletion</h3>
<div id="table_position">

          <!--- Check that FilmID was provided --->
          <!--- If yes, edit, else add --->
          <cfset EditMode=IsDefined("URL.StudentID")>

          <!--- If edit mode then get row to edit --->
          <cfif EditMode>
            
            <!--- Get the film record --->
            <cfquery datasource="csrmain" name="getstudent">
              SELECT *
              FROM Students
              WHERE StudentID=#URL.StudentID#
              </cfquery>
            
            <!--- Save to variables --->
            <cfset SName=Decrypt(getstudent.SName,"snamILIS0720")>
            <cfset StudentID= Trim(getstudent.StudentID)>
			<cfset SIDNumber=Decrypt(getstudent.SIDNumber, "sidnILIS0720")>
			
                  
            
            <!--- Form text --->
            <cfset FormTitle="Update Student">
            <cfset ButtonText="Update">
            
  <cfelse>
            
            <!--- Save to variables --->
            <cfset SName= "">
            <cfset StudentID= "">
			<cfset SIDNumber= "">
            
            <!--- Form text --->
            <cfset FormTitle="Add an Instructor">
            <cfset ButtonText="Add">
          </cfif>


          <!--- Add/update movie form --->


          <cfform action="delete_students.cfm">
            
  <cfif EditMode>
    <!--- Embed primary key as a hidden field --->
    <cfoutput>
      <input type="hidden" name="StudentID" value="#getstudent.StudentID#">
      </cfoutput>
  </cfif>
 <fieldset><legend>Confirm Student Deletion or Go Back</legend>
           
<p><label>Student Name:</label>
			<cfinput type="Text"
                     name="SName"
                     value="#SName#"
                     message="Name is required!"
                     required="Yes"
                     size="20"
                     maxlength="20"></p>
                                     
<p><label>Student ID:</label>
			<cfinput type="Text"
                     name="SIDNumber"
                     value="#SIDNumber#"
                     message="ID is required!"
                     required="Yes"
                     size="20"
                     maxlength="20"></p>
                     
<p class="submit"><label>Submit:</label><input type="submit" value="Confirm Deletion"></p>
</fieldset>
          </cfform>
     </div>
     
<div id="footer">&nbsp;<br> </div>
</div>     
</body>
</html>
