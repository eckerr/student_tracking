<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<cfset thisDataSource = "csrmain"/>
<title>Delete Students and Events</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../../main.css" rel="stylesheet" type="text/css">
</head>

<body>
<div id="wrapper">

<div id="logo">&nbsp;</div>
<div class="indentmenu">
<ul>
<li><a href="../../logoff.cfm">Log Off</a></li>
<li><a href="selectStuEvents2Delete.cfm">Go Back</a></li>
</ul>
</div>
<h3>Confirm Deletion</h3>
<h2>All students and events pre-dating this student will be deleted</h2>
<div id="table_position">

          <!--- Check that studentID was passed --->
          <!--- If yes, edit, else add --->
          <cfset DeleteMode=IsDefined("URL.StudentID")>

          <!--- If Delete mode then get rows to be deleted --->
   <cfif DeleteMode>
            
            <!--- Get the student record we will delete below --->
            <cfquery datasource="#thisDataSource#" name="getStudent2Delete">
              SELECT *
              FROM Students
              WHERE StudentID=#URL.StudentID#
              ORDER BY StudentID DESC
              </cfquery>
              <cfdump VAR="#getStudent2Delete#"/>
             <cfquery datasource="#thisDataSource#" name="getEvents2Delete">
              SELECT assignedDate
              FROM Events
              WHERE StudentID=#URL.StudentID#
              ORDER BY assignedDate DESC
              </cfquery>             
              <cfdump VAR="#getEvents2Delete#"/>
            <!--- Save to variables --->
            <cfset SName=Decrypt(getstudent2Delete.SName,"snamILIS0720")>
            <cfset StudentID= Trim(getstudent2Delete.StudentID)>
			<cfset SIDNumber=Decrypt(getstudent2Delete.SIDNumber, "sidnILIS0720")>
			
                  
            
            <!--- Form text --->
            <cfset FormTitle="Delete Students">
            <cfset ButtonText="Delete Below">
            
 
          <!--- delete student/events form --->


          <cfform action="delete_stuEvents.cfm">
            
     <!--- Embed primary key as a hidden field --->
    <cfoutput>
      <input type="hidden" name="StudentID" value="#getstudent2Delete.StudentID#">
      </cfoutput>

 <fieldset><legend>Confirm Student/Events Deletion or Go Back</legend>
           
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
  </cfif>          
     </div>
     
<div id="footer">&nbsp;<br> </div>
</div>     
</body>
</html>
