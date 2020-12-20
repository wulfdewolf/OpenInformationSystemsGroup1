#ifndef PARSER_H
#define PARSER_H

#include <stdio.h>
#include <bits/stdc++.h> 
#include <iostream>
using namespace std;

class Parser {

    public: 

    // Get an integer
    int parseIntBetween(int lower, int upper);

    // Get a string
    string parseString();
};

#endif