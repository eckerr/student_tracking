<!--- ASEditClassRecs_action.cfm 
processes data from ASEditClassRecs.cfm for modifying AS classinfoRecs records

--->

<CFSET list_page = 'ASMaint.cfm'>
<!--- point to list page--->
<CFSET list_page="ASBlankPageF.cfm">

<!--- check if url was passed--->
<cfif NOT IsDefined("URL.CC")>
	<!---not defined, sent to list page--->
    <CFLOCATION URL=#list_page#>
    </cfif>
    
<!--- get records from database ---> 
<CFSET Code2Find = #URL.CC#>

<cfquery datasource="AllSchoolAudit" name="FC">
Select * From ClassInfoRecs
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
           <CFSET ABFDIQu = #FC.BFDIQu#>
           <CFSET AMAAIQu = #FC.MAAIQu#>
           <CFSET AVFXIQu = #FC.VFXIQu#>
           <CFSET AWDIMIQu = #FC.WDIMIQu#>
           <CFSET AGADIQu = #FC.GADIQu#>
           <CFSET ABILDIQu = #FC.BILDIQu#>
           <CFSET AIDIQu = #FC.IDIQu#>
           <CFSET ABHMIQu = #FC.BHMIQu#>
           <CFSET ABGDIQu = #FC.BGDIQu#>
           <CFSET ABAPIQu = #FC.BAPIQu#>
           <CFSET AADVIQu = #FC.ADVIQu#>
           <CFSET ABDPHIQu = #FC.BDPHIQu#>
           <CFSET ADFVPIQu = #FC.DFVPIQu#>
           <CFSET AFMMIQu = #FC.FMMIQu#>
           <CFSET AIPR = #FC.IPR#>
           <CFSET ACLevel = #FC.CLevel#>
           <CFSET AGEGrp = #FC.GEGrp#>
           <CFSET ABFDGrp = #FC.BFDGrp#>
           <CFSET AMAAGrp = #FC.MAAGrp#>
           <CFSET AVFXGrp = #FC.VFXGrp#>
           <CFSET AWDIMGrp = #FC.WDIMGrp#>
           <CFSET AGADGrp = #FC.GADGrp#>
           <CFSET ABILDGrp = #FC.BILDGrp#>
           <CFSET AIDGrp = #FC.IDGrp#>
           <CFSET ABHMGrp = #FC.BHMGrp#>
           <CFSET ABGDGrp = #FC.BGDGrp#>
           <CFSET ABAPGrp = #FC.BAPGrp#>
           <CFSET AADVGrp = #FC.ADVGrp#>
           <CFSET ABDPHGrp = #FC.BDPHGrp#>
           <CFSET ADFVPGrp = #FC.DFVPGrp#>
           <CFSET AFMMGrp = #FC.FMMGrp#>
           <CFSET ANPR1 = #FC.NPR1#>
           <CFSET ANPR2 = #FC.NPR2#>
           <CFSET ANPR3 = #FC.NPR3#>
           <CFSET ANPR4 = #FC.NPR4#>
           <CFSET ANPR5 = #FC.NPR5#>
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
<title>Update Class Info Recs</title>
</head>

<body>

<!---  Modify ASClassInfo form --->
<FORM ACTION="ASModifyClassInfoRec.cfm" method="POST">

<CFIF ModifyClass>
      <!--- Embed primary key in a hidden field --->
      <CFOUTPUT>
      <INPUT Type="hidden" name="RecKey" value="#FC.RecKey#">
      </CFOUTPUT>
</CFIF>


