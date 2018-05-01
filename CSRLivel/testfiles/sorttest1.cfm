<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Untitled Document</title>
</head>

<body>

  
  	<cfquery name="getstudent" datasource="csrmain">
    SELECT StudentID, SName
    FROM Students
    </cfquery>
    
<cfoutput query="getstudent">
<cfset decr_name = Decrypt(SName, "snamILIS0720")>
<cfset form.first2 =left(decr_name,2)>
<cfset form.studentID = getstudent.studentID>
<cfupdate tablename="Students" datasource="csrmain">
</cfoutput>

  	<cfquery name="getmorestudent" datasource="csrmain">
    SELECT SName, first2
    FROM Students
    </cfquery>
<table>
<cfoutput query="getmorestudent">
<cfset decr_name = Decrypt(SName, "snamILIS0720")>
<tr><td>#decr_name#</td><td>#first2#</td></tr>
</cfoutput>
</table>
</body>
</html>