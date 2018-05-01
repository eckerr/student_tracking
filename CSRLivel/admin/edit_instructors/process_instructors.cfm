<!--- set the value for the checkbox --->

<cfif NOT isDefined("Form.inactive")>
<cfset Form.inactive = "">
</cfif>

<!--- Begin Encrypt Code --->
<cfset Form.IUserName= Encrypt("#Form.IUserName#", "iuserILIS0720")>
<cfset Form.IPassword = Encrypt("#Form.IPassword#", "ipassILIS0720")>
<cfif Form.emp_ID  NEQ "">
<cfset Form.emp_ID = Encrypt("#Form.emp_ID#", "iempILIS0530")>
</cfif>
<!--- End Encrypt code --->

<!--- Edit or update? --->
<cfif IsDefined("FORM.InstructorID")>
    <!--- Update movie --->
    <cfupdate datasource="csrmain" tablename="Instructors">
<cfelse>
    <!--- Add movie --->
    <cfinsert datasource="csrmain" tablename="Instructors">
</cfif>

<!--- When done go back to movie list --->
<cflocation url="show_instructors.cfm" addtoken="no">
