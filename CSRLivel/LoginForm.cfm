<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>CSR Log In Page</title>

<link href="main.css" rel="stylesheet" type="text/css">

</head>
<!--- Work out the week and quarter --->
<cfoutput>
<cfset weeknum = Week(Now())>

<cfif weeknum GTE 2 AND weeknum LTE 12>
<cfset currentweek = weeknum - 2>

<cfelseif weeknum GTE 14 AND weeknum LTE 24>
<cfset currentweek = weeknum - 13>

<cfelseif weeknum GTE 28 AND weeknum LTE 38>
<cfset currentweek = weeknum - 27>

<cfelseif weeknum GTE 40 AND weeknum LTE 51>
<cfset currentweek = weeknum - 40>

<cfelse>

<cfset currentweek = 0>
</cfif>

<cfset currentquarter = Quarter(Now())>

</cfoutput>

<!--- If the user is now submitting "Login" form, --->
<!--- Include "Login Check" code to validate user --->
<cfif IsDefined("Form.csrUserLogin")> 
  <cfinclude template="LoginCheck.cfm">
</cfif>
<!--- Place cursor in "User Name" field when page loads--->
<body onLoad="document.LoginForm.csrUserLogin.focus();">

<div id="wrapper">

<div id="logo">&nbsp;</div>

<div class="indentmenu">

<ul>
<cfif IsDefined("URL.nomatchtoken")>
<li><a href="#">Your UserName or Password did not match. Please try again</a></li>
<cfelse>
<li><a href="#">Please Log In</a></li>
</cfif>
</ul>
</div>

<!--- Start our Login Form --->
<cfform action="#CGI.SCRIPT_NAME#" name="LoginForm" method="POST">
<fieldset><legend>UserName & Password</legend>

  <!--- Make the UserLogin and UserPassword fields required --->
  <input type="Hidden" name="csrUserLogin_required">
  <input type="Hidden" name="csrUserPassword_required">
  <!--- Pass the week and qaurter fields to the LoginCheck page --->
  <cfoutput>
  <input type="Hidden" name="currentweek" value="#currentweek#">
  <input type="Hidden" name="currentquarter" value="#currentquarter#">
  </cfoutput>

		<!--- Text field for "User Name" ---> 
     <p><label>Username:</label>
    	<cfinput
        type="Text"
        name="csrUserLogin"
        size="21"
        value=""
        maxlength="100"
        required="Yes"
        message="Please type your Username first."></p>
        
  		<!--- Text field for Password ---> 
      <p><label>Password:</label>  
        <cfinput
        type="Password"
        name="csrUserPassword"
        size="12"
        value=""
        maxlength="100"
        required="Yes"
        message="Please type your Password first."></p>

      <!--- Submit Button that reads "Enter" --->  
     <p class="submit"><label>Submit:</label> <input type="Submit" value="Submit"></p>
     <p>&nbsp;</p>
  </fieldset>
</cfform>
<div id="footer" style="margin-top: 250px">&nbsp;<br> </div>
</div>
</body>
</html>
