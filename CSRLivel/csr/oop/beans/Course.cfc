<CFCOMPONENT DISPLAYNAME="Course" OUTPUT="false" HINT="I am the  Course class">
<cfproperty NAME = "iD" TYPE="NUMERIC" DEFAULT= 0 />
<cfproperty name = "classSchedDescrip" TYPE="STRING" DEFAULT="" />
<cfproperty name = "code" TYPE="STRING" DEFAULT="" />
<cfproperty name = "courseCode" TYPE="STRING" DEFAULT="" />
<cfproperty name = "courseDescrip" TYPE="STRING" DEFAULT="" />
<cfproperty name = "adClassSchedID" TYPE="STRING" DEFAULT="" />
<cfproperty name = "roomNumber" TYPE="STRING" DEFAULT="" />
<cfproperty name = "cSection" TYPE="STRING" DEFAULT="" />
<cfproperty name = "buildingID" TYPE="NUMERIC" DEFAULT="" />
<cfproperty name = "startTimeID" TYPE="NUMERIC" DEFAULT="" />
<cfproperty name = "endTimeID" TYPE="NUMERIC" DEFAULT="" />
<cfproperty name = "daysID" TYPE="NUMERIC" DEFAULT="" />
<cfproperty name = "day_orderID" TYPE="NUMERIC" DEFAULT="" />
<cfproperty name = "classStartID" TYPE="NUMERIC" DEFAULT="" />
<cfproperty name = "classEndID" TYPE="NUMERIC" DEFAULT="" />
<cfproperty name = "termCodeID" TYPE="NUMERIC" DEFAULT="" />
<cfproperty name = "teacherID" TYPE="NUMERIC" DEFAULT="" />

