<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Instructor Report</title>
<cfquery datasource="csrmain" name="getinst">
SELECT *
FROM Instructors
ORDER BY IName
</cfquery>
</head>

<body>

<table width="350" border="1" cellpadding="1" cellspacing="0">

  <!--- Add people link --->
     <tr><th>Name</th><th>Status</th><th>Employee ID</th><th>Inactive</th></tr>
  <!--- Loop through people --->
  <cfoutput query="getinst">
    <tr>
      <!--- First and Last name --->
      <td class="left">#IName#</td><td>#status#</td><td>#emp_ID#</td><td>#inactive#</td>
             
    </tr>
    </cfoutput>
  
  <tr>
          <!--- Add people link --->
    
      </tr>
</table>

</body>
</html>