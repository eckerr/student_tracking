<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Instructor Usage</title>
<link href="../../main.css" rel="stylesheet" type="text/css" />

</head>

<cfquery datasource="csrmain" name="getYears">
SELECT DISTINCT YearStamp
FROM Events
ORDER BY YearStamp DESC
</cfquery>

<cfquery datasource="csrmain" name="getinst">
SELECT DISTINCT Events.InstructorID, IName
FROM Events, Instructors
WHERE Events.InstructorID = Instructors.InstructorID 

<!--- if this is the first time through set the quarter and year to the current quarter and year --->
<cfif NOT IsDefined("FORM.CQuarter")>
AND Qtr = #Quarter(Now())# AND yearstamp = #Year(Now())#

<!--- If the form lower down has been sent back to this page insert the selected quarter and year --->
<cfelse>
    AND Qtr = #Form.CQuarter# AND YearStamp = #Form.CYear#
</cfif>
ORDER BY IName
</cfquery>

<cfquery datasource="csrmain" name="getallinst">
SELECT InstructorID
FROM Instructors
WHERE inactive IS NULL
</cfquery>



<body>
<div id="wrapper">

<div id="logo">&nbsp;</div>
<div class="indentmenu">
<ul>
<li><a href="../../logoff.cfm">Log Off</a></li>
<li><a href="../eventsbyquarter/search_stats.cfm">Go Back</a></li>
<li><a href="../select_reports.cfm">Accademic Progress Reports</a></li>
<li><a href="../eventsbyquarter/search_stats.cfm">Events by Quarter</a></li>
<li><a href="../eventsbymajor/major_results.cfm">Events by Major</a></li>
<li><a href="../weekly_report/weekly_report.cfm">Weekly Report</a></li>
<li class="selected"><a href="instructor_usage.cfm">Instructor Usage</a></li>
</ul>
</div>
<cfform action="instructor_usage.cfm">
<table width="200" border="0" cellpadding="1" cellspacing="5">


<!--- headers --->
<tr>
  <td>Quarter</td><td>&nbsp;</td><td>Year</td></tr>
<tr>
<td>
<select name="CQuarter">
<!--- if this is the first time through set the quarter and year to the current quarter and year --->
<cfif NOT IsDefined("FORM.CQuarter")>
<cfoutput><option value="#Quarter(Now())#">#Quarter(Now())#</option></cfoutput>

<!--- If the form lower down has been sent back to this page insert the selected quarter and year --->
<cfelse>
   <cfoutput><option value="#FORM.CQuarter#">#Form.CQuarter#</option></cfoutput>
</cfif>

<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>

</select>
</td>
<td>&nbsp;</td>
<td>
<select name="CYear">
<cfif IsDefined("FORM.CQuarter")>
   <cfoutput><option value="#FORM.CYear#">#Form.CYear#</option></cfoutput>
</cfif>
<cfoutput query="getYears">
<option value="#YearStamp#">#YearStamp#</option>
</cfoutput>

</select></td>
</td> <td>&nbsp;</td><td colspan="9" class="submit"><input type="submit" value="Submit"></td>

</table>
</cfform>

<cfset useI = getinst.recordcount>
<cfset allI = getallinst.recordcount>
<cfset percent = (useI/allI)*100>

<h2><cfoutput> Number of instructors using CSR this quarter is #getinst.recordcount# which is %#DecimalFormat(percent)# of all active instructors :- </cfoutput></h2>
<cfoutput query="getinst">
#Iname#<br />
</cfoutput>


<div id="footer">&nbsp;<br> </div>
</div>
</body>
</html>
