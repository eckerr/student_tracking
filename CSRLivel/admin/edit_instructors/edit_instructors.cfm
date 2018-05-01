<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Edit Instructor</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../../main.css" rel="stylesheet" type="text/css">
</head>

<body onLoad="document.edit_inst.IName.focus();">
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
            <cfset status= Trim(getinst.status)>
            <cfset IUserName=Decrypt(getinst.IUserName, "iuserILIS0720")>
			<cfset IPassword=Decrypt(getinst.IPassword, "ipassILIS0720")>
            <cfset inactive= getinst.inactive>
            
            <!--- Don't try to decrypt if the field is empty --->
            <cfif getinst.emp_ID IS "">
            <cfset emp_ID = "">
            <cfelse>
			<cfset emp_ID=Decrypt(getinst.emp_ID, "iempILIS0530")>
            </cfif>
            
            
            <cfset inactcheck = #iif(getinst.inactive is 'x', DE('Yes'), DE('No'))#>
                  
            
            <!--- Form text --->
            <cfset FormTitle="Update Instructror">
            <cfset ButtonText="Update">
            
  <cfelse>
            
            <!--- Save to variables --->
            <cfset IName="">
            <cfset InstructorID= "">
			<cfset IPassword= "">
			<cfset IUserName= "">
            <cfset status= "">
			<cfset emp_ID= "">
            <cfset inactive= "">
            <cfset inactcheck = 'No'>
            
            
            <!--- Form text --->
            <cfset FormTitle="Add an Instructor">
            <cfset ButtonText="Add">
          </cfif>


          <!--- Add/update Instructor form --->


          <cfform action="process_instructors.cfm" name="edit_inst">
            
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
                     name="Ipassword"
                     value="#Ipassword#"
                     message="Password is required!"
                     required="Yes"
                     size="20"
                     maxlength="20"></p>
                     
<p><label>Status:</label>
			<cfinput type="Text"
                     name="status"
                     value="#status#"
                     required="No"
                     size="3"
                     maxlength="3"></p>
                     
<p><label>Employee ID:</label>
			<cfinput type="Text"
                     name="emp_ID"
                     value="#emp_ID#"
                     required="No"
                     size="10"
                     maxlength="10"></p>
                     
<p><label>Inactive:</label>
			<cfinput type="Checkbox"
                     name="inactive"
                     value="x"
                     checked="#inactcheck#"></p>
        
        <cfoutput>
<p class="submit"><label>Submit:</label><input type="submit" value="#ButtonText#"></p>
          </cfoutput></div>
</fieldset>
          </cfform>
        </div>
        
 <div id="footer">&nbsp;<br> </div>
</div>
</body>
</html>
