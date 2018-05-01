<!--- ASEditClassRecs.cfm 
Author: Ed Kerr
Date: 10/2/11 - updated 3/6/13   3/13/13
Description: Data drill down listing page
Creates a listing of classes to edit based on prefix
called from PickCoursePre.cfm --->

<!--- point to list page--->
<CFSET list_page="ASBlankPageF.cfm">

<!--- check if url was passed--->
<cfif NOT IsDefined("URL.cP")>
	<!---not defined, sent to list page--->
    <CFLOCATION URL=#list_page#>
    </cfif>
    
<!--- get records from database ---> 
<CFSET cp2get = '#URL.cp#' >
<CFOUTPUT>
<!---cp2get = #cp2get#--->
</CFOUTPUT>

<!---select list of class recs --->
<CFQUERY NAME ="ClaList" DATASOURCE="AllSchoolAudit"
 CACHEDWITHIN="#CreateTimeSpan(0,0,1,0)#" >
SELECT CourseCode, CourseName FROM ClassInfoRecs
WHERE CoursePre = '#cp2get#'
ORDER BY CourseCode ASC
</CFQUERY>
<!--- set number of rows to display at a time --->
<CFSET RowsPerPage = 30>
<!--- initially start at first row --->
<CFPARAM NAME="URL.StartRow" DEFAULT = "1" TYPE="numeric">

<!--- get the total rows in query --->
<CFSET TotalRows = ClaList.RecordCount>
<!--- calculate number for last row --->
<CFSET EndRow = Min(URL.StartRow + RowsPerPage - 1, TotalRows)>
<!--- set the value for the next button --->
<CFSET StartRowNext = EndRow + 1>
<!---  set up back button --->
<CFSET StartRowBack = URL.StartRow - RowsPerPage>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Class Listing</title>
</head>

<body>
<!---<CFDUMP VAR=#ClaList#>--->

<CFOUTPUT>
<H3>    Choose Class to Edit 
(#URL.StartRow# thru #EndRow# of #TotalRows# Records)</H3>
<!--- row at Top of list for paging --->
<CFINCLUDE TEMPLATE="ASIncludeBackNext.cfm">
</CFOUTPUT>

<TABLE border="2"  cellpadding="20">
<CFSET colctr = 1>
<TR>
<CFLOOP QUERY="ClaList" StartRow="#URL.StartRow#" EndRow="#EndRow#">
<CFOUTPUT>

  <TD><A HREF="ASEditClassRecs_action.cfm?CC=#URLEncodedFormat(Trim(CourseCode))#"><b>#CourseCode#</b></A></TD>
  <TD>#CourseName#</TD>
  <CFSET colctr = colctr + 1>
  <CFIF colctr GT 3>
		</TR><TR>
        <CFSET colctr = 1>
  </CFIF>
        
</CFOUTPUT>
</TD>
</CFLOOP>
</TABLE>

<!--- row at bottom of list for paging --->
<CFINCLUDE TEMPLATE="ASIncludeBackNext.cfm">
<BR />
<BR />
<A HREF="ASMaint.cfm">Return to Main Menu</A>

</body>
</html>