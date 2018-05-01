<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Assign Advisors</title>
<link href="../main.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="wrapper">

<div id="logo">&nbsp;</div>
<div class="indentmenu">
<ul>
<li><a href="../logoff.cfm">Log Off</a></li>
<li><a href="../admin/select_path.cfm">Go Back</a></li>
</ul>
</div>

<!--- Get all records where there are any unassigned events. 0 is added as a default in the db --->
<cfquery datasource="csrmain" name="getevents">
SELECT *
FROM Events
WHERE Qtr = #Quarter(Now())# AND YearStamp = #Year(Now())# AND assignedto = '0'
</cfquery>


<!--- if there are no records with a 0 in the assigned to column then put out a message --->
<cfif getevents.RecordCount EQ 0>
<h3>There are no Events with Unassigned Advisors</h3>
<cfelse>

<!--- If there are unassigned records loop through each record to find the majorID (held in the student table) and find the advisor for that major --->
<cfoutput query="getevents">
<cfquery datasource="csrmain" name="getmajor">
SELECT *
FROM Students, Majors, Advisors 
WHERE #getevents.StudentID# = Students.StudentID AND Students.MajorID = Majors.MajorID AND Majors.AdvisorID = Advisors.AdvisorID
</cfquery>

<!--- For each records in the unassigned list set the eventID, assignmedto and assigneddate fields to new values---> 
<cfset FORM.eventID = getevents.eventID>
<cfset FORM.assignedto = getmajor.AName>
<cfset FORM.AssignedDate = #DateFormat(Now(), "MM/DD/YY")#>
<cfupdate datasource="csrmain" tablename="events">
</cfoutput>


<!--- Show which records were updated --->
<h3>The following records were updated</h3>
<table width="300" border="1" cellspacing="0" cellpadding="3">
<tr><th>Student</th><th>Advisor</th></tr>
<!--- use the original serch selection but get the updated information from the events table --->
<cfoutput query="getevents">
<cfquery datasource="csrmain" name="getupdatedevents">
SELECT SName, Assignedto
FROM Events, Students
WHERE #getevents.eventID# = Events.EventID AND #getevents.StudentID# = Students.StudentID
</cfquery>
<cfset decr_sname=Decrypt(#getupdatedevents.SName#, "snamILIS0720")>
<tr><td>#decr_sname#</td><td>#getupdatedevents.assignedto#</td></tr>
</cfoutput>
</table>
</cfif>

<div id="footer">&nbsp;<br> </div>
</div>
</body>
</html>
