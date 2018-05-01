

<!---update --->
<cfif IsDefined("FORM.InstructorID")>
<!--- Begin Encrypt Code --->
<cfset Form.IUserName = Encrypt("#IUserName#", "iuserILIS0720")>
<cfset Form.IPassword = Encrypt("#IPassword#", "ipassILIS0720")>
<!--- End Encrypt code --->
    <!--- Update Instrustor UserName and Password --->
    <cfupdate datasource="csrmain" tablename="Instructors">
</cfif>

<!--- When done log off so users can logon with their new password --->
<cflocation url="../logoff.cfm" addtoken="no">
