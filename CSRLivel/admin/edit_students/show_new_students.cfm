<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Show New Students</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../../main.css" rel="stylesheet" type="text/css">

</head>

<body>
<div id="toplogo">&nbsp;</div>
<cfquery datasource="csrmain" name="getstudents">
SELECT *
FROM Students
WHERE Scodecurrent = '000' OR Scodenext = '000'
ORDER BY first2
</cfquery>

<!--- Page header --->

<table width="500" align="center">
<tr><td colspan="3"align="center"><a href="../../advisors/advisor_page.cfm">[Back to Search Page]</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="../select_path.cfm">[Back to Select Page]</a>
&nbsp;&nbsp;&nbsp;&nbsp;<a href="student_download2.cfm">[Download Students]</a></td>
  </tr>
  </table>
  <table width="300" align="center">
  <tr height="10"><td></td></tr>
  <!--- Add people link --->
 <td colspan="2" align="center">&nbsp;</td>
      </tr>
  <!--- Loop through people --->
  <cfoutput query="getstudents">
  
  <!--- Decrption starts here --->
			<cfset decr_sname = Decrypt("#SName#","snamILIS0720")>
			<!--- Decrption finishes here --->
    <tr>
      <!--- First and Last name --->
      <td><div id="whitelink">#decr_sname#</div></td>
              <!--- Edit link --->
      <td><a href="edit_students.cfm?StudentID=#StudentID#">[Edit]</a></td>
              <!--- Delete link --->
      <td><a href="confirm_delete_students.cfm?StudentID=#StudentID#">[Delete]</a></td>
          </tr>
    </cfoutput>
  
  <tr>
          <!--- Add people link --->
    <td colspan="2" align="center">&nbsp;</td>
      </tr>
</table>
        
</body>
</html>
