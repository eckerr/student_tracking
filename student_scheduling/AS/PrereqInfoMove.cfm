<!--- PrereqInfoMove.cfm  --- this program reads the PrereqInfo database and puts the information into the classInfoRecs table for up to 5 prereqs per class --->
<CFQUERY NAME = "prlist" datasource="AllSchoolAudit">
SELECT a.MajorCode, a.CourseCode as C2Fnd, a.PrereqCode, b.RecKey AS MYRK,  b.courseCode as COut, b.NPR1, b.NPR2, b.NPR3, b.NPR4, b.NPR5 FROM PrereqInfo a, classinforecs b
WHERE a.CourseCode = b.CourseCode
ORDER BY MajorCode, a.CourseCode

</CFQUERY>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Show Prereq Information</title>
</head>

<body>
<!---<CFDUMP VAR="#prlist#">--->
<CFSET PreCourseCode = ''>
<CFSET PreRCount = 1>
<CFOUTPUT QUERY="prlist">
	<CFIF #C2Fnd# EQ #PreCourseCode#>
       <CFSET PreRCount = PreRCount + 1>
    <CFELSE>
    	<CFSET PreCourseCode = #C2Fnd#>
        <CFSET PreRCount = 1>
        ============================= <BR />
    </CFIF>
    Course #C2Fnd#  needs  #PreReqCode#  (#PreRCount#) <BR />
    <CFIF #PreRCount# EQ 1>
    	<CFSET NPR2SET = 'NPR1'>
    <CFELSEIF #PreRCount# EQ 2>  
    		<CFSET NPR2SET = 'NPR2'>
      <CFELSEIF #PreRCount# EQ 3>  
    		<CFSET NPR2SET = 'NPR3'>
        <CFELSEIF #PreRCount# EQ 4>  
    		<CFSET NPR2SET = 'NPR4'>
         <CFELSEIF #PreRCount# EQ 5>  
    		<CFSET NPR2SET = 'NPR5'>
            <CFELSE>
                 print an error message, too many prereqs
                </CFIF>
 <!---        NPR2SET = #NPR2SET#  <BR /> --->	
	
     <CFQUERY datasource="AllSchoolAudit">
   UPDATE ClassInfoRecs
   SET  #NPR2SET# = '#PreReqCode#'
    WHERE RecKey=#MYRK#
    </CFQUERY>        

 
</CFOUTPUT>
</body>
</html>