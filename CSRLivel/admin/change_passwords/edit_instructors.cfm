<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Edit Instructor</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../../main.css" rel="stylesheet" type="text/css">
</head>

<body>
<div id="wrapper">

<div id="logo">&nbsp;</div>
<div class="indentmenu">
<ul>
<li><a href="../../logoff.cfm">Log Off</a></li>
<li><a href="show_instructors.cfm">Go Back</a></li>
</ul>
</div>
<h3>Edit Instructors</h3>
<div id="table_position">

          <!--- Check that InstructorID was provided --->
          <!--- If yes, edit, else add --->
          <cfset EditMode=IsDefined("URL.InstructorID")>

          <!--- If edit mode then get row to edit --->
          <cfif EditMode>
            
            <!--- Get the film record --->
            <cfquery datasource="csrmain" name="getinst">
              SELECT *
              FROM Instructors
              WHERE InstructorID=#URL.InstructorID#
              </cfquery>
            
            <!--- Save to variables --->
            <cfset IName=Trim(getinst.IName)>
            <cfset InstructorID= Trim(getinst.InstructorID)>
            <cfset IUserName=Decrypt(getinst.IUserName, "iuserILIS0720")>
			<cfset IPassword=Decrypt(getinst.IPassword, "ipassILIS0720")>
			
                  
            
            <!--- Form text --->
            <cfset FormTitle="Update Instructror">
            <cfset ButtonText="Update">
            
  <cfelse>
            
            <!--- Save to variables --->
            <cfset IName="">
            <cfset InstructorID= "">
			<cfset IPassword= "">
			<cfset IUserName= "">
            
            
            <!--- Form text --->
            <cfset FormTitle="Add an Instructor">
            <cfset ButtonText="Add">
          </cfif>


          <!--- Add/update Instructor form --->


          <cfform action="process_instructors.cfm">
            
  <cfif EditMode>
    <!--- Embed primary key as a hidden field --->
    <cfoutput>
      <input type="hidden" name="InstructorID" value="#getinst.InstructorID#">
      </cfoutput>
  </cfif>
            
<fieldset><legend><cfoutput>#FormTitle#</cfoutput></legend>
<p><label>Instructor Name:</label>
              <cfinput type="Text"
                     name="IName"
                     value="#IName#"
                     message="Name is required!"
                     required="Yes"
                     size="20"
                     maxlength="20"></p>
                                     
<p><label>User Name:</label>
			<cfinput type="Text"
                     name="IUserName"
                     value="#IUserName#"
                     message="UserName is required!"
                     required="Yes"
                     size="20"
                     maxlength="20"></p>
                     
<p><label>Password:</label>
			<cfinput type="Text"
                     name="IPassword"
                     value="#IPassword#"
                     message="Password is required!"
                     required="Yes"
                     size="20"
                     maxlength="20"></p>
        
        <cfoutput>
<p class="submit"><label>Submit:</label><input type="submit" value="#ButtonText#"></p>
          </cfoutput></div></td>
</fieldset>
          </cfform>
        </div>
        
 <div id="footer">&nbsp;<br> </div>
</div>
</body>
</html>
