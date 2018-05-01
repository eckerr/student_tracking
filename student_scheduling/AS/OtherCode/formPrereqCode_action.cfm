<!--- formPrereqCode_action.cfm 
processes data from PrereqCodeForm.cfm for adding or modifying AS Prereq info records

--->

<CFSET list_page = 'ASMaint.cfm'>
<!--- check to make sure classpre and classNum exist --->
<CFSET ClassPreExists = IsDefined("Form.MajorCode")>
<CFSET ClassNumExists = IsDefined("Form.CourseCode")>
    <CFIF len(#Form.MajorCode#) IS 0>
        <CFLOCATION URL=#list_page#>
    </CFIF>  
    <CFIF len(#Form.CourseCode#) IS 0>
        <CFLOCATION URL=#list_page#>
    </CFIF>


<CFSET MajCode = #UCase(Form.MajorCode)#>
<CFSET Code2Find = #Ucase(Form.CourseCode)#>



 
 <!---notvalid code, go back to Maintenance Menu--->
 

<cfquery datasource="AllSchoolAudit" name="PI">
Select * From PrereqInfo
Where MajorCode = '#MajCode#' AND CourseCode= '#Code2Find#'
</cfquery>

<CFDUMP var="#PI#">

<!---  If found, modify existing record --->
<CFIF PI.RecordCount IS 1>
       
	     <!---PreLoad Variables--->
           <CFSET ARecKey = #PI.RecKey#>
	       <CFSET AMajorCode = #Ucase(Trim(PI.MajorCode))#>
           <CFSET ACoursePre = #Ucase(Trim(PI.CourseCode))#>
           <CFSET APrereqCode = #Ucase(Trim(PI.PrereqCode))#>
           
        
        <!--- Form Text --->
           <CFSET FormTitle = 'Update Prereq Info'>
           <CFSET ButtonText = 'Update'>  
           <CFSET ModifyClass = 'YES'>          
   <CFELSE>
        <!--- code is valid, prepare new class record --->
       
        <!---    <CFSET ARecKey = #RecKey#>--->
		<CFSET AMajorCode = #MajCode#>
        <CFSET ACourseCode = #Code2Find#>
        <CFSET APrereqCode = ''>
       
        <!--- Form Text --->
          <CFSET FormTitle = 'Add a new Class'>
          <CFSET ButtonText = 'Insert'> 
          <CFSET ModifyClass = 'NO'>             	
     </CFIF>   


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>

<!--- New  or Modify ASPrereqInfo form --->
<!---<FORM ACTION="InsertASClassRec.cfm" method="POST">--->

<CFIF ModifyClass>
      <!--- Embed primary key in a hidden field --->
      <CFOUTPUT>
      <INPUT Type="hidden" name="RecKey" value="#FC.RecKey#">
      </CFOUTPUT>
</CFIF>

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
 
<CFIF ModifyClass>
    <TR>
       <TD>
           MAA Ideal Quarter:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="MAAIQu"
          value="#AMAAIQu#"
          SIZE="2"
          MAXLENGTH="2">
        </TD>
     </TR>
     <TR>
       <TD>
          GAD Ideal Quarter:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="GADIQu"
          value="#AGADIQu#"
          VALIDATE="INTEGER"
       
          SIZE="2"
          MAXLENGTH="2">
        </TD>
     </TR>
     <TR>
       <TD>
          FM Ideal Quarter:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="FMIQu"
          VALIDATE="INTEGER"
          value="#AFMIQu#"
          SIZE="2"
          MAXLENGTH="2">
        </TD>
     </TR>
     <TR>
       <TD>
          FD Ideal Quarter:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="FDIQu"
          value="#AFDIQu#"
          VALIDATE="INTEGER"
          SIZE="2"
          MAXLENGTH="2">
        </TD>
     </TR>
     <TR>
       <TD>
          VFX Ideal Quarter:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="VFXIQu"
          value="#AVFXIQu#"
          VALIDATE="INTEGER"
          SIZE="2"
          MAXLENGTH="2">
        </TD>
     </TR>
     <TR>
       <TD>
          WDIM Ideal Quarter:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="WDIMIQu"
          VALIDATE="INTEGER"
          value="#AWDIMIQu#"
          SIZE="2"
          MAXLENGTH="2">
        </TD>
     </TR>
     <TR>
       <TD>
          ILD Ideal Quarter:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="ILDIQu"
          VALIDATE="INTEGER"
          value="#AILDIQu#"
          SIZE="2"
          MAXLENGTH="2">
        </TD>
     </TR>
     <TR>
       <TD>
          ID Ideal Quarter:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="IDIQu"
          VALIDATE="INTEGER"
          value="#AIDIQu#"
          SIZE="2"
          MAXLENGTH="2">
        </TD>
     </TR>
     <TR>
       <TD>
          HM Ideal Quarter:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="HMIQu"
          VALIDATE="INTEGER"
          value="#AHMIQu#"
   
          SIZE="2"
          MAXLENGTH="2">
        </TD>
     </TR>
     <TR>
       <TD>
          GD Ideal Quarter:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="GDIQu"
          VALIDATE="INTEGER"
          value="#AGDIQu#"
          SIZE="2"
          MAXLENGTH="2">
        </TD>
     </TR>
     <TR>
       <TD>
          AUD Ideal Quarter:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="AUDIQu"
          VALIDATE="INTEGER"
          value="#AAUDIQu#"
          SIZE="2"
          MAXLENGTH="2">
        </TD>
     </TR>
     <TR>
       <TD>
          ADV Ideal Quarter:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="ADVIQu"
          VALIDATE="INTEGER"
          value="#AADVIQu#"
          SIZE="2"
          MAXLENGTH="2">
        </TD>
     </TR>
     <TR>
       <TD>
          DPH Ideal Quarter:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="DPHIQu"
          VALIDATE="INTEGER"
          value="#ADPHIQu#"
          SIZE="2"
          MAXLENGTH="2">
        </TD>
     </TR>
     <TR>
       <TD>
          DPV Ideal Quarter:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="DPVIQu"
          VALIDATE="INTEGER"
          value="#ADPVIQu#"
          SIZE="2"
          MAXLENGTH="2">
        </TD>
     </TR>
     <TR>
       <TD>
          Is Prerequisite?
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="IPR"
          VALIDATE="INTEGER"
          value="#AIPR#"
          SIZE="1"
          MAXLENGTH="1">
        </TD>
     </TR>
	 
	 <TR>
       <TD>
          General Education Group:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="GEGrp"
          VALIDATE="INTEGER"
          value="#AGEGrp#"
          SIZE="2"
          MAXLENGTH="2">
        </TD>
     </TR>
     <TR>
       <TD>
          Needs PreReq 1:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="NPR1"
          value="#ANPR1#"     
          SIZE="7"
          MAXLENGTH="7">
        </TD>
     </TR>
     <TR>
       <TD>
          Needs PreReq 2:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="NPR2"
          value="#ANPR2#"
          SIZE="7"
          MAXLENGTH="7">
        </TD>
     </TR>
     <TR>
       <TD>
          Needs PreReq 3:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="NPR3"
          value="#ANPR3#"
          SIZE="7"
          MAXLENGTH="7">
        </TD>
     </TR>
     <TR>
       <TD>
          Pre req met:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="PRM"
          VALIDATE="INTEGER"
          value="#APRM#"
          SIZE="1"
          MAXLENGTH="1">
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