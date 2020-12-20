/*
*
*   ONTOLOGY DEMONSTRATOR SCRIPT
* 
*/
#include "include/printer.h"
#include "include/query.h"

int main(int argc, char* argv[]) {

    Printer printer;
    Query query;

    int option;
    string user_country = "";
    string level = "";
    string name = "";

    printer.printIntro();

    // Start main loop
    while(true) {
        
        // Home 
        printer.printLine("What would you like to do?\n1. Give user data\n2. Get covid data\n3. Get travelling advice\nPlease enter a number: ");

        while(true) {

            // Read option from command line
            cin >> option;

            if(option < 4 && option > 0) {
                
                switch(option) {

                    // Giving user data
                    case 1: 
                        printer.printLine("Enter country of residence:");
                        cin >> user_country;
                        printer.printLine("User data saved.");

                    // Getting covid data
                    case 2:
                         printer.printLine("Level?\n1. Continent\n2. Country\n3. Region\n4. City\nPlease enter a number: ");


                         while(true) {
                            
                            // Read option from command line
                            cin >> option;

                            if(option < 5 && option > 0) {

                                switch(option) {
                                    
                                    // Continent
                                    case 1:
                                        level = "dbo:Continent";
                                    
                                    // Country
                                    case 2:
                                        level = "dbo:country";

                                    // Region
                                    case 3:
                                        level = "dbo:region";

                                    // City
                                    case 4:
                                        level = "dbo:city";


                                    // Ask for name
                                    printer.printLine("Please enter place name: ");
                                    cin >> name;

                                    // Send query and print results
                                   // printer.printDiseaseDataResults(query.diseaseQuery(level, name));
                                }
                            } else printer.printLine("Please enter a valid option!");
                         }


                    // Getting travelling advice
                    case 3:
                        printer.printAdviceResults(query.adviceQuery(user_country));


                }
            
            } else printer.printLine("Please enter a valid option:");
        }
    }

    return 0;
}