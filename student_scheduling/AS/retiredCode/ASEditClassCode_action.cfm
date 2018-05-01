<!--- ASEditClassCode_action.cfm 
processes data from ASEditClasses.cfm for modifying AS class info records

--->

<CFSET list_page = 'ASMaint.cfm'>
<!--- point to list page--->
<CFSET list_page="ASBlankPageF.cfm">

<!--- check if url was passed--->
<cfif NOT IsDefined("URL.Sid")>
	<!---not defined, sent to list page--->
    <CFLOCATION URL=#list_page#>
    </cfif>
    
<!--- get records from database ---> 
<CFSET Code2Find = #URL.Sid#>

<cfquery datasource="AllSchoolAudit" name="FC">
Select * From ClassInfo
Where CourseCode= '#Code2Find#'
</cfquery>

<!---  If found, modify existing record --->
<CFIF FC.RecordCount IS 1>
       
	     <!---PreLoad Variables--->
           <CFSET ARecKey = #FC.RecKey#>
	       <CFSET ACourseCode = #Trim(FC.CourseCode)#>
           <CFSET ACoursePre = #Trim(FC.CoursePre)#>
           <CFSET ACourseNum = #Trim(FC.CourseNum)#>
           <CFSET ACourseName = #Trim(FC.CourseName)#>
           <CFSET AIQu = #FC.IQu#>
           <CFSET AFDIQu = #FC.FDIQu#>
           <CFSET AMAAIQu = #FC.MAAIQu#>
           <CFSET AVFXIQu = #FC.VFXIQu#>
           <CFSET AWDIMIQu = #FC.WDIMIQu#>
           <CFSET AGADIQu = #FC.GADIQu#>
           <CFSET AILDIQu = #FC.ILDIQu#>
           <CFSET AIDIQu = #FC.IDIQu#>
           <CFSET AHMIQu = #FC.HMIQu#>
           <CFSET AGDIQu = #FC.GDIQu#>
           <CFSET AAUDIQu = #FC.AUDIQu#>
           <CFSET AADVIQu = #FC.ADVIQu#>
           <CFSET ADPHIQu = #FC.DPHIQu#>
           <CFSET ADPVIQu = #FC.DPVIQu#>
           <CFSET AFMIQu = #FC.FMIQu#>
           <CFSET AIPR = #FC.IPR#>
           <CFSET ACLevel = #FC.CLevel#>
           <CFSET AGEGrp = #FC.GEGrp#>
           <CFSET ANPR1 = #Trim(FC.NPR1)#>
           <CFSET ANPR2 = #Trim(FC.NPR2)#>
           <CFSET ANPR3 = #Trim(FC.NPR3)#>
           <CFSET APRM = #FC.PRM#>	
        
        <!--- Form Text --->
           <CFSET FormTitle = 'Update Class Info'>
           <CFSET ButtonText = 'Update'>  
           <CFSET ModifyClass = 'YES'>          
           </CFIF>   


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>

<!---  Modify ASClassInfo form --->
<FORM ACTION="ASModifyClassRec.cfm" method="POST">

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