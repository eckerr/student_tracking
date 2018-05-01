<!--- ASModifyClassInfoRec --->

<!--- Are we inserting a new rec or editing an existing one? --->
<CFSET ModifyClass = IsDefined("Form.RecKey")>

<CFIF ModifyClass>
    <!--- we are modifying an existing class --->
   <CFQUERY datasource="AllSchoolAudit">
   UPDATE ClassInfoRecs
   SET  CourseCode='#Trim(FORM.CourseCode)#',
        CoursePre='#Trim(FORM.CoursePre)#',
        CourseNum='#Trim(FORM.CourseNum)#',
        CourseName='#Trim(FORM.CourseName)#',
        IQu=#Form.IQu#,
        BFDIQu=#Form.BFDIQu#,
        MAAIQu=#Form.MAAIQu#,
        VFXIQu=#Form.VFXIQu#,
        WDIMIQu=#Form.WDIMIQu#,
        GADIQu=#Form.GADIQu#,
        BILDIQu=#Form.BILDIQu#,
        IDIQu=#Form.IDIQu#,
        BHMIQu=#Form.BHMIQu#,
        BGDIQu=#Form.BGDIQu#,
        BAPIQu=#Form.BAPIQu#,
        ADVIQu=#Form.ADVIQu#,
        BDPHIQu=#Form.BDPHIQu#,
        DFVPIQu=#Form.DFVPIQu#,
        FMMIQu=#Form.FMMIQu#,
        IPR=#Form.IPR#,
        CLevel=#Form.CLevel#,
        GEGrp=#Form.GEGrp#,
        BFDGrp=#Form.BFDGrp#,
        MAAGrp=#Form.MAAGrp#,
        VFXGrp=#Form.VFXGrp#,
        WDIMGrp=#Form.WDIMGrp#,
        GADGrp=#Form.GADGrp#,
        BILDGrp=#Form.BILDGrp#,
        IDGrp=#Form.IDGrp#,
        BHMGrp=#Form.BHMGrp#,
        BGDGrp=#Form.BGDGrp#,
        BAPGrp=#Form.BAPGrp#,
        ADVGrp=#Form.ADVGrp#,
        BDPHGrp=#Form.BDPHGrp#,
        DFVPGrp=#Form.DFVPGrp#,
        FMMGrp=#Form.FMMGrp#,
        NPR1='#Ucase(Trim(FORM.NPR1))#',
        NPR2='#Ucase(Trim(FORM.NPR2))#',
        NPR3='#Ucase(Trim(FORM.NPR3))#',
        NPR4='#Ucase(Trim(FORM.NPR4))#',
        NPR5='#Ucase(Trim(FORM.NPR5))#',
        PRM=#Form.PRM#
    WHERE RecKey=#FORM.RecKey#
    </CFQUERY>        

<CFELSE>

    <!--- we are adding a new class --->
   <CFQUERY DATASOURCE="AllSchoolAudit"> 
          INSERT INTO ClassInfoRecs(CourseCode,
                                CoursePre,
                                CourseNum,
                                CourseName,
                                IQu,
                                BFDIQu,
                                MAAIQu,
                                VFXIQu,
                                WDIMIQu,
                                GADIQu,
                                BILDIQu,
                                IDIQu,
                                BHMIQu,
                                BGDIQu,
                                BAPIQu,
                                ADVIQu,
                                BDPHIQu,
                                DFVPIQu,
                                FMMIQu,
                                IPR,
                                CLevel,
                                GEGrp,
                                BFDGrp,
                                MAAGrp,
                                VFXGrp,
                                WDIMGrp,
                                GADGrp,
                                BILDGrp,
                                IDGrp,
                                BHMGrp,
                                BGDGrp,
                                BAPGrp,
                                ADVGrp,
                                BDPHGrp,
                                DFVPGrp,
                                FMMGrp,
                                NPR1,
                                NPR2,
                                NPR3,
                                PRM)
          VALUES('#Trim(FORM.CoursePre)##Trim(FORM.CourseNum)#',
                 '#Trim(FORM.CoursePre)#',
                 '#Trim(FORM.CourseNum)#',
                 '#Trim(FORM.CourseName)#',
                 #FORM.IQu#,
                 0,
                 0,
                 0,
                 0,
                 0,
                 0,
                 0,
                 0,
                 0,
                 0,
                 0,
                 0,
                 0,
               	 0,
                 0,
                 #FORM.CLevel#,
                 99,
                 99,
                 99,
                 99,
                 99,
                 99,
                 99,
                 99,
                 99,
                 99,
                 99,
                 99,
                 99,
                 99,
                 99,
                 '       ',
                 '       ',
                 '       ',
                 '       ',
                 '       ',
                 0)                                      
</CFQUERY>
</CFIF>

<!--- give feedback that it was entered --->
<CFOUTPUT>
<CFIF ModifyClass>
 Existing class <B>#FORM.CoursePre##FORM.CourseNum#   #FORM.CourseName# </B>  Record Number:<B> #FORM.RecKey#</B> modified
<CFElse>
 <B>#FORM.CoursePre##FORM.CourseNum#   #FORM.CourseName# </B>added to the table 
 </CFIF>
<BR />
<BR />
<BR />
<BR />
<A HREF="PickCoursePre.cfm?">Edit another class?</A>
<BR />
<BR />
<BR />
<BR />
<A HREF="ASMaint.cfm">Return to Maintenance Menu</A>
</CFOUTPUT>

