<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Edit Majors</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../../main.css" rel="stylesheet" type="text/css">
</head>

<body>
<div id="wrapper">

<div id="logo">&nbsp;</div>
<div class="indentmenu">
<ul>
<li><a href="../../logoff.cfm">Log Off</a></li>
<li><a href="show_majors.cfm">Go Back</a></li>
</ul>
</div>
<h3>Confirm Deletion</h3>

          <!--- Check that AdvisorID was provided --->
          <!--- If yes, edit, else add --->
          <cfset EditMode=IsDefined("URL.MajorID")>

          <!--- If edit mode then get row to edit --->
          <cfif EditMode>
            
            <!--- Get the film record --->
            <cfquery datasource="csrmain" name="getmajors">
              SELECT *
              FROM Majors
              WHERE MajorID=#URL.MajorID#
              </cfquery>
            
            <!--- Save to variables --->
            <cfset MajorCode=Trim(getmajors.MajorCode)>
            <cfset MajorName= Trim(getmajors.MajorName)>

                  
            
            <!--- Form text --->
            <cfset FormTitle="Update Major">
            <cfset ButtonText="Update">
            
  <cfelse>
            
            <!--- Save to variables --->
            <cfset MajorCode="">
            <cfset MajorName="">
            
            
            <!--- Form text --->
            <cfset FormTitle="Add a Major">
            <cfset ButtonText="Add">
          </cfif>


          <!--- Add/update movie form --->


          <cfform action="delete_majors.cfm">
            
  <cfif EditMode>
    <!--- Embed primary key as a hidden field --->
    <cfoutput>
      <input type="hidden" name="MajorID" value="#getmajors.MajorID#">
      </cfoutput>
  </cfif>
<fieldset><legend>Confirm Delete</legend>
          
<p><label>Major Code:</label>
  			<cfinput type="Text"
                     name="MajorCode"
                     value="#MajorCode#"
                     message="Code is required!"
                     required="Yes"
                     size="20"
                     maxlength="20"></p>               

<p class="submit"><label>Sumbit:</label><input type="submit" value="Confirm Deletion"></p>
</fieldset>
 </cfform>
          
 <div id="footer">&nbsp;<br> </div>
</div>
</body>
</html>
