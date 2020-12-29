#ifndef PRINTER_H
#define PRINTER_H

#include <stdio.h>
#include <bits/stdc++.h> 
#include "../rapidjson/document.h"
#include "../rapidjson/writer.h"
#include "../rapidjson/stringbuffer.h"
#include <iostream>
using namespace std;
using namespace rapidjson;

class Printer {

    public: 

    // Prints non-availiability message
    void printNonAvailable();

    // Prints intro
    void printIntro();

    // Prints a line
    void printLine(string line);

    // Prints a separator line
    void printSeparator();

    // Prints disease data
    void printDiseaseResult(string json, string place);

    // Prints general advice
    void printAdviceResult(string json, string place);

    // Prints specific advice
    void printSpecificAdviceResult(string json, string from, string place);

    // Prints standings
    void printStandingsResult(string json, int order);
};

#endif