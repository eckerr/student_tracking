<CFQUERY NAME = "cIqlist" datasource="AllSchoolAudit">
SELECT coursecode, coursename, Iqu, AUDIqu FROM ClassInfo
ORDER BY coursecode
</CFQUERY>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Show Class Ideal Quarter Information</title>
</head>

<body>
<CFDUMP VAR="#ciqlist#">
</body>
</html>