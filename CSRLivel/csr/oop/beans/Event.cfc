<CFCOMPONENT DISPLAYNAME="Event" OUTPUT="false" HINT="I am the Event class">
<cfproperty NAME = "iD" TYPE="NUMERIC" DEFAULT= 0 />
<cfproperty name = "inputDate" TYPE="DATE" DEFAULT="" />
<cfproperty name = "instructorMemo" TYPE="STRING" DEFAULT="" />
<cfproperty name = "absence" TYPE="NUMERIC" DEFAULT= 0 />
<cfproperty name = "tardiness" TYPE="NUMERIC" DEFAULT= 0 />
<cfproperty name = "poorQualityWork" TYPE="NUMERIC" DEFAULT= 0 />
<cfproperty name = "missingWork" TYPE="NUMERIC" DEFAULT= 0 />
<cfproperty name = "notPrepared" TYPE="NUMERIC" DEFAULT= 0 />
<cfproperty name = "behavior" TYPE="NUMERIC" DEFAULT= 0 />
<cfproperty name = "personal" TYPE="NUMERIC" DEFAULT= 0 />
<cfproperty name = "financial" TYPE="NUMERIC" DEFAULT= 0 />
<cfproperty name = "drugsAlcohol" TYPE="NUMERIC" DEFAULT= 0 />
<cfproperty name = "plagiarism" TYPE="NUMERIC" DEFAULT= 0 />
<cfproperty name = "familyIssues" TYPE="NUMERIC" DEFAULT= 0 />
<cfproperty name = "transporation" TYPE="NUMERIC" DEFAULT= 0 />
<cfproperty name = "childCare" TYPE="NUMERIC" DEFAULT= 0 />
<cfproperty name = "other" TYPE="NUMERIC" DEFAULT= 0 />
<cfproperty name = "instTalkedToStudent" TYPE="NUMERIC" DEFAULT= 0 />
<cfproperty name = "advTalkedToStudent" TYPE="NUMERIC" DEFAULT= 0 />
<cfproperty name = "assignedTo" TYPE="NUMERIC" DEFAULT= 0 />
<cfproperty name = "assignedDate" TYPE="DATE" DEFAULT= "" />
<cfproperty name = "advisorID" TYPE="NUMERIC" DEFAULT= 0 />
<cfproperty name = "advisorNote" TYPE="TEXT" DEFAULT= "" />
<cfproperty name = "advStatus" TYPE="NUMERIC" DEFAULT= 0 />
<cfproperty name = "courseID" TYPE="NUMERIC" DEFAULT= 0 />
<cfproperty name = "instructorID" TYPE="NUMERIC" DEFAULT= 0 />
<cfproperty name = "weekID" TYPE="NUMERIC" DEFAULT= 0 />
<cfproperty name = "studentID" TYPE="NUMERIC" DEFAULT= 0 />
<cfproperty name = "gradeLevelID" TYPE="NUMERIC" DEFAULT= 0 />
<cfproperty name = "majorID" TYPE="NUMERIC" DEFAULT= 0 />
<cfproperty name = "termCodeID" TYPE="NUMERIC" DEFAULT= 0 />

