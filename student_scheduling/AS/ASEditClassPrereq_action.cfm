<!--- ASEditClassPrereq_action.cfm      
processes data from ClassPrereqForm.cfm for adding or modifying AS class Prereq records

--->

<CFSET list_page = 'ASMaint.cfm'>
    <!--- check if url was passed--->
<cfif NOT IsDefined("URL.RK")>
	<!---not defined, sent to list page--->
    <CFLOCATION URL=#list_page#>
    </cfif>
    
<!--- get records from database ---> 
<CFSET Rec2Find = #URL.RK#>

<cfquery datasource="AllSchoolAudit" name="PC">
Select * From PreReqInfo
Where RecKey = #Rec2Find#
</cfquery>

<!---  If found, modify existing record --->
<CFIF PC.RecordCount IS 1>
       
	     <!---PreLoad Variables--->
           <CFSET ARecKey = #PC.RecKey#>
	       <CFSET ACourseCode = #Trim(PC.CourseCode)#>
           <CFSET AMajorCode = #Trim(PC.MajorCode)#>
           <CFSET APreReqCode = #Trim(PC.PreReqCode)#>
        
        <!--- Form Text --->
           <CFSET FormTitle = 'Update Class Prereq Info'>
           <CFSET ButtonText = 'Update'>  
           <CFSET ModifyClass = 'YES'>          
   <CFELSE>
        <!--- code is already valid, prepare new class record --->
       
        <!---    <CFSET ARecKey = #RecKey#>--->
		<CFSET ACourseCode = #Code2Find#>
        <CFSET AMajorCode = ''>
        <CFSET APreReqCode = ''>
        
        <!--- Form Text --->
          <CFSET FormTitle = 'Add a new Class PreReq'>
          <CFSET ButtonText = 'Insert'> 
          <CFSET ModifyClass = 'NO'>             	
     </CFIF>   


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Prerequisites</title>
</head>

<body>

<!--- New  or Modify ASClassPreReqInfo form --->
<FORM ACTION="ASModifyAddPrereqRec.cfm" method="POST">

<CFIF ModifyClass>
      <!--- Embed primary key in a hidden field --->
      <CFOUTPUT>
      <INPUT Type="hidden" name="RecKey" value="#PC.RecKey#">
      </CFOUTPUT>
</CFIF>

<TABLE ALIGN="center" bgcolor="#00FFFF">
<CFOUTPUT>
<!---   <TR>
     <TH colspan="2">
     <font size="+1">#FormTitle#</font>
     </TH>
   </TR>
   <TR>
       <TD>
          Course Code:
       </TD>
       <TD>
       #ACourseCode#
       <INPUT Type="hidden" name="CourseCode" value="#ACourseCode#">
        </TD>
     </TR> 
       <TR>
       <TD>
          Major Code:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="MajorCode"
          MESSAGE=" Major Code is required!"
          REQUIRED="YES"
          SIZE="4"
          MAXLENGTH="4">
        </TD>
    <!--- </TR>
       <TR>--->
       <TD>
          PreReq Course:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="PreReqCode"
          MESSAGE=""
          REQUIRED="No"
          SIZE="7"
          MAXLENGTH="7">
        </TD>
     </TR>    --->
<CFIF ModifyClass>
       <TR>
       <TD>
          Course Code:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="courseCode"
          value="#ACourseCode#"
          MESSAGE=" CourseCode is required!"
          REQUIRED="YES"
          SIZE="7"
          MAXLENGTH="7">
        </TD>
   <!---  </TR>
       <TR>--->
       <TD>
          PreReq Course:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="PreReqCode"
          value="#APreReqCode#"
          MESSAGE=""
          REQUIRED="No"
          SIZE="7"
          MAXLENGTH="7">
        </TD>
     </TR>    
 </CFIF>
     
     
     <TR>
        <TD colspan="2" align="center">
            <input type="submit" value="#ButtonText#" />
        </TD>
      </TR>
      </CFOUTPUT>
     </TABLE>   
     </FORM>       
    
</body>
</html>