<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Select Path</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../main.css" rel="stylesheet" type="text/css">

</head>

<cfquery datasource="csrmain" name="getadvis">
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
<li><a href="../reports/select_reports.cfm">Go Back</a></li>
<li class="selected"><a href="change_passwords/show_advisors.cfm">Show Advisors</a></li>
<li><a href="change_passwords/show_instructors.cfm">Show Instructors</a></li>

</ul>
</div>
<h3>Show Advisors</h3>
<div id="table_position">
<table width="350" border="0" cellpadding="0" cellspacing="0" rules="all">

	<tr>
          <!--- Add people link --->
    <td colspan="3"><a href="change_passwords/edit_advisors.cfm">[Add]</a></td>
      </tr>
  <!--- Loop through people --->
  <cfoutput query="getadvis">
    <tr>
      <!--- First and Last name --->
      <td class="left">#AName#</div></td>
              <!--- Edit link --->
      <td><a href="change_passwords/edit_advisors.cfm?AdvisorID=#AdvisorID#">[Edit]</a></td>
             
      
          </tr>
    </cfoutput>
  
  <tr>
          <!--- Add people link --->
    <td colspan="3"><a href="change_passwords/edit_advisors.cfm">[Add]</a></td>
      </tr>
</table>
</div>

<div id="footer">&nbsp;<br> </div>
</div>       
</body>
</html>
