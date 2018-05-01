<!--- ASformClassCode_action.cfm 
processes data from ASClassCodeForm.cfm for adding or modifying AS class info records

--->

<CFSET list_page = 'ASMaint.cfm'>
<!--- check to make sure classpre and classNum exist --->
<CFSET ClassPreExists = IsDefined("Form.ClassCode")>
<CFSET ClassNumExists = IsDefined("Form.ClassNum")>
    <CFIF len(#Form.ClassCode#) IS 0>
        <CFLOCATION URL=#list_page#>
    </CFIF>  
    <CFIF len(#Form.ClassNum#) IS 0>
        <CFLOCATION URL=#list_page#>
    </CFIF>


<CFSET ClassPre = #UCase(Form.ClassCode)#>
<CFSET ClassNum = #Form.ClassNum#>
<CFSET Code2Find = '#ClassPre##ClassNum#'>
<CFSET ValidPre = (!IsNumeric(#ClassPre#))>
<CFSET ValidNum = (IsNumeric(#ClassNum#))>
<CFSET CVal = (Fix((#ClassNum#/100))* 100)>


 
 <!---notvalid code, go back to Maintenance Menu--->
    <CFIF (!#ValidPre#)>
        <CFLOCATION URL=#list_page#>
    </CFIF>  
    <CFIF (!#ValidNum#)>
        <CFLOCATION URL=#list_page#>
    </CFIF>

<cfquery datasource="AllSchoolAudit" name="FC">
Select * From ClassInfoRecs
Where CourseCode= '#Code2Find#'
</cfquery>

<!---  If found, modify existing record --->
<CFIF FC.RecordCount IS 1>
       
       <BR />
       This routine is to add records only  - modify them with ASEditClassRecs<Br />
        <CFLOCATION URL=#list_page#>
       
        <!--- Form Text --->
           <CFSET FormTitle = 'Update Class Info'>
           <CFSET ButtonText = 'Update'>  
           <CFSET ModifyClass = 'YES'>          
   <CFELSE>
        <!--- code is valid, prepare new class record --->
       
        <!---    <CFSET ARecKey = #RecKey#>--->
		<CFSET ACourseCode = #Code2Find#>
        <CFSET ACoursePre = #ClassPre#>
        <CFSET ACourseNum = #ClassNum#>
        <CFSET ACourseName = ''>
        <CFSET AIQu = 1>
        <CFSET AFDIQu = 0>
        <CFSET AMAAIQu = 0>
        <CFSET AVFXIQu = 0>
        <CFSET AWDIMIQu = 0>
        <CFSET AGADIQu = 0>
        <CFSET ABILDIQu = 0>
        <CFSET AIDIQu = 0>
        <CFSET AHMIQu = 0>
        <CFSET AGDIQu = 0>
        <CFSET ABAPIQu = 0>
        <CFSET AADVIQu = 0>
        <CFSET ABDPHIQu = 0>
        <CFSET ADFVPIQu = 0>
        <CFSET AFMMIQu = 0>
        <CFSET AIPR = 0>
        <CFSET AGEGrp = 0>
         <CFSET AFDGrp = 99>
        <CFSET AMAAGrp = 99>
        <CFSET AVFXGrp = 99>
        <CFSET AWDIMGrp = 99>
        <CFSET AGADGrp = 99>
        <CFSET ABILDGrp = 99>
        <CFSET AIDGrp = 99>
        <CFSET AHMGrp = 99>
        <CFSET AGDGrp = 99>
        <CFSET ABAPGrp = 99>
        <CFSET AADVGrp = 99>
        <CFSET ABDPHGrp = 99>
        <CFSET ADFVPGrp = 99>
        <CFSET AFMMGrp = 99>
        <CFSET ANPR1 = ''>
        <CFSET ANPR2 = ''>
        <CFSET ANPR3 = ''>
        <CFSET APRM = 0>
        <!--- Use computed value for CLevel based on class number --->
        <CFSET ACLevel = #CVal#> 
        
        <!--- Form Text --->
          <CFSET FormTitle = 'Add a new Class'>
          <CFSET ButtonText = 'Insert'> 
          <CFSET ModifyClass = 'NO'>             	
     </CFIF>   


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Add new class info record only</title>
</head>

<body>

<!--- New  or Modify ASClassInfo form --->
<FORM ACTION="ASModifyClassInfoRec.cfm" method="POST">
<TABLE ALIGN="center" bgcolor="#00FFFF">
<CFOUTPUT>
   <TR>
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
       <INPUT Type="hidden" name="CoursePre" value="#ACoursePre#">
       <INPUT Type="hidden" name="CourseNum" value="#ACourseNum#">
        </TD>
     </TR>     
     <TR>
       <TD>
          Course Name:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="CourseName"
          MESSAGE=" Course Name is required!"
          REQUIRED="YES"
          value="#ACourseName#"
          SIZE="40"
          MAXLENGTH="40">
        </TD>
     </TR>
     <TR>
       <TD>
          Ideal Quarter:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="IQu"
          value="#AIQu#"
          SIZE="2">
        </TD>
     </TR>
     <TR>
       <TD>
          Course Level:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="CLevel"
          value="#ACLevel#"       
          SIZE="3">
        </TD>
     </TR>
      
     
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