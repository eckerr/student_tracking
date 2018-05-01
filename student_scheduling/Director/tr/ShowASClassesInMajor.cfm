
<!--- point to list page--->
<CFSET list_page="ASBlankPageF.cfm">

<!--- check if url was passed--->
<cfif NOT IsDefined("URL.mID")>
	<!---not defined, sent to list page--->
    <CFLOCATION URL=#list_page#>
    </cfif>
    
<!--- get records from database ---> 
<CFSET IQuSet = '#URL.mID#IQU' >
<CFOUTPUT>
<!---IQuSet = #IQuSet#--->
</CFOUTPUT>

<CFQUERY NAME = "clist" datasource="AllSchoolAudit">
SELECT CourseCode, CourseName, #IQuSet# FROM ClassInfoRecs
WHERE #IQuSet# > 0 AND NOT CoursePre = 'GEN' AND NOT CoursePre = 'GEL'
ORDER BY #IQuSet#

</CFQUERY>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Show Classes in Major Information</title>
</head>

<body>
<CFDUMP VAR="#clist#">
</body>
</html>