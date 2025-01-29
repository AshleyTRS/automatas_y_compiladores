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
    if(c == '0' || c == '1' || c == '2' || c == '3' || c == '4' || c == '5' || c == '6' || c == '7' || c == '8' || c == '9') return true;
    return false;
}

