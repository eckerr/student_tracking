<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Show S Students</title>
<link href="../../main.css" rel="stylesheet" type="text/css" />
</head>
<!--- get all s students  --->
<cfquery datasource="csrmain" name="getses">
SELECT *
FROM Students, Levels
WHERE Students.LevelID = Levels.LevelID AND Students.LevelID IN (4,5,6)
ORDER BY LevelName
</cfquery>

<body>
<div id="wrapper">

<div id="logo">&nbsp;</div>
<div class="indentmenu">
<ul>
<li><a href="../logoff.cfm">Log Off</a></li>
<li><a href="../edit_students/show_students.cfm">Go Back</a></li>
<li><a href="process_S.cfm">Update S Levels</a></li>
</ul>
</div>

<h3>Show S level Students</h3>

<div id="table_position">
<table width="500" align="center" rules="all">
<cfoutput query="getses">
<tr>
	<!--- Decrption starts here --->
	<cfset decr_sname = Decrypt("#SName#","snamILIS0720")>
	<!--- Decrption finishes here --->
<td width="75" class="left">#decr_sname#</td><td width="75">#LevelName#</td>
</tr>
</cfoutput>
</table>
</div>

<div id="footer">&nbsp;<br> </div>
</div>
</body>
</html>