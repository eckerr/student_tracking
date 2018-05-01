<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Save Event</title>

<link href="../main.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="wrapper">

<div id="logo">&nbsp;</div>
<div class="indentmenu">
<ul>
<li><a href="../logoff.cfm">Log Off</a></li>
<li><a href="input_student.cfm">Add New Event</a></li>
<li><a href="edit_user_password.cfm">Change Your Password</a></li>
</ul>
</div>
<!--- If instructorID is passed, save --->
<cfif IsDefined("form.InstructorID")>
<cfset WeekID =#Form.WeekID#>
<cfparam name="Absence" default="">
<cfparam name="Tardiness" default="">
<cfparam name="PoorQltyWork" default="">
<cfparam name="MissingWork" default="">
<cfparam name="NotPrepared" default="">
<cfparam name="Personal" default="">
<cfparam name="Plagerism" default="">
<cfparam name="InstructorNote" default="">
<cfparam name="Others" default="">
<cfparam name="Behavior" default="">
<cfparam name="TalktoStudent" default="">
<cfparam name="Financial" default="">
<cfparam name="DrugsAlcohol" default="">
<cfinsert datasource="csrmain" tablename="Events">
</cfif>

<cfquery datasource="csrmain" name="getevents">
SELECT *
FROM Events, Students
WHERE InstructorID = #SESSION.Auth.InstructorID# AND Events.StudentID = Students.StudentID AND Qtr = #Quarter(Now())# AND YearStamp = #Year(Now())# 
ORDER BY InputDate DESC 
</cfquery>

<cfoutput>
<h4>#SESSION.Auth.Iname#, Welcome to the ILIS CSR system.&nbsp;&nbsp; You have #getevents.recordcount# entries&nbsp;&nbsp; Today is #DateFormat(Now(), "DDDD, MMMM D, YYYY")# &nbsp;
<cfif SESSION.currentweek IS 0>
This is not a class week
<cfelse>
 Quarter: #SESSION.currentquarter# &nbsp; Week: #SESSION.currentweek# &nbsp;&nbsp;  </h4><br />
</cfif>
</cfoutput>

<table width="955" border="1" cellpadding="1" cellspacing="0" >
<tr>
	<th>Student<br />Name</th>
	<th>Week</th>
    <th>Absence</th>
    <th>Tardiness</th>
    <th>Not<br />Prepared</th>
    <th>Missing<br />Work</th>
    <th>Poor<br />Quality<br />Work</th>
    <th>Failed<br />Mid<br /> Term</th>
    <th>Personal</th>
    <th>Financial</th>
    <th>Behavior</th>
    <th>Plagiarism</th> 
    <th>Talked<br />to<br />Student</th>
    <th>Assigned<br />to</th>
    <th>Assigned<br />Date</th>
	<th>Instructor<br />Note</th>
  </tr>
<cfoutput query="getevents">
<cfif CurrentRow Mod 2 EQ 1>
<tr bgcolor="##ecdfdf">
<cfelse>
<tr>
</cfif>
<!--- Decryption starts here --->
<cfset decr_sname = Decrypt(SName,"snamILIS0720")>

<!--- Decryption finishes here --->

	<td width="125" class="left">&nbsp;#decr_sname#</td>
	<td>&nbsp;#WeekID#</td>
	<td>&nbsp;#Absence#</td>
    <td>&nbsp;#Tardiness#</td>
    <td>&nbsp;#NotPrepared#</td>
    <td>&nbsp;#MissingWork#</td>
    <td>&nbsp;#PoorQltyWork#</td>
    <td>&nbsp;#Other#</td>
    <td>&nbsp;#Personal#</td>
    <td>&nbsp;#Financial#</td>
    <td>&nbsp;#Behavior#</td> 
    <td>&nbsp;#Plagerism#</td>
    <td>&nbsp;#TalkedtoStudent#</td>
    <!--- Add a link to update event only on the day entered ---> 
    <cfif DateFormat(getevents.InputDate) EQ DateFormat(now())>
    <td>&nbsp;<a href="update_event.cfm?EventID=#getevents.EventID#">Update</a></td>
   <!--- if not the day entered check if assignedto is 0 and write a space --->
     <cfelseif Assignedto IS '0'>
        <td>&nbsp;</td>
    <!--- Otherwise show who it was assigned to --->
        <cfelse>
        <td class="left">&nbsp;#Assignedto#</td>
        </cfif>
	<!--- ...and the date it was assigned --->
	<td>#DateFormat(AssignedDate, "MM/DD/YY")#</td>
	<td class="left">&nbsp;#InstructorNote#</td>
  </tr>
</cfoutput>
</table>

<div id="footer">&nbsp;<br> </div>

<!--- preload the rollover image --->
<div style="display:none"><img src="../images/grad2.png" /></div>
</body>
</html>
