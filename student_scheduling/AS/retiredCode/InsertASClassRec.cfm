<!--- InsertASClassRec --->

<!--- Are we inserting a new rec or editing an existing one? --->
<CFSET ModifyClass = IsDefined("Form.RecKey")>

<CFIF ModifyClass>
    <!--- we are modifying an existing class --->
   <CFQUERY datasource="AllSchoolAudit">
   UPDATE ClassInfo
   SET  CourseCode='#Trim(FORM.CourseCode)#',
        CoursePre='#Trim(FORM.CoursePre)#',
        CourseNum='#Trim(FORM.CourseNum)#',
        CourseName='#Trim(FORM.CourseName)#',
        IQu=#Form.IQu#,
        FDIQu=#Form.FDIQu#,
        MAAIQu=#Form.MAAIQu#,
        VFXIQu=#Form.VFXIQu#,
        WDIMIQu=#Form.WDIMIQu#,
        GADIQu=#Form.GADIQu#,
        ILDIQu=#Form.ILDIQu#,
        IDIQu=#Form.IDIQu#,
        HMIQu=#Form.HMIQu#,
        GDIQu=#Form.GDIQu#,
        AUDIQu=#Form.AUDIQu#,
        ADVIQu=#Form.ADVIQu#,
        DPHIQu=#Form.DPHIQu#,
        DPVIQu=#Form.DPVIQu#,
        FMIQu=#Form.FMIQu#,
        IPR=#Form.IPR#,
        CLevel=#Form.CLevel#,
        GEGrp=#Form.GEGrp#,
        NPR1='#Ucase(Trim(FORM.NPR1))#',
        NPR2='#Ucase(Trim(FORM.NPR2))#',
        NPR3='#Ucase(Trim(FORM.NPR3))#',
        PRM=#Form.PRM#
    WHERE RecKey=#FORM.RecKey#
    </CFQUERY>        

<CFELSE>

    <!--- we are adding a new class --->
   <CFQUERY DATASOURCE="AllSchoolAudit"> 
          INSERT INTO ClassInfo(CourseCode,
                                CoursePre,
                                CourseNum,
                                CourseName,
                                IQu,
                                FDIQu,
                                MAAIQu,
                                VFXIQu,
                                WDIMIQu,
                                GADIQu,
                                ILDIQu,
                                IDIQu,
                                HMIQu,
                                GDIQu,
                                AUDIQu,
                                ADVIQu,
                                DPHIQu,
                                DPVIQu,
                                FMIQu,
                                IPR,
                                CLevel,
                                GEGrp,
                                NPR1,
                                NPR2,
                                NPR3,
                                PRM)
          VALUES('#Trim(FORM.CoursePre)##Trim(FORM.CourseNum)#',
                 '#Trim(FORM.CoursePre)#',
                 '#Trim(FORM.CourseNum)#',
                 '#Trim(FORM.CourseName)#',
                 #FORM.IQu#,
                 #FORM.IQu#,
                 #FORM.IQu#,
                 #FORM.IQu#,
                 #FORM.IQu#,
                 #FORM.IQu#,
                 #FORM.IQu#,
                 #FORM.IQu#,
                 #FORM.IQu#,
                 #FORM.IQu#,
                 #FORM.IQu#,
                 #FORM.IQu#,
                 #FORM.IQu#,
                 #FORM.IQu#,
                 #FORM.IQu#,
                 0,
                 #FORM.CLevel#,
                 0,
                 '       ',
                 '       ',
                 '       ',
                 0)                                      
</CFQUERY>
</CFIF>

<!--- give feedback that it was entered --->
<CFOUTPUT>
<CFIF ModifyClass>
 Existing class <B>#FORM.CoursePre##FORM.CourseNum#   #FORM.CourseName#  Record Number #FORM.RecKey#</B> modified
<CFElse>
 <B>#FORM.CoursePre##FORM.CourseNum#   #FORM.CourseName# </B>added to the table 
 </CFIF>
</CFOUTPUT>
<BR />
<BR />
<BR />
<BR />
<A HREF="ASClassCodeForm.cfm">Add/Edit another class?</A>
<BR />
<BR />
<BR />
<BR />
<A HREF="ASMaint.cfm">Return to Maintenance Menu</A>
