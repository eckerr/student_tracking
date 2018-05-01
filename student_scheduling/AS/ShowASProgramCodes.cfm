<CFQUERY NAME = "prlist" datasource="AllSchoolAudit">
SELECT DISTINCT MajorCode FROM PrereqInfo
ORDER BY MajorCode

</CFQUERY>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Show Program Codes</title>
</head>

<body>
<CFDUMP VAR="#prlist#">
</body>
</html>