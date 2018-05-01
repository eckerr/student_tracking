<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Select Path</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../main.css" rel="stylesheet" type="text/css">

</head>

<body>
<div id="wrapper">

<div id="logo">&nbsp;</div>
<div class="indentmenu">
<ul>
<li><a href="../logoff.cfm">Log Off</a></li>
<li><a href="../advisors/advisor_page.cfm">Go Back</a></li>
<li class="selected"><a href="select_reports.cfm">Academic Progress Reports</a></li>
<li><a href="eventsbyquarter/search_stats.cfm">Events by Quarter</a></li>
<li><a href="eventsbymajor/major_results.cfm">Events by Major</a></li>
<li><a href="weekly_report/weekly_report.cfm">Weekly Report</a></li>
<li><a href="../admin/adminlogon.cfm">Admin</a></li>
<li><a href="instructor_usage/instructor_usage.cfm">Instructor Usage</a></li>

</ul>
</div>
<cfform action="academic_progress_reports/confirm_print.cfm">
 <fieldset><legend> Select Weeks to Print</legend><br>
      <!--- First and Last name --->
 <p><label>Select:</label>
 <select name="weekrangeID">
  <option value="1">Weeks 1 through 3 </option>
  <option value="4">Weeks 4 through 6 </option>
  <option value="7">Weeks 7 through 9 </option>
  </select></p>
 
  <p class="submit"><label>Submit:</label>
  <input type="submit" value="print"></p>
  
  </fieldset>
  </cfform>


<div id="footer">&nbsp;<br> </div>
</div>     
</body>
</html>
