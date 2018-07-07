#include <iostream>
#include <time.h>
#include <stdlib.h>
#include <math.h>
#include <stdio.h>
#include <sstream>
#include <ctime>

using namespace std;

int nIteracoes=0;
int hexToDec(string s)
{
    int aux;
    stringstream ss;
    ss << s;
    ss >> hex >> aux;
    return aux;
}
string decToHex(int n)
{
    stringstream ss;
    ss<<hex<<n;
    string aux(ss.str());
    return aux;
}

int parseIntPerf (int t)
{
    int m=0, n=0;
    int random=0;
    string s;
    srand(time(NULL));

    for(int i=0; i<t; i++)
    {
        nIteracoes+=1;
        n = rand()%(4294967295);
        s = decToHex(n);
        m = hexToDec(s);
    }
    return n;
}
int main()
{
    int i=1000;

    clock_t start;
    double duration;

    start = clock();
    parseIntPerf(i);

    duration = ( clock() - start ) / (double) CLOCKS_PER_SEC;

    cout<<"Tempo: "<< duration <<endl;
    cout<<"Iterações: "<< nIteracoes <<endl;

    return 0;
}
