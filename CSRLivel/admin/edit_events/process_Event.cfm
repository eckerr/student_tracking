<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Process Event</title>
</head>
<cfset thisDataSource = "CSRMain"/>
<body>
<!--- Update only if passed an eventID --->
<cfif IsDefined("FORM.EventID")>
    <!--- Update Event --->
    <cfupdate datasource="#thisDataSource#" tablename="Events">
</cfif>

<!--- When done go back calling program --->
<cflocation url="show_Events.cfm" addtoken="no">

</body>
</html>