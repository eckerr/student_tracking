<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Edit Students</title>
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
<h3>Edit Students</h3>
<div id="table_position">

          <!--- Check that StudentID was provided --->
          <!--- If yes, edit, else add --->
          <cfset EditMode=IsDefined("URL.StudentID")>

          <!--- If edit mode then get row to edit --->
          <cfif EditMode>
            
            <!--- Get the selected Student from the Students Table --->
            <cfquery datasource="csrmain" name="getstudent">
              SELECT *
              FROM Students
              WHERE StudentID=#URL.StudentID#
              </cfquery>
			  
			  <cfquery datasource="csrmain" name="getcurrentcodes">
              SELECT DISTINCT Scodecurrent
              FROM Students
              </cfquery>
			  
			  <cfquery datasource="csrmain" name="getnextcodes">
              SELECT DISTINCT Scodenext
              FROM Students
              </cfquery>
			  
			  <!--- Get all the Majors to populate the drop down menus ---> 
			<cfquery datasource="csrmain" name="getmajors">
              SELECT *
              FROM Majors
			  ORDER BY MajorCode
              </cfquery>
			  
			  <cfquery datasource="csrmain" name="getlevels">
              SELECT *
              FROM Levels
			  ORDER BY LevelID
              </cfquery>
			  
            <!--- Save to variables --->
            <cfset SName=Decrypt(getstudent.SName, "snamILIS0720")>
			<cfset SIDNumber=Decrypt(getstudent.SIDNumber, "sidnILIS0720")>
			<cfset Scodecurrent=Trim(getstudent.Scodecurrent)>
			<cfset Scodenext=Trim(getstudent.Scodenext)>
			<cfset LevelName=Trim(getlevels.LevelName)>
			<cfset MajorID=getstudent.MajorID>
	
     
            
            <!--- Form text --->
            <cfset FormTitle="Update Student">
            <cfset ButtonText="Update">
            
  <cfelse>
            
            <!--- Save to variables --->
            <cfset SName="">
			<cfset SIDNumber= "">
            <cfset Scodecurrent="">
			<cfset Scodenext="">
			<cfset Slevel="">
            
            <!--- Form text --->
            <cfset FormTitle="Add Student">
            <cfset ButtonText="Add">
          </cfif>


          <!--- Add/update Instructor form --->


  <cfform action="process_students.cfm">
            
  <cfif EditMode>
    <!--- Embed primary key as a hidden field --->
    <cfoutput>
      <input type="hidden" name="StudentID" value="#getstudent.StudentID#">
      </cfoutput>
  </cfif>
<fieldset><legend><cfoutput>#FormTitle#</cfoutput></legend>

<p><label>Student Name:</label>
			<cfinput type="Text"
                     name="SName"
                     value="#SName#"
                     message="Name is required!"
                     required="Yes"
                     size="20"
                     maxlength="30"></p>
                     
<p><label>Student ID:</label>
			<cfinput type="Text"
                     name="SIDNumber"
                     value="#SIDNumber#"
                     message="Student ID is required!"
                     required="Yes"
                     size="20"
                     maxlength="20"></p>
                     
<p><label>Student Level:</label>
		  <cfselect name="LevelID"
	 				query="getlevels"
					value="LevelID"
					display="LevelName"
					selected="#getstudent.LevelID#"
					size="1"
					required="yes">	
					</cfselect></p>
                     
<p><label>Major:</label>
		  <cfselect name="MajorID"
	 				query="getmajors"
					value="MajorID"
					display="MajorCode"
					selected="#getstudent.MajorID#"
					size="1"
					required="yes">	</cfselect></p>
                    
<p><label>Current Code:</label>
		  <cfselect name="Scodecurrent"
	 				query="getcurrentcodes"
					value="Scodecurrent"
					display="Scodecurrent"
					selected="#getstudent.Scodecurrent#"
					size="1"
					required="yes">	</cfselect></p>
                    
<p><label>Next Code:</label>
		  <cfselect name="Scodenext"
	 				query="getnextcodes"
					value="Scodenext"
					display="Scodenext"
					selected="#getstudent.Scodenext#"
					size="1"
					required="yes">	</cfselect></p>
            
        <cfoutput>
<p class="submit"><label>Submit:</label><input type="submit" value="#ButtonText#"></p>
          </cfoutput>
</fieldset>
          </cfform>
        </div>
        
<div id="footer">&nbsp;<br> </div>
</div>
</body>
</html>
