<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Edit Advisors</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../../main.css" rel="stylesheet" type="text/css">
</head>

<body>
<div id="wrapper">

<div id="logo">&nbsp;</div>
<div class="indentmenu">
<ul>
<li><a href="../logoff.cfm">Log Off</a></li>
<li><a href="../select_advisor.cfm">Go Back</a></li>
</ul>
</div>
<h3>Edit Advisors</h3>
<div id="table_position">
          <!--- Check that AdvisorID was provided --->
          <!--- If yes, edit, else add --->
          <cfset EditMode=IsDefined("URL.AdvisorID")>

          <!--- If edit mode then get row to edit --->
          <cfif EditMode>
            
            <!--- Get the film record --->
            <cfquery datasource="csrmain" name="getadvis">
              SELECT *
              FROM Advisors
              WHERE AdvisorID=#URL.AdvisorID#
              </cfquery>
            
            <!--- Save to variables --->
            <cfset AName=Trim(getadvis.AName)>
			<cfset APassword=Decrypt(getadvis.APassword, "ipassILIS0720") >
			<cfset AUserName=Decrypt(getadvis.AUserName, "iuserILIS0720")>
                  
            
            <!--- Form text --->
            <cfset FormTitle="Update Advisor">
            <cfset ButtonText="Update">
            
  <cfelse>
            
            <!--- Save to variables --->
            <cfset AName="">
            <cfset AdvisorID= "">
			<cfset APassword= "">
			<cfset AUserName= "">
            
            
            <!--- Form text --->
            <cfset FormTitle="Add an Advisor">
            <cfset ButtonText="Add">
          </cfif>


          <!--- Add/update movie form --->


          <cfform action="process_advisors.cfm">
            
  <cfif EditMode>
    <!--- Embed primary key as a hidden field --->
    <cfoutput>
      <input type="hidden" name="AdvisorID" value="#getadvis.AdvisorID#">
      </cfoutput>
  </cfif>
            
<fieldset>
      <legend><cfoutput>#FormTitle#</cfoutput></legend>

<p> <label>Advisor Name:</label>
            <cfinput type="Text"
                     name="AName"
                     value="#AName#"
                     message="Name is required!"
                     required="Yes"
                     size="20"
                     maxlength="20"></p>                
<p><label>User Name:</label>
             
    		<cfinput type="Text"
                     name="AUserName"
                     value="#AUserName#"
                     message="UserName is required!"
                     required="Yes"
                     size="20"
                     maxlength="20"></p>
<p><label>Password:</label>
			<cfinput type="Text"
                     name="APassword"
                     value="#APassword#"
                     message="Password is required!"
                     required="Yes"
                     size="20"
                     maxlength="20"></p>               

               
        
			<cfoutput>
<p class="submit"><label>Submit</label><input type="submit" value="#ButtonText#"></p>
          	</cfoutput>
</fieldset>
          </cfform>
</div>

<div id="footer">&nbsp;<br> </div>
</div>       
</body>
</html>
