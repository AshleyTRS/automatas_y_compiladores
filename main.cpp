#include <iostream>
#include <locale>
#include <codecvt>

using namespace std;

bool hasNumber(wchar_t c);

int main()
{
    locale::global(locale(""));
    wcin.imbue(locale());
    wcout.imbue(locale());

    wstring s;
    wcin>>s;
    int strLen = s.size();
    int nNum = 0;
    for(auto c : s){
        if(hasNumber(c)) nNum++;
    }
    if(nNum == strLen) wcout<<"Número entero";
    if(nNum == 0) wcout<<"Palabra";
    else if(nNum < strLen) wcout<<"Compuesta";
}

bool hasNumber(wchar_t c){
    reeturn (c >= '0' && c <= '9');
}

