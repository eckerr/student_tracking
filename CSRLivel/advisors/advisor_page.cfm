<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Advisor Page</title>
<link href="../main.css" rel="stylesheet" type="text/css" />
</head>

<!--- If instructorID is passed don't save --->
<cfif IsDefined("AuthorID")>
  <cfset WeekID =#Form.WeekID#>
  <cfparam name="Absence" default="&nbsp;">
  <cfparam name="Tardiness" default="&nbsp;">
  <cfparam name="PoorQltyWork" default="&nbsp;">
  <cfparam name="MissingWork" default="&nbsp;">
  <cfparam name="NotPrepared" default="&nbsp;">
  <cfparam name="Personal" default="&nbsp;">
  <cfparam name="Plagerism" default="&nbsp;">
  <cfparam name="InstructorNote" default="&nbsp;">
  <cfparam name="Others" default="&nbsp;">
  <cfparam name="Behavior" default="&nbsp;">
  <cfparam name="TalktoStudent" default="&nbsp;">
  <cfparam name="Financial" default="&nbsp;">
  <cfparam name="DrugsAlcohol" default="&nbsp;">
  <cfupdate datasource="csrmain" tablename="Events">
</cfif>
<!--- Get unassigned Events from the events table first time then through a Session varable subequest times. This is to enable viewing of unassigned events even after they have been assigned  --->
<cfquery datasource="csrmain" name="getevents">
SELECT *
FROM Events, Students, Instructors
WHERE Events.StudentID = Students.StudentID AND Events.InstructorID = Instructors.InstructorID AND Qtr = #Quarter(Now())# AND YearStamp = #Year(Now())# 
<!--- If a session variable is not even defined check for default 0's in the assigned list and get all the unassigned records--->
<cfif NOT IsDefined("Session.unassigned_list")>
AND assignedto = '0'

<!--- If the session variable is defined and it has some values in it then use the comma separated values to search the records --->
<cfelseif ListLen(Session.unassigned_list) NEQ 0>
AND eventID IN (#Session.unassigned_list#)
</cfif>
ORDER BY SName, InputDate DESC
</cfquery>

<!--- test to set if unassigned list has been set --->
<cfif NOT IsDefined("Session.unassigned_list") AND #getevents.RecordCount# NEQ 0>
<cfset Session.unassigned_list = ValueList(getevents.eventID)>
</cfif>

<body>
<div id="wrapper">

<div id="logo">&nbsp;</div>
<div class="indentmenu">
<ul>
<li><a href="../logoff.cfm">Log Off</a></li>
<li><a href="show_all.cfm">Show All Events</a></li>
<li><a href="search_events.cfm">Search Events</a></li>
<li><a href="../reports/select_reports.cfm">Reports</a></li>
</ul>
</div>

<!--- put out a message if there are no unassigned records --->
<!--- put out a message if there are no unassigned records --->
  <cfoutput>
    <h4>Unassigned Events - #SESSION.Auth.Aname#, Welcome to the ILIS CSR system.
    <cfif getevents.RecordCount IS 0>
    There are no unassigned records as of
    <cfelse>
   There are #getevents.recordcount# records as of
    </cfif>
    
    	<cfif SESSION.currentweek IS 0>
		a week that is not a class week
		<cfelse>
	 	Quarter: #SESSION.currentquarter#, &nbsp; Week: #SESSION.currentweek# &nbsp;&nbsp;</h4><br />
		</cfif>
      
  </cfoutput>

  

  <table width="955" border="1" cellpadding="1" cellspacing="0">
    <tr>
      <th>Instructor<br />Name</th>
      <th>Student<br />Name</th>
      <th>Student<br />Input<br />Date</th>
      <th>Week</th>
      <th>Absence</th>
      <th>Tardi<br />-ness</th>
      <th>Not<br />Prepared</th>
      <th>Missing<br />Work</th>
      <th>Poor<br />Qlty<br />Work</th>
      <th>Failed<br />Mid Term</th>
      <th>Personal<br />Issues</th>
      <th>Financial<br />Issues</th>
      <th>Behavior</th>
      <th>Plag-<br />airism</th>
      <th>Talked<br />to<br />Student</th>
      <th>Assigned<br />to</th>
      <th>Assigned<br />Date</th>
      <th>Detail</th>
    </tr>
    <cfoutput query="getevents">
      <cfif CurrentRow Mod 2 EQ 1>
	<tr bgcolor="##ecdfdf">
	<cfelse>
	<tr>
	</cfif>
        <td class="left">#IName#</td>
            <!--- Decrption starts here --->
			<cfset decr_sname = Decrypt("#SName#","snamILIS0720")>
			<!--- Decrption finishes here --->
            <!--- rearrange first and last names --->
<cfset lname = ListFirst(#decr_sname#)>
<cfset fname = ListLast(#decr_sname#)>
<cfset fullname = fname&" "&lname>
        <td class="left">#fullname#</td>
        <td>#DateFormat(InputDate, "mm/dd/yy")#</td>
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
        <cfif Assignedto IS '0'>
        <td>&nbsp;</td>
        <cfelse>
        <td class="left">&nbsp;#Assignedto#</td>
        </cfif>
        <td>&nbsp;#DateFormat(AssignedDate,"MM/DD/YY")#</td>
        <td><a href="advisor_detail.cfm?eventID=#Trim(eventid)#">[Detail]</a>&nbsp;&nbsp;<a href="advisor_update.cfm?eventID=#Trim(eventid)#">[Update]</a></td>
      </tr>
    </cfoutput>
  </table>

<div id="footer">&nbsp;<br> </div>
</div>
<!--- preload the rollover image --->
<div style="display:none"><img src="../images/grad2.png" /></div>
</body>
</html>
