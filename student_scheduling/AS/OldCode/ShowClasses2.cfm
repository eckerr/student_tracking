<!--- get records from database ---> 
<CFQUERY NAME = "classes" datasource="StudentsAudit">
SELECT courseCode, StuId, FlagDone FROM AuditRecs
WHERE StuId = '111111'
ORDER BY StuId, FlagDone, courseCode
</CFQUERY>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Data Retrieval</title>
</head>

<body>
<H1> List of Classes to Take </H1>

<!--- Display classes to be taken --->
<cfoutput query="classes">
#StuId# xxx #courseCode#    #FlagDone# <br />
</cfoutput>

</body>
</html>