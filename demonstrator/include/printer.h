#ifndef PRINTER_H
#define PRINTER_H

#include <stdio.h>
#include <bits/stdc++.h> 
using namespace std;

class Printer {

    public: 

    // Prints intro
    void printIntro();

    // Prints a line
    void printLine(string line);

    // Prints disease data
    void printDiseaseDataResults();

    // Prints travel data
    void printTravelDataResults();
};

#endif