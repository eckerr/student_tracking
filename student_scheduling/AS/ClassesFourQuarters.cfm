<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Classes needed next two quarters</title>
</head>

<body>
<CFQUERY NAME="FourBy" DATASOURCE="StudentsAudit">
SELECT * FROM fourquartertemp JOIN fourquartertemp2 
</CFQUERY>
<cfdump VAR="#FourBy#">

</body>
</html>