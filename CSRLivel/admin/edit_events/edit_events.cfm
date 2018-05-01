<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Edit Events</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../../main.css" rel="stylesheet" type="text/css">
</head>
<cfset thisDataSource = "csrmain"/>
<body>
<div id="wrapper">

<div id="logo">&nbsp;</div>
<div class="indentmenu">
<ul>
<li><a href="../../logoff.cfm">Log Off</a></li>
<li><a href="show_Events.cfm">Go Back</a></li>
</ul>
</div>
<h3>Edit Events</h3>
<div id="table_position">



          <!--- Check that StudentID was provided --->
          <!--- If yes, edit, else add --->
          <cfset EditMode=IsDefined("URL.EventID")>

          <!--- If eventID passed in, put into edit mode then get row to edit --->
          <cfif EditMode>
                 
            <!--- Get the selected event from the Events Table --->
            <cfquery datasource="#thisDataSource#" name="getEvent">
              SELECT *
              FROM Events
              WHERE EventID=#URL.EventID#
              </cfquery>
             <!--- Get the selected event's student information from the Students Table --->
            <cfquery datasource="#thisDataSource#" name="getThisStudent">
              SELECT *
              FROM Students
              WHERE StudentID=#getEvent.StudentID#
              </cfquery>
			    
			  <!--- Get all the Majors to populate the drop down menus ---> 
			<cfquery datasource="#thisDataSource#" name="getmajors">
              SELECT *
              FROM Majors
			  ORDER BY MajorCode
              </cfquery>

			  <!--- Get all the Courses to populate the drop down menus ---> 
			<cfquery datasource="#thisDataSource#" name="getCourses">
              SELECT *
              FROM Courses
			  ORDER BY CourseCode
              </cfquery>
			  
			  
			  <!--- Get all the Instructors to populate the drop down menus ---> 
			<cfquery datasource="#thisDataSource#" name="getInstructors">
              SELECT *
              FROM Instructors
			  ORDER BY Iname
              </cfquery>
              
			  <!--- Get all the Weeks to populate the drop down menus ---> 
			<cfquery datasource="#thisDataSource#" name="getWeeks">
              SELECT *
              FROM Weeks
			  ORDER BY WeekName
              </cfquery>

			  <!--- Get all the Students to populate the drop down menus ---> 
			<cfquery datasource="#thisDataSource#" name="getStudents">
              SELECT *
              FROM Students
			  ORDER BY StudentID
              </cfquery>
              
			  <!--- Get all the Advisors to populate the drop down menus ---> 
			<cfquery datasource="#thisDataSource#" name="getAdvisors">
              SELECT *
              FROM Advisors
			  ORDER BY AName
              </cfquery>
              
            <!--- Get all the levels to populate the drop down menus ---> 
			<cfquery datasource="#thisDataSource#" name="getLevels">
              SELECT *
              FROM Levels
			  ORDER BY LevelName
              </cfquery>	  
			  
            <!--- Preload Save to variables with existing content --->
     		<cfset LevelName=Trim(getlevels.LevelName)>
			<cfset MajorID=getEvent.MajorID>
            <cfset InputDate=getEvent.InputDate/>
            <cfset AssignedTo=Trim(getEvent.AssignedTo)/>
            <cfset CourseID=getEvent.CourseID/>
            <cfset MajorID=getEvent.MajorID/>
            <cfset InstructorID=getEvent.InstructorID/>
            <cfset WeekID=getEvent.WeekID/>
            <cfset StudentID=getEvent.StudentID/>
            <cfset AdvisorID=getEvent.AdvisorID/>
            <cfset Qtr=getEvent.Qtr/>
            <cfset YearStamp=getEvent.YearStamp/>
            
            <!--- Form text --->
            <cfset FormTitle="Update Event">
            <cfset ButtonText="Update">
            
 
  </cfif>
  <cfoutput QUERY="getThisStudent">
      	   <!---  Decryption starts here --->
			<cfset decr_sname = Decrypt("#getThisStudent.SName#","snamILIS0720")>
            <cfset decr_sidnum = Decrypt("#getThisStudent.SIDNumber#","snamILIS0720")>
			 <!---Decryption finishes here---> 
      #decr_sname# --- #decr_sidnum# <br/>
      
  </cfoutput>

          <!--- update Event form --->
  <cfform action="process_Event.cfm">
            
  <cfif EditMode>
    <!--- Embed primary key as a hidden field --->
    <cfoutput>
      <input type="hidden" name="EventID" value="#getEvent.EventID#">
      </cfoutput>
  </cfif>
<fieldset><legend><cfoutput>#FormTitle#</cfoutput></legend>
                     
<p><label>Assigned to:</label>
		  <cfselect name="AssignedTo"
	 				query="getAdvisors"
					value="AName"
					display="AName"
					selected="#getEvent.AssignedTo#"
					size="1"
					required="yes">	</cfselect></p>

<!---			<cfinput type="Text"
                     name="AssignedTo"
                     value="#AssignedTo#"
                     message="Assigned to field is required!"
                     required="Yes"
                     size="50"
                     maxlength="50"></p>--->
                     
<p><label>Course ID:</label>
		  <cfselect name="CourseID"
	 				query="getCourses"
					value="CourseID"
					display="CourseName"
					selected="#getEvent.courseID#"
					size="1"
					required="yes">	
					</cfselect></p>
                     
<p><label>Major:</label>
		  <cfselect name="MajorID"
	 				query="getmajors"
					value="MajorID"
					display="MajorCode"
					selected="#getEvent.MajorID#"
					size="1"
					required="yes">	</cfselect></p>
                    
<p><label>Instructor:</label>
		  <cfselect name="InstructorID"
	 				query="getInstructors"
					value="InstructorID"
					display="Iname"
					selected="#getEvent.InstructorID#"
					size="1"
					required="yes">	</cfselect></p>
                    
<p><label>Week:</label>
		  <cfselect name="WeekID"
	 				query="getWeeks"
					value="WeekID"
					display="WeekName"
					selected="#getEvent.WeekID#"
					size="1"
					required="yes">	</cfselect></p>
                    
<p><label>Student:</label>
			<cfinput type="Text"
                     name="StudentID"
                     value="#studentID#"
                     message="studentID is required!"
                     required="Yes"></p>
                    
<p><label>Advisor:</label>
		  <cfselect name="AdvisorID"
	 				query="getAdvisors"
					value="AdvisorID"
					display="AName"
					selected="#getEvent.AdvisorID#"
					size="1"
					required="yes">	</cfselect></p>
                                     
<p><label>Quarter:</label>
			<cfinput type="Text"
                     name="Qtr"
                     value="#Qtr#"
                     message="quarter is required!"
                     required="Yes"></p>

<p><label>YearStamp:</label>
			<cfinput type="Text"
                     name="YearStamp"
                     value="#YearStamp#"
                     message="year stamp is required!"
                     required="Yes"></p>
                     
                     
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
