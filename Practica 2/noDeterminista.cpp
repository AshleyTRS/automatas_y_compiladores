/*
author: ash_c4t
*/
#include <bits/stdc++.h>

using namespace std;

bool findEmpty(vector<unordered_map<char, vector<int>>>& AFN, int currentSt, vector<bool> finalStates){
    if(finalStates[currentSt]){
        return true;
    }
    if(AFN[currentSt].find('E') == AFN[currentSt].end()){
        return false;
    }
    for(auto s:AFN[currentSt]['E']){
        return findEmpty(AFN,s,finalStates);
    }
}

void verifyS(vector<unordered_map<char, vector<int>>>& AFN, int currentSt, string W, int wIdx, vector<bool> finalStates, bool& accepted){
    //cout<<accepted<<"\n";
    //cout<<currentSt<<"\n";
    if(wIdx == W.size()){
        accepted = finalStates[currentSt];
        return;
    }
    if(AFN[currentSt].find(W[wIdx]) == AFN[currentSt].end() && AFN[currentSt].find('E') == AFN[currentSt].end()){
        accepted = false;
        return;
    }
    if(AFN[currentSt].find(W[wIdx]) != AFN[currentSt].end()){
        for(auto s : AFN[currentSt][W[wIdx]]){
            //recursive call to keep exploring path/transitions
            if(!accepted) verifyS(AFN, s, W, wIdx+1, finalStates, accepted);
            //else break;
        }
    }
    if(!accepted && AFN[currentSt].find('E') != AFN[currentSt].end()){
        for(auto s : AFN[currentSt]['E']){
            //recursive call to keep exploring path/transitions
            if(!accepted) verifyS(AFN, s, W, wIdx, finalStates, accepted);
            //else break;
        }
    }
    return;
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
    int I, J, K, fState;
    char X;
    //represent automata as a vector of hash maps
    vector<unordered_map<char, vector<int>>> AFN(D+5); //vector idx -> state (I), char key -> ASCII that belongs to alphabet (X),
    //vector<int> val -> transition states (J)
    for(int i=1; i<=D; i++){
        cin>>I>>X>>K;
        for(int j=1; j<=K; j++){
            cin>>fState;
            AFN[I][X].push_back(fState);
        }
    }

    //read and evaluate strings
    string W;
    cin.ignore();
    while(C--){
        bool accepted = false;
        getline(cin, W);
        if(finalStates[q] && W==""){
            cout<<"ACEPTADA\n"; //empty strings are accepted
        }
        else{
            //call function
            if(W=="" && findEmpty(AFN,q,finalStates)) cout<<"ACEPTADA\n";
            else if(W=="" && !findEmpty(AFN,q,finalStates)) cout<<"RECHAZADA\n";
            else{
                verifyS(AFN, q, W, 0, finalStates, accepted);
                if(accepted) cout<<"ACEPTADA\n";
                else cout<<"RECHAZADA\n";
            }
        }
    }

}

/* test cases XD
4 2 7 1 1 1
1 0
4
1 0 1 1
1 1 2 1 2
2 0 1 3
2 E 1 3
3 1 1 4
4 0 1 4
4 1 1 4
101

4 2 7 1 1 4
1 0
4
1 0 1 1
1 1 2 1 2
2 0 1 3
2 E 1 3
3 1 1 4
4 0 1 4
4 1 1 4
101
1001
100100010000100010000100000010000001000010
110


*/
