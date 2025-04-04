%option noyywrap
%option yylineno
%{
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <string.h>
FILE *yyin;
int lugares = 0;
int casas = 0;
int personajes = 0;
int w=0, i=0, dr=0, n=0, aj=0, ag=0, rd=0, rc=0, bt=0, d=0;
int stark=0, arryn=0, tully=0, grey=0, lann=0, ty=0, mar=0, bara=0, tar=0;
int edd=0, cat=0, arya=0, san=0, rob=0, joff=0, stann=0, aegon=0, dae=0, aery=0, tyw=0, jai=0, tyri=0, cer=0;
%}

%%
"Eddard" {edd++;}
"Catelyn" {cat++;}
"Arya" {arya++;}
"Sansa" {san++;}
"Robert" {rob++;}
"Joffrey" {joff++;}
"Stannis" {stann++;}
"Aegon" {aegon++;}
"Daenerys" {dae++;}
"Aerys" {aery++;}
"Tywin" {tyw++;}
"Jaime" {jai++;}
"Tyrion" {tyri++;}
"Cersei" {cer++;}
"Stark" {stark++;}
"Arryn" {arryn++;}
"Tully" {tully++;}
"Greyjoy" {grey++;}
"Lannister" {lann++;}
"Tyrell" {ty++;}
"Martell" {mar++;}
"Baratheon" {bara++;}
"Targaryen" {tar++;}
"Westeros" {w++;}
"Invernalia" {i++;}
"Desembarco del Rey" {dr++;}
"Nido de Águilas" {n++;}
"Nido de Aguilas" {n++;};
"Altojardín" {aj++;}
"Aguasdulces" {ag++;}
"Rocadragón" {rd++;}
"Rocadragon" {rd++;}
"Roca Casterly" {rc++;}
"Bastión de Tormentas" {bt++;}
"Dorne" {d++;}
%%

int main(){
FILE *file_tronos;
char nameFile[]="juego_de_tronos.txt";
file_tronos = fopen(nameFile, "r");

if(!file_tronos){
printf("THERE WAS AN ERROR IN OPENING YOUR FILE");
return 1;
}

yyin = file_tronos;
yylex();
fclose(file_tronos);
printf("************************************\n");
printf("Lugares Juego de Tronos\n");
printf("Westeros: %d\n", w);
printf("Invernalia: %d\n", i);
printf("Desembarco del Rey: %d\n", dr);
printf("Nido de Águilas: %d\n", n);
printf("Altojardín: %d\n", aj);
printf("Aguasdulces: %d\n", ag);
printf("Rocadragón: %d\n", rd);
printf("Roca Casterly: %d\n", rc);
printf("Bastión de Tormentas: %d\n", bt);
printf("Dorne: %d\n", d);
printf("************************************\n");
printf("Casas principales\n");
printf("Stark: %d\n", stark);
printf("Arryn: %d\n", arryn);
printf("Tully: %d\n", tully);
printf("Greyjoy: %d\n", grey);
printf("Lannister: %d\n", lann);
printf("Tyrrell: %d\n", ty);
printf("Martell: %d\n", mar);
printf("Baratheon: %d\n", bara);
printf("Targaryen: %d\n", tar);
printf("************************************\n");
printf("Personajes principales\n");
printf("Eddard: %d\n", edd);
printf("Catelyn: %d\n", cat);
printf("Arya: %d\n", arya);
printf("Sansa: %d\n", san);
printf("Robert: %d\n", rob);
printf("Joffrey: %d\n", joff);
printf("Stannis: %d\n", stann);
printf("Aegon: %d\n", aegon);
printf("Daenerys: %d\n", dae);
printf("Aerys: %d\n", aery);
printf("Tywin: %d\n", tyw);
printf("Jaime: %d\n", jai);
printf("Tyrion: %d\n", tyri);
printf("Cersei: %d\n", cer);

return 0;
}