<!---  Pseudo-constructor --->
<cfset Variables.instance = structNew()>
	<cfset Variables.instance.iD = 0 />
	<cfset Variables.instance.inputDate = '' />
    <cfset Variables.instance.instructorNote = '' />
    <cfset Variables.instance.absence = 0 />
    <cfset Variables.instance.tardiness = 0 />
    <cfset Variables.instance.poorQualityWork = 0 />
    <cfset Variables.instance.missingWork = 0 /> 
	<cfset Variables.instance.notPrepared = 0 />  
	<cfset Variables.instance.behavior = 0 />  
	<cfset Variables.instance.personal = 0 />  
	<cfset Variables.instance.financial = 0 />  
	<cfset Variables.instance.drugsAlchohol = 0 />  
	<cfset Variables.instance.plagiarism = 0 />
	<cfset Variables.instance.familyIssues = 0 />    
    <cfset Variables.instance.transportation = 0 /> 
    <cfset Variables.instance.childCare = 0 />
    <cfset Variables.instance.other = 0 />  
	<cfset Variables.instance.instTalkedToStudent = 0 />    
	<cfset Variables.instance.advTalkedToStudent = 0 />
   	<cfset Variables.instance.assignedTo = 0 />
	<cfset Variables.instance.assignedDate = '' />    
	<cfset Variables.instance.advisorNote = "" />    
	<cfset Variables.instance.advStatus = 0 />
	<cfset Variables.instance.courseID = 0 />
	<cfset Variables.instance.instructorID = 0 />
   	<cfset Variables.instance.weekID = 0 />
	<cfset Variables.instance.studentID = 0 />
	<cfset Variables.instance.gradeLevelID = 0 />
   	<cfset Variables.instance.majorID = 0 />
	<cfset Variables.instance.termCodeID = 0 />
 
	<CFFUNCTION NAME="init" ACCESS="public"  OUTPUT="false" RETURNTYPE="any" 
       HINT="I am the constructor method for the Event class">
     <cfargument NAME="iD" TYPE="NUMERIC" REQUIRED="true" DEFAULT = 0
           HINT="I am the  ID" />
	 <CFARGUMENT NAME="inputDate" TYPE="DATE" REQUIRED="true" DEFAULT="" 
           HINT="I am the  input date" />
	 <CFARGUMENT NAME="instructorMemo" TYPE="string" REQUIRED="true" 
             DEFAULT="" HINT="I am the  instructor memo" />
     <CFARGUMENT NAME="absence" TYPE="NUMERIC" REQUIRED="true" 
            DEFAULT= 0 HINT="I am the  absence flag" />
     <CFARGUMENT NAME="tardiness" TYPE="NUMERIC" REQUIRED="true" 
            DEFAULT= 0 HINT="I am the  tardiness flag" />
     <CFARGUMENT NAME="poorQualityWork" TYPE="NUMERIC" REQUIRED="true" 
            DEFAULT= 0 HINT="I am the  poor quality work flag" />
     <CFARGUMENT NAME="missingWork" TYPE="NUMERIC" REQUIRED="true" 
            DEFAULT="" HINT="I am the  missing work flag" />
     <CFARGUMENT NAME="notPrepared" TYPE="NUMERIC" REQUIRED="true" 
            DEFAULT= 0 HINT="I am the  not prepared flag" />    
     <CFARGUMENT NAME="behavior" TYPE="NUMERIC" REQUIRED="true" 
            DEFAULT= 0 HINT="I am the  behavior flag" />    
     <CFARGUMENT NAME="personal" TYPE="NUMERIC" REQUIRED="true" 
            DEFAULT= 0 HINT="I am the  personal flag" />    
     <CFARGUMENT NAME="financial" TYPE="NUMERIC" REQUIRED="true" 
            DEFAULT= 0 HINT="I am the  financial flag" />    
     <CFARGUMENT NAME="drugsAlchohol" TYPE="NUMERIC" REQUIRED="true" 
            DEFAULT= 0 HINT="I am the  Drugs / Alchohol flag" />    
     <CFARGUMENT NAME="plagiarism" TYPE="NUMERIC" REQUIRED="true" 
            DEFAULT= 0 HINT="I am the  plagiarism flag" /> 
     <CFARGUMENT NAME="financial" TYPE="NUMERIC" REQUIRED="true" 
            DEFAULT= 0 HINT="I am the  financial flag" />           
     <CFARGUMENT NAME="transportation" TYPE="NUMERIC" REQUIRED="true" 
            DEFAULT= 0 HINT="I am the  transportation flag" />           
     <CFARGUMENT NAME="childCare" TYPE="NUMERIC" REQUIRED="true" 
            DEFAULT= 0 HINT="I am the  child care flag" />
     <CFARGUMENT NAME="other" TYPE="NUMERIC" REQUIRED="true" 
            DEFAULT= 0 HINT="I am the  other catch-all flag" />                    
     <CFARGUMENT NAME="instTalkedToStudent" TYPE="NUMERIC" REQUIRED="true" 
            DEFAULT= 0 HINT="Instructor talked to student about behavior" /> 
     <CFARGUMENT NAME="advTalkedToStudent" TYPE="NUMERIC" REQUIRED="true" 
            DEFAULT= 0 HINT="Advisor talked to student about behavior" /> 
     <CFARGUMENT NAME="assignedTo" TYPE="NUMERIC" REQUIRED="true" 
            DEFAULT= 0 HINT="I am the  assigned to ID" />    
     <CFARGUMENT NAME="assignedDate" TYPE="DATE" REQUIRED="true" 
            DEFAULT="" HINT="I am the  assigned date" />
     <CFARGUMENT NAME="advisorID" TYPE="NUMERIC" REQUIRED="true" 
            DEFAULT= 0 HINT="I am the  course id" />    
	 <CFARGUMENT NAME="advisorNote" TYPE="string" REQUIRED="true" 
             DEFAULT="" HINT="I am the advisor note" />
     <CFARGUMENT NAME="advStatus" TYPE="NUMERIC" REQUIRED="true" 
            DEFAULT= 0 HINT="I am the advisor status" />                  
     <CFARGUMENT NAME="courseID" TYPE="NUMERIC" REQUIRED="true" 
            DEFAULT= 0 HINT="I am the  course id" />    
      <CFARGUMENT NAME="instructorID" TYPE="NUMERIC" REQUIRED="true" 
            DEFAULT= 0 HINT="I am the  instructor id" />    
     <CFARGUMENT NAME="weekID" TYPE="NUMERIC" REQUIRED="true" 
            DEFAULT= 0 HINT="I am the  week id" />    
     <CFARGUMENT NAME="studentID" TYPE="NUMERIC" REQUIRED="true" 
            DEFAULT= 0 HINT="I am the  student id" />    
     <CFARGUMENT NAME="gradeLevelID" TYPE="NUMERIC" REQUIRED="true" 
            DEFAULT= 0 HINT="I am the grade level id" />    
     <CFARGUMENT NAME="majorID" TYPE="NUMERIC" REQUIRED="true" 
            DEFAULT= 0 HINT="I am the  major id" />    
     <CFARGUMENT NAME="termCodeID" TYPE="NUMERIC" REQUIRED="true" 
            DEFAULT= 0 HINT="I am the  termCodeID" />    
                 
        <cfscript>
			setID (arguments.iD);
			setInputDate(arguments.inputDate);
			setInstructorMemo(arguments.instructorMemo);
			setAbsence(arguments.absence);
			setTardiness(arguments.tardiness);
			setPoorQualityWork(arguments.poorQualityWork);
			setMissingWork(arguments.missingWork);
			setNotPrepared(arguments.notPrepared);
			setBehavior(arguments.behavior);
			setPersonal(arguments.personal);
			setFinancial(arguments.financial);
			setDrugsAlcohol(arguments.drugsAlcohol);
			setPlagiarism(arguments.plagiarism);
			setFamilyIssues(arguments.familyIssues);
			setTransportation(arguments.transportation);
			setChildCare(arguments.childCare);	
			setOther(arguments.other);
			setInstTalkedToStudent(arguments.instTalkedToStudent);
			setAdvTalkedToStudent(arguments.advTalkedToStudent);
			setAssignedTo(arguments.assignedTo);
			setAssignedDate(arguments.assignedDate);
			setAdvisorID(arguments.advisorID);
			setAdvisorNote(arguments.advisorNote);
			setAdvStatus(arguments.advStatus);
			setCourseID(arguments.courseID);
			setInstructorID(arguments.instructorID);
			setWeekID(arguments.weekID);
			setStudentID(arguments.studentID);
			setGradeLevelID(arguments.gradeLevelID);
			setMajorID(arguments.majorID);
			setTermCodeID(arguments.termCodeID);
		</cfscript>	
		<CFRETURN this>
	</CFFUNCTION>
    
    <!--- setters / mutators --->
    <cffunction NAME="setID" ACCESS="PRIVATE" OUTPUT="false" 
       HINT="I set the  ID into the Variables.instance scope.">
    <cfargument NAME="iD" REQUIRED="true" TYPE="Numeric" 
       HINT="I am the  ID"/>
			<cfset Variables.instance.iD = arguments.iD />          
    </cffunction>
    
    <cffunction NAME="setInputDate" ACCESS="PRIVATE" OUTPUT="false" 
       HINT="I set the  input date into the Variables.instance scope.">
    <cfargument NAME="inputDate" REQUIRED="true" TYPE="DATE" 
        HINT="I am the  input date"/>
			<cfset Variables.instance.inputDate = arguments.inputDate />
    </cffunction>
    
    <cffunction NAME="setInstructorMemo" ACCESS="PRIVATE" OUTPUT="false" 
       HINT="I set the  instructor memo into the Variables.instance scope" >
    <cfargument NAME="instructorMemo" REQUIRED="true" TYPE="STRING"
        HINT="I am the instructor memo." />	
		<cfset Variables.instance.instructorMemo = arguments.instructorMemo />	
    </cffunction>
    
    <cffunction NAME="setAbsence" ACCESS="PRIVATE" OUTPUT="false"
       HINT="I set the  absence into the Variables.instance scope" >
    <cfargument NAME="absence" REQUIRED="true" TYPE="NUMERIC"
        HINT="I am the  absence flag." />	
			<cfset Variables.instance.absence = arguments.absence />	
    </cffunction>
    
     <cffunction NAME="setTardiness" ACCESS="PRIVATE" OUTPUT="false"
        HINT="I set the  Tardiness into the Variables.instance scope" >
    <cfargument NAME="tardiness" REQUIRED="true" TYPE="NUMERIC"
        HINT="I am the  Tardiness flag." />	
			<cfset Variables.instance.tardiness = arguments.tardiness />	
    </cffunction>
    
    <cffunction NAME="setPoorQualityWork" ACCESS="PRIVATE" OUTPUT="false"
        HINT="I set the  PoorQualityWork flag into the Variables.instance scope" >
    <cfargument NAME="poorQualityWork" REQUIRED="true" TYPE="NUMERIC"
        HINT="I am the  PoorQualityWork flag." />	
			<cfset Variables.instance.poorQualityWork = arguments.poorQualityWork />	
    </cffunction>
    
    <cffunction NAME="setNotPrepared" ACCESS="PRIVATE" OUTPUT="false" 
        HINT="I set the  NotPrepared into the Variables.instance scope" >
    <cfargument NAME="notPrepared" REQUIRED="true" TYPE="NUMERIC"
        HINT="I am the  NotPrepared flag." />	
			<cfset Variables.instance.notPrepared = arguments.notPrepared />	
    </cffunction>
    
    <cffunction NAME="setBehavior" ACCESS="PRIVATE" OUTPUT="false" 
       HINT="I set the  Behavior into the Variables.instance scope" >
    <cfargument NAME="behavior" REQUIRED="true" TYPE="NUMERIC"
        HINT="I am the  Behavior flag." />	
			<cfset Variables.instance.behavior = arguments.behavior />	
    </cffunction>
    
    <cffunction NAME="setPersonal" ACCESS="PRIVATE" OUTPUT="false"
        HINT="I set the  Personal into the Variables.instance scope" >
    <cfargument NAME="personal" REQUIRED="true" TYPE="NUMERIC"
        HINT="I am the  Personal flag." />	
			<cfset Variables.instance.personal = arguments.personal />	
    </cffunction>
    
    <cffunction NAME="setFinancial" ACCESS="PRIVATE" OUTPUT="false"
        HINT="I set the  Financial into the Variables.instance scope" >
    <cfargument NAME="financial" REQUIRED="true" TYPE="NUMERIC"
        HINT="I am the Financial flag." />	
			<cfset Variables.instance.financial = arguments.financial />	
    </cffunction>
    
    <cffunction NAME="setDrugsAlcohol" ACCESS="PRIVATE" OUTPUT="false"
        HINT="I set the  DrugsAlcohol into the Variables.instance scope" >
    <cfargument NAME="drugsAlcohol" REQUIRED="true" TYPE="NUMERIC"
        HINT="I am the  DrugsAlcohol flag." />	
			<cfset Variables.instance.drugsAlcohol = arguments.drugsAlcohol />	
    </cffunction>
    
    <cffunction NAME="setPlagiarism" ACCESS="PRIVATE" OUTPUT="false" 
        HINT="I set the  Plagiarism into the Variables.instance scope" >
    <cfargument NAME="plagiarism" REQUIRED="true" TYPE="NUMERIC"
        HINT="I am the  Plagiarism flag." />	
			<cfset Variables.instance.plagiarism = arguments.plagiarism />	
    </cffunction>
    
    <cffunction NAME="setFamilyIssues" ACCESS="PRIVATE" OUTPUT="false"
        HINT="I set the  FamilyIssues flag into the Variables.instance scope" >
    <cfargument NAME="familyIssues" REQUIRED="true" TYPE="NUMERIC"
        HINT="I am the family issues flag." />	
			<cfset Variables.instance.familyIssues = arguments.familyIssues />	
    </cffunction>
    
    <cffunction NAME="setTransportation" ACCESS="PRIVATE" OUTPUT="false"
        HINT="I set the  Transportation into the Variables.instance scope" >
    <cfargument NAME="transportation" REQUIRED="true" TYPE="NUMERIC"
        HINT="I am the  Transportation." />	
			<cfset Variables.instance.transportation = arguments.transportation />	
    </cffunction>
    
    <cffunction NAME="setChildCare" ACCESS="PRIVATE" OUTPUT="false" 
        HINT="I set the  ChildCare into the Variables.instance scope" >
    <cfargument NAME="childCare" REQUIRED="true" TYPE="NUMERIC"
        HINT="I am the  ChildCare flag." />	
			<cfset Variables.instance.childCare = arguments.childCare />	
    </cffunction>
    
    <cffunction NAME="setOther" ACCESS="PRIVATE" OUTPUT="false"
        HINT="I set the  other into the Variables.instance scope" >
    <cfargument NAME="other" REQUIRED="true" TYPE="NUMERIC"
        HINT="I am the  other." />	
			<cfset Variables.instance.other = arguments.other />	
    </cffunction>
    
    <cffunction NAME="setInstTalkedToStudent" ACCESS="PRIVATE" OUTPUT="false"          		          				        HINT="I set the instructor TalkedToStudent flag into the Variables.instance scope" >
    <cfargument NAME="instTalkedToStudent" REQUIRED="true" TYPE="NUMERIC"
        HINT="I am the instructor TalkedToStudent flag." />	
			<cfset Variables.instance.instTalkedToStudent = arguments.instTalkedToStudent />	
    </cffunction>
    
    <cffunction NAME="setAdvTalkedToStudent" ACCESS="PRIVATE" OUTPUT="false"          		          				        HINT="I set the advisor TalkedToStudent flag into the Variables.instance scope" >
    <cfargument NAME="advTalkedToStudent" REQUIRED="true" TYPE="NUMERIC"
        HINT="I am the advisor TalkedToStudent flag." />	
			<cfset Variables.instance.advTalkedToStudent = arguments.advTalkedToStudent />	
    </cffunction>
    
    <cffunction NAME="setAssignedTo" ACCESS="PRIVATE" OUTPUT="false"
        HINT="I set the  AssignedTo into the Variables.instance scope" >
    <cfargument NAME="assignedTo" REQUIRED="true" TYPE="NUMERIC"
        HINT="I am the  AssignedTo." />	
			<cfset Variables.instance.assignedTo = arguments.assignedTo />	
    </cffunction>
 
 	<cffunction NAME="setAssignedDate" ACCESS="PRIVATE" OUTPUT="false" 
        HINT="I set the  AssignedDate into the Variables.instance scope" >
    <cfargument NAME="assignedDate" REQUIRED="true" TYPE="DATE"
        HINT="I am the  Assigned Date." />	
			<cfset Variables.instance.assignedDate = arguments.assignedDate />	
    </cffunction>   

     <cffunction NAME="setAdvisorID" ACCESS="PRIVATE" OUTPUT="false"
        HINT="I set the  AdvisorID into the Variables.instance scope" >
    <cfargument NAME="advisorID" REQUIRED="true" TYPE="NUMERIC"
        HINT="I am the  AdvisorID." />	
			<cfset Variables.instance.advisorID = arguments.advisorID />	
    </cffunction>
    
     <cffunction NAME="setAdvisorNote" ACCESS="PRIVATE" OUTPUT="false"
        HINT="I set the  AdvisorNote into the Variables.instance scope" >
    <cfargument NAME="advisorNote" REQUIRED="true" TYPE="STRING"
        HINT="I am the  advisorNote." />	
			<cfset Variables.instance.advisorNote = arguments.advisorNote />	
    </cffunction>
    
     <cffunction NAME="setAdvStatus" ACCESS="PRIVATE" OUTPUT="false"
        HINT="I set the  Advising status into the Variables.instance scope" >
    <cfargument NAME="advStatus" REQUIRED="true" TYPE="NUMERIC"
        HINT="I am the  advising status." />	
			<cfset Variables.instance.advStatus = arguments.advStatus />	
    </cffunction>
    
    <cffunction NAME="setCourseID" ACCESS="PRIVATE" OUTPUT="false"
        HINT="I set the  CourseID into the Variables.instance scope" >
    <cfargument NAME="courseID" REQUIRED="true" TYPE="NUMERIC"
        HINT="I am the  CourseID." />	
			<cfset Variables.instance.courseID = arguments.courseID />	
    </cffunction>
    
     <cffunction NAME="setInstructorID" ACCESS="PRIVATE" OUTPUT="false" 
        HINT="I set the  InstructorID into the Variables.instance scope" >
    <cfargument NAME="instructorID" REQUIRED="true" TYPE="NUMERIC"
        HINT="I am the  InstructorID." />	
			<cfset Variables.instance.instructorID = arguments.instructorID />	
    </cffunction>
    
     <cffunction NAME="setWeekID" ACCESS="PRIVATE" OUTPUT="false" 
        HINT="I set the WeekID into the Variables.instance scope" >
    <cfargument NAME="weekID" REQUIRED="true" TYPE="NUMERIC"
        HINT="I am the  WeekID." />	
			<cfset Variables.instance.weekID = arguments.weekID />	
    </cffunction>
    
     <cffunction NAME="setStudentID" ACCESS="PRIVATE" OUTPUT="false"  
        HINT="I set the  StudentID into the Variables.instance scope" >
    <cfargument NAME="studentID" REQUIRED="true" TYPE="NUMERIC"
        HINT="I am the  StudentID." />	
			<cfset Variables.instance.studentID = arguments.studentID />	
    </cffunction>
    
     <cffunction NAME="setGradeLevelID" ACCESS="PRIVATE" OUTPUT="false" 
        HINT="I set the  LevelID into the Variables.instance scope" >
    <cfargument NAME="gradeLevelID" REQUIRED="true" TYPE="NUMERIC"
        HINT="I am the  grade LevelID." />	
			<cfset Variables.instance.gradeLevelID = arguments.gradeLevelID />	
    </cffunction>
     
    <cffunction NAME="setMajorID" ACCESS="PRIVATE" OUTPUT="false" 
        HINT="I set the  major ID into the Variables.instance scope" >
    <cfargument NAME="majorID" REQUIRED="true" TYPE="NUMERIC"
        HINT="I am the student's majorID." />	
			<cfset Variables.instance.majorID = arguments.majorID />	
    </cffunction>
 
     <cffunction NAME="setTermCodeID" ACCESS="PRIVATE" OUTPUT="false" 
        HINT="I set the  TermCodeID into the Variables.instance scope" >
    <cfargument NAME="termCodeID" REQUIRED="true" TYPE="NUMERIC"
        HINT="I am the termCodeID." />	
			<cfset Variables.instance.termCodeID = arguments.termCodeID />	
    </cffunction>

    <!--- getters / accessors --->
    <cffunction NAME="getID" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the  ID.">
    <cfreturn variables.iD />
    </cffunction>
    
    <cffunction NAME="getInputDate" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the  input date.">
    <cfreturn variables.inputDate />
    </cffunction>
    
     <cffunction NAME="getInstructorNote" ACCESS="PUBLIC" OUTPUT="false"
          HINT="I return the  instructorNote.">
    <cfreturn variables.instructorNote />
    </cffunction>
    
    <cffunction NAME="getAbsence" ACCESS="PUBLIC" OUTPUT="false" 
         HINT="I return the Absense flag">
    <cfreturn variables.absence />
    </cffunction>
    
    <cffunction NAME="getTardiness" ACCESS="PUBLIC" OUTPUT="false" 
         HINT="I return the 's tardiness flag">
    <cfreturn variables.tardiness />
    </cffunction>
    
    <cffunction NAME="getPoorQualityWork" ACCESS="PUBLIC" OUTPUT="false" 
         HINT="I return the 's poor quality work">
    <cfreturn variables.poorQuaityWork />
    </cffunction>
    
    <cffunction NAME="getMissingWork" ACCESS="PUBLIC" OUTPUT="false" 
         HINT="I return the  missing work">
    <cfreturn variables.missingWork />
    </cffunction>
    
     <cffunction NAME="getNotPrepared" ACCESS="PUBLIC" OUTPUT="false" 
         HINT="I return the  NotPrepared">
    <cfreturn variables.notPrepared />
    </cffunction>
    
     <cffunction NAME="getBehavior" ACCESS="PUBLIC" OUTPUT="false" 
         HINT="I return the  Behavior">
    <cfreturn variables.behavior />
    </cffunction>
    
     <cffunction NAME="getPersonal" ACCESS="PUBLIC" OUTPUT="false" 
         HINT="I return the  Personal">
    <cfreturn variables.personal />
    </cffunction>
    
     <cffunction NAME="getFinancial" ACCESS="PUBLIC" OUTPUT="false" 
         HINT="I return the  Financial">
    <cfreturn variables.financial />
    </cffunction>
    
     <cffunction NAME="getDrugsAlcohol" ACCESS="PUBLIC" OUTPUT="false" 
         HINT="I return the  DrugsAlcohol">
    <cfreturn variables.drugsAlcohol />
    </cffunction>
    
     <cffunction NAME="getPlagiarism" ACCESS="PUBLIC" OUTPUT="false" 
         HINT="I return the  Plagiarism">
    <cfreturn variables.plagiarism />
    </cffunction>
    
    <cffunction NAME="getFamilyIssues" ACCESS="PUBLIC" OUTPUT="false" 
         HINT="I return the family issues flag">
    <cfreturn variables.familyIssues />
    </cffunction>
    
    <cffunction NAME="getTransportation" ACCESS="PUBLIC" OUTPUT="false" 
         HINT="I return the  Transportation flag">
    <cfreturn variables.transportation />
    </cffunction>
    
     <cffunction NAME="getChildCare" ACCESS="PUBLIC" OUTPUT="false" 
         HINT="I return the  ChildCare flag">
    <cfreturn variables.childCare />
    </cffunction>
    
     <cffunction NAME="getOther" ACCESS="PUBLIC" OUTPUT="false" 
         HINT="I return the  Other flag">
    <cfreturn variables.other />
    </cffunction>
    
     <cffunction NAME="getInstTalkedToStudent" ACCESS="PUBLIC" OUTPUT="false" 
         HINT="I return the instructor TalkedToStudent flag">
    <cfreturn variables.instTalkedToStudent />
    </cffunction>
    
     <cffunction NAME="getAdvTalkedToStudent" ACCESS="PUBLIC" OUTPUT="false" 
         HINT="I return the advisor TalkedToStudent flag">
    <cfreturn variables.advTalkedToStudent />
    </cffunction>
    
     <cffunction NAME="getAssignedTo" ACCESS="PUBLIC" OUTPUT="false" 
         HINT="I return the  AssignedTo">
    <cfreturn variables.assignedTo />
    </cffunction>
    
     <cffunction NAME="getAssignedDate" ACCESS="PUBLIC" OUTPUT="false" 
         HINT="I return the  AssignedDate">
    <cfreturn variables.assignedDate />
    </cffunction>
    
     <cffunction NAME="getAdvisorID" ACCESS="PUBLIC" OUTPUT="false" 
         HINT="I return the  AdvisorID">
    <cfreturn variables.advisorID />
    </cffunction>
    
     <cffunction NAME="getAdvisorNote" ACCESS="PUBLIC" OUTPUT="false" 
         HINT="I return the  AdvisorNote">
    <cfreturn variables.advisorNote />
    </cffunction>
    
     <cffunction NAME="getAdvStatus" ACCESS="PUBLIC" OUTPUT="false" 
         HINT="I return the  Advising status">
    <cfreturn variables.advStatus />
    </cffunction>
    
     <cffunction NAME="getCourseID" ACCESS="PUBLIC" OUTPUT="false" 
         HINT="I return the  CourseID">
    <cfreturn variables.courseID />
    </cffunction>
    
     <cffunction NAME="getInstructorID" ACCESS="PUBLIC" OUTPUT="false" 
         HINT="I return the  InstructorID">
    <cfreturn variables.instructorID />
    </cffunction>
    
     <cffunction NAME="getWeekID" ACCESS="PUBLIC" OUTPUT="false" 
         HINT="I return the  WeekID">
    <cfreturn variables.weekID />
    </cffunction>
    
     <cffunction NAME="getStudentID" ACCESS="PUBLIC" OUTPUT="false" 
         HINT="I return the  StudentID">
    <cfreturn variables.studentID />
    </cffunction>
    
     <cffunction NAME="getGradeLevelID" ACCESS="PUBLIC" OUTPUT="false" 
         HINT="I return the grade LevelID">
    <cfreturn variables.gradeLevelID />
    </cffunction>
    
     <cffunction NAME="getMajorID" ACCESS="PUBLIC" OUTPUT="false" 
         HINT="I return the  MajorID">
    <cfreturn variables.majorID />
    </cffunction>
    
     <cffunction NAME="getTermCodeID" ACCESS="PUBLIC" OUTPUT="false" 
         HINT="I return the TermCodeID">
    <cfreturn variables.termCodeID />
    </cffunction>
    
    <!--- utility --->
    <cffunction NAME="getMemento" ACCESS="PUBLIC" OUTPUT="NO" HINT="I return a dumped struct of the Variables.instance scope">
    <cfreturn Variables.instance />
    </cffunction>
    
</CFCOMPONENT>