<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>admin_logon</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../main.css" rel="stylesheet" type="text/css">
</head>

<body>
<div id="wrapper">

<div id="logo">&nbsp;</div>
<div class="indentmenu">
<ul>
<li><a href="../logoff.cfm">Log Off</a></li>
<li><a href="../reports/select_reports.cfm">Go Back</a></li>
<cfif IsDefined("Form.UserLogin")>
  <cfif '#Form.UserLogin#' EQ 'dreamcatcher' AND '#Form.Userpassword#' EQ 'student'>
  <cflocation url="select_path.cfm" addtoken="no">
  <cfelseif '#Form.UserLogin#' EQ 'change' AND '#Form.Userpassword#' EQ 'passwords'>
  <cflocation url="select_advisor.cfm" addtoken="no">
    <cfelse>
 <li><a href="#"> Your User Name or Password did not match - Please try again</a></li>
 
  </cfif>
</cfif>
</ul>
</div>

          <!--- Place cursor in "User Name" field when page loads--->
          <body onLoad="document.SingleFormLogin.UserLogin.focus();">

          <!--- Start our Login Form --->
          <cfform action="adminlogon.cfm" name="SingleFormLogin" method="POST">
          <fieldset><legend>Admin Login</legend>
            <!--- Make the UserLogin and UserPassword fields required --->
            <input type="Hidden" name="UserLogin_required">
            <input type="Hidden" name="UserPassword_required">
            <!--- Use an HTML table for simple formatting --->
<p><label>Username:</label>		
		
         <!--- Text field for "User Name" --->
        <cfinput 
        type="Text"
        name="UserLogin"
        size="21"
        value=""
        maxlength="100"
        required="Yes"
        message="Please type your Username first."></p> 

 <p><label>Password:</label> 
          <!--- Text field for Password --->
          <cfinput 
        type="Password"
        name="UserPassword"
        size="12"
        value=""
        maxlength="100"
        required="Yes"
        message="Please type your Password first."></p>
        
          <!--- Submit Button that reads "Enter" --->
<p class="submit"><label>Submit:</label>   <input type="Submit" value="Enter"></p>
</fieldset>
            </cfform>
<div id="footer">&nbsp;<br> </div>
</div>     
</body>
</html>
