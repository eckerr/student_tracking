<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Pick Major</title>
</head>

<!--- program we are passing this info to --->


<CFSET mID = 'BAP' >

<cfset this.datasource = "AllSchoolAudit">
	
    
		<cfquery datasource="#this.datasource#" NAME="mlist">
		SELECT MajorCode, MajorName FROM ProgramInfo
        	WHERE ProgramCode = 'UNDG'
            ORDER BY MajorName
        </cfquery>
        <BR />
        <center> <B> Select Major </B></center>
        <BR />
<TABLE border="2" bordercolor="#333333" cols="3" cellpadding="2"  cellspacing="5" align="center">
<CFSET colctr = 1> 
 <TR>         	
<CFOUTPUT QUERY="mlist">
 
  	<TD>
    <!---<button type="button" onclick="Alert">#majorCode#</button>--->
    <A HREF="ShowASClassesInMajor.cfm?mID=#URLEncodedFormat(Trim(majorCode))#"><b>#majorCode#</b></A>
    </TD>
    <TD>
    	#majorName#
     </TD>
     <TD></TD>
     <CFSET colctr = colctr + 1>
     <CFIF colctr GT 2>
          <CFSET colctr = 1>
   		  </TR><TR>
     </CFIF>
  
</CFOUTPUT>		

<body>
</body>
</html>