/*
*
*  PRINTER CLASS
*   
*/
#include "../include/printer.h"

void Printer::printIntro() {
    cout << "|"  << string(60, '*') << "|" << endl;
    cout << "|"  << string(60, ' ') << "|" << endl;
    cout << "|"  << string(60, ' ') << "|" << endl;

    cout << "|"  << string(20, ' ') << "Welcome to Pandemmy!" << string(20, ' ') << "|" << endl;

    cout << "|"  << string(60, ' ') << "|" << endl;
    cout << "|"  << string(60, ' ') << "|" << endl;
    cout << "|"  << string(60, '*') << "|" << endl;
}

void Printer::printLine(string line) {
    cout << line << endl;
}

void Printer::printSeparator() {
    cout << endl << string(62, '*') << endl << endl;
}

void Printer::printDiseaseResult(string json, string place) {
    // Parse as json
    Document d;
    d.Parse(json.c_str());
    
    printSeparator();

    if(d["results"]["bindings"].GetArray().Empty()) {
         cout << "Given place not in database!" << endl;
    } else {

        cout << "NUMBERS FOR " << place << ": " << endl << endl;

        // Infected
        cout << "Infected:              " << d["results"]["bindings"][0]["infected"]["value"].GetString() << endl;

        // Total infected
        cout << "Total infected:        " << d["results"]["bindings"][0]["totalinfected"]["value"].GetString() << endl;

        // Cured
        cout << "Cured:                 " << d["results"]["bindings"][0]["cured"]["value"].GetString() << endl;

        // Deaths
        cout << "Deaths:                " << d["results"]["bindings"][0]["deaths"]["value"].GetString() << endl;

        // Reproduction number
        cout << "Reproduction number:   " << d["results"]["bindings"][0]["rn"]["value"].GetString() << endl;
    }
}

void Printer::printAdviceResult(string json, string place) {  
    // Parse as json
    Document d;
    d.Parse(json.c_str());

    printSeparator();

    if(d["results"]["bindings"].GetArray().Empty()) {
         cout << "Given countries not in database!" << endl;
    } else {
        cout << "TRAVELLING ADVICE FOR " << place << ": " << endl << endl;

        for(Value& s : d["results"]["bindings"].GetArray()) {
            // Advice
            cout << "Advice:              " << s["advice"]["value"].GetString() << endl;
        }
    }
}

void Printer::printSpecificAdviceResult(string json, string from, string place) {  
    // Parse as json
    Document d;
    d.Parse(json.c_str());

    printSeparator();

    if(d["results"]["bindings"].GetArray().Empty()) {
         cout << "Given countries not in database!" << endl;
    } else {
        cout << "TRAVELLING ADVICE FROM " << place << " FOR " << from << ": " << endl << endl;

        // Print all the advices
        for(Value& s : d["results"]["bindings"].GetArray()) {
        cout << "Advice:              " << s["advice"]["value"].GetString() << endl;
        }
    }
}

void Printer::printStandingsResult(string json, int order) {  
    // Parse as json
    Document d;
    d.Parse(json.c_str());

    string title = "Infected";
    if(order == 2) title = "Deaths";

    printSeparator();

    cout << "STANDINGS FOR " << title << ": " << endl << endl;

    int index = 1;

    // Print the standings
    for(Value& s : d["results"]["bindings"].GetArray()) {

        string name = s["name"]["value"].GetString();
        string number = s["total"]["value"].GetString();
        cout << index << ". " << name << string(20-name.length(), ' ') << number << endl;
        index++;
    }
}