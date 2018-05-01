<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Logoff Page</title>

<link href="main.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div id="wrapper">
<div id="logo">&nbsp;</div>
<div class="indentmenu">
<ul>

</ul>
</div>

 <CFAPPLICATION NAME="csrmain" 
  SESSIONMANAGEMENT="Yes" 
  SESSIONTIMEOUT="#CreateTimeSpan(0,0,0,0)#"> 
  
 <h3>Thank you, You have been logged off the CSR system</h3>
 
 <meta http-equiv="REFRESH" content="2; url=LoginForm.cfm">
 
 <div id="footer">&nbsp;<br></div>
 <cfabort>
 </div> 
</body>
</html>
