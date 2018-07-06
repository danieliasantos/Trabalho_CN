#include <iostream>
#include <time.h>
#include <stdlib.h>
#include <math.h>
#include <stdio.h>
#include <sstream>


using namespace std;

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
        n = rand()%(4294967295);
        s = decToHex(n);
        m = hexToDec(s);
        cout<<"\nNumero: "<<n<<endl;
        cout<<"Hex: "<<s<<endl;
        cout<<"Dec: "<<m<<endl;
    }
    return n;
}
int main()
{
    int i=1000;
    i=parseIntPerf(i);
    return 0;
}
