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

    int option, order;
    string user_country = "";
    string place = "";

    const char* levels[4] = { "dbo:Continent", "dbo:country", "dbo:region", "dbo:city"};
    const char* orders[2] = { ":newInfected", ":newDeaths"};

    printer.printIntro();

    // Start main loop
    while(true) {
        
        // Home 
        printer.printLine("What would you like to do?\n1. Give user data\n2. Get covid data\n3. Get travelling advice\n4. Get standings\nPlease enter a number: ");

        // Read option from command line
        option = parser.parseIntBetween(0, 5);
                
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

                // Read option from command line
                option = parser.parseIntBetween(0, 5);

                // Ask for place
                printer.printLine("Please enter place name: ");
                place = parser.parseString();

                // Create query
                char buff1[1000];
                snprintf(buff1, sizeof(buff1), query.diseaseQueryTemplate, levels[option-1], place.c_str());

                // Do query and print resutls
                printer.printDiseaseResult(query.doQuery(buff1), place);
                break;

            // Getting travelling advice
            case 3:

                // Ask for country
                printer.printLine("Please enter country name: ");

                // Create query
                char buff2[1000];
                place = parser.parseString();

                if(user_country == "") snprintf(buff2, sizeof(buff2), query.adviceQueryTemplate,  place.c_str());
                else snprintf(buff2, sizeof(buff2), query.specificAdviceQueryTemplate, user_country.c_str(),  place.c_str());

                // Do query and print resutls
                if(user_country == "") printer.printAdviceResult(query.doQuery(buff2), place);
                else printer.printSpecificAdviceResult(query.doQuery(buff2), user_country, place);
                break;


            // Getting standings
            case 4:

                // Ask for ordering
                printer.printLine("Order by?\n1. Infected\n2. Deaths\nPlease enter a number: ");

                // Get ordering
                order = parser.parseIntBetween(0, 3);

                // Create query
                char buff3[1000];
                snprintf(buff3, sizeof(buff3), query.standingsQueryTemplate, orders[order-1]);

                // Do query and print resutls
                printer.printStandingsResult(query.doQuery(buff3), order);
                break;
        }
        printer.printSeparator();
    }
    return 0;
}