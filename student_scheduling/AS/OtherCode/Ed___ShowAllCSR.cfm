<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<!--- get records from database ---> 
<CFQUERY NAME = "classes" datasource="EdSOS">
SELECT * FROM Classes
</CFQUERY>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Data Retrieval</title>
</head>

<body>
<H1> List of Classes to Take </H1>

<cfdump var="#classes#">

<!--- Display classes to be taken --->
<cfoutput query="classes">

#courseCode#<br />
</cfoutput>

</body>
</html>