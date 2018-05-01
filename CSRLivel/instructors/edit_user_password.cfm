<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Edit Instructor</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../main.css" rel="stylesheet" type="text/css">
</head>

<body>
<div id="wrapper">

<div id="logo">&nbsp;</div>
<div class="indentmenu">
<ul>
<li><a href="../logoff.cfm">Log Off</a></li>
<li><a href="save_event.cfm">Go Back</a></li>
</ul>
</div> 

                  
            <!--- Get the insrtuctor record --->
            <cfquery datasource="csrmain" name="getinst">
              SELECT *
              FROM Instructors
              WHERE InstructorID=#SESSION.Auth.InstructorID#
              </cfquery>
   <h3><cfoutput>
            Hi #getinst.IName# Please type in your new UserName and Password. Then logon again.
       </cfoutput></h3>
            
            <!--- Save to variables --->
            <cfset IName=Trim(getinst.IName)>
            <cfset InstructorID= Trim(getinst.InstructorID)>
            <!--- Decrption starts here --->
			<cfset IPassword= Decrypt(getinst.IPassword,"ipassILIS0720")>
			<cfset IUserName = Decrypt(getinst.IUserName,"iuserILIS0720")>
			<!--- Decrption finishes here --->
                  
            
            <!--- Form text --->
            <cfset FormTitle="Change UserName and Password">
            <cfset ButtonText="Change">
            
  

          <!--- Add/update Instructor form --->


        
    <cfform action="process_user_password.cfm">
            
    <!--- Embed primary key as a hidden field --->
    <cfoutput>
      <input type="hidden" name="InstructorID" value="#SESSION.Auth.InstructorID#">
      </cfoutput>


                      
 	<fieldset><legend><cfoutput>#FormTitle#</cfoutput></legend>
    
            

		   
           <p><label>User Name:</label>
           
              <cfinput type="Text"
                     name="IUserName"
                     value="#IUserName#"
                     message="UserName is required!"
                     required="Yes"
                     size="20"
                     maxlength="20"></p>                

            <p><label> Password:</label>
				<cfinput type="Password"
                     name="IPassword"
                     value="#IPassword#"
                     message="Password is required!"
                     required="Yes"
                     size="20"
                     maxlength="20"> </p>              
	         
        <cfoutput>
         <p class="submit"><label>Submit:</label> <input type="submit" value="#ButtonText#"></p>
          </cfoutput>

  </fieldset>
          </cfform>
            <div id="footer">&nbsp;<br> </div>
        </div>
       
</body>
</html>
