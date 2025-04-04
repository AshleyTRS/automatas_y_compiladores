%{
#include <stdio.h>
#define TKN_CONJ 1
#define TKN_PREP 2
#define TKN_PRON 3
#define TKN_BLM_ANA 4
#define TKN_BLM_ADJ 5
%}

%option caseless

%%

(^|[^a-zA-Z����������])([Yy])([^a-zA-Z����������]|$) { return TKN_CONJ; }
(^|[^a-zA-Z����������])([Ee])([^a-zA-Z����������]|$) { return TKN_CONJ; }
(^|[^a-zA-Z����������])([Nn][Ii])([^a-zA-Z����������]|$) { return TKN_CONJ; }
(^|[^a-zA-Z����������])([Pp][Ee][Rr][Oo])([^a-zA-Z����������]|$) { return TKN_CONJ; }
(^|[^a-zA-Z����������])([Mm][��][Ss])([^a-zA-Z����������]|$) { return TKN_CONJ; }

(^|[^a-zA-Z����������])([Aa][Nn][Tt][Ee])([^a-zA-Z����������]|$) { return TKN_PREP; }
(^|[^a-zA-Z����������])([Bb][Aa][Jj][Oo])([^a-zA-Z����������]|$) { return TKN_PREP; }
(^|[^a-zA-Z����������])([Cc][Oo][Nn])([^a-zA-Z����������]|$) { return TKN_PREP; }
(^|[^a-zA-Z����������])([Dd][Ee][Ss][Dd][Ee])([^a-zA-Z����������]|$) { return TKN_PREP; }
(^|[^a-zA-Z����������])([Ee][Nn][Tt][Rr][Ee])([^a-zA-Z����������]|$) { return TKN_PREP; }

(^|[^a-zA-Z����������])([��][Ll])([^a-zA-Z����������]|$) { return TKN_PRON; }
(^|[^a-zA-Z����������])([Tt][��])([^a-zA-Z����������]|$) { return TKN_PRON; }
(^|[^a-zA-Z����������])([Yy][Oo])([^a-zA-Z����������]|$) { return TKN_PRON; }
(^|[^a-zA-Z����������])([Nn][Oo][Ss][Oo][Tt][Rr][Oo][Ss])([^a-zA-Z����������]|$) { return TKN_PRON; }
(^|[^a-zA-Z����������])([Vv][Oo][Ss][Oo][Tt][Rr][Oo][Ss])([^a-zA-Z����������]|$) { return TKN_PRON; }

(^(comparar|contrast(ar|o)|examinar|investigar|organizar|diferenciar|relacionar|descomponer|categorizar|distinguir|analizar|dividir|discriminar|experimentar|identificar|seleccionar|inferir|justificar|evaluar)$) {return TKN_BLM_ANA;}
(^(hermos(o|a)|inteligente|amable|valiente|fuerte|generoso|brillante|excelente|encantador(a)?|honesto|noble|admirable)$) {return TKN_BLM_ADJ;}


%%

int main() {
    int token;
	while(1){
		token = yylex();
		if(token == TKN_CONJ){
			printf("token TKN_CONJ reconocido\n");
		}
		if(token == TKN_PREP){
			printf("token TKN_PREP reconocido\n");
		}
		if(token == TKN_PRON){
			printf("token TKN_PRON reconocido\n");
		}
		if(token == TKN_BLM_ANA){
			printf("token TKN_BLM_ANA reconocido\n");
		}
		if(token == TKN_BLM_ADJ){
			printf("token TKN_BLM_ADJ reconocido\n");
		}
		if(token == 0) break;
	}
}
