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
    getline(wcin, s);
    s += ' ';

    int strLen = 0;
    int nNum = 0;
    int e = 0, p = 0, co = 0;

    for(auto c : s){
        if(c != ' '){
            strLen++;
            if(hasNumber(c)) nNum++;
        }
        else{
            if(strLen == nNum) e++;
            if(nNum == 0) p++;
            else if(nNum < strLen)co++;
            strLen = 0;
            nNum = 0;
        }
    }

    wcout<<e<<" entero(s), "<<p<<" palabra(s), "<<co<<" compuesta(s)";

}

bool hasNumber(wchar_t c){
    return (c >= '0' && c <= '9');
}