<!---  Pseudo-constructor --->
<cfset Variables.instance = structNew()>
	<cfset Variables.instance.iD = 0 />
	<cfset Variables.instance.classSchedDescrip = '' />
    <cfset Variables.instance.code = '' />
    <cfset Variables.instance.courseCode = '' />
    <cfset Variables.instance.courseDescrip = '' />
    <cfset Variables.instance.adClassSchedID = '' />        
    <cfset Variables.instance.roomNumber = '' />    
    <cfset Variables.instance.cSection = '' />       
    <cfset Variables.instance.buildingID = '' />
    <cfset Variables.instance.startTimeID = '' />
    <cfset Variables.instance.endTimeID = '' />    
    <cfset Variables.instance.daysID = '' /> 
    <cfset Variables.instance.day_orderID = '' />
    <cfset Variables.instance.classStartID = '' />
    <cfset Variables.instance.classEndID = '' />
    <cfset Variables.instance.termCodeID = '' /> 
    <cfset Variables.instance.teacherID = '' />    
    
	<CFFUNCTION NAME="init" ACCESS="public"  OUTPUT="false" RETURNTYPE="any" 
    		HINT= "I am the constructor method for the All Course class">
    	<cfargument NAME="iD" TYPE="NUMERIC" REQUIRED="true" DEFAULT = 0 
        	HINT="I am the  ID" />
		<CFARGUMENT NAME="classSchedDescrip" TYPE="string" REQUIRED="true" DEFAULT="" 
        	HINT="I am the scheduling name for the class" />
		<CFARGUMENT NAME="code" TYPE="string" REQUIRED="true" 
             DEFAULT="" HINT="I am the Course's code" />
        <CFARGUMENT NAME="courseCode" TYPE="string" REQUIRED="true" 
            DEFAULT="" HINT="I am the Course's courseCode" />
        <CFARGUMENT NAME="courseDescrip" TYPE="string" REQUIRED="true" 
            DEFAULT="" HINT="I am an additional name for the class" />
      	<CFARGUMENT NAME="adClassSchedID" TYPE="string" REQUIRED="true"         
            DEFAULT="" HINT="I am the Class's identification number (school provided)" /> 
      	<CFARGUMENT NAME="roomNumber" TYPE="string" REQUIRED="true"         
            DEFAULT="" HINT="I am the room where the class meets" /> 
      	<CFARGUMENT NAME="cSection" TYPE="string" REQUIRED="true"         
            DEFAULT="" HINT="I am the Class's section" /> 
         <CFARGUMENT NAME="buildingID" TYPE="NUMERIC" REQUIRED="true" 
            DEFAULT="" HINT="I am the building where the class meets" />
         <CFARGUMENT NAME="startTimeID" TYPE="NUMERIC" REQUIRED="true" 
            DEFAULT="" HINT="I am the start time for the class" />
         <CFARGUMENT NAME="endTimeID" TYPE="NUMERIC" REQUIRED="true" 
            DEFAULT="" HINT="I am the end time for the class" />
         <CFARGUMENT NAME="daysID" TYPE="NUMERIC" REQUIRED="true" 
            DEFAULT="" HINT="I am the days for the class" />
         <CFARGUMENT NAME="day_orderID" TYPE="NUMERIC" REQUIRED="true" 
            DEFAULT="" HINT="I am the day order code for the class" />
      	<CFARGUMENT NAME="classStartID" TYPE="NUMERIC" REQUIRED="true"         
            DEFAULT="" HINT="I am the Class's start date" /> 
      	<CFARGUMENT NAME="classEndID" TYPE="NUMERIC" REQUIRED="true"         
            DEFAULT="" HINT="I am the Class's end date" /> 
       	<CFARGUMENT NAME="termCodeID" TYPE="NUMERIC" REQUIRED="true"         
            DEFAULT="" HINT="I am the Class's termcode" /> 
     	<CFARGUMENT NAME="teacherID" TYPE="NUMERIC" REQUIRED="true"         
            DEFAULT="" HINT="I am the Class's teacher" /> 
            
        <cfscript>
			setID (arguments.iD);
			setClassSchedDescrip(arguments.classSchedDescrip);
			setCode(arguments.code);
			setCourseCode(arguments.courseCode);
			setCourseDescrip(arguments.courseDescrip);
			setAdClassSchedID(arguments.adClassSchedID);			
			setRoomNumber(arguments.roomNumber);
			setCSection(arguments.cSection);						
			setBuildingID(arguments.buildingID);
			setStartTimeID(arguments.startTimeID);
			setendTimeID(arguments.endTimeID);
			setDaysID(arguments.daysID);
			setDay_orderID(arguments.day_orderID);
			setClassStartID(arguments.classStartID);			
			setClassEndID(arguments.classEndID);			
			setTermCodeID(arguments.termCodeID);			
			setTeacherID(arguments.teacherID);			
			
		</cfscript>
		<CFRETURN this>
	</CFFUNCTION>
    
    <!--- setters / mutators --->
    <cffunction NAME="setID" ACCESS="PRIVATE" OUTPUT="false" 
       HINT="I set the ID into the Variables.instance scope.">
    <cfargument NAME="iD" REQUIRED="true" TYPE="Numeric" 
       HINT="I am the  ID"/>
			<cfset Variables.instance.iD = arguments.iD />          
    </cffunction>
    
    <cffunction NAME="setClassSchedDescrip" ACCESS="PRIVATE" OUTPUT="false" 
       HINT="I set the  Course scheduling name into the Variables.instance scope.">
    <cfargument NAME="classSchedDescrip" REQUIRED="true" TYPE="STRING" 
        HINT="I am the  Course scheduling name"/>
			<cfset Variables.instance.classSchedDescrip = arguments.classSchedDescrip />
    </cffunction>
    
    <cffunction NAME="setCode" ACCESS="PRIVATE" OUTPUT="false" 
       HINT="I set the Course's code into the Variables.instance scope" >
    <cfargument NAME="code" REQUIRED="true" TYPE="STRING"
        HINT="I am the course's code." />	
			<cfset Variables.instance.code = arguments.code />	
    </cffunction>

     <cffunction NAME="setCourseCode" ACCESS="PRIVATE" OUTPUT="false" 
        HINT="I set the Course's course code into the Variables.instance scope" >
    <cfargument NAME="courseCode" REQUIRED="true" TYPE="STRING"
        HINT="I am the Course's course code." />	
			<cfset Variables.instance.courseCode = arguments.courseCode />	
    </cffunction>
   
    <cffunction NAME="setCourseDescrip" ACCESS="PRIVATE" OUTPUT="false" 
        HINT="I set the Course's descriptive name into the Variables.instance scope" >
    <cfargument NAME="courseDescrip" REQUIRED="true" TYPE="STRING"
        HINT="I am the Course's descriptive name." />	
			<cfset Variables.instance.courseDescrip = arguments.courseDescrip />	
    </cffunction>
    
    <cffunction NAME="setAdClassSchedID" ACCESS="PRIVATE" OUTPUT="false" 
        HINT="I set the Class's school id number the Variables.instance scope" >
    <cfargument NAME="adClassSchedID" REQUIRED="true" TYPE="STRING"
        HINT="I am the Class's school Id number." />	
			<cfset Variables.instance.adClassSchedID = arguments.adClassSchedID />	
    </cffunction>
    
    <cffunction NAME="setRoomNumber" ACCESS="PRIVATE" OUTPUT="false" 
        HINT="I set the room in the Variables.instance scope" >
    <cfargument NAME="roomNumber" REQUIRED="true" TYPE="STRING"
        HINT="I am the room the class is held in." />	
			<cfset Variables.instance.roomNumber = arguments.roomNumber />	
    </cffunction>

     <cffunction NAME="setCSection" ACCESS="PRIVATE" OUTPUT="false" 
        HINT="I set the Class's section the Variables.instance scope" >
    <cfargument NAME="cSection" REQUIRED="true" TYPE="STRING"
        HINT="I am the Class's section." />	
			<cfset Variables.instance.cSection = arguments.cSection />	
    </cffunction>
    
    <cffunction NAME="setBuildingID" ACCESS="PRIVATE" OUTPUT="false" 
        HINT="I set the class's building into the Variables.instance scope" >
    <cfargument NAME="buildingID" REQUIRED="true" TYPE="numeric"
        HINT="I am the building the class is in." />	
			<cfset Variables.instance.buildingID = arguments.buildingID />	
    </cffunction>
    
    <cffunction NAME="setStartTimeID" ACCESS="PRIVATE" OUTPUT="false" 
        HINT="I set the start time into the Variables.instance scope" >
    <cfargument NAME="startTimeID" REQUIRED="true" TYPE="numeric"
        HINT="I am the class's start time." />	
			<cfset Variables.instance.startTimeID = arguments.startTimeID />	
    </cffunction>

    <cffunction NAME="setEndTimeID" ACCESS="PRIVATE" OUTPUT="false" 
        HINT="I set the end time into the Variables.instance scope" >
    <cfargument NAME="endTimeID" REQUIRED="true" TYPE="numeric"
        HINT="I am the class's end time." />	
			<cfset Variables.instance.endTimeID = arguments.endTimeID />	
    </cffunction>

    <cffunction NAME="setDaysID" ACCESS="PRIVATE" OUTPUT="false" 
        HINT="I set the days into the Variables.instance scope" >
    <cfargument NAME="daysID" REQUIRED="true" TYPE="numeric"
        HINT="I am the class's days." />	
			<cfset Variables.instance.daysID = arguments.daysID />	
    </cffunction>

    <cffunction NAME="setDay_orderID" ACCESS="PRIVATE" OUTPUT="false" 
        HINT="I set the day order into the Variables.instance scope" >
    <cfargument NAME="day_orderID" REQUIRED="true" TYPE="numeric"
        HINT="I am the class's day_order." />	
			<cfset Variables.instance.day_orderID = arguments.day_orderID />	
    </cffunction>
    
    <cffunction NAME="setClassStartID" ACCESS="PRIVATE" OUTPUT="false" 
        HINT="I set the Class's start date the Variables.instance scope" >
    <cfargument NAME="classStartID" REQUIRED="true" TYPE="numeric"
        HINT="I am the Class's start date." />	
			<cfset Variables.instance.classStartID = arguments.classStartID />	
    </cffunction>
    
    <cffunction NAME="setClassEndID" ACCESS="PRIVATE" OUTPUT="false" 
        HINT="I set the Class's end date the Variables.instance scope" >
    <cfargument NAME="classEndID" REQUIRED="true" TYPE="numeric"
        HINT="I am the Class's end date." />	
			<cfset Variables.instance.classEndID = arguments.classEndID />	
    </cffunction>
    
    <cffunction NAME="setTermCodeID" ACCESS="PRIVATE" OUTPUT="false" 
        HINT="I set the Class's term code the Variables.instance scope" >
    <cfargument NAME="termCodeID" REQUIRED="true" TYPE="numeric"
        HINT="I am the Class's termCode." />	
			<cfset Variables.instance.termCodeID = arguments.termCodeID />	
    </cffunction>
    
    <cffunction NAME="setTeacherID" ACCESS="PRIVATE" OUTPUT="false" 
        HINT="I set the Class's teacher the Variables.instance scope" >
    <cfargument NAME="teacherID" REQUIRED="true" TYPE="numeric"
        HINT="I am the Class's termCode." />	
			<cfset Variables.instance.teacherID = arguments.teacherID />	
    </cffunction>
    
    <!--- getters / accessors --->
    <cffunction NAME="getID" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the  ID.">
    <cfreturn Variables.instance.iD />
    </cffunction>
 
     <cffunction NAME="getClassSchedDescrip" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the Course's scheduling name.">
    <cfreturn Variables.instance.classSchedDescrip />
    </cffunction>

    <cffunction NAME="getCode" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the Courses code.">
    <cfreturn Variables.instance.code />
    </cffunction>
   
    <cffunction NAME="getCourseCode" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the Course's courseCode.">
    <cfreturn Variables.instance.courseCode />
    </cffunction>
    
    <cffunction NAME="getCourseDescrip" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the Course's descriptive name.">
    <cfreturn Variables.instance.courseDescrip />
    </cffunction>
    
    <cffunction NAME="getAdClassSchedID" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the Class's school ID number.">
    <cfreturn Variables.instance.adClassSchedID />
    </cffunction>
           
    <cffunction NAME="getCSection" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the Class's section.">
    <cfreturn Variables.instance.cSection />
    </cffunction>
              
    <cffunction NAME="getRoomNumber" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the class's room number.">
    <cfreturn Variables.instance.roomNumber />
    </cffunction>

    <cffunction NAME="getBuildingID" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the building street number.">
    <cfreturn Variables.instance.buildingID />
    </cffunction>

    <cffunction NAME="getStartTimeID" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the class start time.">
    <cfreturn Variables.instance.startTimeID />
    </cffunction>
   
    <cffunction NAME="getEndTimeID" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the class end time.">
    <cfreturn Variables.instance.endTimeID />
    </cffunction>
   
    <cffunction NAME="getDaysID" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the class days.">
    <cfreturn Variables.instance.daysID />
    </cffunction>
   
    <cffunction NAME="getDay_orderID" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the class's day order code.">
    <cfreturn Variables.instance.day_orderID />
    </cffunction>

    <cffunction NAME="getClassStartID" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the Class's start date.">
    <cfreturn Variables.instance.classStartID />
    </cffunction>
           
    <cffunction NAME="getClassEndID" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the Class's end date.">
    <cfreturn Variables.instance.classEndID />
    </cffunction>
           
     <cffunction NAME="getTermCodeID" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the Class's term code.">
    <cfreturn Variables.instance.termCodeID />
    </cffunction>
           
   <cffunction NAME="getTeacherID" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the Class's teacher.">
    <cfreturn Variables.instance.teacherID />
    </cffunction>
           
    <!--- utility --->
    <cffunction NAME="getMemento" ACCESS="PUBLIC" OUTPUT="NO" HINT="I return a dumped struct of the Variables.instance scope">
    <cfreturn Variables.instance />
    </cffunction>
    
</CFCOMPONENT>