<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Advisor Detail</title>

<link href="../main.css" rel="stylesheet" type="text/css">
</head>

<!--- Get Specific event to update --->
<cfquery datasource="csrmain" name="getevent">
SELECT *
FROM Events, Students, Instructors, Majors, Levels
WHERE Events.eventID=#URL.EventID# AND Events.StudentID = Students.StudentID 
AND Events.InstructorID = Instructors.InstructorID AND Students.MajorID = Majors.MajorID AND Students.levelID = Levels.levelID
</cfquery>
<!---Set major to show the current settings in the drop downs  --->
<cfset Assignedto=trim(getevent.Assignedto)>
<!--- Get all records from other tables for drop down menus --->
<cfquery datasource="csrmain" name="getadvisors">
SELECT *
FROM Advisors
ORDER BY AName
</cfquery>

<body>
<div id="wrapper">

<div id="logo">&nbsp;</div>
<div class="indentmenu">
<ul>
<li><a href="../logoff.cfm">Log Off</a></li>
<!--- need a history back here --->
<li><a href="javascript:history.back()">Go Back</a></li>

</ul>
</div>




<!--- Output the Instructor and Student Name, the Course, Major and Level if so assigned --->
<cfoutput query="getevent">
<p>&nbsp;</p>
<!--- Start the table for the headers for each column --->
<table width="955" border="1" cellpadding="1" cellspacing="0">
	        <!--- Decrption starts here --->
			<cfset decr_sname = Decrypt("#SName#","snamILIS0720")>
			<cfset decr_sidnumber = Decrypt("#SIDNumber#","sidnILIS0720")>
			<!--- Decrption finishes here --->
<tr><td colspan="8" class="left"><h3>Student: #decr_sname# -- #decr_sidnumber# -- #MajorCode# -- Level #levelname#</h3></td><td width="477" colspan="8" class="left"><h3>Instructor: #IName#</h3></td></tr>
<tr bgcolor="##ecdfdf">
	<td>Student<br />Input<br />Date</td>
	<td>Week</td>
    <td>Absence</td>
    <td>Tardiness</td>
    <td>Poor<br />
    QltyWork</td>
    <td>Missing<br />
    Work</td>
    <td>Not<br />
    Prepared</td>
    <td>Behavior</td>
    <td>Personal<br />
    Issues</td>
    <td>Financial</td>
    <td>Accounting<br />Issues</td>
    <td>Plagiarism</td>
    <td>Talked<br />to<br />
    Student</td>
    <td>Assigned<br />to</td>
    <td>Assigned<br />
    Date</td>
  </tr>
<tr>
	<td>&nbsp;#DateFormat(InputDate, "mm/dd/yy")#</td>
	<td>&nbsp;#WeekID#</td>
	<td>&nbsp;#Absence#</td>
    <td>&nbsp;#Tardiness#</td>
    <td>&nbsp;#PoorQltyWork#</td>
    <td>&nbsp;#MissingWork#</td>
    <td>&nbsp;#NotPrepared#</td>
    <td>&nbsp;#Behavior#</td>
    <td>&nbsp;#Personal#</td>
    <td>&nbsp;#Financial#</td>
    <td>&nbsp;#DrugsAlcohol#</td>
    <td>&nbsp;#Plagerism#</td>
    <td>&nbsp;#TalkedtoStudent#</td> 
    <td>&nbsp;#Assignedto#</td>
	<td>&nbsp;#DateFormat(AssignedDate,"MM/DD/YY")#</td>
  </tr>
  </table>
  <table width="955" border="1" cellpadding="1" cellspacing="0">
  <tr><td> Advisor Note:</td><td> Assigned To: </td><td> Instructor Note: </td></tr>
  <tr>
  </cfoutput>
<cfform action="advisor_process.cfm">
<!--- Advisor Note Section --->
<cfoutput query="getevent">
<td width="323"><textarea cols="46" rows="5" name="AdvisorNote" class="textsize">#AdvisorNote#</textarea></td> 
</cfoutput>
<!--- Dropdown to show current advisor or udate to new one --->
<td width="100" align="right">
 <cfselect  name="Assignedto"
                      query="getadvisors"
                      value="AName"
                      display="AName"
                      selected="#VARIABLES.Assignedto#">
      </cfselect></td>
<!--- Instructor Note Section --->
<cfoutput query="getevent">      
<td width="300" class="left">#InstructorNote#</td>
</cfoutput>
<!--- Hiddent field to updste assigned date for given ID --->	  
<cfoutput>
<input type="hidden" name="EventID" value="#getevent.eventID#" />
<input type="hidden" name="AssignedDate" value="#Dateformat(Now())#" />
</cfoutput>
</tr>
<!--- button at the bottom --->
<tr bgcolor="##cccccc"><td colspan="5" class="submit"><input type="submit" value="Update"></td></tr>
</table>
</cfform>

<div id="footer">&nbsp;<br> </div>
</div>

</body>
</html>
