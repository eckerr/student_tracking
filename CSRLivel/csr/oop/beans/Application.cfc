<cfcomponent>
	<cffunction name="onApplicationStart" output="NO" >
    
		<!--- Instantiate the Local Datasource object  --->
           <cfset var locObjDatasource = createObject('component',
		     'com.csr.oop.beans.Datasource').init(
			 DSName='CSRStudentInputS', username= '', password= '') />
                         
		<!--- Instantiate the Remote Datasource object  --->
           <cfset var objDatasource = createObject('component',
		     'com.csr.oop.beans.Datasource').init(
			 DSName='CSRMySQL', username= 'root', password= '42030303') />
             
 <!--- this part is needed for the temporary lookup of student contact information for use with current system--->             
        <!--- Instantiate and persist the Import Student Service in the 
		     application scope  --->
        <cfset Application.ImportStudentSVC  = createObject('component',
		      'com.csr.oop.dataAccess.ImportStudentService').init(
			  datasource=locObjDataSource) />
           
                 <!---Local Databases for building files--->            
                          
        <!--- Instantiate and persist the ImportStudentDirectoryService in the 
		     application scope  --->
        <cfset Application.ImportStudentDirectorySVC  = createObject('component',
		      'com.csr.oop.dataAccess.ImportStudentDirectoryService').init(
			  datasource=locObjDataSource) />
 
         <!--- Instantiate and persist the ImportClassScheduleService in the 
		     application scope  --->
        <cfset Application.ImportClassScheduleSVC  = createObject('component',
		      'com.csr.oop.dataAccess.ImportClassScheduleService').init(
			  datasource=locObjDataSource) />
 
       <!--- Instantiate and persist the ImportStudentClass Info Service in the 
		     application scope  --->
        <cfset Application.ImportStudentClassInfoSVC  = createObject('component',
		      'com.csr.oop.dataAccess.ImportStudentClassInfoService').init(
			  datasource=locObjDataSource) />
 
                 <!---Remote Datafiles for application operation--->            
		  			  
        <!--- Instantiate and persist the StudentService in the 
		     application scope  --->
        <cfset Application.StudentSVC  = createObject('component',
		      'com.csr.oop.dataAccess.StudentService').init(
			  datasource=objDataSource) />

        <!--- Instantiate and persist the MajorService in the 
		     application scope  --->
        <cfset Application.MajorSVC  = createObject('component',
		      'com.csr.oop.dataAccess.MajorService').init(
			  datasource=objDataSource) />

        <!--- Instantiate and persist the ShiftDescripService in the 
		     application scope  --->
        <cfset Application.ShiftDescripSVC  = createObject('component',
		      'com.csr.oop.dataAccess.ShiftDescripService').init(
			  datasource=objDataSource) />

        <!--- Instantiate and persist the GenderService in the 
		     application scope  --->
        <cfset Application.GenderSVC  = createObject('component',
		      'com.csr.oop.dataAccess.GenderService').init(
			  datasource=objDataSource) />

        <!--- Instantiate and persist the EnrollStat Service in the 
		     application scope  --->
        <cfset Application.EnrollStatSVC  = createObject('component',
		      'com.csr.oop.dataAccess.EnrollStatService').init(
			  datasource=objDataSource) />

        <!--- Instantiate and persist the StatusDesc Service in the 
		     application scope  --->
        <cfset Application.StatusDescSVC  = createObject('component',
		      'com.csr.oop.dataAccess.StatusDescService').init(
			  datasource=objDataSource) />

        <!--- Instantiate and persist the GradeLevel Service in the 
		     application scope  --->
        <cfset Application.GradeLevelSVC  = createObject('component',
		      'com.csr.oop.dataAccess.GradeLevelService').init(
			  datasource=objDataSource) />

         <!--- Instantiate and persist the SAP Service in the 
		     application scope  --->
        <cfset Application.SAPSVC  = createObject('component',
		      'com.csr.oop.dataAccess.SAPService').init(
			  datasource=objDataSource) />

        <!--- Instantiate and persist the CourseService in the 
		     application scope  --->
        <cfset Application.CourseSVC  = createObject('component',
		      'com.csr.oop.dataAccess.CourseService').init(
			  datasource=objDataSource) />

        <!--- Instantiate and persist the InstructorService in the 
		     application scope  --->
        <cfset Application.InstructorSVC  = createObject('component',
		      'com.csr.oop.dataAccess.InstructorService').init(
			  datasource=objDataSource) />

        <!--- Instantiate and persist the AdvStatusService in the 
		     application scope  --->
        <cfset Application.AdvStatusSVC  = createObject('component',
		      'com.csr.oop.dataAccess.AdvStatusService').init(
			  datasource=objDataSource) />

       <!--- Instantiate and persist the ClassService in the 
		     application scope  --->
        <cfset Application.ClassSVC  = createObject('component',
		      'com.csr.oop.dataAccess.ClassService').init(
			  datasource=objDataSource) />

      <!--- Instantiate and persist the EventService in the 
		     application scope  --->
        <cfset Application.EventSVC  = createObject('component',
		      'com.csr.oop.dataAccess.EventService').init(
			  datasource=objDataSource) />

      <!--- Instantiate and persist the Building Service in the 
		     application scope  --->
        <cfset Application.BuildingSVC  = createObject('component',
		      'com.csr.oop.dataAccess.BuildingService').init(
			  datasource=objDataSource) />

      <!--- Instantiate and persist the StartTimeService in the 
		     application scope  --->
        <cfset Application.StartTimeSVC  = createObject('component',
		      'com.csr.oop.dataAccess.StartTimeService').init(
			  datasource=objDataSource) />

      <!--- Instantiate and persist the EndTimeService in the 
		     application scope  --->
        <cfset Application.EndTimeSVC  = createObject('component',
		      'com.csr.oop.dataAccess.EndTimeService').init(
			  datasource=objDataSource) />

      <!--- Instantiate and persist the DaysService in the 
		     application scope  --->
        <cfset Application.DaysSVC  = createObject('component',
		      'com.csr.oop.dataAccess.DaysService').init(
			  datasource=objDataSource) />

      <!--- Instantiate and persist the Day_orderService in the 
		     application scope  --->
        <cfset Application.Day_orderSVC  = createObject('component',
		      'com.csr.oop.dataAccess.Day_orderService').init(
			  datasource=objDataSource) />

      <!--- Instantiate and persist the ClassStartService in the 
		     application scope  --->
        <cfset Application.ClassStartSVC  = createObject('component',
		      'com.csr.oop.dataAccess.ClassStartService').init(
			  datasource=objDataSource) />

      <!--- Instantiate and persist the ClassEndService in the 
		     application scope  --->
        <cfset Application.ClassEndSVC  = createObject('component',
		      'com.csr.oop.dataAccess.ClassEndService').init(
			  datasource=objDataSource) />

      <!--- Instantiate and persist the TermCodeService in the 
		     application scope  --->
        <cfset Application.TermCodeSVC  = createObject('component',
		      'com.csr.oop.dataAccess.TermCodeService').init(
			  datasource=objDataSource) />

      <!--- Instantiate and persist the ProgramCodeService in the 
		     application scope  --->
        <cfset Application.ProgramCodeSVC  = createObject('component',
		      'com.csr.oop.dataAccess.ProgramCodeService').init(
			  datasource=objDataSource) />

		<!--- Instantiate and persist additional Service --->
        
                <!--- Instantiate the key value --->
    	<cfset Application.key = "IlisCSR1114aCeGiK" />
        

		
	</cffunction>
</cfcomponent>