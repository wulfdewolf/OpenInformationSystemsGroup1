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

void Printer::printDiseaseDataResults() {
}

void Printer::printTravelDataResults() {  
}