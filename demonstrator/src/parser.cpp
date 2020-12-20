/*
*
*  PARSER CLASS
*   
*/
#include "../include/parser.h"

// Get an integer
int Parser::parseIntBetween(int lower, int upper) {

    string input;
    int value;

    while(true) {
        getline(cin, input);
        try {
            value = stoi(input);
            
            if(value < upper && value > lower) return value;
        } catch(exception) {
        }
        cout << "Please fill in a valid number: " << endl;
    }
}

// Get a string
string Parser::parseString() {

    string input;
    getline(cin, input);
    return input;
}