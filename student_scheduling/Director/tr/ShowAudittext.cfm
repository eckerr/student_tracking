<!--- ShowAuditText.cfm --->

<!--- point to list page--->
<CFSET list_page="ASBlankPageF.cfm">

<!--- check if url was passed--->
<cfif NOT IsDefined("URL.Sid")>
	<!---not defined, send to list page--->
    <CFLOCATION URL=#list_page#>
    </cfif>
    
<!--- get records from database ---> 
<CFSET ATStuIdIn=#URL.Sid#>
<!---<CFOUTPUT>
URL.Sid = #URL.Sid#
</CFOUTPUT>--->
<!--- If the student ID is only 5 characters long, need to add a blank space at front--->
<CFIF Len(ATStuIdIn) EQ 5>
       <CFSET ATStuIdIn = ' ' & ATStuIdIn>
</CFIF>

<CFQUERY NAME = "atlist" datasource="AllSchoolAudit">
SELECT * FROM AuditText
WHERE StuID = '#ATStuIdIn#'
</CFQUERY>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Show AuditText Information</title>
</head>

<body>
<!---<CFDUMP VAR="#atlist#">--->
<cfoutput QUERY="atlist">
<!--- <B>Student ID = #StuID#</B><BR/>--->
<table border="3" align="center" cellspacing="1" cellpadding="20">
<tr>
<td>
 #ATXT#
 </td>
 </tr>
 </table>
 </cfoutput>
</body>
</html>