<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Advisor Page</title>
<link href="../main.css" rel="stylesheet" type="text/css" />
</head>

<cfquery datasource="csrmain" name="getevents">
SELECT *
FROM Events, Students, Instructors
WHERE Events.StudentID = Students.StudentID AND Events.InstructorID = Instructors.InstructorID AND Qtr = #Quarter(Now())# AND YearStamp = #Year(Now())#
ORDER BY SName, InputDate DESC
</cfquery>
<body>
<div id="wrapper">

<div id="logo">&nbsp;</div>
<div class="indentmenu">
<ul>
<li><a href="../logoff.cfm">Log Off</a></li>
<li><a href="advisor_page.cfm">Show Unassigned</a></li>
<li><a href="search_events.cfm">Search Events</a></li>
<li><a href="../reports/select_reports.cfm">Reports</a></li>

</ul>
</div>

   <cfoutput>
    <h4>All Events - #SESSION.Auth.Aname#, Welcome to the ILIS CSR system.
    <cfif getevents.RecordCount IS 0>
    There are no unassigned records as of
    <cfelse>
    There are #getevents.recordcount# records as of
    </cfif>
    
    	<cfif SESSION.currentweek IS 0>
		a week that is not a class week
		<cfelse>
	 	Quarter: #SESSION.currentquarter#, &nbsp; Week: #SESSION.currentweek# &nbsp;&nbsp;  </h4><br />
		</cfif>
      
  </cfoutput>
  </table>
  <table width="955" border="1" cellpadding="1" cellspacing="0">
    <tr>
      <th>
        Instructor<br />
        Name</th>
      <th>Student<br />
        Name</th>
      <th>Student<br />
        Input<br />
        Date</th>
      <th><div align="center">Week</div></th>
      <th><div align="center">Absence</div></th>
      <th><div align="center">Tardi<br />
          -ness</div></th>
      <th><div align="center">Not<br />
          Prepared</div></th>
      <th><div align="center">Missing<br />
          Work</div></th>
      <th><div align="center">Poor<br />
          Qlty<br />
          Work</div></th>
      <th><div align="center">Failed<br />Mid Term</div></th>
      <th><div align="center">Personal<br />Issues</div></th>
      <th><div align="center">Financial<br />Issues</div></th>
      <th><div align="center">Behavior</div></th>
      <th><div align="center">Plag-<br />
          airism</div></th>
      <th><div align="center">Talked<br />to<br />Student</div></th>
      <th><div align="center">Assigned<br />
          to</div></th>
      <th><div align="center">Assigned<br />
          Date</div></th>
      <th><div align="center">Detail</div></th>
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
</body>
</html>
