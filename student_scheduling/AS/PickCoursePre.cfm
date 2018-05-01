<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Pick Course Prefix</title>
</head>

<!--- program we are passing this info to --->


<CFSET p2run = 'ASEditClassRecs.cfm' >

<cfset this.datasource = "AllSchoolAudit">
	
    
		<cfquery datasource="#this.datasource#" NAME="mlist">
		SELECT DISTINCT CoursePre FROM ClassInfoRecs
  
        </cfquery>
         <!---<CFDUMP VAR="#mlist#">--->
        <BR />
        <center> <B> Select Course Prefix </B></center>
        <BR />
<TABLE border="2" bordercolor="#333333" cols="3"  cellpadding="10"  cellspacing="10" align="center">
<CFSET colctr = 1> 
 <TR>         	
<CFOUTPUT QUERY="mlist">
 
  	<TD>
    <!---<button type="button" onclick="Alert">#majorCode#</button>--->
    <A HREF="#p2run#?cP=#URLEncodedFormat(Trim(coursePre))#"><b>   #coursePre#   </b></A>
    </TD>

     <CFSET colctr = colctr + 1>
     <CFIF colctr GT 7>
          <CFSET colctr = 1>
   		  </TR><TR>
     </CFIF>
</CFOUTPUT>	
</TABLE>	

<body>
</body>
</html>