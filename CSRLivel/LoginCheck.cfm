<!--- 
  Filename:     LoginCheck.cfm
  Created by:   Terry Lunn
  Purpose:      Validates a user's password entries
  Please Note:  Included by LoginForm.cfm
--->


<!--- Make sure we have Login name and Password --->
<cfparam name="Form.csrUserLogin" type="string">
<cfparam name="Form.csrUserPassword" type="string">
<cfparam name="Form.currentweek" type="string">
<cfparam name="Form.currentquarter" type="string">
<cfset errormess=0>
<!--- Find record with this Username/Password --->
<!--- If no rows returned, password not valid --->

<!--- Encryption starts here --->
<cfset Form.csrUserLogin = Encrypt("#Form.csrUserLogin#","iuserILIS0720")>
<cfset Form.csrUserPassword = Encrypt("#Form.csrUserPassword#","ipassILIS0720")>
<!--- Encryption finishes here --->

<cfquery name="GetInstructor" datasource="csrmain">
  SELECT InstructorID, IName
  FROM Instructors
  WHERE IUserName    = '#Form.csrUserLogin#'
    AND IPassword = '#Form.csrUserPassword#'
</cfquery>

<!--- If the Instuctor username and password are correct --->
<cfif GetInstructor.RecordCount EQ  1>
  <!--- Remember user's logged-in status, plus --->
  <!--- ContactID and First Name, in structure --->
  <cflock scope="Session" type="ReadOnly" timeout=60>
  <cfset SESSION.Auth = StructNew()>
  <cfset SESSION.Auth.IsLoggedIn = "Yes">
  <cfset SESSION.Auth.InstructorID  = GetInstructor.InstructorID>
  <cfset SESSION.Auth.IName  = GetInstructor.IName>
  <cfset SESSION.currentweek  = FORM.currentweek>
  <cfset SESSION.currentquarter  = FORM.currentquarter>
</cflock>
  <!--- Now that user is logged in, send them --->
  <!--- to whatever page makes sense to start --->
  <cflocation url="instructors/save_event.cfm" addtoken="no">
  <cfelse>
  <!--- If this is not and Instructor check is it's an Advisor --->
  <cfquery name="GetAdvisor" datasource="csrmain">
  SELECT AdvisorID, AName
  FROM Advisors
  WHERE AUserName    = '#Form.csrUserLogin#'
  AND APassword = '#Form.csrUserPassword#'
  </cfquery>
	<!--- If the Advisor username and password are correct --->
  <cfif GetAdvisor.RecordCount EQ  1>
  <!--- Remember user's logged-in status, plus --->
  <!--- ContactID and First Name, in structure --->
  <cflock scope="Session" type="ReadOnly" timeout=60>
  <cfset SESSION.Auth = StructNew()>
  <cfset SESSION.Auth.IsLoggedIn = "Yes">
  <cfset SESSION.Auth.AdvisorID  = GetAdvisor.AdvisorID>
  <cfset SESSION.Auth.AName  = GetAdvisor.AName>
  <cfset SESSION.currentweek  = FORM.currentweek>
  <cfset SESSION.currentquarter  = FORM.currentquarter>
  </cflock>
   <!--- Now that user is logged in, send them --->
  <!--- to whatever page makes sense to start --->
  <cflocation url="advisors/advisor_page.cfm" addtoken="no"> 
  </cfif>
</cfif>
<cflocation url="LoginForm.cfm?nomatchtoken=1" addtoken="no">