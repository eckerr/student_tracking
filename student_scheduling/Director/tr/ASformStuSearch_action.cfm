<!--- ASformStuSearch_action.cfm  --->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Process Student Search</title>
</head>

<body>
<CFIF IsNumeric(#FORM.StudentID#)>
      <CFLOCATION URL = "ASEdFrames.cfm?Sid=#FORM.StudentID#">
   <CFELSE>
      <CFLOCATION URL = "ASFindStudentNames.cfm?Nam=#FORM.StudentID#">
   </CFIF>

</body>
</html>