<TABLE ALIGN="center" bgcolor="#88FFFF">
<CFOUTPUT>
   <TR>
     <TH colspan="7">
     <font size="+2">#FormTitle#</font>
     </TH>
   </TR>
   <TR>
       <TD>
          Course Code:
       </TD>
       <TD>
      <B> #ACourseCode# </B>
       <INPUT Type="hidden" name="CourseCode" value="#ACourseCode#">
       <INPUT Type="hidden" name="CoursePre" value="#ACoursePre#">
       <INPUT Type="hidden" name="CourseNum" value="#ACourseNum#">
        </TD>
    <!--- </TR>     
     <TR>--->
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
    <!--- </TR>
     <TR>--->
       <TD>
          Ideal Quarter:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="IQu"
          value="#AIQu#"
          SIZE="2">
        </TD>
    <!--- </TR>
     <TR>--->
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
    <!--- </TR>
     <TR>--->
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
    <!--- </TR>
     <TR>--->
       <TD>
          FMM Ideal Quarter:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="FMMIQu"
          VALIDATE="INTEGER"
          value="#AFMMIQu#"
          SIZE="2"
          MAXLENGTH="2">
        </TD>
    <!--- </TR>
     <TR>--->
       <TD>
          BFD Ideal Quarter:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="BFDIQu"
          value="#ABFDIQu#"
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
    <!--- </TR>
     <TR>--->
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
    <!--- </TR>
     <TR>--->
       <TD>
          BILD Ideal Quarter:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="BILDIQu"
          VALIDATE="INTEGER"
          value="#ABILDIQu#"
          SIZE="2"
          MAXLENGTH="2">
        </TD>
    <!--- </TR>
     <TR>--->
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
          BHM Ideal Quarter:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="BHMIQu"
          VALIDATE="INTEGER"
          value="#ABHMIQu#"
   
          SIZE="2"
          MAXLENGTH="2">
        </TD>
    <!--- </TR>
     <TR>--->
       <TD>
          BGD Ideal Quarter:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="BGDIQu"
          VALIDATE="INTEGER"
          value="#ABGDIQu#"
          SIZE="2"
          MAXLENGTH="2">
        </TD>
     <!---</TR>
     <TR>--->
       <TD>
          BAP Ideal Quarter:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="BAPIQu"
          VALIDATE="INTEGER"
          value="#ABAPIQu#"
          SIZE="2"
          MAXLENGTH="2">
        </TD>
     <!---</TR>
     <TR>--->
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
          BDPH Ideal Quarter:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="BDPHIQu"
          VALIDATE="INTEGER"
          value="#ABDPHIQu#"
          SIZE="2"
          MAXLENGTH="2">
        </TD>
   <!---  </TR>
     <TR>--->
       <TD>
          DFVP Ideal Quarter:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="DFVPIQu"
          VALIDATE="INTEGER"
          value="#ADFVPIQu#"
          SIZE="2"
          MAXLENGTH="2">
        </TD>
     <TR>
      </TR>
         <TR>
       <TD>
           MAA GE Group:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="MAAGrp"
          value="#AMAAGrp#"
          SIZE="2"
          MAXLENGTH="2">
        </TD>
    <!--- </TR>
     <TR>--->
       <TD>
          GAD GE Group:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="GADGrp"
          value="#AGADGrp#"
          VALIDATE="INTEGER"
       
          SIZE="2"
          MAXLENGTH="2">
        </TD>
    <!--- </TR>
     <TR>--->
       <TD>
          FMM GE Group:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="FMMGrp"
          VALIDATE="INTEGER"
          value="#AFMMGrp#"
          SIZE="2"
          MAXLENGTH="2">
        </TD>
    <!--- </TR>
     <TR>--->
       <TD>
          BFD GE Group:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="BFDGrp"
          value="#ABFDGrp#"
          VALIDATE="INTEGER"
          SIZE="2"
          MAXLENGTH="2">
        </TD>
     </TR>
     <TR>
       <TD>
          VFX GE Group:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="VFXGrp"
          value="#AVFXGrp#"
          VALIDATE="INTEGER"
          SIZE="2"
          MAXLENGTH="2">
        </TD>
    <!--- </TR>
     <TR>--->
       <TD>
          WDIM GE Group:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="WDIMGrp"
          VALIDATE="INTEGER"
          value="#AWDIMGrp#"
          SIZE="2"
          MAXLENGTH="2">
        </TD>
    <!--- </TR>
     <TR>--->
       <TD>
          BILD GE Group:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="BILDGrp"
          VALIDATE="INTEGER"
          value="#ABILDGrp#"
          SIZE="2"
          MAXLENGTH="2">
        </TD>
    <!--- </TR>
     <TR>--->
       <TD>
          ID GE Group:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="IDGrp"
          VALIDATE="INTEGER"
          value="#AIDGrp#"
          SIZE="2"
          MAXLENGTH="2">
        </TD>
     </TR>
     <TR>
       <TD>
          BHM GE Group:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="BHMGrp"
          VALIDATE="INTEGER"
          value="#ABHMGrp#"
   
          SIZE="2"
          MAXLENGTH="2">
        </TD>
    <!--- </TR>
     <TR>--->
       <TD>
          BGD GE Group:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="BGDGrp"
          VALIDATE="INTEGER"
          value="#ABGDGrp#"
          SIZE="2"
          MAXLENGTH="2">
        </TD>
     <!---</TR>
     <TR>--->
       <TD>
          BAP GE Group:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="BAPGrp"
          VALIDATE="INTEGER"
          value="#ABAPGrp#"
          SIZE="2"
          MAXLENGTH="2">
        </TD>
     <!---</TR>
     <TR>--->
       <TD>
          ADV GE Group:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="ADVGrp"
          VALIDATE="INTEGER"
          value="#AADVGrp#"
          SIZE="2"
          MAXLENGTH="2">
        </TD>
     </TR>
     <TR>
       <TD>
          BDPH GE Group:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="BDPHGrp"
          VALIDATE="INTEGER"
          value="#ABDPHGrp#"
          SIZE="2"
          MAXLENGTH="2">
        </TD>
   <!---  </TR>
     <TR>--->
       <TD>
          DFVP GE Group:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="DFVPGrp"
          VALIDATE="INTEGER"
          value="#ADFVPGrp#"
          SIZE="2"
          MAXLENGTH="2">
        </TD>
    <!--- </TR>
     <TR>--->
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
    <!--- </TR>
	 
	 <TR>--->
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
          PreReq 1:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="NPR1"
          value="#ANPR1#"     
          SIZE="7"
          MAXLENGTH="7">
        </TD>
     <!---</TR>
     <TR>--->
       <TD>
          PreReq 2:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="NPR2"
          value="#ANPR2#"
          SIZE="7"
          MAXLENGTH="7">
        </TD>
 <!---    </TR>
     <TR>--->
       <TD>
          PreReq 3:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="NPR3"
          value="#ANPR3#"
          SIZE="7"
          MAXLENGTH="7">
        </TD>
         <TD>
          PreReq 4:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="NPR4"
          value="#ANPR4#"
          SIZE="7"
          MAXLENGTH="7">
        </TD>
     </TR>
     <TR>
      <TD>
          PreReq 5:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="NPR5"
          value="#ANPR5#"
          SIZE="7"
          MAXLENGTH="7">
        </TD>
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