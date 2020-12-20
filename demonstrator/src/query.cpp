/*
*
*  QUERY CLASS
*   
*/
#include "../include/query.h"

static size_t WriteCallback(void *contents, size_t size, size_t nmemb, void *userp)
{
    ((std::string*)userp)->append((char*)contents, size * nmemb);
    return size * nmemb;
}

string Query::doQuery(string request) {
    // Init curl
    curl_global_init(CURL_GLOBAL_ALL);
    CURL *curl = curl_easy_init();

    CURLcode res;
    string response;


    if(curl) {
        curl_easy_setopt(curl, CURLOPT_URL, "localhost:8080/sparql");
        curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, WriteCallback);
        curl_easy_setopt(curl, CURLOPT_WRITEDATA, &response);

        // Set headers
        struct curl_slist* headers = NULL;
        headers = curl_slist_append(headers, "Content-Type: application/sparql-query");
        headers = curl_slist_append(headers, "accept: application/json");
        curl_easy_setopt(curl, CURLOPT_HTTPHEADER, headers);

        // Set request
        curl_easy_setopt(curl, CURLOPT_POSTFIELDS, request.c_str());
        
        // Do query and clean up
        res = curl_easy_perform(curl);
        curl_easy_cleanup(curl);
    }
    return response;
}