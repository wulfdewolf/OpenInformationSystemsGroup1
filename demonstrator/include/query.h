#ifndef QUERY_H
#define QUERY_H

#include <stdio.h>
#include <bits/stdc++.h> 
#include <curl/curl.h>
#include <iostream>
using namespace std;

class Query {

    public: 

    const char* diseaseQueryTemplate = 
    "PREFIX dbo: <http://dbpedia.org/ontology/>\n"
    "PREFIX foaf: <http://xmlns.com/foaf/0.1/>\n"
    "PREFIX : <http://pandemmy.org/>\n"
    "PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>\n"
    "PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>\n"
    "SELECT ?place ?infected ?totalinfected ?cured ?deaths ?rn WHERE {"
    "?place a %s ."
    "?place rdfs:label '%s' ."
    "?place :infected ?infected ."
    "?place :totalInfected ?totalinfected ."
    "?place :cured ?cured ."
    "?place :deaths ?deaths ."
    "?place :derivedReproductionNumber ?rn}";

    const char* adviceQueryTemplate =
    "PREFIX dbo: <http://dbpedia.org/ontology/>\n"
    "PREFIX foaf: <http://xmlns.com/foaf/0.1/>\n"
    "PREFIX : <http://pandemmy.org/>\n"
    "PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>\n"
    "PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>\n"
    "SELECT ?advice WHERE {"
    "?place a dbo:country ."
    "?place rdfs:label '%s' ."
    "?place :generalTravellingAdvice ?advice .}";

    const char* specificAdviceQueryTemplate =
    "PREFIX dbo: <http://dbpedia.org/ontology/>\n"
    "PREFIX foaf: <http://xmlns.com/foaf/0.1/>\n"
    "PREFIX : <http://pandemmy.org/>\n"
    "PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>\n"
    "PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>\n"
    "SELECT ?advice WHERE {"
    "?usercountry a dbo:country . "
    "?usercountry rdfs:label '%s' ."
    "?Sadvice :adviceFor ?usercountry."
    "?destinationcountry :hasSpecificTravellingAdvice ?Sadvice."
    "?destinationcountry rdfs:label '%s' ."
    "?Sadvice :advice ?advice .}";

    const char* standingsQueryTemplate =
    "PREFIX dbo: <http://dbpedia.org/ontology/>\n"
    "PREFIX foaf: <http://xmlns.com/foaf/0.1/>\n"
    "PREFIX : <http://pandemmy.org/>\n"
    "PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>\n"
    "PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>\n"
    "SELECT ?name (SUM(?toCount) as ?total) WHERE {"
    "?cr a :PandemicReading ."
    "?city :reading ?cr ."
    "?city rdfs:label ?name ."
    "?cr %s ?toCount ."  
    "} GROUP BY ?name ORDER BY desc(?total)";

    string doQuery(string request);
};

#endif