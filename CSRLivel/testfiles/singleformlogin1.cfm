<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Single Form Login</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body onLoad="document.singleformlogin2.UserLogin.focus();">
<div id="toplogo">&nbsp;</div>
  <cfif IsDefined("Form.UserLogin")>
  <cfif '#Form.UserLogin#' EQ 'wdim401' AND '#Form.Userpassword#' EQ '12345'>
  <cflocation url="http://www.amazon.com">
  <cfelse>
  <center>Your User Name or Password did not match - Please try again</center>
  </cfif>
          </cfif>

          <!--- Place cursor in "User Name" field when page loads--->
          <body onLoad="document.singleformlogin1.UserLogin.focus();">

          <!--- Start our Login Form --->
		<center>
          <cfform action="../singleformlogim1.cfm" name="SingleFormLogin" method="POST">
            <!--- Make the UserLogin and UserPassword fields required --->
            <input type="Hidden" name="UserLogin_required">
            <input type="Hidden" name="UserPassword_required">
            <!--- Use an HTML table for simple formatting --->
            
            <table border="0" align="center">
             <tr>
                <th colspan="2" bgcolor="Silver">Admin Log In</th>
      		</tr>
             <tr> 
                <th>Username:</th>		
		
        <td>
          <!--- Text field for "User Name" --->
        <cfinput 
        type="Text"
        name="UserLogin"
        size="21"
        value=""
        maxlength="100"
        required="Yes"
        message="Please type your Username first."> 
		</td>
		</tr>
       <tr>
                <th>Password:</th>
       
	   <td> 
          <!--- Text field for Password --->
          <cfinput 
        type="Password"
        name="UserPassword"
        size="12"
        value=""
        maxlength="100"
        required="Yes"
        message="Please type your Password first."> 
          <!--- Submit Button that reads "Enter" --->
          <input type="Submit" value="Enter">
		</td>
            
        
      </tr>
              </table>
            </cfform><center>
</body>
</html>
