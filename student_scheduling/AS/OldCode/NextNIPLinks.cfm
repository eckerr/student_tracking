<!---
FileName: NextNIPLinks.cfm
Displays pages
--->

<!--- set up page counter --->
<CFSET ThisPage = 1>

<!--- loop thru row numbers in increments of RowsPerPage --->
<CFLOOP FROM="1" TO="#TotalRows#" STEP="#RowsPerPage#" INDEX="PageRow">
<!--- detect whether this page is currently being viewed --->
<CFSET IsCurrentPage = (PageRow GTE URL.StartRow) AND (PageRow LTE EndRow)>

<!--- if this is the current page, show without link --->
<CFIF IsCurrentPage>
<CFOUTPUT><B>#ThisPage#</B></CFOUTPUT>
<!--- otherwise, show with link so user can go to page --->
<CFELSE>
   <CFOUTPUT>
   <A HREF=#CGI.SCRIPT_NAME#?StartRow=#PageRow#">#ThisPage#</S>
   </CFOUTPUT>
   
   <!--- increment this page variable --->
   <CFSET ThisPage = ThisPage + 1>
   </CFLOOP>
   

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>
</body>
</html>