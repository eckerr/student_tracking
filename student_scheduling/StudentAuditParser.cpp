// StudentAudit.cpp : Defines the entry point for the console application.

#include "stdafx.h"
#include <fstream>
#include <iostream>
#include <string>
#include <io.h>
using namespace std;



int _tmain(int argc, _TCHAR* argv[])
{
	char fileName[80]; //filename being worked on
	string myReadBuffer = ""; //buffer to hold line being parsed
	string cPrefix = "";   //alpha course prefix
	string cNumPart = "";  // number course suffix
	string stuStat;        // student status (freshman, sophmore, junior, senior
	string fileSuffixAuditRecsT = "AuditRecsT"; //class records for students
    string fileSuffixStudentTabT = "StudentTabT"; // student name and completed course counts
	string fileSuffixStudentTabStats = "StudentTabStats";

	bool bFirstStudent = 1;

	bool bCommaFound = 0; //seperator of student's last and first name
	int flagDone = 0; // class is completed
	int perComp = 0; // percentage of coursework completed
	int MCN = 30; // number of major courses needed to graduate
	int GCN = 15;  // gen ed courses needed to graduate
	int majNeed = 0; // total major needed
	int genNeed = 0; // total gen ed needed
	int totNeed = 0; // total classes remaining

	// counters

	int i;
	int compNGECount = 0; //number of major courses completed
	int compGECount = 0; //number of gen ed courses completed
    int inprogCount = 0; //number of courses in progress this term
	int doneCount = 0; //number of completed courses
	int totStuCount = 0; //total students
	int totRecCount = 0; //total audit records

//---------------------------------------------------------------------------------------------------
	//  initialize student record items
	string stuID = "      ";
	string stuName = "";
	string StuLastName = "";
	string StuFirstName = "";
	string schProgram = "";
	string majorID= "";
	string majorName = "";
	string GenSav = ""; //code for Gen ed class if first 2 of 5 class has already been taken
	int DayEv = 0; // day or evening student
	int M2L = 0; // math 200 level complete flag
	int H2L = 0; // humanities 200 level complete flag
	int F2L = 0; // fine arts 200 level complete flag
	int S2L = 0; // science 200 level complete flag
	int L3L = 0; // life science 300 level complete flag
	int F3L = 0; // fine arts 300 level complete flag
	int S3L = 0; // science 300 level complete flag
//----------------------------------------------------------------------------------------------------
	//  initialize course record items
	string cSpecial = ""; 
	string cCode = "";  //course code
	string cName = "";  //course name
	string cDone = "";  //course completed
	string cDate = "";  //course completion date
	string cGrade = "";
//-----------------------------------------------------------------------------------------------------
	

	/**************************************************************/
	/* open file to parse                                         */
	/**************************************************************/
	char buffer[255];   // for user input
	cout << "File name: ";
	cin >> fileName;

	ifstream fin(fileName);    // open file for reading
	cout << "Here's what is found in the file:\n";

	/**************************************************************/
	/* open files for output                                         */
	/**************************************************************/

	ofstream foutART((fileName + fileSuffixAuditRecsT)); // open for writing audit recores


    ofstream foutSTS((fileName + fileSuffixStudentTabStats)); // open for writing of class counts
	foutSTS << "Temporary count summary file...\n";

	ofstream foutSTT((fileName + fileSuffixStudentTabT)); // open for writing of student names and completed counts


    int myCount = 0;
	int charCount = 0;
	char ch;
// initialize buffer counts
	myCount = 0;
	charCount = 0;

	int lineCount = 200;

	// get first character -- newline
	fin.get(ch);
// Main Loop - continue until all records are read
    //	while (!_eof(fin))
	// Loop through the entire file
	while (fin)
	{
		// read one character at a time until entire line read (as long as there is a character to read and not end of line)
	 while (fin.get(ch) && (ch != 10))
	 {
			myReadBuffer = myReadBuffer + ch;
		   	}

	 // line is in read buffer - see if the line is important to us
	 // search for the word "Major:" and note its starting point (Major line means this is new student record)
	 size_t nOffset = myReadBuffer.find("Major:", 0);
	
	 //  maybe use Case Statement to file course lines?
	 // search for 7 blank spaces located after column 9 and note their starting point
	 // we will use this info later to identify a course line for the auditrecs
	 size_t courseOffset = myReadBuffer.find("      ", 9);

    // lines that are shorter than 56 characters long are unimportant to us so clear buffer and read a new line
	if (myReadBuffer.length() <= 56) // skip short lines (includes blank lines)
		{
			myReadBuffer="";
			lineCount--;
		}
	//  any line that are divider lines
	//			check second character to see if it is - or =
	// this would mean the line is simply a divider line on the page, so ignore it
	else if ((myReadBuffer[1] == 45) || (myReadBuffer[1] == 61)) // uses - or =
			{
		    lineCount--;
			myReadBuffer = "";
			}
	   // if the line contains "Major:" at column 44, this is a line we need and denotes we are working on a new student
	   else if (nOffset == 44) // Major: line
	      {
			  if (bFirstStudent)
			  {
				  // if this is the first student, there is nothing yet to output
				  // flag that after this we need to output student records
			        bFirstStudent = 0;
			  }
			  else // write student info and counts and clear student variables for new student
			  {
				  // compute student's counts, determine percent complete and set student status
				 doneCount = (compNGECount + compGECount);
					perComp = doneCount/4;
				 if (doneCount < 12)
						stuStat = "Freshman";
				else if (doneCount < 24)
						stuStat = "Sophmore";
				else if (doneCount < 36)
						stuStat = "Junior";
				else if (doneCount < 45)
						stuStat = "Senior";

				 // count the student and write the student record
			    totStuCount++;
			    majNeed = (MCN - compNGECount);
			    genNeed = (GCN - compGECount);
			    totNeed = (majNeed + genNeed);
					/**************************************************************/
					/* output to student files                                         */
					/**************************************************************/

	           foutSTS << stuID << " " << stuName << " Total need:" << totNeed << " Major need:" << majNeed << " GEN need:" << genNeed << " " << stuStat << " Q"<< perComp << " Major:" << compNGECount << " GEN:" << compGECount << " inprog:" << inprogCount<< "\n";
		       foutSTT << "('" << stuID << "', '"<< StuLastName << "', '"<< StuFirstName <<"', " << DayEv << ", " << totNeed <<", " << majNeed <<  ", "<< genNeed << ", '"<< stuStat << "', " << perComp << ", "<< compNGECount << ", "<< compGECount << ", " << inprogCount <<", '"
				   << majorID <<"', '" << schProgram <<"', "<< M2L <<", "<< H2L <<", "<< F2L <<", "<< S2L <<", "<< L3L <<", "<< F3L <<", "<< S3L <<", '" << GenSav <<"'),"<< endl;
			  
	           
	            // reset counters and values for next student
			    compNGECount = 0;
	            compGECount = 0;
                inprogCount = 0;
                stuID = "";
                stuName = "";
                StuLastName = "";
                StuFirstName = "";
	            schProgram = "";
	            majorID= "";
	            majorName = "";
				DayEv = 0;
				M2L = 0;
				H2L = 0;
				F2L = 0;
				S2L = 0;
				L3L = 0;
				F3L = 0;
				S3L = 0;
				GenSav = "";
				totNeed = 0;
				majNeed = 0;
				genNeed = 0;
			  }

	      lineCount--;
	      cout << myReadBuffer << "\n";
		 /**************************************************************/
	     /* collect data on this student                               */
		 /* info found on this line and the next                       */
	     /**************************************************************/

	      int i;
	      stuID = "";// extract student ID number
	      for (i = 18;i < 24 ;i++)
	      stuID = stuID + myReadBuffer[i];


	      schProgram = ""; // extract school program
	      for (i = 36;i < 40 ;i++)
	      schProgram = schProgram + myReadBuffer[i];



	      majorID = ""; // extract major ID
	      for (i = 52;i < 56 ;i++)
	      majorID = majorID + myReadBuffer[i];


		  // Is this an evening student?
		  if (majorID[3] == 69) // has an "E" as the fourth character
			  DayEv = 1;
		  else
			  DayEv = 0;


	      majorName = ""; // extract Major Name
	      for (i = 57;i < 79 ;i++)
	      majorName = majorName + myReadBuffer[i];


	      nOffset = 0;
	      myReadBuffer = "";
		  // read name line (immediately follows Major Line)
	 	    while (fin.get(ch) && (ch != 10))
		    {
			myReadBuffer = myReadBuffer + ch;
		   	}
			cout << myReadBuffer << "\n";


		    stuName ="";// extract student Name
	            // Can be anywhere on the line from 10 thru 42
				{
	           for (i = 10; i < 43 ;i++)
	           stuName = stuName + myReadBuffer[i];
	           cout << "Student Name: " << stuName << "\n";
	           myReadBuffer = "";
			}
             // student name parsed, now need to seperate first name from last name
                 bCommaFound = 0;
                 for (i = 0; i < 32; i++)
                    {   if (stuName[i] == ',')
                          { bCommaFound = 1;
				            i++;
				            continue;
                          }
                         else if (bCommaFound)
							         if (stuName[i] == 39)
                                      StuFirstName = StuFirstName + '\'' + '\'';
									 else
									  StuFirstName = StuFirstName + stuName[i];
                              else if (stuName[i] != ' ')
								    if (stuName[i] == 39)
                                      StuLastName = StuLastName + '\'' + '\'';
									else
					                  StuLastName = StuLastName + stuName[i];
	              }
             }
			 	/**********************************************************************************/
	            /* line containing course information has 7 blank spaces from columns 16-22       */
				/* therefore, courseOffset must be 15 for the 7 spaces. Columns 9-14 are blank if */
			    /* this course does not count toward their degree, check if column 12 is a space  */
	            /**********************************************************************************/

			     // the lines with the course information have 7 blank spaces located at columns 16-22
	     else if ( myReadBuffer[12] != ' ' && (courseOffset == 15 || courseOffset == 14)) // These might be the lines we want - course data
			 // check to be sure these are not 'courses not counted in major, if so, no course ID in 9-14
	      {

              // I don't know what this column means, so lets carry it forward just in case
			  cSpecial = "";// extract course Special
			  for (i = 15; i < 17 ;i++)
	          cSpecial = cSpecial + myReadBuffer[i];



			  cCode = "";// extract course code  - 1/21/13 add 1 character to allow 7 characters
			  for (i = 9; i < 16 ;i++)
	          cCode = cCode + myReadBuffer[i];


			  cName = "";// extract course name
			  for (i = 22; i < 48 ;i++)
	          cName = cName + myReadBuffer[i];


              cDone = "";// extract course Done
			  for (i = 49; i < 58 ;i++)
	          cDone = cDone + myReadBuffer[i];

			  // if course is not complete (character is "_")set flag
			  if (cDone[1] == 95)
			    flagDone = 0;
		      else
			    flagDone = 1;

              cDate = "";// extract course Date
			  for (i = 62; i < 66 ;i++)
	          cDate = cDate + myReadBuffer[i];


              cGrade = "";// extract course Grade
			  for (i = 76; i < 78 ;i++)
	          cGrade = cGrade + myReadBuffer[i];

	/**************************************************************/
	/* Course decoded                                             */
    /* need to flag Gen Ed elective courses                       */
	/**************************************************************/


			  // course decoded - update counts and  write record to file

			  // check if course is done
			  if ((cDone != "_________") && (cDone !="         "))
							  {


//				course is done, now we need to decide if it is a GEN ED class and which electives it relates to
				  cPrefix = "";
				 for (i=0; i < 3 ; i++)
					 cPrefix = cPrefix + cCode[i];
				 // don't count if it is transitional gen ed class
				 if ((cPrefix == "GEN") && (cCode[3] != 48))
					 {// it is a GEN ED class so add it to the completed count
				    compGECount++;

				     // now find out which elective classes it satisfies
				     // parse the number part from cCode
				     cNumPart = "";
				     for (i=3; i < 6 ; i++)
						 cNumPart = cNumPart + cCode[i];
					 // see if it is Mathematics 200 level
					 if (cNumPart == "250" || cNumPart == "253" ||cNumPart == "257")
						 M2L = M2L + 1;
					 // maybe Humanities 200 level
					 else if (cNumPart == "223" || cNumPart == "225" ||cNumPart == "228" || cNumPart == "230" ||cNumPart == "231")
						 H2L = H2L + 1;
					    // maybe Fine Arts 200 level
					    else if (cNumPart == "211" || cNumPart == "212")
							F2L = F2L + 1;
					    // Social Science 200 level
					      else if (cNumPart == "241" || cNumPart == "244" || cNumPart == "247" || cNumPart == "248")
							     {S2L = S2L + 1;
						          // two required, so save the name of the class taken (if only one taken, last class taken otherwise)
						          GenSav = cPrefix + cNumPart;}
						// Life and Physical Sciences 300 level
						   else if (cNumPart == "360" || cNumPart == "380")
							   L3L = L3L + 1;
						      
						   // Fine Arts and Humanities
						     else if (cNumPart == "310" || cNumPart == "325" || cNumPart == "329")
								 F3L = F3L + 1;
			
						   // Social Sciences 300 level
						      else if (cNumPart == "340" || cNumPart == "345")
								  S3L= S3L + 1;
				 }
				 else if (cDone[2] != '0') // don't count transitional classes (0 hundred level)
				  compNGECount++;

				 if (cGrade == "IP")
					 inprogCount++;
                }  

			  if (cDone !="         ")
			  {
				   // count the record and write to audit records file
			    totRecCount++;
			  foutART << "('" << stuID << "', '" << schProgram <<  "', '" << majorID << "', ";
			  foutART << "'" << cSpecial << "', '" << cCode << "', '" << cDone << "', "<< flagDone << ", '" << cDate << "', '" << cGrade << "')," << endl;
			  }

			  // student record items
	string stuID = "      ";
	string stuName = "";
	string schProgram = "";
	string majorID= "";
	string majorName = "";

              // reset strings
              cSpecial = "";
			  cCode ="";
			  cName = "";
			  cDone = "";
		      cDate = "";
	          cGrade = "";


			courseOffset = 0;
			lineCount--;
			myReadBuffer = "";
	      }
		   else
	        {
				lineCount--;

				myReadBuffer = "";

			}
	}

	
	// output last student's counts
	 doneCount = (compNGECount + compGECount);
	 perComp = doneCount/4;
	 if (doneCount < 12)
		 stuStat = "Freshman";
	 else if (doneCount < 24)
		 stuStat = "Sophmore";
	 else if (doneCount < 36)
		 stuStat = "Junior";
	 else if (doneCount < 45)
		 stuStat = "Senior";

	 // last student, count and write output
	     totStuCount++;
		 majNeed = (MCN - compNGECount);
		 genNeed = (GCN - compGECount);
		 totNeed = (majNeed + genNeed);
	     foutSTS << stuID << " " << stuName << " Major need:" << majNeed << " GEN need:" << genNeed << " " << stuStat << " Q"<< perComp << " Major:" << compNGECount << " GEN:" << compGECount << " inprog:" << inprogCount<< "\n";
		 // end of data, so no comma on end
         foutSTT << "('" << stuID << "', '"<< StuLastName << "', '"<< StuFirstName <<"', " << DayEv << ", " << totNeed <<", " << majNeed <<  ", "<< genNeed << ", '"<< stuStat << "', " << perComp << ", "<< compNGECount << ", "<< compGECount << ", " << inprogCount <<", '"
		 				   << majorID <<"', '" << schProgram <<"', "<< M2L <<", "<< H2L <<", "<< F2L <<", "<< S2L <<", "<< L3L <<", "<< F3L <<", "<< S3L <<", '" << GenSav <<"')"<< endl;


	
	cout << "\n***End of file Contents.***\n";


	cout << "Press any key to finish: ";
	cin.ignore(1, '\n'); // eat the newline after the file name
	cin.getline(buffer, 255);  // get the user's input

	fin.close();       // always close file when done
	foutART.close();
	foutSTS.close();
	foutSTT.close();
	return 0;
}
