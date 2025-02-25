/*
author: ash_c4t
*/
#include <bits/stdc++.h>

using namespace std;

bool verifyW(vector<unordered_map<char, int>>& AFD, int currentSt, string W, int wIdx, vector<bool> finalStates){
    if(wIdx == W.size()) return finalStates[currentSt]; //base case: when position is the same as size of string W
    if(AFD[currentSt].find(W[wIdx]) == AFD[currentSt].end()) return false;
    return verifyW(AFD, AFD[currentSt][W[wIdx]], W, wIdx+1, finalStates);
}

int main()
{
    ios_base::sync_with_stdio(0);
    cin.tie(0);

    int N, S, D, q, T, C;
    //size of Q, size of alphabet, #of transitions, initial state, # of final states, # of strings to be tested
    cin>>N>>S>>D>>q>>T>>C;

    //read chars in alphabet
    //char alphabet[S+5]; no need to store alphabet
    for(int i=0; i<S; i++){
        char letter;
        cin>>letter;
        //cin>>alphabet[i];
    }

    //read final states
    //int setF[T+5];
    vector<bool> finalStates(N+1, false);
    for(int i=0; i<T; i++){
        int s;
        cin>>s;
        finalStates[s] = true;
    }

    //read state transitions
    int I, J;
    char X;
    //represent automaton as a vector of hash maps
    vector<unordered_map<char, int>> AFD(D+5); //vector idx -> state (I), char key -> ASCII that belongs to alphabet (X),
    //int val -> transition states (J)
    for(int i=1; i<=D; i++){
        cin>>I>>X>>J;
        AFD[I][X]=J;
    }

    //read and evaluate strings
    string W;
    cin.ignore();
    while(C--){
        bool isValid = false; //asume that current string is not accepted by AFD
        getline(cin, W);
        if(T==0) cout<<"RECHAZADA\n"; //no string is accepted, not even empty string, only recognizes the empty language
        else if(finalStates[q] && W=="") cout<<"ACEPTADA\n"; //empty strings are accepted
        else if(verifyW(AFD, q, W, 0, finalStates)) cout<<"ACEPTADA\n";
        else cout<<"RECHAZADA\n";
    }

}
