#include <fstream>
#include <iostream>
#include <regex>
#include <string>

using namespace std;

void writeTxt(string& s, ofstream& file);
void readTxt(const string& s);
void searchMatchesLines(const string& fileName, int& tot, int& totWOSpaces, int& onlyNumb, int& alphaNum, int& onlyLetter, int& tokens);

int main()
{
    string fileName;
    cout<<"Name of file: ";
    cin>>fileName;

    fileName+=".txt";
    ofstream file(fileName);

    if(!file){
        cout<<"Error creating "<<fileName;
        return 0;
    }

    cin.ignore();//ignores new line in input buffer

    string txtContent;

    writeTxt(txtContent, file);
    file.close(); //close file

    //readTxt(fileName);

    int tot = 0, totWOSpaces = 0;
    int onlyNumb = 0, alphaNum = 0, onlyLetter = 0, lexemes = 0;

    searchMatchesLines(fileName, tot, totWOSpaces, onlyNumb, alphaNum, onlyLetter, lexemes);

    cout<<"\nREPORTE\n"<<"Total de caracteres (con espacios): "<<tot<<"\nTotal de caracteres (sin espacios): "<<totWOSpaces;
    cout<<"\nTotal de lexemas:"<<lexemes;
    cout<<"\nTotal de numeros: "<<onlyNumb;
    cout<<"\nTotal de palabras: "<<onlyLetter;
    cout<<"\nTotal de combinadas: "<<alphaNum;

    return 0;
}

void writeTxt(string& s, ofstream& file){
    cout<<"type 'gatito' on a new line to STOP WRITING\n";

    while(true){
        getline(cin, s); //get text
        if(s == "gatito") break; //stop text input
        file<<s<<endl; //write text to write
    }
}

void readTxt(const string& s){
    char c;

    ifstream file(s);

    if(!file){
        cout<<"Error opening "<<s;
        return;
    }

    while(file.get(c)){
        cout<<c;
    }
}


void searchMatchesLines(const string& fileName, int& tot, int& totWOSpaces, int& onlyNumb, int& alphaNum, int& onlyLetter, int& lex){
    ifstream file(fileName);

    if(!file){
        cout<<"Error opening "<<fileName;
        return;
    }

    //apply regex patterns
    regex countChar(R"(\w)");
    regex countCharSpa(R"([\w\ ])");
    regex tok(R"(\b[a-zA-Z0-9]+\b)");
    regex onlyNum(R"(\b[0-9]+\b)");
    regex onlyLet(R"(\b[a-zA-Z]+\b)");
    regex onlyAlphNum(R"(\b(?=.\w*\d)(?=.\w*[a-zA-Z])[a-zA-Z0-9]+\b)");

    string line;

    while(getline(file, line)){
        sregex_iterator it(line.begin(), line.end(), onlyNum);
        sregex_iterator endNum;
        onlyNumb += distance(it, endNum);

        sregex_iterator itLet(line.begin(), line.end(), onlyLet);
        sregex_iterator endLet;
        onlyLetter += distance(itLet, endLet);

        sregex_iterator itAN(line.begin(), line.end(), onlyAlphNum);
        sregex_iterator endAN;
        alphaNum += distance(itAN, endAN);

        sregex_iterator itTok(line.begin(), line.end(), tok);
        sregex_iterator endTok;
        lex += distance(itTok, endTok);

        sregex_iterator itCountChar(line.begin(), line.end(), countChar);
        sregex_iterator endCC;
        totWOSpaces += distance(itCountChar, endCC);

        sregex_iterator itCountCS(line.begin(), line.end(), countCharSpa);
        sregex_iterator endCS;
        tot += distance(itCountCS, endCS);
    }

    file.close();
}
