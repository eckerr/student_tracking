<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Show Instructors</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../../main.css" rel="stylesheet" type="text/css">

</head>

<cfquery datasource="csrmain" name="getinst">
SELECT *
FROM Instructors
ORDER BY IName
</cfquery>

<body>
<div id="wrapper">

<div id="logo">&nbsp;</div>
<div class="indentmenu">
<ul>
<li><a href="../../logoff.cfm">Log Off</a></li>
<li><a href="../select_advisor.cfm">Go Back</a></li>
<li><a href="../select_advisor.cfm">Show Advisors</a></li>
<li class="selected"><a href="show_instructors.cfm">Show Instructors</a></li>

</ul>
</div>
<h3>Show Instructors</h3>
<div id="table_position">


<table width="350" border="0" cellpadding="0" cellspacing="0" rules="all">

  <!--- Add people link --->
 <td colspan="3"><a href="edit_instructors.cfm">[Add]</a></td>
      </tr>
  <!--- Loop through people --->
  <cfoutput query="getinst">
    <tr>
      <!--- First and Last name --->
      <td class="left">#IName#</div></td>
              <!--- Edit link --->
      <td><a href="edit_instructors.cfm?InstructorID=#InstructorID#">[Edit]</a></td>
          </tr>
    </cfoutput>
  
  <tr>
          <!--- Add people link --->
    <td colspan="3"><a href="edit_instructors.cfm">[Add]</a></td>
      </tr>
</table>
</div>

<div id="footer">&nbsp;<br> </div>
</div> 
</body>
</html>
