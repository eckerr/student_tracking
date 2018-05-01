<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>Add New Event</title>

<link href="../main.css" rel="stylesheet" type="text/css" />

<!--- link to validation code --->
<script language="JavaScript" src="gen_validatorv31.js" type="text/javascript"></script>

</head>
<!---  go get all the records to select the student and populate the dropdowns--->
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
WHERE StudentID=#URL.StudentID#
</cfquery>
<body>
<!--- Top Logo and Common navigation  --->
<div id="wrapper">

<div id="logo">&nbsp;</div>
<div class="indentmenu">
<ul>
<li><a href="../logoff.cfm">Log Off</a></li>
<li><a href="input_student.cfm">Go Back</a></li>
<li><a href="save_event.cfm">Review Submissions</a></li>
</ul>
</div>

<!--- Begin the Form which jumps to save_event.cfm --->
<cfform name="form1" id="form1" method="post" action="save_event.cfm">

<!--- Set the top line message  --->
<cfoutput> 
<h4>Today is #DateFormat(Now(), "DDDD, MMMM D, YYYY")# &nbsp;
<cfif SESSION.currentweek IS 0>
This is not a class week
<cfelse>
 Quarter: #SESSION.currentquarter# &nbsp; Week: #SESSION.currentweek# &nbsp;&nbsp;  </h4><br />
</cfif>


<!--- Set all the hidden fields  --->
      <input type="hidden" name="InputDate" value="#Now()#" />
      <input type="hidden" name="Qtr" value="#Quarter(Now())#" />
      <input type="hidden" name="YearStamp" value= "#Year(Now())#" />
      <input type="hidden" name="InstructorID" value="#SESSION.Auth.InstructorID#" />
      <input type="hidden" name="StudentID" value="#getstudents.StudentID#" />
  </cfoutput>

<!--- Decrption starts here --->
<cfset decr_sname = Decrypt(getstudents.SName,"snamILIS0720")>
<cfset decr_sidnumber = Decrypt(getstudents.SIDNumber,"sidnILIS0720")>
  
<!---set the first quadrant  --->
<div id="quad1">
<fieldset><legend>This is the student you are submitting</legend>
<p><label>Student Name:</label>
<cfoutput>
<span style="color:##000; font-size:14px; font-weight:bold">#decr_sname#&nbsp;&nbsp;&nbsp;<span style="font-size: 11px; font-weight:normal;color:##000"> ID:</span>&nbsp;&nbsp; #decr_sidnumber#</span>
</cfoutput></p>
</fieldset>
</div>
          
<!--- Show the week number and course drop downs in the second quadrant --->
<div id="quad2">
<fieldset><legend>Please select the course code</legend> 
<p><label>Week:</label>
        <select name="WeekID">
	 	<cfoutput>		
		<option value="#SESSION.currentweek#">&nbsp;#SESSION.currentweek#</option>
		</cfoutput>
        </select>
     &nbsp;&nbsp;&nbsp;           
      <span style="color:black;">Course:</span>
         <select name="CourseID" id="CourseID">
       <option value="" selected="selected"></option>
       <cfoutput query="getcourses">
       <option value="#CourseID#">#CourseCode#</option>
	   </cfoutput>
       </select></p>
</fieldset>
</div>

<!--- Show reasons for submisson  --->
<div id="quad3">
<fieldset><legend>Reason for Submission: </legend>
 <div id="subdiv1">

<p><label>Absence:</label>
      <cfinput border="0" type="checkbox" name="Absence" value="x"></p>
<p><label>Not Prepared:</label>
      <cfinput type="checkbox" name="NotPrepared" value="x"></p> 
<p><label>Poor Quality Work:</label>
     <cfinput type="checkbox" name="PoorQltyWork" value="x"></p>
<p><label>Personal Issues:</label>
   <cfinput type="checkbox" name="Personal" value="x">
<p><label>Behavioral Issues:</label>
      <cfinput type="checkbox" name="Behavior" value="x"></p>
<p><label>Talked to Student:</label>
     <cfinput type="checkbox" name="TalkedtoStudent" value="x"></p>
 
  </div>

  <div id="subdiv2">
<p><label>Tardiness:</label>
      <cfinput type="checkbox" name="Tardiness" value="x"></p>
<p><label>Missing Work:</label> 
     <cfinput type="checkbox" name="MissingWork" value="x"></p>
<p><label>Failed at Mid Term:</label>
      <cfinput type="checkbox" name="Other" value="x"></p>        
<p><label>Financial Issues:</label>
     <cfinput type="checkbox" name="Financial" value="x"></p>
<p><label>Plagiarism:</label>
     <cfinput type="checkbox" name="Plagerism" value="x"></p>
  </div>
   </fieldset>
</div>

<!--- Quad 4 holds the test area and submit buttons --->
<div id="quad4">
<fieldset><legend> Make your comments here</legend>
<p><label>Instructor Notes:</label>
          
  <textarea name="InstructorNote" cols="33" rows="7"></textarea>
          </p>
</fieldset>

<fieldset><legend> Please check your selection & submit</legend>
<p class="submit"><label>Submit:</label>
<input type="submit" value="submit" /></p>
</fieldset>
</div>
 

</cfform>
<!--- Validator code for the course ID field --->
<script language="JavaScript" type="text/javascript">
 var frmvalidator = new Validator("form1");
 frmvalidator.addValidation("CourseID","req","Please enter the Course Number");
</script>

<div id="footer" style="padding-top: 50px">&nbsp;<br> </div>
</div>
</body>
</html>