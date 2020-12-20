/*
*
*   ONTOLOGY DEMONSTRATOR SCRIPT
* 
*/
#include "include/printer.h"
#include "include/parser.h"
#include "include/query.h"

int main(int argc, char* argv[]) {

    Printer printer;
    Parser parser;
    Query query;

    int option;
    string user_country = "";
    string place = "";

    const char* levels[4] = { "dbo:Continent", "dbo:country", "dbo:region", "dbo:city"};

    printer.printIntro();

    // Start main loop
    while(true) {
        
        // Home 
        printer.printLine("What would you like to do?\n1. Give user data\n2. Get covid data\n3. Get travelling advice\nPlease enter a number: ");

        while(true) {

            // Read option from command line
            option = parser.parseIntBetween(0, 4);
                
            switch(option) {

                // Giving user data
                case 1: 
                    printer.printLine("Enter country of residence:");
                    user_country = parser.parseString();
                    printer.printLine("User data saved.");
                    break;

                // Getting covid data
                case 2:
                    printer.printLine("Level?\n1. Continent\n2. Country\n3. Region\n4. City\nPlease enter a number: ");

                    while(true) {
                            
                        // Read option from command line
                        option = parser.parseIntBetween(0, 5);

                        // Ask for place
                        printer.printLine("Please enter place name: ");

                        // Create query
                        char buff[1000];
                        snprintf(buff, sizeof(buff), query.diseaseQueryTemplate, levels[option-1], parser.parseString().c_str());

                        // Do query and print resutls
                        printer.printDiseaseResult(query.doQuery(buff), place);
                        break;
                    }
                    break;


                // Getting travelling advice
                case 3:

                    // Ask for country
                    printer.printLine("Please enter country name: ");

                    // Create query
                    char buff[1000];
                    place = parser.parseString();

                    if(user_country == "") snprintf(buff, sizeof(buff), query.adviceQueryTemplate,  place.c_str());
                    else snprintf(buff, sizeof(buff), query.specificAdviceQueryTemplate, user_country.c_str(),  place.c_str());

                    cout << buff << endl;

                    // Do query and print resutls
                    if(user_country == "") printer.printAdviceResult(query.doQuery(buff), place);
                    else printer.printSpecificAdviceResult(query.doQuery(buff), user_country, place);
                    break;
            }
                printer.printSeparator();
                break;
        }
    }

    return 0;
}