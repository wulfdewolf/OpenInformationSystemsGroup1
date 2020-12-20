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
    string place = "";

    const char* levels[4] = { "dbo:Continent", "dbo:country", "dbo:city", "dbo:region" };

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
                        break;

                    // Getting covid data
                    case 2:
                         printer.printLine("Level?\n1. Continent\n2. Country\n3. Region\n4. City\nPlease enter a number: ");


                         while(true) {
                            
                            // Read option from command line
                            option = 0;
                            cin >> option;

                            if(option < 5 && option > 0) {

                                // Ask for place
                                printer.printLine("Please enter place name: ");
                                cin >> place;

                                // Create query
                                char buff[1000];
                                snprintf(buff, sizeof(buff), query.diseaseQueryTemplate, levels[option-1], place.c_str());

                                 // Do query and print resutls
                                printer.printDiseaseResult(query.doQuery(buff), place);
                                break;
                            } else printer.printLine("Please enter a valid option!");
                         }
                         break;


                    // Getting travelling advice
                    case 3:

                        // Ask for country
                        printer.printLine("Please enter country name: ");
                        cin >> place;

                        // Create query
                        char buff[1000];
                        if(user_country == "") snprintf(buff, sizeof(buff), query.adviceQueryTemplate, place.c_str());
                        else snprintf(buff, sizeof(buff), query.specificAdviceQueryTemplate, user_country.c_str(), place.c_str());

                        // Do query and print resutls
                        if(user_country == "") printer.printAdviceResult(query.doQuery(buff), place);
                        else printer.printSpecificAdviceResult(query.doQuery(buff), user_country, place);
                        break;
                }
                printer.printSeparator();
                break;
            
            } else printer.printLine("Please enter a valid option:");
        }
    }

    return 0;
}