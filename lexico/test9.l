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

(^|[^a-zA-ZΑΙΝΣΪαινσϊ])([Yy])([^a-zA-ZΑΙΝΣΪαινσϊ]|$) { return TKN_CONJ; }
(^|[^a-zA-ZΑΙΝΣΪαινσϊ])([Ee])([^a-zA-ZΑΙΝΣΪαινσϊ]|$) { return TKN_CONJ; }
(^|[^a-zA-ZΑΙΝΣΪαινσϊ])([Nn][Ii])([^a-zA-ZΑΙΝΣΪαινσϊ]|$) { return TKN_CONJ; }
(^|[^a-zA-ZΑΙΝΣΪαινσϊ])([Pp][Ee][Rr][Oo])([^a-zA-ZΑΙΝΣΪαινσϊ]|$) { return TKN_CONJ; }
(^|[^a-zA-ZΑΙΝΣΪαινσϊ])([Mm][Αα][Ss])([^a-zA-ZΑΙΝΣΪαινσϊ]|$) { return TKN_CONJ; }

(^|[^a-zA-ZΑΙΝΣΪαινσϊ])([Aa][Nn][Tt][Ee])([^a-zA-ZΑΙΝΣΪαινσϊ]|$) { return TKN_PREP; }
(^|[^a-zA-ZΑΙΝΣΪαινσϊ])([Bb][Aa][Jj][Oo])([^a-zA-ZΑΙΝΣΪαινσϊ]|$) { return TKN_PREP; }
(^|[^a-zA-ZΑΙΝΣΪαινσϊ])([Cc][Oo][Nn])([^a-zA-ZΑΙΝΣΪαινσϊ]|$) { return TKN_PREP; }
(^|[^a-zA-ZΑΙΝΣΪαινσϊ])([Dd][Ee][Ss][Dd][Ee])([^a-zA-ZΑΙΝΣΪαινσϊ]|$) { return TKN_PREP; }
(^|[^a-zA-ZΑΙΝΣΪαινσϊ])([Ee][Nn][Tt][Rr][Ee])([^a-zA-ZΑΙΝΣΪαινσϊ]|$) { return TKN_PREP; }

(^|[^a-zA-ZΑΙΝΣΪαινσϊ])([Ιι][Ll])([^a-zA-ZΑΙΝΣΪαινσϊ]|$) { return TKN_PRON; }
(^|[^a-zA-ZΑΙΝΣΪαινσϊ])([Tt][Ϊϊ])([^a-zA-ZΑΙΝΣΪαινσϊ]|$) { return TKN_PRON; }
(^|[^a-zA-ZΑΙΝΣΪαινσϊ])([Yy][Oo])([^a-zA-ZΑΙΝΣΪαινσϊ]|$) { return TKN_PRON; }
(^|[^a-zA-ZΑΙΝΣΪαινσϊ])([Nn][Oo][Ss][Oo][Tt][Rr][Oo][Ss])([^a-zA-ZΑΙΝΣΪαινσϊ]|$) { return TKN_PRON; }
(^|[^a-zA-ZΑΙΝΣΪαινσϊ])([Vv][Oo][Ss][Oo][Tt][Rr][Oo][Ss])([^a-zA-ZΑΙΝΣΪαινσϊ]|$) { return TKN_PRON; }

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
