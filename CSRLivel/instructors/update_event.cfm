<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Update Results</title>
</head>
<link href="../main.css" rel="stylesheet" type="text/css" />

</head>
<!--- Get selected event from Event Table --->
<cfquery datasource="csrmain" name="getevent">
SELECT *
FROM Events, Students, Instructors
WHERE Events.eventID=#URL.EventID# AND Events.StudentID = Students.StudentID 
AND Events.InstructorID = Instructors.InstructorID 
</cfquery>

<!--- set the reasons to match what comes out of the Event file --->
<cfset abscheck = #iif(getevent.Absence is 'x', DE('Yes'), DE('No'))#>
<cfset othcheck = #iif(getevent.Other is 'x', DE('Yes'), DE('No'))#>
<cfset tarcheck = #iif(getevent.Tardiness is 'x', DE('Yes'), DE('No'))#>
<cfset poocheck = #iif(getevent.PoorQltyWork is 'x', DE('Yes'), DE('No'))#>
<cfset mischeck = #iif(getevent.MissingWork is 'x', DE('Yes'), DE('No'))#>
<cfset notcheck = #iif(getevent.NotPrepared is 'x', DE('Yes'), DE('No'))#>
<cfset inacheck = #iif(getevent.Behavior is 'x', DE('Yes'), DE('No'))#>
<cfset percheck = #iif(getevent.Personal is 'x', DE('Yes'), DE('No'))#>
<cfset discheck = #iif(getevent.Financial is 'x', DE('Yes'), DE('No'))#>
<cfset drucheck = #iif(getevent.DrugsAlcohol is 'x', DE('Yes'), DE('No'))#>
<cfset placheck = #iif(getevent.Plagerism is 'x', DE('Yes'), DE('No'))#>
<cfset talcheck = #iif(getevent.TalkedtoStudent is 'x', DE('Yes'), DE('No'))#>

<!--- Select the data from other tables to populate the drop down menues --->
<cfquery name="getweeks" datasource="csrmain">
SELECT *
FROM Weeks
ORDER BY WeekID
</cfquery>
<cfquery name="getcourses" datasource="csrmain">
SELECT *
FROM Courses
ORDER BY CourseCode
</cfquery>
<cfquery name="getstudents" datasource="csrmain">
SELECT *
FROM Students
ORDER BY first2
</cfquery>

<body>
<div id="wrapper">

<div id="logo">&nbsp;</div>
<div class="indentmenu">
<ul>
<li><a href="../logoff.cfm">Log Off</a></li>
<li><a href="save_event.cfm">Go Back</a></li>
</ul>
</div>


<!--- Start the Form --->
<cfform name="form1" id="form1" method="post" action="process_event_update.cfm">
<cfoutput>#Dateformat(Now(),"DDDD, D MMM YYYY")#<br /><br />
<input type="hidden" name="EventID" value="#getevent.EventID#" />
</cfoutput>

<!--- Decrption starts here --->
<cfset decr_sname = Decrypt(getevent.SName,"snamILIS0720")>
<cfset decr_sidnumber = Decrypt(getevent.SIDNumber,"sidnILIS0720")>

<!---set the first quadrant  --->
 <div id="quad1">
<fieldset><legend>This is the student you are editing</legend>
<p><label>Student Name:</label>
<cfoutput>
<span style="color:##000; font-size:14px; font-weight:bold">#decr_sname#&nbsp;&nbsp;&nbsp;<span style="font-size: 11px; font-weight:normal;color:##000"> ID:</span>&nbsp;&nbsp; #decr_sidnumber#</span>
</cfoutput></p>
</fieldset>
</div>
          
<!--- Show the week number and course drop downs in the second quadrant --->
<div id="quad2">
<fieldset><legend>Please change the week number & course code here</legend> 
<p><label>Week:</label>
     <cfselect 	name="WeekID"
	 			query="getweeks"
				value="WeekID"
				display="WeekName"
				selected="#getevent.WeekID#"
				size="1"
				required="yes">	</cfselect>
     &nbsp;&nbsp;&nbsp;           
      <span style="color:black;">Course:</span>
     <cfselect 	name="CourseID"
	 			query="getcourses"
				value="CourseID"
				display="CourseCode"
				selected="#getevent.CourseID#"
				size="1"
				required="yes">	</cfselect></p>
</fieldset>
</div>

<!--- Show reasons for submisson  --->
<div id="quad3">
<fieldset><legend>Change the reason for submission here: </legend>
 <div id="subdiv1">

<p><label>Absence:</label>
      <cfinput type="checkbox" name="Absence" value="x" checked="#abscheck#"></p>
<p><label>Not Prepared:</label>
      <cfinput type="checkbox" name="NotPrepared" value="x" checked="#notcheck#"></p> 
<p><label>Poor Quality Work:</label>
     <cfinput type="checkbox" name="PoorQltyWork" value="x" checked="#poocheck#"></p>
<p><label>Personal Issues:</label>
   <cfinput type="checkbox" name="Personal" value="x" checked="#percheck#">
<p><label>Behavioral Issues:</label>
      <cfinput type="checkbox" name="Behavior" value="x" checked="#inacheck#"></p>
<p><label>Talked to Student:</label>
     <cfinput type="checkbox" name="TalkedtoStudent" value="x" checked="#talcheck#"></p>
 
  </div>

  <div id="subdiv2">
<p><label>Tardiness:</label>
      <cfinput type="checkbox" name="Tardiness" value="x" checked="#tarcheck#"></p>
<p><label>Missing Work:</label> 
     <cfinput type="checkbox" name="MissingWork" value="x" checked="#mischeck#"></p>
<p><label>Failed at Mid Term:</label>
      <cfinput type="checkbox" name="Other" value="x" checked="#othcheck#"></p>        
<p><label>Financial Issues:</label>
     <cfinput type="checkbox" name="Financial" value="x" checked="#discheck#"></p>
<p><label>Plagiarism:</label>
     <cfinput type="checkbox" name="Plagerism" value="x" checked="#placheck#"></p>
  </div>
   </fieldset>
</div>

<div id="quad4">
<fieldset><legend> Change your comments here: </legend>
<p><label>Instructor Notes:</label>
          
            <cfoutput>
          <textarea name="InstructorNote" cols="33" rows="7">#getevent.InstructorNote#</textarea>
          </cfoutput></p>
          </p>
</fieldset>
<fieldset><legend> Please check your selection & submit</legend>
<p class="submit"><label>Submit:</label>
<input type="submit" value="submit" /></p>
</fieldset>
</div>    

</cfform>
<div id="footer" style="padding-top: 50px">&nbsp;<br> </div>
</div>
</body>
</html>