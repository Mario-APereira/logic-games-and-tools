;***********************************************************************************************************************
;* IST-UL                                                                                                              *
;* LEIC-T                                                                                                              *
;* Projeto de Introdução à Arquitetura de Computadores                                                                 *
;* Nave Guardiã Mineradora- versão final                                                                               *
;* 2020/2021                                                                                                           *
;*                                                                                                                     *
;* Grupo 1: 99045 Afonso Knudsen                                                                                       *
;*          87209    Inês Véstia                                                                                       *
;*          99107  Mário Pereira                                                                                       *
;***********************************************************************************************************************
;* Descrição:                                                                                                          * 
;***********************************************************************************************************************
;* Constantes de dados                                                                                                 *
;***********************************************************************************************************************


INICIO_JOGO             EQU 0           ; Estado inicial do processo gestao_jogo.
MANTEM_JOGO             EQU 1           ; Estado estável do processo gestao_jogo.
JOGO_ATIVO              EQU 2           ; Estado estável do processo gestao_jogo.
JOGO_TECLA_E_0          EQU 3           ; Estado transitório do processo gestao_jogo.
JOGO_TECLA_E_1          EQU 4           ; Estado transitório do processo gestao_jogo.
JOGO_TECLA_F            EQU 5           ; Estado transitório do processo gestao_jogo.
JOGO_TECLA_C            EQU 6           ; Estado transitório do processo gestao_jogo.
JOGO_GAME_OVER          EQU 7           ; Estado transitório do processo gestao_jogo.
JOGO_SEM_ENERGIA        EQU 8           ; Estado transitório do processo gestao_jogo.
VIDEO_INICIO            EQU 0           ; Nº do vídeo de abertura.
VIDEO_JOGO              EQU 1           ; Nº do vídeo de background do jogo.
VIDEO_PAUSA             EQU 2           ; Nº do vídeo de pausa.
VIDEO_TERMINADO         EQU 3           ; Nº do vídeo de jogo terminado p/ carregar nas teclas.
VIDEO_LOSE_ENERGIA      EQU 4           ; Nº do vídeo de jogo terminado p/ falta de energia.
VIDEO_LOSE_COLISAO      EQU 5           ; Nº do vídeo de jogo terminado p/ colisão.
SOM_MINERAR             EQU 6           ; Nº do som de minerar um asteróide.
SOM_DESTRUIR            EQU 7           ; Nº do som de destruír uma nave ou um asteróide.
SOM_LASER               EQU 8           ; Nº do som de lançar a arma laser.
SOM_PERDEU_COLISAO      EQU 9           ; Nº do som de terminar jogo p/colisão.
SOM_PERDEU_ENERGIA      EQU 10          ; Nº do som de terminar o jogo p/falta de energia.
TECLA_C                 EQU 12          ; Nº da tecla C.
TECLA_E                 EQU 14          ; Nº da tecla E.
TECLA_F                 EQU 15          ; Nº da tecla F.
LC_4                    EQU 8           ; 4ª linha ou 4ª coluna.
VAR_16                  EQU 16          ; Usado para indicar que não houve tecla premida. 
CICLO                   EQU 4           ; Número de ciclos necessários p/converter o número a apresentar (nos displays).
MASCARA                 EQU 0           ; Máscara de bits neutros p/ utilizar numa dijunção exclusiva lógica.
DEZ                     EQU 10          ; Fator usado para retirar o algarismo de menor peso do contador. 
INICIO_GESTAO_NAVE      EQU 0           ; Estado inicial do processo gestao_nave.
MANTEM_NAVE             EQU 1           ; Estado estável do processo gestao_nave.
ENERGIA_NAVE            EQU 2           ; Estado transitório 0 do processo gestao_nave.
MOVE_NAVE               EQU 3           ; Estado transitório 1 do processo gestao_nave.
MOVE_ENERGIA_NAVE       EQU 3           ; Estado transitório do processo gestao_nave.
TEC_5                   EQU 5           ; Tecla 5.
TEC_7                   EQU 7           ; Tecla 7.
PIX_MIN_NAVE            EQU 1728        ; Pixel minimo para garantir que a nave não sai do ecrã.
PIX_MAX_NAVE            EQU 1787        ; Pixel máximo para garantir que a nave não sai do ecrã.
VALOR_2                 EQU 2           ; Utilizado para somar 2.
VALOR_3                 EQU 3           ; Utilizado para dividir por 3.
VALOR_4                 EQU 4           ; Utilizado para somar 4.
VALOR_5                 EQU 5           ; Utilizado para somar 5.
VALOR_6                 EQU 6           ; Utilizado para somar 6.
VALOR_9                 EQU 9           ; Utilizado para somar 9.
VALOR_10                EQU 10          ; Utilizado para somar 10.
VALOR_12                EQU 12          ; Utilizado para somar 12.
VALOR_16                EQU 16          ; Usado para indicar que não houve tecla premida. 
VALOR_31                EQU 31          ; Utilizado para somar 31.
VALOR_59                EQU 59          ; Utilizado para verificar se já chegou a coluna 59.
VALOR_100               EQU 100         ; Utilizado para somar 100.
VALOR_1759              EQU 1759        ; Utilizado para colocar a nave na sua posição inicial.
MAX_CONTADOR            EQU 65001       ; Valor máximo a atingir pelo contador + 1.
MASCARA_AND             EQU 3           ; Utilizada numa operacao AND para ficar só com os 2 digitos de menor peso.
TIPO_OVNI               EQU 2           ; Valor somado ao endereço da tabela do ovni, p/ aceder ao seu tipo.
LINHA_OVNI              EQU 4           ; Valor somado ao endereço da tabela do ovni, p/ aceder a linha de ref.
COL_OVNI                EQU 6           ; Valor somado ao endereço da tabela do ovni, p/ aceder à coluna de ref.
TIPO_MOV_OVNI           EQU 8           ; Valor somado ao endereço da tab do ovni, p/ aceder ao seu tipo de movimento.
ECRA_OVNI               EQU 10          ; Valor somado ao endereço da tab do ovni, p/ aceder ao ecrã onde o desenhar.   
TAMANHO_OVNI            EQU 12          ; Valor somado ao endereço da tabela do ovni, p/ aceder ao seu tamanho atual.
MOVIMENTOS_OVNI         EQU 14          ; Valor somado ao endereço da tabela do ovni, p/ aceder ao nº de movimentos.
COLISAO_OVNI            EQU 16          ; Valor somado ao endereço da tabela do ovni, p/ ver se este sofreu colisão.
EXPLOSAO_OVNI           EQU 18          ; Valor somado ao endereço da tabela do ovni, p/ver se tem explosão ativa.
CICLOS_EXPLOSAO         EQU 20          ; Valor somado ao endereço da tabela do ovni, p/saber nº de ciclos da explosao.
ECRA_EXPLOSAO           EQU 22          ; Valor somado ao endereço da tabela do ovni, p/saber o nº ecrã da sua explosao.
START_1_OVNI            EQU 0           ; Estado estável do processo gestao_1_ovni.
MANTEM_1_OVNI           EQU 1           ; Estado estável do processo gestao_1_ovni.
MOVE_1_OVNI             EQU 2           ; Estado transitório 0 do processo gestao_1_ovni.
TRATA_COLISAO_OVNI      EQU 3           ; Estado transitório 1 do processo gestao_1_ovni.
START_LASER             EQU 0           ; Estado inicial do processo lança laser.
MANTEM_LASER            EQU 1           ; Estado estável do processo lança laser.
MOVE_LASER              EQU 2           ; Estado transitório do processo lança laser.
EXTINGUE_LASER          EQU 3           ; Estado transitório do processo lança laser.
EXPLOSAO_APAGADA        EQU 0           ; Estado inicial do processo explosao
EXPLOSAO_ATIVA          EQU 1           ; Estado transitorio do processo explosao.
APAGA_EXPLOSAO          EQU 2           ; Estado transitório do processo explosao.


;***********************************************************************************************************************
;* Constantes de endereços                                                                                             *
;***********************************************************************************************************************

DISPLAYS        EQU 0A000H      ; Endereço dos displays de 7 segmentos (periférico POUT-1).
TEC_OUT         EQU 0C000H      ; Endereço das linhas do teclado (periférico POUT-2). 
TEC_IN          EQU 0E000H      ; Endereço das colunas do teclado (periférico PIN).
APAGA_ECRA      EQU 6000H       ; Comando que apaga todos os pixeis de um ecrã especificado. 
APAGA_TODOS     EQU 6002H       ; Comando que apaga todos os pixeis de todos os ecrãs.  
SEL_ECRA        EQU 6004H       ; Comando que seleciona o ecrã especificado.
MOSTRA_ECRA     EQU 6008H       ; Comando que mostra o ecrã especificado. 
ESCONDE_ECRA    EQU 6006H       ; Comando que esconde o ecrã especificado. 
SEL_PIX         EQU 600EH       ; Comando que seleciona o nº do pixel a usar no próximo comando.
MUDA_COR        EQU 6012H       ; Comando que altera a cor do pixel selecionado.
APAGA_FUNDO     EQU 6040H       ; Comando que apaga apaga o cenário de fundo.
SEL_FUNDO       EQU 6042H       ; Comando que seleciona o nº do cenário de fundo a visualizar.  
SEL_MEDIA       EQU 6048H       ; Comando que seleciona um vídeo a usar no próximo comando. 
SEL_TRANSICAO   EQU 6056H       ; Comando que especifíca um padrão de transição entre media.
START_1_MEDIA   EQU 605AH       ; Comando que reproduz o vídeo específicado uma vez.
START_MEDIA     EQU 605CH       ; Comando que reproduz o vídeo específicado em loop.
PAUSE_MEDIA     EQU 605EH       ; Comando que pausa o vídeo especificado.
UNPAUSE_MEDIA   EQU 6060H       ; Comando que des-pausa o vídeo especificado.
STOP_MEDIA      EQU 6066H       ; Comando que pára o vídeo especificado.
STOP_ALL        EQU 6068H       ; Comando que pára todos os vídeos. 
ESTADO_PIX      EQU 6014H       ; Comando que obtém se o pixel especificado está ligado ou desligado. 
ESTADO_MEDIA    EQU 6052H       ; Comando que obtém se um vídeo está a ser reproduzido ou não. 


;***********************************************************************************************************************
;* Variaveis/dados em memória                                                                                          *
;***********************************************************************************************************************

PLACE 2000H

pilha: 
    TABLE 800H
sp_inicial:

tab_interrupcoes:
                WORD rot_int_0  ; Rotina de atendimento da interrupção 0.
                WORD rot_int_1  ; Rotina de atendimento da interrupção 0.
                WORD rot_int_2  ; Rotina de atendimento da interrupção 0.

ocorreu_int:
                WORD 0          ; Se está a 1, ocorreu a interrupção 0.
                WORD 0          ; Se está a 1, ocorreu a interrupção 1.
                WORD 0          ; Se está a 1, ocorreu a interrupcão 2.
                
estado_gestao_jogo:             ; Variável que guarda o estado do processo gestão do jogo.
                WORD 0
tecla:      
                WORD 16         ; Variavel que guarda a tecla premida; inicializada a 16 (indica nenhuma tecla premida).

energia:    
                WORD 100        ; Variavel que guarda a energia da nave; inicializada a 100.
            
tab_objeto:
                WORD 0          ; Variável que guarda o endereço da tabela do objeto; inicializada a 0
            
local_objeto:
                WORD 0          ; Variável que guarda o número do pixel de referência do objeto a desenhar

ecra_pixel: 
                WORD 0          ; Variavel que guarda o ecra p/desenhar o pixel; inicializada a 0.
                
estado_gestao_nave:
                WORD 0          ; Variável que guarda o estado do processo gestao_nave.

local_nave:
                WORD 1759       ; Variável que guarda o pixel de referencia da nave; inicializado com 1759.
                
tab_asteroides:             ; Tabela que guarda os endereços das várias tabelas que contêm 
                            ; as cores de cada pixel do asteróide, consoante o seu tamanho.
            WORD tab_ast_1
            WORD tab_ast_2
            WORD tab_ast_3
            WORD tab_ast_4
            WORD tab_ast_5

tab_ast_1:                  ; Tabela que guarda as cores de cada pixel do asteroide no tamanho 1x1. 
            WORD 1          ; 1º elemento da tabela: número de linhas/colunas.
            WORD 0FDDDH

tab_ast_2:                  ; Tabela que guarda as cores de cada pixel do asteroide no tamanho 2x2. 
            WORD 2          ; 1º elemento da tabela: número de linhas/colunas.
            WORD 0FDDDH
            WORD 0000H
            WORD 0FDDDH
            WORD 0FDDDH
                    
tab_ast_3:                  ; Tabela que guarda as cores de cada pixel do asteroide no tamanho 3x3.
            WORD 3          ; 1º elemento da tabela: número de linhas/colunas.
            WORD 0000H
            WORD 0FDDBH
            WORD 0FDDBH

            WORD 0FDDBH
            WORD 0F786H
            WORD 0FDDBH

            WORD 0FDDBH
            WORD 0FDDBH
            WORD 0000H
                    
tab_ast_4:                  ; Tabela que guarda as cores de cada pixel do asteroide no tamanho 4x4.
            WORD 4          ; 1º elemento da tabela: número de linhas/colunas.
            WORD 0FDDBH
            WORD 0FDDBH
            WORD 0000H
            WORD 0000H

            WORD 0FDDBH
            WORD 0F786H
            WORD 0FDDBH
            WORD 0000H

            WORD 0000H
            WORD 0FDDBH
            WORD 0F786H
            WORD 0FDDBH

            WORD 0000H
            WORD 0000H
            WORD 0FDDBH
            WORD 0FDDBH
                    
                    
tab_ast_5:                  ; Tabela que guarda as cores de cada pixel do asteroide no tamanho 5x5.  
            WORD 5          ; 1º elemento da tabela: número de linhas/colunas.
            WORD 0000H
            WORD 0000H
            WORD 0000H
            WORD 0FDDBH
            WORD 0FDDBH				

            WORD 0000H
            WORD 0FDDBH
            WORD 0FDDBH
            WORD 0F786H
            WORD 0FDDBH

            WORD 0000H
            WORD 0FDDBH
            WORD 0F786H
            WORD 0FDDBH
            WORD 0000H

            WORD 0FDDBH
            WORD 0F786H
            WORD 0FDDBH
            WORD 0FDDBH
            WORD 0000H
            
            WORD 0FDDBH
            WORD 0FDDBH
            WORD 0000H
            WORD 0000H
            WORD 0000H
            	

tab_nave_inimiga:           ; Tabela que guarda os endereços das várias tabelas que contêm 
                            ; as cores de cada pixel da nave inimiga, consoante o seu tamanho.
            WORD tab_inimigo_1
            WORD tab_inimigo_2
            WORD tab_inimigo_3
            WORD tab_inimigo_4
            WORD tab_inimigo_5

tab_inimigo_1:              ; Tabela que guarda as cores de cada pixel da nave inimiga e no tamanho 1x1.  
            WORD 1          ; 1º elemento da tabela: número de linhas/colunas. 
            WORD 0FDDDH

tab_inimigo_2:              ; Tabela que guarda as cores de cada pixel da nave inimiga no tamanho 2x2.      
            WORD 2          ; 1º elemento da tabela: número de linhas/colunas. 
            WORD 0FDDDH
            WORD 0FDDDH
            WORD 0000H
            WORD 0FDDDH
                    
tab_inimigo_3:              ; Tabela que guarda as cores de cada pixel da nave inimiga no tamanho 3x3.      
            WORD 3          ; 1º elemento da tabela: número de linhas/colunas. 
            WORD 0FF22H
            WORD 0FFF0H
            WORD 0FF22H

            WORD 0000H
            WORD 0FF22H
            WORD 0000H

            WORD 0000H
            WORD 0000H
            WORD 0000H
                    
tab_inimigo_4:              ; Tabela que guarda as cores de cada pixel da nave inimiga no tamanho 4x4.       
            WORD 4          ; 1º elemento da tabela: número de linhas/colunas. 
            WORD 0FFF0H
            WORD 0000H
            WORD 0000H
            WORD 0FFF0H

            WORD 0000H
            WORD 0FF22H
            WORD 0FF22H
            WORD 0000H

            WORD 0FFF0H
            WORD 0FF22H
            WORD 0FF22H
            WORD 0FFF0H

            WORD 0000H
            WORD 0FF22H
            WORD 0FF22H
            WORD 0000H
                    
tab_inimigo_5:              ; Tabela que guarda as cores de cada pixel da nave inimiga no tamanho 5x5.       
            WORD 5          ; 1º elemento da tabela: número de linhas/colunas.        
            WORD 0FFF0H
            WORD 0000H
            WORD 0000H
            WORD 0000H
            WORD 0FFF0H

            WORD 0000H
            WORD 0FF22H
            WORD 0FF22H
            WORD 0FF22H
            WORD 0000H

            WORD 0FFF0H
            WORD 0FF22H
            WORD 0FF22H
            WORD 0FF22H
            WORD 0FFF0H

            WORD 0000H
            WORD 0FF22H
            WORD 0FF22H
            WORD 0FF22H
            WORD 0000H

            WORD 0000H
            WORD 0000H
            WORD 0FFF0H
            WORD 0000H
            WORD 0000H

tab_nave:                   ; Tabela que guarda as cores de cada pixel da nave. 
            WORD 5          ; 1º elemento da tabela: número de linhas/colunas.         
            WORD 0000H
            WORD 0000H
            WORD 0F0CFH
            WORD 0000H
            WORD 0000H
            
            WORD 0000H
            WORD 0F06FH
            WORD 0F06FH
            WORD 0F06FH
            WORD 0000H
            
            WORD 0F06FH
            WORD 0F06FH
            WORD 0F06FH
            WORD 0F06FH
            WORD 0F06FH
            
            WORD 0F06FH
            WORD 0F06FH
            WORD 0F06FH
            WORD 0F06FH
            WORD 0F06FH
            
            WORD 0F0CFH
            WORD 0000H
            WORD 0000H
            WORD 0000H
            WORD 0F0CFH
                    
tab_explosao:               ; Tabela que guarda as cores de cada pixel da explosao. 
            WORD 5          ; 1º elemento da tabela: número de linhas/colunas.        
            WORD 0FF00H
            WORD 0000H
            WORD 0FF00H
            WORD 0000H
            WORD 0FF00H
            
            WORD 0000H
            WORD 0FF00H
            WORD 0FF80H
            WORD 0FF00H
            WORD 0000H
            
            WORD 0FF00H
            WORD 0FF80H
            WORD 0FFF0H
            WORD 0FF80H
            WORD 0FF00H
            
            WORD 0000H
            WORD 0FF00H
            WORD 0FF80H
            WORD 0FF00H
            WORD 0000H
            
            WORD 0FF00H
            WORD 0000H
            WORD 0FF00H
            WORD 0000H
            WORD 0FF00H
                         
tab_laser:                  ; Tabela que guarda as cores do unico pixel do laser. 
            WORD 1          ; 1º elemento da tabela: número de linhas/colunas.              
            WORD 0F0FBH 
            
contador_aleatorio:         ; Contador de números aleatórios; inicializado com 0.
            WORD 0          

gera_ovni:                  ; Variável que guarda 0 ou 1, consoante é nave inimiga ou asteróide.
            WORD 0          
            
direcao_ovni:               ; Variável que guarda 0, 1 ou 2 , consoante a direção do ovni.
            WORD 0          

tab_ovni_0:                 ; Tabela c/as especifícações do ovni 0.
            WORD 0          ; Estado do processo gestao_ovnis para este ovni.
            WORD 0          ; Tipo de ovni: 0 ou 1.
            WORD 1          ; Linha do pixel de ref.: 0 a 31.
            WORD 31         ; Coluna do pixel de ref.: 0 a 63.
            WORD 0          ; Tipo de movimento.: 0, 1 ou 2. 
            WORD 1          ; Ecrã a desenhar o ovni.
            WORD 0          ; Tamanho atual(nº de linhas = nº de colunas) do ovni -1.
            WORD 0          ; Nº de movimentos do ovni.
            WORD 0          ; Guarda 0 se não houve colisão; 1 se colidiu com a nave e 2 se colidiu com o míssil.
            WORD 0          ; Guarda 1 se tem uma explosão ativa.
            WORD 0          ; Guarda o nº de ciclos da explosão.
            WORD 6          ; Guarda o nº do ecra da explosão deste ovni.
            
tab_ovni_1:                 ; Tabela c/as especifícações do ovni 1.
            WORD 0          ; Estado do processo gestao_ovnis para este ovni.
            WORD 0          ; Tipo de ovni: 0 ou 1.
            WORD 0          ; Linha do pixel de ref.: 0 a 31.
            WORD 31         ; Coluna do pixel de ref.: 0 a 63.
            WORD 0          ; Tipo de movimento.: 0, 1 ou 2. 
            WORD 2          ; Ecrã a desenhar o ovni.
            WORD 0          ; Tamanho atual(nº de linhas = nº de colunas) do ovni -1.
            WORD 0          ; Nº de movimentos do ovni.
            WORD 0          ; Guarda 0 se não houve colisão; 1 se colidiu com a nave e 2 se colidiu com o míssil.
            WORD 0          ; Guarda 1 se tem uma explosão ativa.
            WORD 0          ; Guarda o nº de ciclos da explosão.
            WORD 7          ; Guarda o nº do ecra da explosão deste ovni.
            
tab_ovni_2:                 ; Tabela c/as especifícações do ovni 0.
            WORD 0          ; Estado do processo gestao_ovnis para este ovni..
            WORD 0          ; Tipo de ovni: 0 ou 1.
            WORD 0          ; Linha do pixel de ref.: 0 a 31. 
            WORD 31         ; Coluna do pixel de ref.: 0 a 63.
            WORD 0          ; Tipo de movimento.: 0, 1 ou 2. 
            WORD 3          ; Ecrã a desenhar o ovni.
            WORD 0          ; Tamanho atual(nº de linhas = nº de colunas) do ovni -1.
            WORD 0          ; Nº de movimentos do ovni.
            WORD 0          ; Guarda 0 se não houve colisão; 1 se colidiu com a nave e 2 se colidiu com o míssil.
            WORD 0          ; Guarda 0 se tem uma explosão ativa.
            WORD 0          ; Guarda o nº de ciclos da explosão.
            WORD 8          ; Guarda o nº do ecra da explosão deste ovni.
            
tab_ovni_3:                 ; Tabela c/as especifícações do ovni 0.
            WORD 0          ; Estado do processo gestao_ovnis para este ovni.
            WORD 0          ; Tipo de ovni: 0 ou 1.
            WORD 0          ; Linha do pixel de ref.: 0 a 31.
            WORD 31         ; Coluna do pixel de ref.: 0 a 63.
            WORD 0          ; Tipo de movimento.: 0, 1 ou 2. 
            WORD 4          ; Ecrã a desenhar o ovni.
            WORD 0          ; Tamanho atual(nº de linhas = nº de colunas) do ovni -1.
            WORD 0          ; Nº de movimentos do ovni.
            WORD 0          ; Guarda 0 se não houve colisão; 1 se colidiu com a nave e 2 se colidiu com o míssil.
            WORD 0          ; Guarda 1 se tem uma explosão ativa.
            WORD 0          ; Guarda o nº de ciclos da explosão.
            WORD 9          ; Guarda o nº do ecra da explosão deste ovni.
            
tab_cor_ovni:               ; Variável que guarda o endereço da tabela com as cores do ovni.
            WORD 0

local_ovni:                 ; Variável que guarda o nº do pixel de ref. do ovni.
            WORD 0

verifica_limite:            ; Variável que se tiver o valor 1, indica que o ovni saiu pelo ecrã.
            WORD 0

local_laser:                ; Variável que guarda o nº do pixel onde o missil se encontra.
            WORD 0

ecra_laser:                 ; Variável que guarda o nº do ecrã a desenhar o laser.
            WORD 5

movimentos_laser:           ; Variável que guarda o nº de movimentos do laser.
            WORD 0

estado_lanca_laser:         ; Varíavel que guarda o estado do processo lança laser.
            WORD 0

lancamento_laser:           ; Ativo a 1 quando um laser é lançado.
            WORD 0
            
ocorreu_embate:             ; Variável que guarda as possíveis 
            WORD 0
            
pixel_inf_dir:              ; Variável que guarda o nº do pixel inferior direito de um objeto.
            WORD 0

deteta_colisao_nave:        ; Variável que guarda 1 se for detetada colisão do ovni com a nave.
            WORD 0

deteta_colisao_laser:       ; Variável que guarda 1 se for detetada colisão com o laser.
            WORD 0
            
deteta_pixeis_sobrepostos:  ; Variável que guarda 1 se houver pelo menos um pixel sobreposto nos ecrãs nave e ovni.
            WORD 0

estado_energia_interrupcao: ; Variável que guarda o estado do processo energia interrupcao.
            WORD 0        

contador_explosao:          ; Variável utilizada para guardar o nº de interrupções 2 ocorridas.
            WORD 0 
            
game_over:                  ; Variável ativa a 1 se houver colisão da nave inimiga c/a nave.
            WORD 0 
            
jogo_ativo:                 ; Variável ativa se se estiver no jogo principal(não menus).
            WORD 0 

ainda_pressiona_tecla:      ; Variável ativa se a tecla não for largada.
            WORD 0 
            
jogo_terminado:             ; Variável ativa se o jogador decidir terminar o jogo.
            WORD 0
            
copia_energia:              ; Variável que guarda uma cópia da energia da nave.
            WORD 100
            

;***********************************************************************************************************************
;* PROGRAMA PRINCIPAL                                                                                                  *
;***********************************************************************************************************************

PLACE 0

    MOV SP, sp_inicial                    ; Inicializa o SP para a palavra a seguir à última da pilha.
    MOV BTE, tab_interrupcoes             ; Inicializa BTE (registo de Base da Tabela de Exceções)
    EI                                    ; Permite interrupções.
    EI0                                   ; Permite interrupções 0.
    EI1                                   ; Permite interrupções 1.
    EI2                                   ; Permite interrupções 2.
    
    MOV R0, APAGA_TODOS                   ; Guarda o endereço do comando que apaga todos os pixeis de todos os ecrãs.
    MOV [R0], R1                          ; Apaga todos os pixeis de todos os ecrãs.
    MOV R0, APAGA_FUNDO                   ; Guarda o endereço do comando que apaga o cenário e o aviso.
    MOV [R0], R1                          ; Apaga o cenário e o aviso.

ciclo_principal:
    CALL rot_gestao_jogo                  ; Chama a rotina que gere o jogo.
    JMP ciclo_principal
  
;***********************************************************************************************************************
;* PROCESSOS                                                                                                           *
;***********************************************************************************************************************  
;***********************************************************************************************************************
;* PROCESSO GESTAO DO JOGO: processo central que gere o jogo Nave Guardiã Mineradora.                                  *
;*                          O processo é constítuido por 7 estados:                                                    *
;*                          - estado inicial(estável): reseta as variáveis de todos os processor e reproduz o video    * 
;*                            inicial em loop e verifica se foi premida a tecla C. Se sim, passa para o modo estável   *
;*                            e ativa a variável jogo_ativo.                                                           *
;*                          - estado estável: verifica se está em alguma das situações abaixo e se sim altera a        *
;*                            variável de estado para o estado transitório correspondente.                             *
;*                          Situações relevantes:                                                                      *
;*                          0) a variável jogo_ativo está a 1 (estado transitório 0)                                   *
;*                          1) foi premida a tecla E (pausa) + a variável jogo_ativo estava a 1 (estado transitório 1) *
;*                          2) foi premida a tecla E (pausa) + a variável jogo_ativo estava a 0 (estado transitório 2) *
;*                          3) foi premida a tecla F (parar) + a variável jogo_ativo estava a 1 (estado transitório 3) *
;*                          4) foi premida a tecla C (start) + a variável jogo_ativo estava a 0 (estado transitório 4) *
;*                          5) a variável game over estava 1 + a variável jogo_ativo estava a 1 (estado transitório 5) *
;*                          6) a variável energia estava 0   + a variável jogo_ativo estava a 1 (estado transitório 6) *
;*                          - 7 estados transitórios:                                                                  *
;*                           *Estado transtório 0: chama as rotinas que correm o jogo. Regressa ao estado estável.     *
;*                           *Estado transtório 1: pausa o vídeo de jogo, reproduz o vídeo de pausa e coloca           *
;*                                                   a variável jogo_ativo a 0. Regressa ao estado estável.            *
;*                           *Estado transtório 2: pára o video de pausa, reproduz o vídeo de jogo e coloca            *
;*                                                   a variável jogo_ativo a 1. Regressa ao estado estável.            *
;*                           *Estado transtório 3: pausa o vídeo de jogo, reproduz o vídeo de terminado e coloca       *
;*                                                   a variável jogo_ativo a 0. Coloca a variável jogo terminado       *
;*                                                   a 1. Regressa ao estado estável.                                  *
;*                           *Estado transtório 4: pausa o vídeo de terminado, reproduz o vídeo de jogo e coloca       *
;*                                                   a variável jogo_ativo a 1. Coloca a variável jogo terminado a 0.  *
;*                                                   Regressa ao estado inicial.                                       *
;*                           *Estado transtório 5: pausa o vídeo de jogo, reproduz o vídeo de perdeu p/colisao         *
;*                                                   e coloca a variável jogo_ativo a 0. Regressa ao estado estável.   *
;*                           *Estado transtório 6: pausa o vídeo de jogo, reproduz o vídeo de perdeu p/energia         *
;*                                                   e coloca a variável jogo_ativo a 0. Regressa ao estado estável.   *
;*                                                                                                                     *
;* ARGUMENTOS DE ENTRADA:                                                                                              *
;*                           INICIO_JOGO             - valor 0 (indica estado inicial).                                *
;*                           MANTEM_JOGO             - valor 1 (indica estado estável).                                *
;*                           JOGO_ATIVO              - valor 2
;*                           JOGO_TECLA_E_0          - valor 3 (indica estado transitório 0).                          *
;*                           JOGO_TECLA_E_1          - valor 4 (indica estado transitório 1).                          *
;*                           JOGO_TECLA_F            - valor 5 (indica estado transitório 2).                          *
;*                           JOGO_TECLA_C            - valor 6 (indica estado transitório 3).                          *
;*                           JOGO_GAME_OVER          - valor 7 (indica estado transitório 4).                          *
;*                           JOGO_SEM_ENERGIA        - valor 8 (indica estado transitório 5).                          *
;*                           [estado_gestao_jogo]    - guarda o estado (0,1,2,3,4,5,6 ou 7) deste processo             *
;*                           [jogo_ativo]            - se a 1, indica que se está a jogar (não se está nos "menus").   *
;*                           [game_over]             - se a 1, indica que houve colisão da nave inimiga com a nave.    *
;*                           [energia]               - se a 0, indica se a nave esgotou a sua energia.                 *
;*                           [jogo_terminado]        - se a 1, indica que o jogador quis terminar o jogo.
;***********************************************************************************************************************

rot_gestao_jogo:
    PUSH R0
    PUSH R1
    PUSH R2
    PUSH R10
    
    MOV R0, estado_gestao_jogo               ; Guarda o endereço da variável estado_gestao_jogo.
    MOV R1, [R0]                             ; Lê o estado deste processo.
    MOV R2, INICIO_JOGO                      ; Escreve 0 no registo 2.
    CMP R1, R2                               ; Está no estado inicial?
    JZ gestao_jogo_inicio                    ; Se sim, vai executá-lo.
    MOV R2, MANTEM_JOGO                      ; Escreve 1 no regito 2.
    CMP R1, R2                               ; Está no estado estável? 
    JZ gestao_jogo_mantem                    ; Se sim, vai executá-lo.
    MOV R2, JOGO_ATIVO                       ; Escreve 2 no regito 2.    
    CMP R1, R2                               ; Está no estado transitório 0?
    JZ gestao_jogo_t0                        ; Se sim, vai executá-lo.
    MOV R2, JOGO_TECLA_E_0                   ; Escreve 3 no regito 2.
    CMP R1, R2                               ; Está no estado transitório 1?
    JZ gestao_jogo_t1                        ; Se sim, vai executá-lo.
    MOV R2, JOGO_TECLA_E_1                   ; Escreve 4 no regito 2.
    CMP R1, R2                               ; Está no estado transitório 2?
    JZ gestao_jogo_t2                        ; Se sim, vai executá-lo.  
    MOV R2, JOGO_TECLA_F                     ; Escreve 5 no regito 2.
    CMP R1, R2                               ; Está no estado transitório 3?
    JZ gestao_jogo_t3                        ; Se sim, vai executá-lo.  
    MOV R2, JOGO_TECLA_C                     ; Escreve 6 no regito 2.
    CMP R1, R2                               ; Está no estado transitório 4?
    JZ gestao_jogo_t4                        ; Se sim, vai executá-lo.  
    MOV R2, JOGO_GAME_OVER                   ; Escreve 7 no regito 2.
    CMP R1, R2                               ; Está no estado transitório 5?
    JZ gestao_jogo_t5                        ; Se sim, vai executá-lo.    
    MOV R2, JOGO_SEM_ENERGIA                 ; Escreve 8 no regito 2.
    CMP R1, R2                               ; Está no estado transitório 6?
    JZ gestao_jogo_t6                        ; Se sim, vai executá-lo.
    
gestao_jogo_inicio:                          ; Estado inicial.
    CALL rot_gestao_jogo_inicio              ; Chama a rotina que executa o estado inicial.
    JMP sai_rot_gestao_jogo                  ; Sai.
    
gestao_jogo_mantem:                          ; Estado estável.
    CALL  rot_gestao_jogo_estavel            ; Chama a rotina que executa o estado estável.
    JMP sai_rot_gestao_jogo                  ; Sai.
    
gestao_jogo_t0:                              ; Estado transitório 0.
    CALL rot_gestao_jogo_t0                  ; Chama a rotina que executa o estado transitório 0. 
    MOV R0, MANTEM_JOGO                      ; Escreve 1 no registo 0.
    MOV R1, estado_gestao_jogo               ; Guarda o endereço da variável de estado.
    MOV [R1], R0                             ; Atualiza o estado p/o estado estável.
    JMP sai_rot_gestao_jogo                  ; Sai.
    
gestao_jogo_t1:                              ; Estado transitório 1.
    CALL rot_gestao_jogo_t1                  ; Chama a rotina que executa o estado transitório 1. 
    MOV R0, MANTEM_JOGO                      ; Escreve 1 no registo 0.
    MOV R1, estado_gestao_jogo               ; Guarda o endereço da variável de estado.
    MOV [R1], R0                             ; Atualiza o estado p/o estado estável.
    JMP sai_rot_gestao_jogo                  ; Sai.

gestao_jogo_t2:                              ; Estado transitório 2.
    CALL rot_gestao_jogo_t2                  ; Chama a rotina que executa o estado transitório 2. 
    MOV R0, MANTEM_JOGO                      ; Escreve 1 no registo 0.
    MOV R1, estado_gestao_jogo               ; Guarda o endereço da variável de estado.
    MOV [R1], R0                             ; Atualiza o estado p/o estado estável.
    JMP sai_rot_gestao_jogo                  ; Sai.
    
gestao_jogo_t3:                              ; Estado transitório 3.
    CALL rot_gestao_jogo_t3                  ; Chama a rotina que executa o estado transitório 3. 
    MOV R0, MANTEM_JOGO                      ; Escreve 1 no registo 0.
    MOV R1, estado_gestao_jogo               ; Guarda o endereço da variável de estado.
    MOV [R1], R0                             ; Atualiza o estado p/o estado estável.
    JMP sai_rot_gestao_jogo                  ; Sai.
    
gestao_jogo_t4:                              ; Estado transitório 4.
    CALL rot_verifica_se_ja_largou_tecla     ; Chama a rotina que verifica se já largou a tecla.
    MOV R0, ainda_pressiona_tecla            ; Guarda o endereço da variável c/ a informação se ainda pressiona a tecla.
    MOV R1, [R0]                             ; Cópia do valor dessa variável.
    CMP R1, 1                                ; Ainda pressiona a tecla?
    JZ gestao_jogo_t4                        ; Se sim, não sai daqui.
    MOV R0, STOP_ALL                         ; Se não, guarda o endereço do comando que pára todos os vídeos/sons.
    MOV [R0], R1                             ; Pára todos os vídeos/sons.
    MOV R0, APAGA_TODOS                      ; Guarda o endereço do comando que apaga todos os pixeis de todos os ecrãs.
    MOV [R0], R1                             ; Apaga todos os pixeis de todos os ecrãs.
    MOV R0, INICIO_JOGO                      ; Ecreve 0 no registo 0.
    MOV R1, estado_gestao_jogo               ; Guarda o endereço da variável do estado de gestão do jogo.
    MOV [R1], R0                             ; Atualiza o estado p/o estável.
    JMP sai_rot_gestao_jogo                  ; Sai.
    
gestao_jogo_t5:                              ; Estado transitório 5.
    CALL rot_gestao_jogo_t5                  ; Chama a rotina que executa o estado transitório 5.
    MOV R0, MANTEM_JOGO                      ; Escreve 1 no registo 0.
    MOV R1, estado_gestao_jogo               ; Guarda o endereço da variável de estado.
    MOV [R1], R0                             ; Atualiza o estado p/o estado estável.
    JMP sai_rot_gestao_jogo                  ; Sai.
    
gestao_jogo_t6:                              ; Estado transitório 5.
    CALL rot_gestao_jogo_t6                  ; Chama a rotina que executa o estado transitório 5.
    MOV R0, MANTEM_JOGO                      ; Escreve 1 no registo 0.
    MOV R1, estado_gestao_jogo               ; Guarda o endereço da variável de estado.
    MOV [R1], R0                             ; Atualiza o estado p/o estado estável.
    JMP sai_rot_gestao_jogo                  ; Sai.

sai_rot_gestao_jogo:
    POP R10
    POP R2
    POP R1
    POP R0
    RET
 
;***********************************************************************************************************************
;* ESTADO INICIAL DO PROCESSO GESTAO_JOGO:   reseta as variáveis de todos os processos, reproduz o video               * 
;*                                           inicial em loop e verifica se foi premida a tecla C.                      *
;*                                           Se sim, passa para o modo estável e ativa a variável jogo_ativo.          *
;***********************************************************************************************************************
 
rot_gestao_jogo_inicio:
    PUSH R0
    PUSH R1
    PUSH R2
    PUSH R3 
    MOV R0, estado_gestao_nave                  ; Guarda o endereço da variável de estado do processo gestao_nave.
    MOV R1, 0                                   ; Coloca 0 no registo 1.
    MOV [R0], R1                                ; Reseta essa variável de estado.
            
    MOV R0, estado_lanca_laser                  ; Guarda o endereço da variável de estado do processo gestao_lanca_laser
    MOV R1, 0                                   ; Coloca 0 no registo 1.
    MOV [R0], R1                                ; Reseta essa variável de estado.
    
    MOV R10, tab_ovni_0                         ; Guarda o endereço da tabela do 1º ovni.
    MOV R1, 0                                   ; Coloca 0 no registo 1.
    MOV [R10], R1                               ; Reseta a variável de estado do processo gestão 1 ovni p/este ovni.
    MOV R0, CICLOS_EXPLOSAO                     ; Escreve 22 no registo 0.
    ADD R0, R10                                 ; Obtém o endereço da entrada c/o nº de vezes que passou pela explosão.
    MOV R1, 0                                   ; Coloca 0 no registo 1.
    MOV [R0], R1                                ; Reseta essa variável.
    MOV R0, EXPLOSAO_OVNI                       ; Escreve 20 no registo 0.
    ADD R0, R10                                 ; Obtém o endereço da entrada c/ o pedido p desenhar explosao.
    MOV R1, 0                                   ; Coloca 0 no registo 1.
    MOV [R0], R1                                ; Reseta essa variável.
    
    MOV R10, tab_ovni_1                         ; Guarda o endereço da tabela do 2º ovni.
    MOV R1, 0                                   ; Coloca 0 no registo 1.
    MOV [R10], R1                               ; Reseta a variável de estado do processo gestão 1 ovni p/este ovni.
    MOV R0, CICLOS_EXPLOSAO                     ; Escreve 22 no registo 0.
    ADD R0, R10                                 ; Obtém o endereço da entrada c/o nº de vezes que passou pela explosão.
    MOV R1, 0                                   ; Coloca 0 no registo 1.
    MOV [R0], R1                                ; Reseta essa variável.
    MOV R0, EXPLOSAO_OVNI                       ; Escreve 20 no registo 0.
    ADD R0, R10                                 ; Obtém o endereço da entrada c/ o pedido p desenhar explosao.
    MOV R1, 0                                   ; Coloca 0 no registo 1.
    MOV [R0], R1                                ; Reseta essa variável.
    
    MOV R10, tab_ovni_2                         ; Guarda o endereço da tabela do 3º ovni.
    MOV R1, 0                                   ; Coloca 0 no registo 1.
    MOV [R10], R1                               ; Reseta a variável de estado do processo gestão 1 ovni p/este ovni.
    MOV R0, CICLOS_EXPLOSAO                     ; Escreve 22 no registo 0.
    ADD R0, R10                                 ; Obtém o endereço da entrada c/o nº de vezes que passou pela explosão.
    MOV R1, 0                                   ; Coloca 0 no registo 1.
    MOV [R0], R1                                ; Reseta essa variável.
    MOV R0, EXPLOSAO_OVNI                       ; Escreve 20 no registo 0.
    ADD R0, R10                                 ; Obtém o endereço da entrada c/ o pedido p desenhar explosao.
    MOV R1, 0                                   ; Coloca 0 no registo 1.
    MOV [R0], R1                                ; Reseta essa variável.
    
    MOV R10, tab_ovni_3                         ; Guarda o endereço da tabela do 4º ovni.
    MOV R1, 0                                   ; Coloca 0 no registo 1.
    MOV [R10], R1                               ; Reseta a variável de estado do processo gestão 1 ovni p/este ovni.
    MOV R0, CICLOS_EXPLOSAO                     ; Escreve 22 no registo 0.
    ADD R0, R10                                 ; Obtém o endereço da entrada c/o nº de vezes que passou pela explosão.
    MOV R1, 0                                   ; Coloca 0 no registo 1.
    MOV [R0], R1                                ; Reseta essa variável.
    MOV R0, EXPLOSAO_OVNI                       ; Escreve 20 no registo 0.
    ADD R0, R10                                 ; Obtém o endereço da entrada c/ o pedido p desenhar explosao.
    MOV R1, 0                                   ; Coloca 0 no registo 1.
    MOV [R0], R1                                ; Reseta essa variável.
    
    MOV R0, jogo_terminado                      ; Guarda o endereço da variável que indica se o jogo terminou.
    MOV R1, 0                                   ; Escreve 0 no registo 1.
    MOV [R0], R1                                ; Reseta a variável de cima.
    
    MOV R0, game_over                           ; Guarda o endereço da variável que indica se as naves colidiram.
    MOV R1, 0                                   ; Escreve 0 no registo 1.
    MOV [R0], R1                                ; Reseta a variável de cima.
    
    MOV R0, energia                             ; Guarda o endereço da variável c/o valor da energia.
    MOV R1, VALOR_100                           ; Escreve 100 no registo 1.
    MOV [R0], R1                                ; Reseta a variável de cima.
    CALL rot_displays                           ; Chama a rotina que mostra a energia nos displays.
    
    MOV R0, VIDEO_INICIO                        ; Escreve 0 no registo 0.
    MOV R1, SEL_MEDIA                           ; Guarda o endereço do comando que seleciona o video.
    MOV [R1], R0                                ; Seleciona o vídeo inicial.
    
    MOV R1, ESTADO_MEDIA                        ; Guarda o endereço do comando que devolve o estado do video.
    MOV R2, [R1]                                ; Cópia do estao desta video.
    MOV R3, 1                                   ; Escreve 1 no registo 3.
    CMP R2, R3                                  ; O video incial está a reproduzir?
    JNZ ativa_video_inicio                      ; Se não vai reproduzi-lo.
    
retorna_inicio:
    CALL rot_teclado                            ; Chama a rotina que varre o teclado.
    MOV R0, tecla                               ; Guarda o endereço da variável c/o valor da tecla. 
    MOV R1, [R0]                                ; Cópia do valor da tecla.
    MOV R2, TECLA_C                             ; Escreve 12 no registo 2.
    CMP R1, R2                                  ; Foi premida a tecla C?
    JZ vai_iniciar                              ; Se sim, vai mudar o estado.
    JMP sai_rot_gestao_inicio                   ; Se não, mantém o estado e sai.
    
ativa_video_inicio:
    MOV R1, START_MEDIA                         ; Guarda o endereço do comando que incia o video.
    MOV [R1], R0                                ; Inicia o vídeo incial.
    JMP retorna_inicio                          ; Volta ao ponto do código onde estava.

vai_iniciar:
    MOV R0, VIDEO_INICIO                        ; Escreve 2 no registo 0.
    MOV R1, STOP_MEDIA                          ; Guarda o endereço do comando que pára um vídeo.
    MOV [R1], R0                                ; Pára o vídeo de pausa.
    MOV R0, VIDEO_JOGO                          ; Ecreve 1 no registo 0.
    MOV R1, SEL_MEDIA                           ; Guarda o endereço do comando que seleciona um vídeo.
    MOV [R1], R0                                ; Seleciona o vídeo de jogo.
    MOV R1, START_MEDIA                         ; Guatrda o endereço do comando que inicia um vídeo.           
    MOV [R1], R0                                ; Inicia o vídeo de jogo.
    
    MOV R0, jogo_ativo                          ; Guarda o endereço da variável c/a informação de que se está a jogar.
    MOV R1, 1                                   ; Coloca 1 no registo 1.
    MOV [R0], R1                                ; Altera a variável acima p/1.
    
    MOV R1, estado_gestao_jogo                  ; Guarda o endereço da variável c/o estado deste processo.
    MOV R2, MANTEM_JOGO                         ; Escreve 2 no registo 2.
    MOV [R1], R2                                ; Altera o estado p/o estado estável.   
    JMP sai_rot_gestao_inicio                   ; Sai
    
sai_rot_gestao_inicio:
    POP R3
    POP R2
    POP R1
    POP R0
    RET

;***********************************************************************************************************************
;* ESTADO ESTÁVEL DO PROCESSO GESTÃO JOGO:  verifica se ocorreu alguma situação que o faça alterar a variável p/o      *
;*                                          estado transitório correspondente.                                         *
;***********************************************************************************************************************
 
 rot_gestao_jogo_estavel:
    PUSH R0
    PUSH R1
    PUSH R2
    PUSH R3
    PUSH R4
    PUSH R5
    
    CALL rot_teclado                        ; Chama a rotina que varre o teclado.
    MOV R0, tecla                           ; Guarda o endereço da variável c/o valor da tecla.
    MOV R1, [R0]                            ; Cópia do valor da tecla.
    MOV R2, TECLA_E                         ; Escreve 14 no registo 2.
    CMP R1, R2                              ; A tecla premida foi a E?
    JZ foi_premida_tecla_e                  ; Se sim, vai alterar o estado.
    MOV R2, TECLA_F                         ; Escreve 15 no registo 2.
    CMP R1, R2                              ; A tecla premida foi a F?
    JZ foi_premida_tecla_f                  ; Se sim, vai alterar o estado.
    MOV R2, TECLA_C                         ; Escreve 12 no registo 2.
    CMP R1, R2                              ; A tecla premida foi a C?
    JZ foi_premida_tecla_c                  ; Se sim, vai alterar o estado.   
    MOV R0, game_over                       ; Guarda o endereço da variável c/o a informação se houve colisão das naves.
    MOV R1, [R0]                            ; Lê o valor dessa variável.
    CMP R1, 1                               ; Ocorreu colisão das naves?
    JZ aconteceu_game_over                  ; Se sim, vai alterar o estado.
    MOV R0, copia_energia                   ; Guarda o endereço da variável c/o a informação se ficou sem energia. 
    MOV R1, [R0]                            ; Lê o valor dessa variável.
    CMP R1, 0                               ; Ficou sem energia?
    JZ ficou_sem_energia                    ; Se sim, vai alterar o estado.
    MOV R0, jogo_ativo                      ; Guarda o endereço da variável c/o a informação se está a jogar.  
    MOV R1, [R0]                            ; Lê o valor dessa variável.               
    CMP R1, 1                               ; Está a jogar?  
    JZ o_jogo_esta_ativo                    ; Se sim, vai alterar o estado.
    JMP sai_rot_gestao_jogo_estavel         ; Se não, sai e mantém o estado.

foi_premida_tecla_e:                        
    MOV R0, jogo_terminado                  ; Guarda o endereço da variável c/a informação de jogo terminado.
    MOV R1, [R0]                            ; Lê o valor dessa variável.
    CMP R1, 1                               ; O jogo está terminado?
    JZ sai_rot_gestao_jogo_estavel          ; Se sim, sai.        
    MOV R0, jogo_ativo                      ; Se não guarda o endereço da variávelc c/a informação se está a jogar.
    MOV R1, [R0]                            ; Lê o valor dessa variável.
    CMP R1, 0                               ; Está a jogar?
    JZ vai_retomar                          ; Se não, vai retomar.
    MOV R0, estado_gestao_jogo              ; Se sim, vai mudar o estado p/o transitório 1.
    MOV R1, JOGO_TECLA_E_1                  ; Escreve 4 no registo 1.
    MOV [R0], R1                            ; Altera a variável de estado.
    JMP sai_rot_gestao_jogo_estavel         ; Sai.

vai_retomar:
    MOV R0, estado_gestao_jogo              ; Guarda o endereço da variável de estado.         
    MOV R1, JOGO_TECLA_E_0                  ; Escreve 3 no registo 1.
    MOV [R0], R1                            ; Altera a variável de estado.
    JMP sai_rot_gestao_jogo_estavel         ; Sai.       

foi_premida_tecla_c:
    MOV R0, jogo_ativo                      ; Guarda o endereço da variável c/a informação se está a jogar.     
    MOV R1, [R0]                            ; Lê o valor dessa variável.
    CMP R1, 1                               ; Está a jogar?
    JZ sai_rot_gestao_jogo_estavel          ; Se sim, sai.  
    MOV R0, estado_gestao_jogo              ; Se não, guarda o endereço da variável de estado. .
    MOV R1, JOGO_TECLA_C                    ; Escreve 5 no registo 1.
    MOV [R0], R1                            ; Altera a variável de estado.
    JMP sai_rot_gestao_jogo_estavel         ; Sai.      

foi_premida_tecla_f:                        
    MOV R0, estado_gestao_jogo              ; Guarda o endereço da variável de estado.       
    MOV R1, JOGO_TECLA_F                    ; Escreve 6 no registo 1.     
    MOV [R0], R1                            ; Altera a variável de estado.    
    JMP sai_rot_gestao_jogo_estavel         ; Sai.   
    
ficou_sem_energia:
    MOV R0, estado_gestao_jogo              ; Guarda o endereço da variável de estado.        
    MOV R1, JOGO_SEM_ENERGIA                ; Escreve 7 no registo 1.           
    MOV [R0], R1                            ; Altera a variável de estado.     
    JMP sai_rot_gestao_jogo_estavel         ; Sai.              
        
aconteceu_game_over:                            
    MOV R0, estado_gestao_jogo              ; Guarda o endereço da variável de estado.             
    MOV R1, JOGO_GAME_OVER                  ; Escreve 8 no registo 1.        
    MOV [R0], R1                            ; Altera a variável de estado.  
    JMP sai_rot_gestao_jogo_estavel         ; Sai.                     

o_jogo_esta_ativo:                              
    MOV R0, estado_gestao_jogo              ; Guarda o endereço da variável de estado.        
    MOV R1, JOGO_ATIVO                      ; Escreve 0 no registo 1.  
    MOV [R0], R1                            ; Altera a variável de estado.      
    JMP sai_rot_gestao_jogo_estavel         ; Sai.         

    
sai_rot_gestao_jogo_estavel:
    POP R5
    POP R4
    POP R3
    POP R2
    POP R1
    POP R0
    RET


;***********************************************************************************************************************
;* ESTADO TRANSITÓRIO 0 DO PROCESSO GESTÃO JOGO:  chama as rotinas que correm o jogo.                                  *
;***********************************************************************************************************************

rot_gestao_jogo_t0:
    PUSH R0
    PUSH R1
    PUSH R2
    PUSH R3
    PUSH R10
    
    MOV R0, VALOR_10                       ; Escreve 10 no registo 0.
    MOV R1, 0                              ; Escreve 1 no registo 1.
ciclo_ecras_t0:
    MOV R2, MOSTRA_ECRA                    ; Guarda o endereço do comando que mostra o ecrã.
    MOV [R2], R1                           ; Mostra o ecrã cujo nº está no registo 1.
    ADD R1, 1                              ; Passa ao próximo ecrã.
    CMP R1, R0                             ; Já colocou visivéis todos os ecrãs?
    JNZ ciclo_ecras_t0                     ; Se não, continua.
        
    CALL rot_teclado                       ; Chama o processo que varre o teclado.
    CALL rot_gestao_nave                   ; Chama o processo que gere a nave.
    CALL rot_lanca_laser                   ; Chama o processo que lanca o laser.
    
    CALL rot_add_contador                  ; Chama a rotina que incrementa o contador.
    MOV R10, tab_ovni_0                    ; Guarda no registo 0 o endereço da tabela do 1º ovni.
    CALL rot_gestao_1_ovni                 ; Chama o processo que gere um ovni.
    
    CALL rot_add_contador                  ; Chama a rotina que incrementa o contador.
    MOV R10, tab_ovni_1                    ; Guarda no registo 0 o endereço da tabela do 1º ovni.
    CALL rot_gestao_1_ovni                 ; Chama o processo que gere um ovni. 
        
    CALL rot_add_contador                  ; Chama a rotina que incrementa o contador.
    MOV R10, tab_ovni_2                    ; Guarda no registo 0 o endereço da tabela do 1º ovni.
    CALL rot_gestao_1_ovni                 ; Chama o processo que gere um ovni.
        
    CALL rot_add_contador                  ; Chama a rotina que incrementa o contador.
    MOV R10, tab_ovni_3                    ; Guarda no registo 0 o endereço da tabela do 1º ovni.
    CALL rot_gestao_1_ovni                 ; Chama o processo que gere um ovni.
    JMP sai_rot_gestao_estavel          
    

sai_rot_gestao_estavel:
    POP R10
    POP R3
    POP R2
    POP R1
    POP R0
    RET

;***********************************************************************************************************************
;* ESTADO TRANSITÓRIO 1 DO PROCESSO GESTÃO JOGO:  retoma o vídeo de jogo, pausa o vídeo de pausa e coloca              *
;*                                                a variável jogo_ativo a 1.                                           *
;***********************************************************************************************************************

rot_gestao_jogo_t1:
    PUSH R0
    PUSH R1
    
    MOV R0, VALOR_10                       ; Escreve 10 no registo 0.
    MOV R1, 0                              ; Escreve 1 no registo 1.
ciclo_ecras_t1:
    MOV R2, MOSTRA_ECRA                    ; Guarda o endereço do comando que mostra o ecrã.
    MOV [R2], R1                           ; Mostra o ecrã cujo nº está no registo 1.
    ADD R1, 1                              ; Passa ao próximo ecrã.
    CMP R1, R0                             ; Já colocou visivéis todos os ecrãs?
    JNZ ciclo_ecras_t1                     ; Se não, continua.
    
    MOV R0, VIDEO_PAUSA                    ; Ecreve 1 no registo 0.
    MOV R1, SEL_MEDIA                      ; Guarda o endereço do comando que seleciona um vídeo.
    MOV [R1], R0                           ; Seleciona o vídeo de jogo.
    MOV R1, STOP_MEDIA                     ; Guatrda o endereço do comando que inicia um vídeo.           
    MOV [R1], R0                           ; Inicia o vídeo de jogo.
    
    MOV R0, VIDEO_JOGO                     ; Ecreve 1 no registo 0.
    MOV R1, SEL_MEDIA                      ; Guarda o endereço do comando que seleciona um vídeo.
    MOV [R1], R0                           ; Seleciona o vídeo de jogo.
    MOV R1, UNPAUSE_MEDIA                  ; Guatrda o endereço do comando que inicia um vídeo.           
    MOV [R1], R0                           ; Inicia o vídeo de jogo.
    
    MOV R0, jogo_ativo                     ; Guarda o endereço da variável que indica se está a jogar.
    MOV R1, 1                              ; Escreve 1 no registo 1.
    MOV [R0], R1                           ; Atualiza a variável.

sai_rot_estado_t1:
    CALL rot_verifica_se_ja_largou_tecla   ; Chama a rotina que verifica se já largou a tecla.
    MOV R0, ainda_pressiona_tecla          ; Obtém o endereço da variavél que indica se ainda tem premida a tecla.
    MOV R1, [R0]                           ; Cópia do valor dessa variável.
    CMP R1, 1                              ; Ainda tem a tecla premida?
    JZ sai_rot_estado_t1                   ; Se sim, não sai daqui.
    POP R1
    POP R0
    RET
    
;***********************************************************************************************************************
;* ESTADO TRANSITÓRIO 2 DO PROCESSO GESTÃO JOGO:  pára o video de jogo, reproduz o vídeo de pausa e coloca             *
;*                                                a variável jogo_ativo a 0.                                           *
;***********************************************************************************************************************

rot_gestao_jogo_t2:
    PUSH R0
    PUSH R1
    PUSH R2
    
    MOV R0, VALOR_10                       ; Escreve 10 no registo 0.
    MOV R1, 0                              ; Escreve 1 no registo 1.
ciclo_ecras_t2:
    MOV R2, ESCONDE_ECRA                   ; Guarda o endereço do comando que esconde o ecrã.
    MOV [R2], R1                           ; Esconde o ecrã cujo nº está no registo 1.
    ADD R1, 1                              ; Passa ao próximo ecrã.
    CMP R1, R0                             ; Já colocou invisivéis todos os ecrãs?
    JNZ ciclo_ecras_t2                     ; Se não, continua.
    
    MOV R0, VIDEO_JOGO                     ; Ecreve 1 no registo 0.
    MOV R1, SEL_MEDIA                      ; Guarda o endereço do comando que seleciona um vídeo.
    MOV [R1], R0                           ; Seleciona o vídeo de jogo.
    MOV R1, PAUSE_MEDIA                    ; Guatrda o endereço do comando que inicia um vídeo.           
    MOV [R1], R0                           ; Inicia o vídeo de jogo.
    
    MOV R0, VIDEO_PAUSA                    ; Ecreve 1 no registo 0.
    MOV R1, SEL_MEDIA                      ; Guarda o endereço do comando que seleciona um vídeo.
    MOV [R1], R0                           ; Seleciona o vídeo de jogo.
    MOV R1, START_MEDIA                    ; Guatrda o endereço do comando que inicia um vídeo.           
    MOV [R1], R0                           ; Inicia o vídeo de jogo.
    
    MOV R0, jogo_ativo                     ; Guarda o endereço da variável que indica se está a jogar.
    MOV R1, 0                              ; Escreve 0 no registo 1.
    MOV [R0], R1                           ; Atualiza a variável.
    
sai_rot_estado_t2:
    CALL rot_verifica_se_ja_largou_tecla   ; Chama a rotina que verifica se já largou a tecla.
    MOV R0, ainda_pressiona_tecla          ; Obtém o endereço da variavél que indica se ainda tem premida a tecla.
    MOV R1, [R0]                           ; Cópia do valor dessa variável.
    CMP R1, 1                              ; Ainda tem a tecla premida?
    JZ sai_rot_estado_t2                   ; Se sim, não sai daqui.
    
    POP R2
    POP R1
    POP R0
    RET
    
;***********************************************************************************************************************
;* ESTADO TRANSITÓRIO 3 DO PROCESSO GESTÃO JOGO:   pausa o vídeo de jogo, reproduz o vídeo de terminado e coloca       *
;*                                                 a variável jogo_ativo a 0. Coloca a variável jogo terminado a 1.    *
;***********************************************************************************************************************

rot_gestao_jogo_t3:
    PUSH R0
    PUSH R1
    PUSH R2
    
    MOV R0, VALOR_10                       ; Escreve 10 no registo 0.
    MOV R1, 0                              ; Escreve 1 no registo 1.
ciclo_ecras_t3:
    MOV R2, ESCONDE_ECRA                   ; Guarda o endereço do comando que esconde o ecrã.
    MOV [R2], R1                           ; Esconde o ecrã cujo nº está no registo 1.
    ADD R1, 1                              ; Passa ao próximo ecrã.
    CMP R1, R0                             ; Já colocou invisivéis todos os ecrãs?
    JNZ ciclo_ecras_t3                     ; Se não, continua.
    
    MOV R0, VIDEO_JOGO                     ; Escreve 1 no registo 0.
    MOV R1, STOP_MEDIA                     ; Guarda o endereço do comando que pára um vídeo.
    MOV [R1], R0                           ; Pára o vídeo de jogo.
    MOV R0, VIDEO_TERMINADO                ; Ecreve 3 no registo 0.
    MOV R1, SEL_MEDIA                      ; Guarda o endereço do comando que seleciona um vídeo.
    MOV [R1], R0                           ; Seleciona o vídeo de terminado.
    MOV R1, START_MEDIA                    ; Guatrda o endereço do comando que inicia um vídeo.           
    MOV [R1], R0                           ; Inicia o vídeo de terminado.
    
    MOV R0, jogo_ativo                     ; Guarda o endereço da variável que indica se está a jogar.
    MOV R1, 0                              ; Escreve 0 no registo 1.
    MOV [R0], R1                           ; Atualiza a variável.
    
    MOV R0, jogo_terminado                 ; Guarda o endereço da variável que indica se terminou.
    MOV R1, 1                              ; Escreve 1 no registo 1.
    MOV [R0], R1                           ; Atualiza a variável.
    
sai_rot_estado_t3:
    CALL rot_verifica_se_ja_largou_tecla   ; Chama a rotina que verifica se já largou a tecla.
    MOV R0, ainda_pressiona_tecla          ; Obtém o endereço da variavél que indica se ainda tem premida a tecla.
    MOV R1, [R0]                           ; Cópia do valor dessa variável.
    CMP R1, 1                              ; Ainda tem a tecla premida?
    JZ sai_rot_estado_t3                   ; Se sim, não sai daqui.
    
    POP R2
    POP R1
    POP R0
    RET
    
;***********************************************************************************************************************
;* ESTADO TRANSITÓRIO 5 DO PROCESSO GESTÃO JOGO:  pausa o vídeo de jogo, reproduz o vídeo de perdeu p/colisao          *
;*                                               e coloca a variável jogo_ativo a 0.                                   *
;***********************************************************************************************************************

rot_gestao_jogo_t5:
    PUSH R0
    PUSH R1
    PUSH R2
    
    MOV R0, VALOR_10                       ; Escreve 10 no registo 0.
    MOV R1, 0                              ; Escreve 1 no registo 1.
ciclo_ecras_t5:
    MOV R2, ESCONDE_ECRA                   ; Guarda o endereço do comando que esconde o ecrã.
    MOV [R2], R1                           ; Esconde o ecrã cujo nº está no registo 1.
    ADD R1, 1                              ; Passa ao próximo ecrã.
    CMP R1, R0                             ; Já colocou invisivéis todos os ecrãs?
    JNZ ciclo_ecras_t5                     ; Se não, continua.

    MOV R0, VIDEO_JOGO                     ; Escreve 1 no registo 0.
    MOV R1, STOP_MEDIA                     ; Guarda o endereço do comando que pára um vídeo.
    MOV [R1], R0                           ; Pára o vídeo de jogo.
    MOV R0, VIDEO_LOSE_COLISAO             ; Ecreve 4 no registo 0.
    MOV R1, SEL_MEDIA                      ; Guarda o endereço do comando que seleciona um vídeo.
    MOV [R1], R0                           ; Seleciona o vídeo de terminado p/colisão.
    MOV R1, START_MEDIA                    ; Guatrda o endereço do comando que inicia um vídeo.           
    MOV [R1], R0                           ; Inicia o vídeo de terminado p/colisão.
    
    MOV R0, jogo_ativo                     ; Guarda o endereço da variável que indica se está a jogar.
    MOV R1, 0                              ; Escreve 0 no registo 1.
    MOV [R0], R1                           ; Atualiza a variável.
    
    MOV R0, game_over                      ; Guarda o endereço da variável que indica se terminou p/colsiao.
    MOV R1, 0                              ; Escreve 0 no registo 1.
    MOV [R0], R1                           ; "Consome" a colisão.
    
    MOV R0, jogo_terminado                 ; Guarda o endereço da variável que indica se terminou.
    MOV R1, 1                              ; Escreve 1 no registo 1.
    MOV [R0], R1                           ; Atualiza a variável.
    
    MOV R0, SOM_PERDEU_COLISAO              
    MOV R1, START_1_MEDIA                  ; Guarda o endereço do comando que inicia um video uma vez.
    MOV [R1], R0
    
    
sai_rot_estado_t5:
    CALL rot_verifica_se_ja_largou_tecla   ; Chama a rotina que verifica se já largou a tecla.
    MOV R0, ainda_pressiona_tecla          ; Obtém o endereço da variavél que indica se ainda tem premida a tecla.
    MOV R1, [R0]                           ; Cópia do valor dessa variável.
    CMP R1, 1                              ; Ainda tem a tecla premida?
    JZ sai_rot_estado_t5                   ; Se sim, não sai daqui.
    
    POP R2
    POP R1
    POP R0
    RET
    
;***********************************************************************************************************************
;* ESTADO TRANSITÓRIO 6 DO PROCESSO GESTÃO JOGO:  pausa o vídeo de jogo, reproduz o vídeo de perdeu p/energia          *
;*                                                e coloca a variável jogo_ativo a 0.                                  *
;***********************************************************************************************************************

rot_gestao_jogo_t6:
    PUSH R0
    PUSH R1
    PUSH R2
    
    MOV R0, VALOR_10                       ; Escreve 10 no registo 0.
    MOV R1, 0                              ; Escreve 1 no registo 1.
ciclo_ecras_t6:
    MOV R2, ESCONDE_ECRA                   ; Guarda o endereço do comando que esconde o ecrã.
    MOV [R2], R1                           ; Esconde o ecrã cujo nº está no registo 1.
    ADD R1, 1                              ; Passa ao próximo ecrã.
    CMP R1, R0                             ; Já colocou invisivéis todos os ecrãs?
    JNZ ciclo_ecras_t6                     ; Se não, continua.
    
    MOV R0, VIDEO_JOGO                     ; Escreve 1 no registo 0.
    MOV R1, STOP_MEDIA                     ; Guarda o endereço do comando que pára um vídeo.
    MOV [R1], R0                           ; Pára o vídeo de jogo.
    MOV R0, VIDEO_LOSE_ENERGIA             ; Ecreve 5 no registo 0.
    MOV R1, SEL_MEDIA                      ; Guarda o endereço do comando que seleciona um vídeo.
    MOV [R1], R0                           ; Seleciona o vídeo de terminado p/energia.
    MOV R1, START_MEDIA                    ; Guatrda o endereço do comando que inicia um vídeo.           
    MOV [R1], R0                           ; Inicia o vídeo de terminado p/energia.
    
    MOV R0, jogo_ativo                     ; Guarda o endereço da variável que indica se está a jogar.
    MOV R1, 0                              ; Escreve 0 no registo 1.
    MOV [R0], R1                           ; Atualiza a variável.
    
    MOV R0, copia_energia                  ; Guarda o endereço da variável que indica se terminou p/energia.
    MOV R1, 1                              ; Escreve 1 no registo 1.
    MOV [R0], R1                           ; "Consome".
    
    MOV R0, jogo_terminado                 ; Guarda o endereço da variável que indica se terminou.
    MOV R1, 1                              ; Escreve 1 no registo 1.
    MOV [R0], R1                           ; Atualiza a variável.
    
    MOV R0, SOM_PERDEU_ENERGIA              
    MOV R1, START_1_MEDIA                  ; Guarda o endereço do comando que inicia um video uma vez.
    MOV [R1], R0
    
sai_rot_estado_t6:
    CALL rot_verifica_se_ja_largou_tecla   ; Chama a rotina que verifica se já largou a tecla.
    MOV R0, ainda_pressiona_tecla          ; Obtém o endereço da variavél que indica se ainda tem premida a tecla.
    MOV R1, [R0]                           ; Cópia do valor dessa variável.
    CMP R1, 1                              ; Ainda tem a tecla premida?
    JZ sai_rot_estado_t6                   ; Se sim, não sai daqui.
    
    POP R2
    POP R1
    POP R0
    RET
  
;***********************************************************************************************************************
;* PROCESSO GESTAO NAVE:   Processo que controla o movimento da nave, em função das teclas 5 (esquerda) e 7 (direita). *
;*                         O processo é constítuido por 3 estados:                                                     *
;*                         - estado inicial(estável): onde a é nave é desenhada na posição central no fundo do ecrã;   * 
;*                         - estado estável: mantém a posição da nave e verifica se houve uma tecla premida ou se      *
;*                           ocorreu a interrupção 2.                                                                  *
;*                         - estado transitório 0: apaga a nave e reescreve-a no novo local consoante a tecla.         *
;*                         - estado transitório 1: altera a variável energia e mostra-a nos displays.                  *
;*                         Após inicialização, o processo vai transitando entre o estado estável e estado transitório, *
;*                         consoante a pressão ou não de teclas.                                                       *
;*                                                                                                                     *
;*  ARGUMENTOS DE ENTRADA:                                                                                             *
;*                              INICIO_GESTAO_NAVE    - valor 0 (estado inicial).                                      *
;*                              MANTEM_NAVE           - valor 1 (estado estável).                                      *
;*                              ENERGIA_NAVE          - valor 2 (estado transitório 0)                                 *
;*                              MOVE_NAVE             - valor 3 (estado transitório 1).                                *
;*                              TEC_5                 - valor 5.                                                       *
;*                              TEC_7                 - valor 7.                                                       *
;*                              VAR_16                - valor 16.                                                      *
;*                              [estado_gestao_nave]  - 0, 1 ou 2, indicando qual o estado do processo.                *
;*                              [tab_objeto]          - endereço da tabela c/ as especificacoes do objeto a apagar.    *
;*                              [local_objeto]        - nº do pixel de referência do objeto a desenhar.                *
;*                              [tab_nave]            - endereço da tabela c/ as especificacoes do nave a apagar.      *
;*                              [local_nave]          - nº do pixel de referência da nave a desenhar.                  *
;***********************************************************************************************************************

rot_gestao_nave:
    PUSH R0
    PUSH R1
    PUSH R2
    PUSH R3
    PUSH R4
    PUSH R5
    PUSH R6
    PUSH R7
    PUSH R8
    PUSH R9
    PUSH R10
    
    MOV R0, estado_gestao_nave        ; Cópia do endereço da variável de estado deste processo.
    MOV R8, [R0]                      ; Guarda o valor do estado do processo.
    CMP R8, INICIO_GESTAO_NAVE        ; Estado inicial?
    JZ gestao_nave_inicio             ; Se sim, vai executar o estado inicial.
    CMP R8, MANTEM_NAVE               ; Estado estável?
    JZ gestao_nave_mantem             ; Se sim, vai executar o estado estável.
    CMP R8, ENERGIA_NAVE              ; Estado transitório 0?
    JZ gestao_energia_nave            ; Se sim, vai executar o estado transitorio 0.
    CMP R8, MOVE_NAVE                 ; Estado transitório 1? 
    JZ gestao_nave_move               ; Se sim, vai executar o estado transitorio 1.
    
gestao_nave_inicio:                   ; Estado inicial.
    CALL rot_inicia_variaveis_nave    ; Chama a rotina que faz reset às variáveis da nave.
    CALL rot_displays                 ; Chama a rotina que atualiza os displays.   
    MOV R1, tab_objeto                ; Cópia do endereço da variável c/ endereço da tabela c/especificacoes da nave.
    MOV R2, tab_nave                  ; Cópia do endereço da tabela com as especificacoes da nave.
    MOV [R1], R2                      ; Guarda o endereço da tabela c/ as especificacoes da nave na variavel tab objeto.
    MOV R3, local_objeto              ; Copia do endereço da variavel que guarda o pixel de referencia. 
    MOV R4, local_nave                ; Copia o endereço da variável com o pixel de referencia.
    MOV R5, [R4]                      ; Guarda o nº do pixel de referência.
    MOV [R3], R5                      ; Guarda o nº do pixel a desenhar na variavel local_objeto.
    MOV R6, ecra_pixel                ; Cópia do endereço do comando que permite selecionar o ecra a desenhar.
    MOV R7, 0                         ; Coloca 0 no registo 7.
    MOV [R6], R7                      ; Seleciona que se vai desenhar no ecrã 0.
    CALL rot_desenha_objeto           ; Chama a rotina de desehar objeto.
    MOV R9, MANTEM_NAVE               ; Coloca 1 no registo 9.
    MOV [R0], R9                      ; Atualiza a variavel de estado deste processo.
    JMP sai_gestao_nave               ; Sai.

gestao_nave_mantem:                   ; Estado estável.
    MOV R0, ocorreu_int               ; Guarda o endereço da tabela c/as variáveis se ocorreu interrupções.
    MOV R1, VALOR_4                   ; Escreve 4 no registo 1.
    ADD R0, R1                        ; Endereço da entrada da variável c/a ocorrência da interrupção 2.
    MOV R1, [R0]                      ; Lê essa entrada.
    CMP R1, 1                         ; Ocorreu interrupção 2?
    JZ muda_estado_interrupcao        ; Se sim, vai mudar o estado p/o estado transitório 0.
    MOV R1, tecla                     ; Endereço da variável que contém o valor da tecla premida (ou nenhuma).
    MOV R10, [R1]                     ; Lê o valor dessa variável.
    MOV R3, VAR_16                    ; Escreve 16 no registo 3.
    CMP R10, R3                       ; Se não premiu nenhuma tecla, 
    JZ  sai_gestao_nave               ; Sai
    MOV R0, estado_gestao_nave        ; Guarda o endereço da variável c/a informação sobre o estado deste processo. 
    MOV R2, MOVE_NAVE                 ; Guarda o valor do proximo estado (vai para o estado transitório 1).
    MOV [R0], R2                      ; Escreve na variavél de estado, o valor do próximo estado.
    JMP sai_gestao_nave               ; Sai.

muda_estado_interrupcao:              
    MOV R0, estado_gestao_nave        ; Guarda o endereço da variável estado_energia.
    MOV R1, ENERGIA_NAVE              ; Escreve 2 no registo 1.
    MOV [R0], R1                      ; Altera a variável de estado deste processo p/ o estado transitório 0.
    JMP sai_gestao_nave               ; Sai.
    
gestao_energia_nave:                  ; Estado transitório 0. 
    MOV R0, energia                   ; Guarda o endereço da variável c/ o contador de energia.                   
    MOV R1, [R0]                      ; Lê o valor da energia.
    MOV R2, VALOR_5                   ; Escreve 5 no registo 2.
    SUB R1, R2                        ; Subtrai 5 à energia.
    MOV [R0], R1                      ; Atualiza a variavel energia.
    CALL rot_displays                 ; Chama a rotina que atualiza os displays.
    
    MOV R0, estado_gestao_nave        ; Guarda o endereço da variável c/o estado do processo.
    MOV R1, MANTEM_NAVE               ; Escreve 1 no registo 1.
    MOV [R0], R1                      ; Altera a variável de estado para o estado estável.
    
    MOV R0, ocorreu_int               ; Guarda o endereço da tabela c/as variáveis se ocorreu interrupções.
    MOV R1, VALOR_4                   ; Escreve 4 no registo 1.
    ADD R0, R1                        ; Endereço da entrada da variável c/a ocorrência da interrupção 2.
    MOV R1, 0                         ; Escreve 0 no registo 1.
    MOV [R0], R1                      ; "Consome" a interrupçãp
    JMP sai_gestao_nave               ; Sai.
       
gestao_nave_move:                     ; Estado transitório 1: 
    CALL rot_move_nave                ; Chama a rotina que movimenta a nave.
    MOV R1, MANTEM_NAVE               ; Guarda o valor do proximo estado (retorna ao estado estável).
    MOV [R0], R1                      ; Escreve na variavél de estado, o valor do próximo estado.
    JMP sai_gestao_nave               ; Sai.
    
sai_gestao_nave: 
    POP R10
    POP R9
    POP R8
    POP R7
    POP R6
    POP R5
    POP R4
    POP R3
    POP R2
    POP R1
    POP R0
    RET


;***********************************************************************************************************************
;* PROCESSO GESTAO 1 OVNI:      processo que controla o aparecimento, tipo e movimento de um ovni.                     *
;*                              O processo é constítuido por 3 estados:                                                *
;*                              - estado inicial(estável): onde o ovni é desenhado, no seu ecrã e  na posição central  *
;*                                no topo do ecrã.                                                                     *
;*                           - estado estável: mantém a posição do ovni e verifica se ocorreu uma interrupção.      *
;*                           - estado transitório 0: apaga o ovni e reescreve-o no novo local consoante a sua direção.*
;*                           - estado transitório 1: atende o tipo de colisao .                                        *
;*                              Após inicialização, o processo vai transitando entre o estado estável e o estado       *
;*                              transitório, consoante a ocorrência de interrupções.                                   *
;*                              Retorna ao estado inicial se for eliminado ou chegar ao fundo do ecrã.                 *
;*                                                                                                                     *
;*  ARGUMENTOS DE ENTRADA:                                                                                             *
;*                        R10                    - endereço da tabela do ovni.                                         *
;*                        START_1_OVNI           - valor 0 (estado inicial).                                           *
;*                        MANTEM_1_OVNI          - valor 1 (estado estável).                                           *
;*                        MOVE_1_OVNI            - valor 2 (estado transitório).                                       *
;*               TRATA_COLISAO_OVNI              - valor 3 (estado transitório).                                       *
;*                        MOVIMENTOS_OVNI        - valor 14.                                                           *
;*                        COLISAO_OVNI           - valor 16.                                                           *
;*                        [ocorreu_int]          - valor a 1 se tiver ocorrido a interrupcao 0.                        *
;*  ARGUMENTOS DE SAÍDA:                                                                                               *
;*                        [ocorreu_int]          - valor a 0, se tiver "consumido" a interrupcao 0.                    *
;***********************************************************************************************************************

rot_gestao_1_ovni:
    PUSH R0
    PUSH R1
    PUSH R2
    PUSH R3
    PUSH R4
    PUSH R10
 
    MOV R0, [R10]                   ; Lê a variável de estado do proceso gestao_1_ovni, para este ovni.
    CMP R0, START_1_OVNI            ; Está no estado inicial?
    JZ gestao_1_ovni_inicio         ; Se sim, vai executar o estado incicial.
    CMP R0, MANTEM_1_OVNI           ; Está no estado estável?
    JZ gestao_1_ovni_estavel        ; Se sim, vai executar o estado estável.
    CMP R0, MOVE_1_OVNI             ; Está no estado transitório 0?
    JZ gestao_1_ovni_t0             ; Se sim, vai executar o estado transitório 0.
    CMP R0, TRATA_COLISAO_OVNI      ; Está no estado transitório 1?
    JZ gestao_1_ovni_t1             ; Se sim, vai executar o estado transitório 1.
    JMP gestao_1_ovni_estavel
    
gestao_1_ovni_inicio:               ; Estado inicial do processo.
    CALL rot_inicializa_ovni        ; Reseta variáveis estratégicas do ovni.
    CALL rot_atribui_ovni           ; Chama a rotina que atribui o tipo e a direção ao ovni.
    CALL rot_desenha_ovni           ; Chama a rotina que desenha o ovni.
    MOV R1, MANTEM_1_OVNI           ; Coloca 1 no registo 1.
    MOV [R10], R1                   ; Atualizada a variável de estado deste ovni para um.
    JMP sai_rot_gestao_1_ovni       ; Sai.

gestao_1_ovni_estavel:              ; Estado estável do processo.
    MOV R1, ocorreu_int             ; Guarda o endereço da variável que guarda a ocorrência ou não de interrupção.
    MOV R2, [R1]                    ; Lê o valor dessa variável.
    CMP R2, 1                       ; Ocorreu interrupção?
    JZ aumenta_estado               ; Se sim, vai passar ao estado transitório 0.
    MOV R0, COLISAO_OVNI            ; Se não, guarda 16 no registo 0.
    ADD R0, R10                     ; Obtém o endereço da entrada da tabela do ovni c/ ocorrência ou não se embate.
    MOV R1, [R0]                    ; Guarda esse valor.
    CMP R1, 0                       ; Ocorreu colisão?
    JZ sai_rot_gestao_1_ovni        ; Se não, mantém o estado e sai.
    MOV R0, TRATA_COLISAO_OVNI      ; Se sim, coloca 3 no resgisto 0.
    MOV [R10], R0                   ; Vai alterar o estado p/o estado transitório 1-
    JMP sai_rot_gestao_1_ovni       ; Sai
    
aumenta_estado:                     
    MOV R1, MOVE_1_OVNI             ; Escreve 2 no registo 1.
    MOV [R10], R1                   ; Altera a variável de estado deste ovni para 2.
    JMP sai_rot_gestao_1_ovni       ; Sai.

gestao_1_ovni_t0:                   ; Estado transitório 0 do processo.
    MOV R1, MANTEM_1_OVNI           ; Escreve 1 no registo 1.
    MOV [R10], R1                   ; Altera p/1 a variável de estado deste processo para este ovni.
    
    MOV R1, ocorreu_int             ; Guarda o endereço da variável que guarda a ocorrência ou não de interrupção.
    MOV R2, 0                       ; Coloca 0 no registo 2.
    MOV [R1], R2                    ; "Consome" a interrupção. 
    
    MOV R3, MOVIMENTOS_OVNI         ; Coloca 14 no registo 3.
    ADD R3, R10                     ; Guarda o endereço da entrada da tabela c/ o nº de movimentos do ovni.
    MOV R4, [R3]                    ; Cópia do nº de movimentos do ovni.
    ADD R4, 1                       ; Adiciona 1 movimento.
    MOV [R3], R4                    ; Atualiza a variável de movimentos.
    
    CALL rot_movimenta_ovni         ; Chama a rotina que movimenta o ovni.
    MOV R1, [R10]                   ; Guarda a variável de estado do ovni.
    CMP R1, 0                       ; É zero?
    JZ sai_rot_gestao_1_ovni        ; Se sim, sai.
    
    CALL rot_deteta_colisao         ; Se não, chama a rotina que deteta se houve colisão.
    CALL rot_explosao               ; Chama o processo que gere a explosão.
    JMP sai_rot_gestao_1_ovni       ; Sai
    
gestao_1_ovni_t1:
    CALL rot_trata_colisao          ; Chama a rotina que age um virtude da colisão ocorrida.
    MOV R1, START_1_OVNI            ; Coloca 0 no resgisto 1.
    MOV [R10], R1                   ; Altera o estado para o estado inicial.
    
sai_rot_gestao_1_ovni:
    POP R10
    POP R4
    POP R3
    POP R2
    POP R1
    POP R0
    RET

;***********************************************************************************************************************
;* PROCESSO LANCA LASER:   processo que desenha o laser no topo da nave após ser premida a tecla 2 e movimenta-o em    *
;*                         linha reta, até a um máximo de 12 movimentos, extinguindo-o.                                *
;*                         O processo é constítuido por 3 estados:                                                     *
;*                         - estado inicial(estável): verifica se foi premida a tecla 2 e se sim desenha o laser       *
;*                           na posição exatamente acima da nave.                                                      *
;*                         - estado estável: mantém a posição do laser e verifica se ocorreu interrupção.              *
;*                         - estado transitório 0: apaga o laser  e reescreve-a no novo local                          *
;*                         - estado transitório 1: extingue o laser e espera que seja largada a tecla .                *
;*                           Após inicialização, o processo vai transitando entre o estado                             *
;*                           estável e estado transitório, consoante ocorrência de interrupções, até a um máximo de    *
;*                           12 transições, altura em que retorna ao estado inicial.                                   *
;*                                                                                                                     *
;* ARGUMENTOS DE ENTRADA:                                                                                              *
;*                               START_LASER     - valor 0.                                                            *
;*                              MANTEM_LASER     - valor 1.                                                            *
;*                                MOVE_LASER     - valor 2.                                                            *
;*                            EXTINGUE_LASER     - valor 3.
;*                                   VALOR_2     - valor 2.                                                            *
;*                                  VALOR_12     - valor 12.                                                           *
;*                      [estado_lanca_laser]     - estado do processo lança laser.                                     *
;*                        [movimentos_laser]     - nº de movimentos do laser.                                          *
;*                       [lancamento_laser]      - regista 1 quando a laser é lançado.                                 *
;*                                   [tecla]     - nº da tecla premida ou 16 se nenhuma premida.                       *
;*                   [ocorreu_int + VALOR_2]     - 1 se ocorreu interrupção 1.                                         *
;***********************************************************************************************************************


rot_lanca_laser:
    PUSH R0
    PUSH R1
    PUSH R2
    PUSH R3
    PUSH R4
    PUSH R5
    
    
    MOV R0, estado_lanca_laser          ; Guarda o endereço da variável estado_lanca_laser.
    MOV R4, [R0]                        ; Cópia do valor do estado do processo.
    MOV R1, START_LASER                 ; Escreve 0 no registo 1.
    CMP R4, R1                          ; Estado inicial?
    JZ lanca_laser_start                ; Vai para o estado inicial.
    MOV R1, MANTEM_LASER                ; Escreve 1 no registo 1.
    CMP R4, R1                          ; Estado estável?
    JZ lanca_laser_mantem               ; Vai para o estado estável.
    MOV R1, MOVE_LASER                  ; Escreve 2 no registo 1.
    CMP R4, R1                          ; Estado transitório 0?
    JZ lanca_laser_move                 ; Vai para o estado transitório 0.
    MOV R1, EXTINGUE_LASER              ; Escreve 3 no registo 1.
    CMP R4, R1                          ; Estado transitório 1?
    JZ vai_extinguir_laser              ; Vai para o estado transitório 1.

lanca_laser_start:                      ; Estado inicial.
    CALL rot_inicializa_laser           ; Chama a rotina que faz reset às variáveis do laser.
    MOV R2, tecla                       ; Cópia do endereço da variável tecla.
    MOV R3, [R2]                        ; Guarda o valor da tecla.
    MOV R2, VALOR_2                     ; Escreve 2 no registo 2.
    CMP R3, R2                          ; A tecla premida foi a 2?
    JZ  inicia_laser                    ; Se sim, vai inicializar o laser.
    JMP sai_rot_lanca_laser             ; Se não sai do processo e mantém o estado.

inicia_laser:
    CALL rot_gera_laser                 ; Chama a rotina responsável por gerar o laser.
    MOV R1, MANTEM_LASER                ; Escreve 1 no registo 1.
    MOV [R0], R1                        ; Atualiza a variável de estado para o estado estável.
    MOV R0, lancamento_laser            ; Guarda o endereço da variável lancamento_laser 1.
    MOV R1, 1                           ; Coloca 1 no registo 1.
    MOV [R0], R1                        ; Atualiza esta variável.
    
    MOV R0, SOM_LASER             
    MOV R1, START_1_MEDIA                  ; Guarda o endereço do comando que inicia um video uma vez.
    MOV [R1], R0
    JMP sai_rot_lanca_laser             ; Sai.
    
lanca_laser_mantem:                     ; Estado estável.
    MOV R2, VALOR_2                     ; Escreve 2 no registo 2.
    MOV R3, ocorreu_int                 ; Guarda o endereço da tabela ocorreu_int.
    ADD R2, R3                          ; Obtém o endereço da 2ª entrada da tabela de interrupções.
    MOV R3, [R2]                        ; Lê essa entrada que indica se ocorreu interrupção 1 ou não.
    CMP R3, 1                           ; Ocorreu interrupção?
    JZ muda_estado_transitorio          ; Se sim, vai alterar a variável de estado do processo.
    JMP sai_rot_lanca_laser             ; Se não, sai e mantém o estado.

muda_estado_transitorio:
    MOV R1, MOVE_LASER                  ; Escreve 2 no registo 1.
    MOV [R0], R1                        ; Atualiza a variável de estado para o estado transitório.
    JMP sai_rot_lanca_laser             ; Sai.
    
lanca_laser_move:                       ; Estado transitório.
    MOV R1, ocorreu_int                 ; Guarda o endereço da tabela que guarda a ocorrência ou não de interrupção.
    MOV R5, VALOR_2                     ; Escreve 2 no registo 2.
    ADD R1, R5                          ; Obtém o endereço da entrada guarda a ocorrência ou não de interrupção 1.
    MOV R2, 0                           ; Coloca 0 no registo 2.
    MOV [R1], R2                        ; "Consome" a interrupção. 
    MOV R1, movimentos_laser            ; Guarda o endereço da variável c/o nº de movimentos do laser.
    MOV R2, [R1]                        ; Obtém o nº de movimentos do laser.
    MOV R5, VALOR_12                    ; Escreve 12 no registo 5.
    CMP R2, R5                          ; Já fez 12 movimentos?
    JZ vai_extinguir_laser              ; Se sim vai extinguir-se.
    CALL rot_move_laser                 ; Se não, vai mover-se.
    ADD R2, 1                           ; Soma 1 ao contador de movimentos do laser.
    MOV [R1], R2                        ; Atualiza o nº de moviementos do laser.
    MOV R1, MANTEM_LASER                ; Escreve 1 no registo 1.
    MOV [R0], R1                        ; Atualiza a variável de estado para o estado estável.
    JMP sai_rot_lanca_laser             ; Sai.
    
vai_extinguir_laser:
    CALL rot_extingue_laser              ; Chama a rotina que extingue o laser.
    CALL rot_verifica_se_ja_largou_tecla ; Chama a rotina que verifica se já largou a tecla.
    MOV R0, ainda_pressiona_tecla        ; Guarda o endereço da variável c/ informção se ainda pressiona tecla.
    MOV R1, [R0]                         ; Cópia do valor dessa variável.
    CMP R1, 1                            ; Se esse valor é 1,
    JZ nao_atualiza_estado               ; Não atualiza o estado.
    MOV R0, estado_lanca_laser           ; Guarda o endereço da variável estado_lanca_laser.
    MOV R1, START_LASER                  ; Escreve 0 no registo 1.
    MOV [R0], R1                         ; Atualiza a variável de estado para o estado inicial.
    JMP sai_rot_lanca_laser              ; Sai.
    
nao_atualiza_estado:
    MOV R0, estado_lanca_laser           ; Guarda o endereço da variável estado_lanca_laser.
    MOV R1, EXTINGUE_LASER               ; Escreve 0 no registo 1.
    MOV [R0], R1                         ; Atualiza a variável de estado para o estado inicial.
    JMP sai_rot_lanca_laser              ; Sai.

sai_rot_lanca_laser:
    POP R5
    POP R4
    POP R3
    POP R2
    POP R1
    POP R0
    RET 
    
 
;***********************************************************************************************************************
;* PROCESSO EXPLOSÃO:  rotina que desenha a explosão e apaga-a após 3 segundos.                                        *
;*                                                                                                                     *
;* ARGUMENTOS DE ENTRADA:                                                                                              *
;*                           R10        - endereço da tabela do ovni                                                   *
;*                 EXPLOSAO_OVNI        - valor 18.                                                                    *
;*                 ECRA_EXPLOSAO        - valor 20.                                                                    *
;*               CICLOS_EXPLOSAO        - valor 22.                                                                    *
;*                       VALOR_4        - valor 4.                                                                     *
;*                       VALOR_6        - valor 6.                                                                     *
;*       [ocorreu_int + VALOR_4]        - se a 1, ocorreu a interrupcão 2.                                             *
;*         [R10 + EXPLOSAO_OVNI]        - se a 1, está ativa a explosão.                                               *
;*         [R10 + EXPLOSAO_OVNI]        - guarda o nº do ecrã da explosão.                                             *
;*            [R10 + CILOS_OVNI]        - guarda o nº de vezes que já passou por este processo.                        *
;***********************************************************************************************************************


 rot_explosao:
    PUSH R0
    PUSH R1
    PUSH R2
    PUSH R3
    
    MOV R1, EXPLOSAO_OVNI               ; Escreve 18 no registo 1.
    ADD R1, R10                         ; Obtém o endereço do estado deste processo.
    MOV R0, [R1]                        ; Lê esse valor.
    MOV R2, EXPLOSAO_APAGADA            ; Escreve 0 no registo 2.
    CMP R0, R2                          ; Não é para desenhar explosão?
    JZ  sai_rot_explosao                ; Sai.
    MOV R2, EXPLOSAO_ATIVA              ; Escreve 1 no registo 2.
    CMP R0, R2                          ; É para desenhar_explosão?
    JZ vai_desenhar_explosao            ; Vai desenhar.
    MOV R2, APAGA_EXPLOSAO              ; Escreve 2 no regitso 2.
    CMP R0, R2                          ; A explosão está ativa e é para apaga-la?
    JZ vai_apagar_explosao              ; Se sim, vai apaga-la.
    JMP sai_rot_explosao                ; Se não, sai.
    
vai_desenhar_explosao:
    MOV R0, ECRA_OVNI                   
    ADD R0, R10                         ; Obtém o endereço da entrada da tabela c/o nº do ecrã do ovni.
    MOV R1, [R0]                        ; Guarda o valor do ecrã do ovni.
    MOV R0, APAGA_ECRA                  ; Guarda o endereço do comando c/ que apaga todos os pixeis de um ecrã.
    MOV [R0], R1                        ; Apaga o ovni do ecrã.
    
    MOV R0, local_ovni                  ; Guarda o endereço da variável c/ o pixel de ref do ovni.
    MOV R1, [R0]                        ; Cópia desse pixel de ref.
    MOV R2, local_objeto                ; Guarda o endereço da variável local_objeto.
    MOV [R2], R1                        ; Escreve o pixel de ref. do ovni nessa variável.
    
    MOV R0, ECRA_EXPLOSAO               ; Escreve 20 no registo 0.
    ADD R0, R10                         ; Guarda o endereço da entrada da tabela c/o nº do ecrã da explosão.
    MOV R1, [R0]                        ; Cópia do nº do ecrã da explosão.
    MOV R2, ecra_pixel                  ; Guarda o endereço da variável ecra_pixel.
    MOV [R2], R1                        ; Ecreve o nº do ecrã da explosão nessa variável.

    MOV R0, tab_explosao                ; Guarda o endereço da tabela c/as cores da explosão.
    MOV R2, tab_objeto                  ; Guarda o endereço da variável tab_objeto.
    MOV [R2], R0                        ; Atualiza essa variável p/a o endereço da taebla c/as cores da explosão.
    CALL rot_desenha_objeto             ; Chama a rotina que desenha a explosão.
    
    MOV R0, EXPLOSAO_OVNI               ; Escreve 18 no resgisto 0.
    ADD R0, R10                         ; Obtém o endereço da entrada da tabela c/o estado deste processo.
    MOV R2, VALOR_2                     ; Escreve 2 no registo 2.
    MOV [R0], R2                        ; Atualiza a variável de estado para passar ao próximo estado.
    JMP sai_rot_explosao                ; Sai.

vai_apagar_explosao:
    MOV R0, CICLOS_EXPLOSAO             ; Escreve 22 no registo 0.
    ADD R0, R10                         ; Obtém o endereço da entrada da tabela c/ nº de vezes que executou este estado.
    MOV R1, [R0]                        ; Lê esse valor.
    MOV R2, 1                           ; Escreve 1 no registo 2.
    CMP R1, R2                          ; Já passou por este estado 1 vez?
    JZ apaga_explosao                   ; Então vai apagar a explosão.
    MOV R0, ocorreu_int                 ; Guarda o endereço da tabela c/as ocorrências de interrupção.
    MOV R1, VALOR_2                     ; Escreve 4 no registo 1.
    ADD R0, R1                          ; Obtém a entrada da tabela anterior c/informação sobre a interrupção 1.
    MOV R2, [R0]                        ; Lê o valor dessa entrada.
    MOV R3, 1                           ; Escreve 1 no registo 3.
    CMP R2, R3                          ; Ocorrreu_interrupção?
    JNZ sai_rot_explosao                ; Se não sai e mantém o estado.
    MOV R0, CICLOS_EXPLOSAO             ; Escreve 22 no registo 0. 
    ADD R0, R10                         ; Obtém o endereço da entrada da tabela c/ nº de vezes que executou este estado.
    MOV R1, [R0]                        ; Lê esse valor.
    ADD R1, 1                           ; Soma-lhe 1.       
    MOV [R0], R1                        ; Atualiza o seu valor.
    JMP sai_rot_explosao                ; Sai. 
    
apaga_explosao:
    MOV R0, ECRA_EXPLOSAO               ; Escreve 20 no registo 0.
    ADD R0, R10                         ; Guarda o endereço da entrada da tabela c/o nº do ecrã da explosão.
    MOV R1, [R0]                        ; Cópia do nº do ecrã da explosão.
    MOV R0, APAGA_ECRA                  ; Guarda o endereço do comando c/ que apaga todos os pixeis de um ecrã.
    MOV [R0], R1                        ; Apaga a explosão do ecrã.
    
    MOV R0, CICLOS_EXPLOSAO             ; Escreve 22 no registo 0.
    ADD R0, R10                         ; Obtém o endereço da entrada da tabela c/ nº de vezes que executou este estado.
    MOV R1, 0                           ; Escreve 0 no registo 1. 
    MOV [R0], R1                        ; "Reseta" essa entrada.
    
    MOV R0, EXPLOSAO_OVNI               ; Escreve 18 no resgisto 0.
    ADD R0, R10                         ; Obtém o endereço da entrada da tabela c/o estado deste processo.
    MOV R1, 0                           ; Escreve 0 no registo 2.
    MOV [R0], R1                        ; Atualiza a variável de estado para passar regressao ao 1º estado.

sai_rot_explosao:
    POP R3
    POP R2
    POP R1
    POP R0 
    RET




;***********************************************************************************************************************
;* ROTINAS AUXILIARES                                                                                                  *
;***********************************************************************************************************************

;***********************************************************************************************************************
;* ROTINA INICIA VARIÁVEIS NAVE:  rotina que inicia as varíaveis da nave, de modo a que quando retorne ao estado       *
;*                                inicial, todas estejam como na 1ª vez que passaram por este estado.                  *
;*                                                                                                                     *
;*  ARGUMENTOS DE ENTRADA:                                                                                             *
;*                              VALOR_1759      - valor 1759 (pixel inicial da nave).                                  *
;*  ARGUMENTOS DE ENTRADA:                                                                                             *
;*                              [local_nave]       - valor 1759.                                                       *
;*              [estado_energia_interrupcao]       - valor 0.                                                          *
;***********************************************************************************************************************

rot_inicia_variaveis_nave:
    PUSH R0
    PUSH R1
    
    MOV R0, local_nave                          ; Guarda o endereço da variável c/ o pixel de ref. da nave.
    MOV R1, VALOR_1759                          ; Escreve 1759 no resgito 1.
    MOV [R0], R1                                ; Altera o valor desta variavél para 1759.
    
    MOV R0, estado_energia_interrupcao          ; Guarda o endereço da variável c/ o estado de energia interrupcao.
    MOV R1, 0                                   ; Escreve 0 no resgito 1.
    MOV [R0], R1                                ; Altera o valor desta variavél para 0.
    
    MOV R0, energia                             ; Guarda o endereço da variável c/ o valor da energia.
    MOV R1, VALOR_100                           ; Ecreve 100 no registo 1.
    MOV [R0], R1                                ; Atualiza essa variável.
    
    MOV R0, ocorreu_int                         ; Endereço da tabela c/a ocorrência de interupções.
    MOV R2, VALOR_4                             ; Escreve 4 no registo 2.
    ADD R0, R2                                  ; Obtém a entrada dessa tabela sobre a interrupção 2.
    MOV R1, 0                                   ; Coloca 0 no registo 1.
    MOV [R0], R1                                ; "Reseta" a interrupção.
    
    POP R1
    POP R0 
    RET
    

;***********************************************************************************************************************
;* ROTINA INICIALIZAÇÃO OVNI:    rotina que inicia varíaveis estratégicas do ovni, de modo a que quando retorne ao     *
;*                               estado incial, todas estejam como na 1ª vez que passaram por este estado.             *
;*                                                                                                                     *
;*ARGUMENTOS DE ENTRADA:                                                                                               *
;*                                     R10          - endereço da tabela do ovni.                                      *
;*                              LINHA_OVNI          - valor 4.                                                         *
;*                                COL_OVNI          - valor 6.                                                         *
;*                            TAMANHO_OVNI          - valor 12.                                                        *
;*                         MOVIMENTOS_OVNI          - valor 14.                                                        *
;*                            COLISAO_OVNI          - valor 16.                                                        *
;*                                VALOR_31          - valor 31.                                                        *
;*                                                                                                                     *
;* ARGUMENTOS DE SAÍDA:                                                                                                *
;*                                   [R10]          - valor 0                                                          * 
;*                      [R10 + LINHA_OVNI]          - valor 0.                                                         *
;*                        [R10 + COL_OVNI]          - valor 31.                                                        *
;*                    [R10 + TAMANHO_OVNI]          - valor 0.                                                         *
;*                 [R10 + MOVIMENTOS_OVNI]          - valor 0.                                                         *
;*                    [R10 + COLISAO_OVNI]          - valor 0.                                                         *
;*                       [verifica_limite]          - valor 0.                                                         *
;*             [deteta_pixeis_sobrepostos]          - valor 0.                                                         *
;*                   [deteta_colisao_nave]          - valor 0.                                                         *
;*                  [deteta_colisao_laser]          - valor 0.                                                         *
;*                        [ocorreu_embate]          - valor 0.                                                         *
;*                             [game_over]          - valor 0.                                                         *
;*                 [estado_energia_outros]          - valor 0.                                                         *
;***********************************************************************************************************************

rot_inicializa_ovni:
    PUSH R0
    PUSH R1
    PUSH R10
    
    MOV R0, LINHA_OVNI                          ; Escreve 4 no registo 0.
    ADD R0, R10                                 ; Obtém o endereço da entrada c/o nº da linha do seu pixel de ref.
    MOV R1, 0                                   ; Escreve 0 no registo 1.
    MOV [R0], R1                                ; Reseta essa entrada.
    
    MOV R0, COL_OVNI                            ; Escreve 6 no registo 0.
    ADD R0, R10                                 ; Obtém o endereço da entrada c/o nº da coluna do seu pixel de ref.
    MOV R1, VALOR_31                            ; Escreve 31 no registo 1.
    MOV [R0], R1                                ; Reseta essa entrada.
    
    MOV R0, TAMANHO_OVNI                        ; Escreve 12 no registo 0.   
    ADD R0, R10                                 ; Obtém o endereço da entrada c/o nº do tamanho do ovni.
    MOV R1, 0                                   ; Escreve 0 no registo 1.  
    MOV [R0], R1                                ; Reseta essa entrada.
    
    MOV R0, MOVIMENTOS_OVNI                     ; Escreve 14 no registo 0.  
    ADD R0, R10                                 ; Obtém o endereço da entrada c/o nº da linha do seu pixel de ref.   
    MOV R1, 0                                   ; Escreve 0 no registo 1.   
    MOV [R0], R1                                ; Reseta essa entrada.       
        
    MOV R0, COLISAO_OVNI                        ; Escreve 4 no registo 0.   
    ADD R0, R10                                 ; Obtém o endereço da entrada c/ o nº correspondente ao tipo de colisão. 
    MOV R1, 0                                   ; Escreve 0 no registo 1.               
    MOV [R0], R1                                ; Reseta essa entrada.                          
    
    MOV R0, verifica_limite                     ; Obtém o endereço da variável verifica_limite.
    MOV R1, 0                                   ; Escreve 0 no registo 1.        
    MOV [R0], R1                                ; Reseta essa variável.      
    
    MOV R0, deteta_pixeis_sobrepostos           ; Obtém o endereço da variável deteta_pixeis_sobrepostos.   
    MOV R1, 0                                   ; Escreve 0 no registo 1.        
    MOV [R0], R1                                ; Reseta essa variável.        
    
    MOV R0, deteta_colisao_nave                 ; Obtém o endereço da variável deteta_colisao_nave.  
    MOV R1, 0                                   ; Escreve 0 no registo 1.         
    MOV [R0], R1                                ; Reseta essa variável.           
    
    MOV R0, deteta_colisao_laser                ; Obtém o endereço da variável deteta_colisao_laser. 
    MOV R1, 0                                   ; Escreve 0 no registo 1.               
    MOV [R0], R1                                ; Reseta essa variável.            
    
    MOV R0, game_over                           ; Obtém o endereço da variável game_over. 
    MOV R1, 0                                   ; Escreve 0 no registo 1.               
    MOV [R0], R1                                ; Reseta essa variável.  
    
    MOV R0, ECRA_OVNI                           
    ADD R0, R10                                 ; Obtém o endereço da entrada da tabela do ovni c/o nº do seu ecrã.
    MOV R1, APAGA_ECRA                          ; Guarda o endereço do comando que apaga todos os pixeis de um ecrã.
    MOV [R1], R0                                ; Apaga o ovni.
    
    MOV R0, ocorreu_int                         ; Endereço da tabela c/a ocorrência de interupções.
    MOV R1, 0                                   ; Coloca 0 no registo 1.
    MOV [R0], R1                                ; "Reseta" a interrupção.
    
    POP R10
    POP R1
    POP R0 
    RET
 
;**********************************************************************************************************************
;* ROTINA INICIALIZAÇÃO LASER:     rotina que inicia varíaveis estratégicas do ovni, de modo a                         *
;*                                 que quando retorne ao estado incial, todas estejam como na 1ª vez que               *
;*                                 passaram por este estado.                                                           *
;*                                                                                                                     *
;* ARGUMENTOS DE SAÍDA:                                                                                                *
;*                       [movimentos_laser]    - valor 0                                                               *
;*                       [lancamento_laser]    - valor 0                                                               *
;*                  [ocorreu_int + VALOR_2]    - valor 0                                                               *
;***********************************************************************************************************************

rot_inicializa_laser:
    PUSH R0
    PUSH R1
    
    MOV R0, movimentos_laser            ; Endereço da variável que guarda o nº de movimentos do laser.
    MOV R1, 0                           ; Escreve 0 no registo 3.
    MOV [R0], R1                        ; "Reseta" o nº de movimentos do laser.
    
    MOV R0, lancamento_laser            ; Endereço da variável que indica se o laser foi lançado.
    MOV R1, 0                           ; Escreve 0 no registo 3.
    MOV [R0], R1                        ; "Reseta" o lançamento do laser.
    
    MOV R0, ocorreu_int                 ; Endereço da tabela c/a ocorrência de interupções.
    MOV R2, VALOR_2                     ; Escreve 2 no registo 2.
    ADD R0, R2                          ; Obtém a entrada dessa tabela sobre a interrupção 1.
    MOV R1, 0                           ; Coloca 0 no registo 1.
    MOV [R0], R1                        ; "Reseta" a interrupção.
    
    POP R1
    POP R0 
    RET
    
;***********************************************************************************************************************
;* ROTINA TECLADO:      Faz um varrimento ao teclado e caso haja uma tecla premida, altera a variavél em memória       * 
;*                      tecla para o valor em hexadecimal correspondente.                                              *
;*                      Caso nenhuma tecla tenha sido premida, coloca o valor 16 nessa variável.                       *
;*                                                                                                                     *
;* ARGUMENTOS DE ENTRADA:                                                                                              *
;*                      LC_4    - Linha 4.                                                                             *
;*                      TEC_OUT - Endereço das linhas do teclado.                                                      *
;*                      TEC_IN  - Endereço das colunas do teclado.                                                     *
;*                                                                                                                     *
;* ARGUMENTOS DE SAÍDA:                                                                                                *
;*                      [tecla] - Valor da tecla premida ou 16 se nenhuma.                                             *
;***********************************************************************************************************************

rot_teclado:
    PUSH R0
    PUSH R1
    PUSH R2
    PUSH R3
    PUSH R4
    
    MOV R0, tecla                ; Guarda o endereço da variável que guarda o nº da tecla premida.
    MOV R1, LC_4                 ; Começa por testar a linha 4.
    
varre_teclas:
    MOV R2, TEC_OUT              ; Coloca o endereço das linhas no registo 2.
    MOVB [R2], R1                ; Insire o valor pretendido nas linhas.
    MOV R2, TEC_IN               ; Coloca o endereço das linhas no registo 2.
    MOVB R3, [R2]                ; Guarda o valor das colunas, no registo 3.                 
    CMP R3, 0                    ; Verifica se há algum tecla pressionada nessa linha.
    JZ  prox_linha               ; Se não há, vai varrer a linha seguinte.
    CALL rot_tecla               ; Chama a rotina que obtém o valor da tecla.
    MOV [R0], R3                 ; Escreve o valor da tecla na variável.
    JMP sai_teclado              ; Sai do teclado.

prox_linha:
    SHR R1, 1                    ; Coloca o valor da próxima linha no registo 1.
    CMP R1, 0                    ; Verifica se já percorreu as 4 linhas.
    JNZ varre_teclas             ; Vai varrer as outras linhas caso negativo.
    MOV R4, VAR_16               ; Coloca 16 no registo 4.
    MOV [R0], R4                 ; Se não houve nenhuma tecla premida, coloca 16 na variavel.
    JMP sai_teclado              ; Sai.

sai_teclado:
    POP R4
    POP R3 
    POP R2 
    POP R1
    POP R0
    RET


;***********************************************************************************************************************
;* ROTINA TECLA:   Converte o nº da coluna e linha premida, cujos valores são 1,2,3 ou 4 no indíces coluna e linha,    *
;*                 respetivamente: 0,1,2 ou 3.Utiliza depois estes indíces para calcular o valor da tecla.             *
;*                                                                                                                     *
;*ARGUMENTOS DE ENTRADA:                                                                                               *
;*                 R1- valor da linha premida (entre 1 e 4).                                                           * 
;*                 R3- valor da coluna premida (entre 1 e 4).                                                          *
;*                                                                                                                     *
;*ARGUMENTOS DE SAÍDA:                                                                                                 *
;*                 R3- valor da tecla premida                                                                          *
;***********************************************************************************************************************

rot_tecla: 
    PUSH R1
    PUSH R2
    PUSH R4
    
    MOV R2, 0                    ; O registo 2 é utilizado como contador do indice coluna.
    MOV R4, 0                    ; O registo 4 é utilizado como contador do indice de linha.

ver_col:                         ; Converte a coluna 1,2,3 ou 4 no indices coluna 0,1,2 ou 3,
    SHR R3, 1                    ; consoante a posição do dígito a 1 do valor da coluna.
    CMP R3, 0                    ; Se já expulsou o digito a 1,
    JZ ver_linha                 ; vai procurar o índice linha.
    ADD R2, 1                    ; Caso contrário, incrementa um contador e retorna ao ciclo
    JMP ver_col                  ; até ter expulso todos os bits a 1.

ver_linha:                       ; Converte a linha 1,2,3 ou 4 no indices linha 0,1,2 ou 3,
    SHR R1, 1                    ; consoante a posição do dígito a 1 do valor da linha.       
    CMP R1, 0                    ; Se já expulsou o digito a 1,
    JZ ver_tecla                 ; vai procurar qual foi a tecla premida.
    ADD R4, 1                    ; Caso contrário, incrementa um contador e retorna ao ciclo
    JMP ver_linha                ; até ter expulso todos os bits a 1.

ver_tecla:                       ; Obtém a tecla consoante o seu indice de linha e coluna:
    SHL R4, 2                    ; Multiplica o indice de linha por 4.
    ADD R4, R2                   ; Soma com o indice coluna e guarda no registo 4 o valor da tecla.
    MOV R3, R4                   ; Guarda no registo 3 o valor da tecla.
    
    POP R4
    POP R2
    POP R1 
    RET
    

;***********************************************************************************************************************
;* ROTINA VERIFICA SE LARGOU TECLA: rotina que verifca se o jogador já largou a tecla.                                 *
;*                                                                                                                     *
;* ARGUMENTOS DE ENTRADA:                                                                                              *
;*                         VALOR_16         - valor 16 (valor devolvido se não houver nenhuma tecla premida)           *
;*                                                                                                                     *
;* ARGUMENTOS DE SAÍDA:                                                                                                *
;*                  [ainda_pressiona_tecla] - se a 1, ainda está a pressionar uma tecla.                               *
;***********************************************************************************************************************
 
rot_verifica_se_ja_largou_tecla:
    PUSH R0
    PUSH R1
    PUSH R2
    
    CALL rot_teclado                            ; Chama a rotina que varre o teclado.
    MOV R0, tecla                               ; Guarda o endereço da variável c/o valor da tecla.
    MOV R1, [R0]                                ; Cópia do valor da tecla.
    MOV R2, VALOR_16                            ; Escreve 16 no registo 2.
    CMP R1, R2                                  ; O valor da variável tecla é 16?
    JZ largou_tecla                             ; Se sim, não está a premir tecla.
    MOV R0, ainda_pressiona_tecla               ; Se não guarda o endereço da variável ainda_pressiona_tecla.
    MOV R1, 1                                   ; Coloca 1 no registo 1.
    MOV [R0], R1                                ; Coloca 1 na variável acima.
    JMP sai_rot_largou_tecla                    ; Sai.
        
largou_tecla:
    MOV R0, ainda_pressiona_tecla               ; Guarda o endereço da variável ainda_pressiona_tecla.
    MOV R1, 0                                   ; Coloca 0 no registo 1.
    MOV [R0], R1                                ; Coloca 0 na variável acima.
    
sai_rot_largou_tecla:
    POP R2
    POP R1
    POP R0
    RET
 
;**********************************************************************************************************++***********
;* ROTINA DISPLAYS:         Lê uma variável em memória que contém o valor de um contador hexadecimal.                  *
;*                          Converte esse valor para decimal e apresenta o valor convertido nos displays.              *
;*                          Atualiza também o valor da variável copia_energia c/uma cópia do valor da energia.         *
;* ARGUMENTOS DE ENTRADA:                                                                                              *
;*                          [energia]- variável em memória que contém a energia da nave em hexadecimal                 *
;*                                                                                                                     *
;*                          DEZ      - valor 10.                                                                       * 
;*                          CICLO    - valor 4.                                                                        *
;*                          DISPLAYS - endereço dos displays.                                                          *
;* ARGUMENTOS DE SAÍDA:                                                                                                *
;*                          [copia_energia]- cópia do valor da energia.                                                *
;************************************************************+++++++++++++++++++++++************************************

rot_displays:

    PUSH R0
    PUSH R1
    PUSH R2
    PUSH R3
    PUSH R4
    PUSH R5 
    PUSH R6
    PUSH R7
    PUSH R10 
    
    MOV R0, energia              ; Coloca o endereço da variavél energia.
    MOV R6, copia_energia        ; Guarda o endereço da variável copia_energia
    MOV R7, [R0]                 ; Cópia do valor da energia.
    MOV [R6], R7                 ; Atualiza a variável copia_energia.
    MOV R10, DEZ                 ; Coloca no resgisto 10, o fator 10.
    MOV R1, CICLO                ; Contador de ciclos de conversão: são necessários 4 ciclos.
    MOV R2, [R0]                 ; Copia o valor do contador, para o registo 2.
    MOV R4, MASCARA              ; Atualiza o valor do registo 9, pois poderá ter sido alterado.
    
ciclo_conv:
    MOV R3, R2                   ; Copia o valor do contador também para o registo 3.
    MOD R3, R10                  ; Obtém o algarismo de menor peso do contador.
    XOR R4, R3                   ; Guarda esse digito no byte de menor peso do registo 4.
    ROR R4, 4                    ; Ordena os dígitos para serem aprensetados pela ordem correta.
    DIV R2, R10                  ; Retira o dígito de menor peso à cópia do contador.
    SUB R1, 1                    ; Decrementa o contador de ciclos de conversão.
    CMP R1, 0                    ; Se ainda não passou 4 vezes pelo ciclo,
    JNZ ciclo_conv               ; continua.
    MOV R5, DISPLAYS             ; Coloca o endereço dos displays, no registo 11.
    MOV [R5], R4                 ; Escreve o valor nos displays.
    
    POP R10
    POP R7
    POP R6
    POP R5
    POP R4
    POP R3 
    POP R2 
    POP R1
    POP R0
    
    RET
    
    
    
;***********************************************************************************************************************
;* ROTINA DESENHA OBJETO:    Desenha num ecrã pretendido, um objeto especificado por uma tabela e uma posição          *
;*                           a partir da qual começar a desenhar.                                                      *
;*                                                                                                                     *
;* ARGUMENTOS DE ENTRADA:                                                                                              *
;*                           [tab_objeto]- endereço da tabela c/ as especificacoes do objeto a desenhar.               *
;*                           [local_objeto]- nº do pixel de referência (pixel superior esq) do objeto a desenhar.      *
;***********************************************************************************************************************

rot_desenha_objeto:
    PUSH R0
    PUSH R1
    PUSH R2
    PUSH R3
    PUSH R4 
    PUSH R5
    PUSH R6
    PUSH R7
    PUSH R8
    PUSH R9
    PUSH R10
    
    MOV R0, tab_objeto    ; Guarda o endereço da variavel com a tabela c/ as especificacoes do objeto.
    MOV R10, [R0]         ; Guarda o endereço da tabela c/ as especificações do objeto.
    MOV R1, [R10]         ; Guarda o 1º elemento da tabela, que é o nº de linhas/colunas do objeto.
    MOV R2, R1            ; Cópia do número de de linhas/colunas do objeto.
    MOV R3, R10           ; Cópia do endereço da tabela c/ as especificacões do objeto.
    ADD R3, 2             ; Endereço do 2º elemento da tabela, que contém a cor do 1º pixel do objeto.
    MOV R4, 0             ; Indíce de linha relativo (em relação ao 1º pixel do objeto).
    MOV R5, 0             ; Indíce de coluna relativo (em relação ao 1º pixel do objeto).
    MOV R0, local_objeto  ; Guarda o endereço com o número do pixel de referência a desenhar.
    MOV R6, [R0]          ; Guarda no registo 6, o número do pixel de referência.
    
desenha_prox:
    MOV R7, R4            ; Cópia do indice linha relativo.
    MOV R8, R5            ; Cópia do indice coluna relativo.
    CALL rot_desenha
    ADD R3, 2             ; Endereço do próximo elemento da tabela, que contém a cor do próximo pixel.
    ADD R5, 1             ; Vai tratar o próximo elemento nessa linha.
    CMP R5, R2            ; Verifica se já tratou todas as colunas.
    JNZ desenha_prox      ; Se ainda não tratou, vai tratar da próxima coluna.
    MOV R5, 0             ; Volta a tratar da coluna zero.
    ADD R4, 1             ; Vai tratar da próxima linha. 
    CMP R4, R2            ; Verifica se já tratou de todas as linhas.
    JNZ desenha_prox      ; Se ainda não tratou, vai tratar da próxima linha.
    
    POP R10
    POP R9
    POP R8
    POP R7
    POP R6
    POP R5
    POP R4
    POP R3
    POP R2
    POP R1
    POP R0
    RET                 


;***********************************************************************************************************************
;* ROTINA DESENHA PIXEL:      Desenha num ecrã pretendido, um pixel especifícado com uma cor desejada.                 *
;*                            Os dois valores são lidos de variáveis na memória.                                       *
;* ARGUMENTOS DE ENTRADA:                                                                                              *
;*                            R3            - endereço do elemento da tabela que contém a cor a desenhar.              *
;*                            R6            - pixel de referência (pixel superior esquerdo).                           *
;*                            R7            - indíce relativo de linha (em relação ao pixel de referência).            *
;*                            R8            - indíce relativo de coluna (em relação ao pixel de referência).           *
;*                            [ecra_pixel]  - ecrã a desenhar (0 a 13).                                                *
;*                            SEL_PIX       - endereço do comando que seleciona o pixel especificado.                  *
;*                            SEL_ECRA      - endereço do comando que seleciona o ecrã especificado.                   *
;*                            MUDA_COR      - endereço do comando que alter a cor.                                     *
;***********************************************************************************************************************

rot_desenha:
    PUSH R0
    PUSH R1
    PUSH R2
    PUSH R3
    PUSH R4
    PUSH R5
    PUSH R6
    PUSH R7
    PUSH R8
    
    MOV R0, ecra_pixel    ; Copia o endereço da variavel que contem o número do ecrã a desenhar.
    MOV R1, [R0]          ; Guarda o número do ecrã a desenhar.
    MOV R0, [R3]          ; Guarda a cor a desenhar.
    SHL R7, 6             ; Multiplica o indice de linha relativo por 64.
    ADD R7, R8            ; Obtém o número do pixel relativo (em relação ao 1º pixel).
    ADD R6, R7            ; Obtém o número do pixel absoluto (em relação ao ecrã).
    MOV R2, SEL_PIX       ; Guarda o endereço do comando que seleciona o pixel.
    MOV [R2], R6          ; Seleciona o pixel a utilizar.
    MOV R2, SEL_ECRA      ; Endereço do comando que seleciona o ecrã.
    MOV [R2], R1          ; Seleciona o ecrã.
    MOV R2, MUDA_COR      ; Escreve no registo 6 o endereço do comando que altera a cor do pixel
    MOV [R2], R0          ; Altera a cor do pixel
    
    POP R8
    POP R7
    POP R6
    POP R5
    POP R4
    POP R3
    POP R2
    POP R1
    POP R0
    RET
 
 
;***********************************************************************************************************************
;* ROTINA APAGA OBJETO:     Apaga num ecrã pretendido, um boneco especificado por uma tabela e uma posição a partir da *
;*                          qual começar a apagar.                                                                     *
;*                                                                                                                     *
;* ARGUMENTOS DE ENTRADA:                                                                                              *
;*                          [tab_objeto]    - endereço da tabela c/ as especificacoes do objeto a apagar.              *
;*                          [local_objeto]  - nº do pixel de referência (pixel superior esq) do objeto a desenhar.     *
;***********************************************************************************************************************

rot_apaga_objeto:
    PUSH R0
    PUSH R1
    PUSH R2
    PUSH R4 
    PUSH R5
    PUSH R6
    PUSH R7
    PUSH R8
    PUSH R9
    PUSH R10
    
    MOV R0, tab_objeto    ; Guarda o endereço da tabela c/ as especificacoes do objeto.
    MOV R10, [R0]         ; Guarda o endereço da tabela c/ as especificacoes do objeto.
    MOV R1, [R10]         ; Guarda o 1º elemento da tabela, que é o nº de linhas/colunas do objeto.
    MOV R2, R1            ; Cópia do número de de linhas/colunas do objeto.
    MOV R4, 0             ; Indice de linha relativo (em relação ao 1º pixel do objeto).
    MOV R5, 0             ; Indice de coluna relativo (em relação ao 1º pixel do objeto).
    MOV R0, local_objeto  ; Guarda o endereço com o número do pixel de referência a apagar.
    MOV R6, [R0]          ; Guarda no registo 6, o número do pixel de referência.
    
apaga_prox:
    MOV R7, R4            ; Cópia do indice linha relativo.
    MOV R8, R5            ; Cópia do indice coluna relativo.
    CALL rot_apaga
    ADD R5, 1             ; Vai tratar o próximo elemento nessa linha
    CMP R5, R2            ; Verifica se já tratou todas as colunas 
    JNZ apaga_prox        ; Se ainda não tratou, vai tratar da próxima coluna
    MOV R5, 0             ; Volta a tratar da coluna zero
    ADD R4, 1             ; Vai tratar da próxima linha 
    CMP R4, R2            ; Verifica se já tratou de todas as linhas
    JNZ apaga_prox        ; Se ainda não tratou, vai tratar da próxima linha
    
    POP R10
    POP R9
    POP R8
    POP R7
    POP R6
    POP R5
    POP R4
    POP R2
    POP R1
    POP R0
    RET                    


;***********************************************************************************************************************
;* ROTINA APAGA PIXEL:      rotina que apaga num ecrã pretendido, um pixel especifícado.                               *
;*                                                                                                                     *
;* ARGUMENTOS DE ENTRADA:                                                                                              *
;*                          R6              - pixel de referência.                                                     *
;*                          R7              - indíce relativo de linha.                                                *
;*                          R8              - indíce relativo de coluna.                                               *
;*                          [ecra_pixel]    - ecrã a apagar (0 a 13).                                                  *
;***********************************************************************************************************************

rot_apaga:
    PUSH R0
    PUSH R1
    PUSH R2
    PUSH R4
    PUSH R5
    PUSH R6
    PUSH R7
    PUSH R8
    
    MOV R0, ecra_pixel    ; Copia o endereço da variavel que contem o número do ecrã a desenhar.
    MOV R1, [R0]          ; Guarda o número do ecrã a desenhar.
    MOV R0, 0             ; Guarda a cor 0000H (para apagar o pixel).
    SHL R7, 6             ; Multiplica o indice de linha relativo por 64.
    ADD R7, R8            ; Obtém o número do pixel relativo (em relação ao 1º pixel).
    ADD R6, R7            ; Obtém o número do pixel absoluto (em relação ao ecrã).
    MOV R2, SEL_PIX       ; Escreve no registo 6 o endereço do comando que seleciona o pixel.
    MOV [R2], R6          ; Seleciona o pixel a utilizar.
    MOV R2, SEL_ECRA      ; Endereço do comando que seleciona o ecrã.
    MOV [R2], R1          ; Seleciona o ecrã.
    MOV R2, MUDA_COR      ; Escreve no registo 6 o endereço do comando que altera a cor do pixel.
    MOV [R2], R0          ; Altera a cor do pixel
    
    POP R8
    POP R7
    POP R6
    POP R5
    POP R4
    POP R2
    POP R1
    POP R0
    RET
    
    
;***********************************************************************************************************************
;* ROTINA MOVIMENTO NAVE:     Rotina que apaga a nave de uma posição e reescreve-a na nova posição, consoante a        *
;*                            tecla premida.                                                                           *
;*                            Se a tecla premida tiver sido a tecla 5, desloca a nave uma posicão para a esquerda.     *
;*                            Se a tecla premida tiver sido a tecla 7, desloca a nave uma posição para a direita.      *
;*                                                                                                                     *
;* ARUMENTOS DE ENTRADA:                                                                                               *
;*                            PIX_MIN_NAVE    - valor 1728 (valor min do pixel de ref. p/ nave não sair do ecrã).      *
;*                            PIX_MAX_NAVE    - valor 1787 (valor máx do pixel de ref. p/ nave não sair do ecrã).      *
;*                            [tab_objeto]    - endereço da tabela c/ as especificações do objeto a apagar.            *
;*                            [local_objeto]  - nº do pixel de referência do objeto a desenhar.                        *
;*                            [tab_nave]      - endereço da tabela c/ as especificações do nave a apagar.              *
;*                            [local_nave]    - nº do pixel de referência da nave a desenhar.                          *
;*                            [tecla]         - valor da tecla premida.                                                *
;***********************************************************************************************************************

rot_move_nave:
            PUSH R0
            PUSH R1
            PUSH R2
            PUSH R3
            PUSH R4
            PUSH R5
            PUSH R6
            
            MOV R0, tecla           ; Guarda o endereço da variável c/ o nº da tecla premida.
            MOV R1, [R0]            ; Cópia do valor da tecla.
            CMP R1, TEC_5           ; Foi premida a tecla 5?
            JZ move_esquerda        ; Se sim, vai mover para a esquerda.
            CMP R1, TEC_7           ; Foi premida a tecla 7?
            JZ move_direita         ; Se sim, vai mover para a direita.
            JMP sai_move_nave       ; Se não foi nenhuma desas teclas, sai.
            
move_direita:
            MOV R0, tab_objeto      ; Guarda o endereço da variável tab_objeto.
            MOV R1, tab_nave        ; Guarda o endereço da tabela c/as cores da nave.
            MOV [R0], R1            ; Escreve o endereço da tabela c/as cores nave na variável tab_objeto.
            MOV R0, local_objeto    ; Guarda o endereço da variável local_objeto.
            MOV R1, local_nave      ; Guarda o endereço da variável c/ o nº do pixel de referência da nave.
            MOV R2, [R1]            ; Cópia do nº do pixel de referência da nave.
            MOV [R0], R2            ; Escreve o número do pixel de referência da nave, na variável local objeto.
            MOV R5, ecra_pixel      ; Guarda o endereço da variável ecra_pixel.
            MOV R6, 0               ; Coloca 0 no registo 6.
            MOV [R5], R6            ; Seleciona o ecrã 0.
            CALL rot_apaga_objeto   ; Apaga a nave da posição antiga.
            
            MOV R2, local_nave      ; Guarda o endereço da variável c/ o nº do pixel de referência da nave.
            MOV R3, [R2]            ; Cópia do nº do pixel de referência da nave.
            ADD R3, 1               ; Desloca o pixel de referência para a direta.
            MOV R4, PIX_MAX_NAVE    ; Escreve 1787 no registo 4.
            CMP R4, R3              ; Este pixel já está fora dos limites?
            JNN vai_desenhar        ; Se não vai desenhar a nave a apartir do pixel selecionado.
            MOV R3, PIX_MAX_NAVE    ; Caso contrário, seleciona o pixel direito máximo para pixel de referência.
            JMP vai_desenhar        ; Vai desenhar a nave.
            
move_esquerda:
            MOV R0, tab_objeto      ; Guarda o endereço da variável tab_objeto.
            MOV R1, tab_nave        ; Guarda o endereço da tabela c/as cores da nave.
            MOV [R0], R1            ; Escreve o endereço da tabela c/as cores nave na variável tab_objeto.
            MOV R0, local_objeto    ; Guarda o endereço da variável local_objeto.
            MOV R1, local_nave      ; Guarda o endereço da variável c/ o nº do pixel de referência da nave.
            MOV R2, [R1]            ; Cópia do nº do pixel de referência da nave.
            MOV [R0], R2            ; Escreve o número do pixel de referência da nave, na variável local objeto.
            MOV R5, ecra_pixel      ; Guarda o endereço da variável ecra_pixel.
            MOV R6, 0               ; Coloca 0 no registo 6.
            MOV [R5], R6            ; Seleciona o ecrã 0.
            CALL rot_apaga_objeto   ; Apaga a nave da posição antiga.
            
            MOV R2, local_nave      ; Guarda o endereço da variável c/ o nº do pixel de referência da nave.
            MOV R3, [R2]            ; Cópia do nº do pixel de referência da nave.
            SUB R3, 1               ; Desloca o pixel de referência para a esquerda .
            MOV R4, PIX_MIN_NAVE    ; Escreve 1728 no registo 4.
            CMP R3, R4              ; Este pixel já está fora dos limites?
            JNN vai_desenhar        ; Se não vai desenhar a nave a apartir do pixel selecionado.
            MOV R3, PIX_MIN_NAVE    ; Caso contrário, seleciona o pixel esquerdo mínimo para pixel de referência.
            
vai_desenhar:            
            MOV [R2], R3            ; Escreve na varivel local_nave o valor do novo pixel de referência da nave.
            MOV R4, local_objeto    ; Guarda o endereço da variável local_objeto.
            MOV [R4], R3            ; Escreve nessa variável, o valor do novo pixel de referência. 
            CALL rot_desenha_objeto ; Desenha a nave.
            
sai_move_nave:
            POP R6
            POP R5
            POP R4
            POP R3
            POP R2
            POP R1 
            POP R0
            RET
 

;***********************************************************************************************************************
;* ROTINA INCREMENTA CONTADOR:     Rotina que incrementa um contador de um unidade, até um máximo de 65000.            *
;*                                 Quando chega a esse valor reseta-se e começa de novo.                               *
;* ARGUMENTOS DE ENTRADA:                                                                                              * 
;*                       MAX_CONTADOR         - valor 650001.                                                          *
;*                       [contador_aleatorio] - contador isto é, um valor aleatório entre 0 e 65000.                   *
;* ARGUMENTOS DE SAIDA:                                                                                                *
;*                       [contador_aleatorio] - contador isto é, um valor aleatório entre 0 e 65000.                   *
;***********************************************************************************************************************
 
 rot_add_contador:
    PUSH R0
    PUSH R1
    PUSH R2
    
    MOV R0, contador_aleatorio        ; Guarda o endereço da variável c/o contador.
    MOV R1, [R0]                      ; Cópia do valor do contador.
    ADD R1, 1                         ; Soma uma unidade ao contador.
    MOV R2, MAX_CONTADOR              ; Escreve 650001 no resgisto 2.
    CMP R1, R2                        ; O contador atingiu o seu valor máximo?
    JZ reseta_contador                ; Se sim, faz-lhe reset.
    JMP sai_add_contador              ; Se não, vai-se embora.
        
reseta_contador:
    MOV R1, 1                         ; Coloca 0 no registo 1.
    
sai_add_contador:    
    MOV [R0], R1                      ; Atualiza a variável de contador.
    
    POP R2
    POP R1
    POP R0 
    RET


;***********************************************************************************************************************
;* ROTINA DE ATRIBUICAO DE OVNI:   rotina que atribui a um ovni um tipo aleatório isto é, ou asteroide ou nave inimiga *
;*                                 e também uma das três direções possíveis aletórias.                                 *
;*                                                                                                                     *
;* ARGUMENTOS DE ENTRADA:                                                                                              *
;*                      R10             - endereço da tabela do ovni.                                                  *
;*                      TIPO_OVNI       - valor 2.                                                                     *
;*                      TIPO_MOV_OVNI   - valor 8                                                                      *
;* ARGUMENTOS DE SAÍDA:                                                                                                *
;*                      [R10 + TIPO_OVNI]             - entrada da tabela que guarda o tipo de ovni.                   *
;*                      [R10 + TIPO_MOV_OVNI]         - entrada da tabela que guarda o tipo de movimento do ovni.      *
;********************************************************************************************************************** 

rot_atribui_ovni:

    PUSH R0 
    PUSH R1
    PUSH R2
    PUSH R3
    PUSH R10
    
    CALL rot_tipo_ovni_random   ; Chama a rotina que gera o tipo do ovni.
    MOV R2, gera_ovni           ; Guarda o endereço da variável com o tipo do ovni.
    MOV R3, [R2]                ; Guarda o tipo de ovni a gerar.
    MOV R1, TIPO_OVNI           ; Coloca 2 no registo 1.
    ADD R1, R10                  ; Guarda o endereço da entrada da tabela que guarda o tipo do ovni.
    MOV [R1], R3                ; Escreve o tipo do ovni, na entrada correspondente da tabela do ovni.
    CALL rot_dir_ovni_random    ; Chama a rotina que gera a direção do ovni.
    MOV R2, direcao_ovni        ; Guarda o endereço da variável com a direção do ovni.
    MOV R3, [R2]                ; Guarda a direção do  ovni a gerar.
    MOV R1, TIPO_MOV_OVNI       ; Coloca 8 no registo 1.
    ADD R1, R10                  ; Guarda o endereço da entrada da tabela que guarda a direção do ovni.
    MOV [R1], R3                ; Escreve a direçãodo ovni, na entrada correspondente da tabela do ovni.
    
    POP R10
    POP R3
    POP R2
    POP R1
    POP R0
    RET 


;***********************************************************************************************************************
;* ROTINA TIPO OVNI ALEATORIO :   rotina que indica o tipo de ovni que vai surgir, analisando os dois digitios         *
;*                                de menor peso de um contador.                                                        *
;*                                Se o valor obtido for 0, 2 ou 3, o ovni será uma nave inimiga.                       *
;*                                Se o valor obtido for 1, o ovni será um asteróide.                                   *
;*                                                                                                                     *
;* ARGUMENTOS DE ENTRADA:                                                                                              *
;*                      [contador_aleatorio]    - valor aleatório entre 0 e 65000 .                                    *
;*                      MASCARA_AND             - valor 3.                                                             *
;*                                                                                                                     *
;* ARGUMENTOS DE SAÍDA:                                                                                                *
;*                      [gera_ovni]             - variável que guarda o valor 0 (nave inimiga) ou 1 (ovni).            *
;***********************************************************************************************************************
 
 rot_tipo_ovni_random:
    PUSH R0
    PUSH R1
    PUSH R2
    PUSH R10
    
    MOV R0, contador_aleatorio
    MOV R1, [R0]                    ; Cópia do valor do contador aleatório.
    MOV R2, MASCARA_AND             ; Máscara que filtra os dois dígitos de menor peso.
    AND R1, R2                      ; Obtém um valor entre 0 e 3
    CMP R1, 1                       ; O número obtido é o número um?
    JZ gera_asteroide               ; Se sim, vai gerar um asteróide.
    JMP gera_nave_inimiga           ; Se não, vai gerar uma nave inimiga.

gera_nave_inimiga:
    MOV R1, 0                       ; Vai gerar uma nave inimiga.
    MOV R2, gera_ovni               ; Guarda o endereço da variáveç que regista o tipo de ovnia gerar.
    MOV [R2], R1                    ; Atualiza o valor da variável gera_ovnis, para gerar uma nave inimiga.
    JMP sai_rot_tipo_ovni_random    ; Sai.
    
gera_asteroide:
    MOV R1, 1                       ; Vai gerar um asteroide.
    MOV R2, gera_ovni               ; Guarda o endereço da variáveç que regista o tipo de ovnia gerar.
    MOV [R2], R1                    ; Atualiza o valor da variável gera_ovnis, para gerar uma nave inimiga.
    
sai_rot_tipo_ovni_random:
    POP R10
    POP R2
    POP R1
    POP R0
    RET
    
    
;***********************************************************************************************************************
;* ROTINA DIRECAO OVNI ALEATORIO:    rotina que indica a qual das possiveis três direções para o ovni:                 *
;*                                   - 0: o ovni desce em direção à lateral esquerda do ecrã;                          *
;*                                   - 1: o ovni desce linearmenre;                                                    *
;*                                   - 2: o ovni desce em direção à lateral direita do ecrã;                           *
;*                                                                                                                     *
;* ARGUMENTOS DE ENTRADA:                                                                                              *
;*                      [contador_aleatorio]    - valor aleatório entre 0 e 65000.                                     *
;*                      VALOR_3                 - nº 3.                                                                *
;*                                                                                                                     *
;* ARGUMENTOS DE SAÍDA:                                                                                                *
;*                      [direcao_ovni]          - variável que guarda o nº da direção do ovni (0, 1 ou 2).             *
;***********************************************************************************************************************

 rot_dir_ovni_random:
    PUSH R0 
    PUSH R1
    PUSH R2
    PUSH R10
    
    MOV R0, contador_aleatorio      ; Guarda o endereço da variável contador_aleatório.
    MOV R1, [R0]                    ; Cópia do valor do contador aleatório.
    MOV R2, VALOR_3                 ; Coloca 3 no registo 2.
    MOD R1, R2                      ; Obtém o resto da divisão inteira do contador por 3.
    MOV R0, direcao_ovni            ; Obtém o endereço da variável direção ovni.
    MOV [R0], R1                    ; Escreve o resto (0, 1 ou 2) na variável direcao_ovni.
    
    POP R10
    POP R2
    POP R1
    POP R0
    RET
    
    
;***********************************************************************************************************************
;* ROTINA DESENHA OVNI:    rotina que desenha um ovni, no seu ecrã correspondente, consoante as suas especificações.   *
;*                                                                                                                     *
;* ARGUMENTOS DE ENTRADA:                                                                                              *
;*                      R10                  - endereço da tabela do ovni.                                             *
;*                      TIPO_OVNI            - valor 2.                                                                *
;*                      LINHA_OVNI           - valor 4.                                                                * 
;*                      COL_OVNI             - valor 6.                                                                * 
;*                      ECRA_OVNI            - valor 10.                                                               *
;*                      TAMANHO_OVNI         - valor 12.                                                               *
;*                      [R10 + TIPO_OVNI]    - tipo de ovni.                                                           *
;*                      [R10 + LINHA_OVNI]   - linha do pixel de ref. a desenhar.                                      *
;*                      [R10 + COL_OVNI]     - coluna do pixel de ref. a desenhar.                                     *
;*                      [R10 + ECRA_OVNI]    - ecrã a desenhar.                                                        *
;*                      [R10 + TAMANHO_OVNI] - nº de linhas/nº de colunas -1 do ovni.                                  *
;*                      tab_asteroides       - endereço da tabela c/as variás tabelas de tamanhos para os asteróides.  *
;*                      tab_nave_inimiga     - endereço da tabela c/as variás tabelas de tamanhos para a nave inimiga. *
;***********************************************************************************************************************

rot_desenha_ovni:
    PUSH R0
    PUSH R1
    PUSH R2
    PUSH R3
    PUSH R4
    PUSH R10
    
    MOV R0, TIPO_OVNI               ; Escreve 2 no registo 0.
    ADD R0, R10                     ; Guarda o endereço da entrada da tabela c/o tipo de ovni.
    MOV R1, [R0]                    ; Guarda o tipo do ovni.
    
    MOV R0, TAMANHO_OVNI            ; Escreve 12 no registo 0.
    ADD R0, R10                     ; Guarda o endereço da entrada da tabela c/o tamanho -1 do ovni.
    MOV R2, [R0]                    ; Guarda o tamaho(nº de linhas/colunas) -1 do ovni.
    
    CALL rot_obtem_tabela_cor_ovni  ; Chama a rotina que obtém o endereço da tabela c/ a cor dos pixeis do ovni.
    MOV R0, tab_cor_ovni            ; Guarda o endereço da variável c/o endereço da tabela c/a cor dos pixeis do ovni.
    MOV R3, [R0]                    ; Cópia do endereço da tabela com as especificações para as cores do ovni.
    MOV R4, tab_objeto              ; Guarda o endereço da variável tab_objeto.
    MOV [R4], R3                    ; Escreve na variável tab_objeto o endereço da tabela c/ as cores do ovni.
    
    MOV R0, LINHA_OVNI              ; Escreve 4 no registo 0.
    ADD R0, R10                     ; Guarda o endereço da entrada da tabela c/a linha do pixel de ref. do ovni.
    MOV R1, [R0]                    ; Guarda a linha do pixel de ref. do ovni.
    
    MOV R0, COL_OVNI                ; Escreve 6 no registo 0.
    ADD R0, R10                     ; Guarda o endereço da entrada da tabela c/a coluna do pixel de ref. do ovni.
    MOV R2, [R0]                    ; Guarda o tamaho(nº de linhas/colunas) -1 do ovni.
    
    CALL rot_obtem_pixel_ovni       ; Chama a rotina que obtém o nº do pixel de ref. do ovni.
    MOV R0, local_ovni              ; Guarda o endereço da variável que guarda o pixel de ref. do ovni.
    MOV R3, [R0]                    ; Cópia do nº do pixel de ref. do ovni.
    MOV R4, local_objeto            ; Guarda o endereço da variável local_objeto.
    MOV [R4], R3                    ; Escreve na variável local_objeto, o nº do pixel de ref. do ovni.
    
    MOV R0, ECRA_OVNI               ; Escreve 10 no registo 0.
    ADD R0, R10                     ; Guarda o endereço da entrada da tabela c/o nº do ecrã a desenhar.
    MOV R1, [R0]                    ; Cópia do nº do ecrã a desenhar.
    MOV R0, ecra_pixel              ; Guarda o endereço da variável ecra_objeto.
    MOV [R0], R1                    ; Ecreve na variáve ecra_objeto, o nº do ecrã a desenhar o ovni 
    
    CALL rot_desenha_objeto         ; Chama a rotina que desenha o ovni no ecrã.
    
    POP R10
    POP R4
    POP R3
    POP R2
    POP R1
    POP R0
    RET
    

;***********************************************************************************************************************
;* ROTINA OBTEM CORES OVNI:    rotina que obtém o endereço da tabela com as cores de cada pixel do ovni, consoante     *
;*                             o seu tamanho e tipo.                                                                   *
;* ARGUMENTOS DE ENTRADA:                                                                                              *
;*                      R1                 - tipo de ovni.                                                             *
;*                      R2                 - tamanho do ovni (nº de linhas/colunas -1)                                 *
;*                      tab_asteroides     - endereço da tabela c/as varias tabelas de tamanhos para os asteróides.    *
;*                      tab_nave_inimiga   - endereço da tabela c/as varias tabelas de tamanhos para a nave inimiga.   *
;* ARGUMENTOS DE SAÍDA:                                                                                                *
;*                      [tab_cor_ovni]     - escreve na variável, o endereço da tabela com as cores dos pixeis do ovni.*
;***********************************************************************************************************************

rot_obtem_tabela_cor_ovni:
    PUSH R1 
    PUSH R2
    PUSH R3
    PUSH R4
    PUSH R10
    
    SHL R2, 1                       ; Multiplica o nº de linhas/colunas do ovni -1, por 2.
    CMP R1, 0                       ; O tipo de ovni é uma nave inimiga?
    JZ obtem_tabela_nave_inimiga    ; Vai obter a tabela das cores da nave inimiga.
    CMP R1, 1                       ; O tipo de ovni é um asteróide?
    JZ obtem_tabela_asteroide       ; Vai obter a tabela das cores do asteróide.
    
obtem_tabela_nave_inimiga:
    MOV R1, tab_nave_inimiga        ; Guarda o endereço da tabela c/as tabelas dos vários tamanhos para as nave inimiga. 
    ADD R1, R2                      ; Obtém o endereço do elemento c/a tabela de cores p/ o tamanho pretendido.
    MOV R3, [R1]                    ; Obtém o endereço da tabela c/o tamanho correto para a nave inimiga.
    MOV R4, tab_cor_ovni            ; Guarda o endereço da variável tab_cor_ovni.
    MOV [R4], R3                    ; Escreve nessa variável o endereço da tabela c/ as cores p/ o tamanho pretendido.
    JMP sai_rot_obtem_tabela_cor_ovni

obtem_tabela_asteroide:
    MOV R1, tab_asteroides          ; Guarda o endereço da tabela c/as tabelas dos vários tamanhos para os asteróides. 
    ADD R1, R2                      ; Obtém o endereço do elemento c/a tabela de cores p/ o tamanho pretendido.
    MOV R3, [R1]                    ; Obtém o endereço da tabela c/o tamanho correto para os ateróides.
    MOV R4, tab_cor_ovni            ; Guarda o endereço da variável tab_cor_ovni.
    MOV [R4], R3                    ; Escreve nessa variável o endereço da tabela c/ as cores p/ o tamanho pretendido.
    JMP sai_rot_obtem_tabela_cor_ovni

sai_rot_obtem_tabela_cor_ovni:
    POP R10
    POP R4
    POP R3
    POP R2
    POP R1
    RET 


;***********************************************************************************************************************
;* ROTINA CONVERTE PIXEL:  rotina que converte a linha e coluna do pixel de ref. do ovni a desenhar, para nº de pixel. *
;*                                                                                                                     *
;* ARGUMENTOS DE ENTRADA:                                                                                              * 
;*                                   R1  - linha do pixel de ref. (pixel superior esquerdo) do ovni.                   *
;*                                   R2  - coluna do pixel de ref. (pixel superior esquerdo) do ovni.                  *
;* ARGUMENTOS DE SAÍDA:                                                                                                *
;*                          [local_ovni] - guarda o nº do pixel de ref. do ovni.                                       *
;***********************************************************************************************************************

rot_obtem_pixel_ovni:
    PUSH R1 
    PUSH R2
    PUSH R3
    PUSH R10
    
    SHL R1, 6               ; Multiplica o valor da linha por 64.
    ADD R1, R2              ; Obtém o valor do pixel de ref.
    MOV R3, local_ovni      ; Guarda o endereço da variável local_ovni.
    MOV [R3], R1            ; Escreve na variável local_ovni, o nº do pixel de referência do ovni.
    
    POP R10
    POP R3
    POP R2
    POP R1
    RET


;***********************************************************************************************************************
;* ROTINA MOVIMENTA OVNI:    rotina que apaga o ovni de uma posição do seu ecrã e desenha-o na nova posição.           *
;*                                                                                                                     *
;* ARGUMENTOS DE ENTRADA:                                                                                              *
;*                      R10             - endereço da tabela do ovni.                                                  *
;* ARGUMENTOS DE SAIDA:                                                                                                *
;*                      [R10]           - coloca a 0 a variável de estado do processo gere ovni (caso tenha chegado ao *
;*                                                                                                   limites do ecrã.) *
;*          [verifica_limite]           - coloca a 0 esta variável se for precisos resetar o ovni.                     *
;***********************************************************************************************************************

rot_movimenta_ovni:
    PUSH R0
    PUSH R1
    PUSH R10
    
    CALL rot_apaga_ovni             ; Chama a rotina que apaga o ovni da posição atual, no seu ecrã.
    CALL rot_posicao_ovni           ; Chama a rotina que altera a posição do ovni.
    CALL rot_verifica_lim_ovni      ; Chama a rotina que verifica se o ovni já está no fundo do ecrã.
    MOV R0, verifica_limite         ; Guarda o endereço da variável que informa se o ovni chegou ao fundo.
    MOV R1, [R0]                    ; Cópia do valor da variável.
    CMP R1, 1                       ; Se o ovni chegou ao fundo,
    JZ reset_ovni                   ; vai retornar ao estado inicial do processo gestao_1_ovni.
    CALL rot_tamanho_ovni           ; Chama a rotina que altera o tamanho do ovni consoante o nº de movimentos.
    CALL rot_desenha_ovni           ; Chama a rotina que desenha o ovni.
    JMP sai_rot_movimenta_ovni      ; Sai.
    
reset_ovni:
    MOV R0, 0                       ; Coloca 0 no registo 0.
    MOV [R10], R0                   ; Atualiza a variável de estado do processo gestao ovni p/o inicial.
    
    MOV R0, verifica_limite         ; Guarda o endereço da variável verifica_limite.
    MOV R1, 0                       ; Escreve 1 no registo 1.
    MOV [R0], R1                    ; "Consome" essa variável.

sai_rot_movimenta_ovni:
    POP R10
    POP R1
    POP R0
    RET


;***********************************************************************************************************************
;* ROTINA APAGA OVNI:    rotina que apaga um ovni de uma posicão no seu ecrã correspondente.                           *
;*                                                                                                                     *
;* ARGUMENTOS DE ENTRADA:                                                                                              *
;*                      R10                  - endereço da tabela do ovni.                                             *
;*                      ECRA_OVNI            - valor 10.                                                               *
;*                      [R10 + ECRA_OVNI]    - ecrã do ovni.                                                           *
;***********************************************************************************************************************

rot_apaga_ovni:
    PUSH R0
    PUSH R1
    PUSH R2
    
    MOV R0, ECRA_OVNI               ; Escreve 10 no registo 0.
    ADD R0, R10                     ; Guarda o endereço da entrada da tabela c/o nº do ecrã do ovni.
    MOV R1, [R0]                    ; Cópia do nº do ecrã do ovni.
  
    MOV R2, APAGA_ECRA              ; Guarda o endereço do comando que apaga todos os pixeis de um ecrã.
    MOV [R2], R1                    ; Apaga todos os pixeis do ecrã do ovni.
    
    POP R2
    POP R1
    POP R0
    RET


;***********************************************************************************************************************
;* ROTINA DE POSICIONAMENTO DO OVNI:    Rotina que indica qual a próxima posição do ovni, consoante o tipo de          *
;*                                      movimento que lhe tenha sido atribuído                                         *
;*                                                                                                                     *
;* ARGUMENTOS DE ENTRADA:                                                                                              *
;*                      R10                     - endereço da tabela do ovni.                                          *
;*                      TIPO_MOV_OVNI           - valor 8.                                                             *
;*                      LINHA_OVNI              - valor 4.                                                             *
;*                      COL_OVNI                - valor 6.                                                             *
;*                      VALOR_59                - valor 59 (valor máximo p/ o nº de coluna do pixel de ref. do ovni).  *
;*                                                                                                                     *
;* ARGUMENTOS DE SAÍDA:                                                                                                *
;*                      [R10 + LINHA_OVNI]      - esta entrada vai guardar a próx linha do pixel de ref. ovni.         *
;*                      [R10 + COL_OVNI]        - esta entrada vai guardar a próx coluna do pixel de ref. ovni.        *
;***********************************************************************************************************************

rot_posicao_ovni: 
    PUSH R0
    PUSH R1
    PUSH R2
    PUSH R3
    PUSH R4
    PUSH R5
    PUSH R6
    PUSH R7
    PUSH R10
    
    MOV R0, R10                 ; Cópia do endereço da tabela do ovni.
    MOV R1, TIPO_MOV_OVNI       ; Coloca 8 no registo 1.
    ADD R1, R0                  ; Guarda o endereço da entrada da tabela c/ o tipo de movimento do ovni.
    MOV R2, [R1]                ; Guarda o tipo de movimento do ovni.
    CMP R2, 0                   ; Se o tipo de movimento é 0;
    JZ movimento_esq            ; vai deslocar-se diagonalmente para a esquerda.
    CMP R2, 1                   ; Se o tipo de movimento é 1;                   
    JZ movimento_ret            ; vai deslocar-se retilineamente para baixo.
    JMP movimento_dir           ; Caso contrário, desloca-se diagonalmente para a direita.
    
movimento_esq:
    MOV R3, LINHA_OVNI          ; Coloca 4 no registo 3.
    MOV R4, COL_OVNI            ; Coloca 6 no registo 4.
    ADD R3, R10                 ; Obtém o endereço da entrada da tabela c/ o valor da linha atual do ovni.
    ADD R4, R10                 ; Obtém o endereço da entrada da tabela c/ o valor da coluna atual do ovni.
    MOV R5, [R3]                ; Cópia do valor atual da linha do ovni.
    MOV R6, [R4]                ; Cópia do valor atual da coluna do ovni.
    ADD R5, 1                   ; Desloca-se uma linha para baixo.
    SUB R6, 1                   ; Desloca-se uma coluna para a esquerda.
    JN  limite_coluna_esq       ; Se obter -1, volta a colocar a coluna a 0.    
retorna_movimento_esq:
    MOV [R3], R5                ; Escreve o novo valor da linha do ovni.
    MOV [R4], R6                ; Escreve o novo valor da coluna do ovni.
    JMP sai_rot_posicao_ovni    ; Sai
    
limite_coluna_esq:
    MOV R6, 0                   ; Coloca o nº da coluna a 0.
    JMP retorna_movimento_esq   ; Regressa.

movimento_ret:
    MOV R3, LINHA_OVNI          ; Coloca 4 no registo 3.
    ADD R3, R10                 ; Obtém o endereço da entrada da tabela c/ o valor da linha atual do ovni.
    MOV R5, [R3]                ; Cópia do valor atual da linha do ovni.
    ADD R5, 1                   ; Desloca-se uma linha para baixo.
    MOV [R3], R5                ; Escreve o novo valor da linha do ovni.
    JMP sai_rot_posicao_ovni    ; Sai.

movimento_dir:
    MOV R3, LINHA_OVNI          ; Coloca 4 no registo 3.
    MOV R4, COL_OVNI            ; Coloca 6 no registo 4.
    ADD R3, R10                 ; Obtém o endereço da entrada da tabela c/ o valor da linha atual do ovni.
    ADD R4, R10                 ; Obtém o endereço da entrada da tabela c/ o valor da coluna atual do ovni.
    MOV R5, [R3]                ; Cópia do valor atual da linha do ovni.
    MOV R6, [R4]                ; Cópia do valor atual da coluna do ovni.
    ADD R5, 1                   ; Desloca-se uma linha para baixo.
    ADD R6, 1                   ; Desloca-se uma coluna para a esquerda.
    MOV R7, VALOR_59            ; Coloca 59 (valor máximo para a coluna) no registo 7.
    SUB R7, R6                  ; Substrai o valor atual da coluna ao valor da coluna máximo.
    JN limite_coluna_dir        ; Se ultrupassou os limites do ecrã, volta a colocar a coluna a 59.
retorna_movimento_dir:
    MOV [R3], R5                ; Escreve o novo valor da linha do ovni.
    MOV [R4], R6                ; Escreve o novo valor da coluna do ovni.
    JMP sai_rot_posicao_ovni    ; Sai.

limite_coluna_dir:  
    MOV R6, VALOR_59            ; Coloca a coluna a 59.
    JMP retorna_movimento_dir   ; Retorna.
    
sai_rot_posicao_ovni:
    POP R10
    POP R7
    POP R6
    POP R5
    POP R4
    POP R3
    POP R2
    POP R1
    POP R0
    RET


;***********************************************************************************************************************
;* ROTINA DE VERFIFICAÇÃOO DOS LIMITES OVNI:   rotina que verifica se a próxima linha a desenhar o pixel de ref.       * 
;*                                             é a linha 64 (linha fora do ecrã.)                                      *
;*                                                                                                                     *
;* ARGUMENTOS DE ENTRADA:                                                                                              *
;*                      R10                     - endereço da tabela do ovni.                                          *
;*                      LINHA_OVNI              - valor 4                                                              *
;*                      [R10 + LINHA_OVNI]      - nº da próx linha do pixel da ref. do ovni.                           *
;* ARGUMENTOS DE SAÍDA:                                                                                                *
;*                      [verifica_limite]       - se ativo a 1, indica que o ovni ia sair dos limites, então reseta-o. *
;***********************************************************************************************************************

rot_verifica_lim_ovni:
    PUSH R0
    PUSH R1
    PUSH R2
    PUSH R3
    PUSH R10
    
    MOV R0, LINHA_OVNI              ; Escreve 4 no registo 0.
    ADD R0, R10                     ; Obtém o endereço da entrada da tabela c/a linha do pixel de ref do ovni.
    MOV R1, [R0]                    ; Cópia da linha de do pixel de ref. do ovni.
    MOV R2, 1                       ; Escreve 1 no registo 2.
    SHL R2, 5                       ; Escreve 32 no registo 2.
    CMP R1, R2                      ; Já chegou à linha 32?
    JZ saiu_limites
    JMP sai_rot_verifica_lim_ovni

saiu_limites:
    MOV R3, verifica_limite         ; Endereço da variável que transmite se o ovni já chegou aos limites do ecrã-
    MOV R2, 1                       ; Escreve 1 no registo 2.
    MOV [R3], R2                    ; Ecreve 1 na variável verifica_limite p/ indicar que o ovni já saiu do ecrã.
    
sai_rot_verifica_lim_ovni:
    POP R10
    POP R3
    POP R2
    POP R1
    POP R0
    RET


;***********************************************************************************************************************
;* ROTINA TAMANHO DO OVNI:   rotina que seleciona o tamanho do ovni consoante o nº de movimentos.                      *
;*                                                                                                                     *
;* ARGUMENTOS DE ENTRADA:                                                                                              *
;*                      R10                    - endereço da tabela do ovni.                                           *
;*                      TAMANHO_OVNI          - valor 12                                                               *
;*                      MOVIMENTOS_OVNI       - valor 14                                                               *
;*                      VALOR_3               - valor 3                                                                *
;*                      VALOR_6               - valor 6                                                                *
;*                      VALOR_9               - valor 9                                                                *
;*                      VALOR_12              - valor 12                                                               *
;*                   [R10 + MOVIMENTOS_OVNI]  - guarda o nº de movimentos do ovni.                                     *
;*                                                                                                                     *
;* ARGUMENTOS DE SAÍDA:                                                                                                *
;*                      [R10 + TAMANHO_OVNI]  - guarda o próx. tamanho (nº de linhas/colunas -1) do ovni.              *
;***********************************************************************************************************************

rot_tamanho_ovni:
    PUSH R0
    PUSH R1
    PUSH R2
    PUSH R3
    PUSH R4
    PUSH R10
    
    MOV R0, MOVIMENTOS_OVNI         ; Escreve 14 no resgisto 0.
    ADD R0, R10                     ; Guarda o endereço da entrada da tabela, que guarda o nº de movimentos do ovni.
    MOV R1, [R0]                    ; Cópia do nº de movimento
    MOV R4, VALOR_3                 ; Escreve 3 no regitso 4.
    CMP R1, R4                      ; Se já se moveu três vezes,
    JZ aumenta_posicao              ; vai aumentar de tamanho.
    MOV R4, VALOR_6                 ; Escreve 6 no regitso 4.
    CMP R1, R4                      ; Se já se moveu seis vezes,
    JZ aumenta_posicao              ; vai aumentar de tamanho.
    MOV R4, VALOR_9                 ; Escreve 9 no regitso 4.
    CMP R1, R4                      ; Se já se moveu nove vezes,
    JZ aumenta_posicao              ; vai aumentar de tamanho.
    MOV R4, VALOR_12                ; Escreve 12 no regitso 4.
    CMP R1, R4                      ; Se já se moveu doze vezes,
    JZ aumenta_posicao              ; vai aumentar de tamanho.
    JMP sai_rot_tamanho_ovni        ; Caso contrário, mantém o tamanho.
    
aumenta_posicao:
    MOV R2, TAMANHO_OVNI           ; Escreve 12 no registo 2.
    ADD R2, R10                    ; Guarda o endereço da entrada da tabela do ovni, que guarda o tamanho do ovni -1.
    MOV R3, [R2]                   ; Cópia do tamanho (nº de linhas/colunas -1) do ovni.
    ADD R3, 1                      ; Passa ao próximo tamanho
    MOV [R2], R3                   ; Altera o tamanho do ovni, na entrada da sua tabela.
    
sai_rot_tamanho_ovni:
    POP R10
    POP R4
    POP R3
    POP R2
    POP R1
    POP R0
    RET
    


;***********************************************************************************************************************
;* ROTINA DETETA COLISAO:    rotina que deteta se um ovni colidiu com um laser ou com a nave.                          *
;*                           OPÇÃO 1-  colidiu c/ a nave; escreve 1 na entrada da tabela do ovni correspondente.       * 
;*                           OPÇÃO 2-  colidiu c/ o laser; escreve 2 na entrada da tabela do ovni correspondente.      *
;* ARGUMENTOS DE ENTRADA:                                                                                              *
;*                      R10                         - endereço da tabela do ovni.                                      *
;*                      [deteta_colisao_laser]      - guarda 1 se for detetada colisão com o laser.                    *
;*                      [deteta_colisao_nave]       - guarda 1 se for detetada colisão com a nave.                     *
;* ARGUMENTOS DE SAÍDA:                                                                                                *
;*                      COLISAO_OVNI             - valor 16.                                                           *
;*                      [R10 + COLISAO_OVNI]     - 0 se não colidiu, 1 se colidou c/ nave, 2 se colidiu c/laser        *
;*                      EXPLOSAO_OVNI            - valor 18.                                                           *
;*                      [R10 + EXPLOSAO_OVNI]    - a 1 se houve embate do ovni c/o laser.                              *
;***********************************************************************************************************************

rot_deteta_colisao:
    PUSH R0
    PUSH R1
    PUSH R10
    
    MOV R0, TIPO_OVNI               ; Escreve 2 no registo 0.
    ADD R0, R10                     ; Guarda o endereço da entrada da tabela c/o tipo de ovni.
    MOV R1, [R0]                    ; Guarda o tipo do ovni.
    MOV R0, TAMANHO_OVNI            ; Escreve 12 no registo 0.
    ADD R0, R10                     ; Guarda o endereço da entrada da tabela c/o tamanho -1 do ovni.
    MOV R2, [R0]                    ; Guarda o tamaho(nº de linhas/colunas) -1 do ovni.
    CALL rot_obtem_tabela_cor_ovni  ; Chama a rotina que obtém o endereço da tabela c/ a cor dos pixeis do ovni.
    
    MOV R0, LINHA_OVNI              ; Escreve 4 no registo 0.
    ADD R0, R10                     ; Guarda o endereço da entrada da tabela c/a linha do pixel de ref. do ovni.
    MOV R1, [R0]                    ; Guarda a linha do pixel de ref. do ovni.
    MOV R0, COL_OVNI                ; Escreve 6 no registo 0.
    ADD R0, R10                     ; Guarda o endereço da entrada da tabela c/a coluna do pixel de ref. do ovni.
    MOV R2, [R0]                    ; Guarda o tamaho(nº de linhas/colunas) -1 do ovni.
    CALL rot_obtem_pixel_ovni       ; Chama a rotina que obtém o nº do pixel de ref. do ovni.
    
    CALL rot_deteta_colisao_nave        ; Chama a rotina que deteta se houve colisão com a nave.
    MOV R0, deteta_colisao_nave         ; Guarda o endereço da variável que fica a 1 se houver colisão c/a nave.
    MOV R1, [R0]                        ; Lê essa variável.
    CMP R1, 1                           ; Houve colisão com a nave?
    JZ colisao_com_nave                 ; Se sim, vai alterar a variável ocorreu_embate.
    CALL rot_deteta_colisao_laser       ; Se não, chama a rotina que deteta se houve colisão com o laser.
    MOV R0, deteta_colisao_laser        ; Guarda o endereço da variável que fica a 1 se houver colisão c/o laser.
    MOV R1, [R0]                        ; Lê essa variável.
    CMP R1, 1                           ; Houve colisão c/o laser?
    JZ colisao_com_laser                ; Se sim, vai alterar a variável ocorreu_embate.
    MOV R0, COLISAO_OVNI                ; Escreve 16 no registo 0.
    ADD R0, R10                         ; Obtém o endereço da entrada da tabela c/o nº da colisão.
    MOV R1, 0                           ; Coloca 0 no registo 0.
    MOV [R0], R1                        ; Atualiza esta entrada p/ 0 pois não houve colisao.
    JMP sai_rot_deteta_colisao          ; Se não, sai.

colisao_com_nave:
    MOV R0, COLISAO_OVNI                ; Escrev 16 no registo 0.
    ADD R0, R10                         ; Guarda o endereço da variável c/o nº correspondente ao tipo de colisao.
    MOV R1, 1                           ; Escreve 1 no registo 1.
    MOV [R0], R1                        ; Altera essa variável.
    JMP sai_rot_deteta_colisao          ; Saí.

colisao_com_laser:
    MOV R0, COLISAO_OVNI                ; Escreve 16 no registo 0.
    ADD R0, R10                         ; Guarda o endereço da entrada c/o nº correspondente ao tipo de colisao.
    MOV R1, VALOR_2                     ; Escreve 2 no registo 1.
    MOV [R0], R1                        ; Altera essa variável.
    MOV R0, EXPLOSAO_OVNI               ; Escreve 18 no registo 0. 
    ADD R0, R10                         ; Obtém o endereço da entrada c/a informação se colidiu c/o laser.
    MOV R1, 1                           ; Escreve 1 no resgisto 1.
    MOV [R0], R1                        ; Atualiza essa variável p/1.
    JMP sai_rot_deteta_colisao          ; Saí.
 
sai_rot_deteta_colisao:
    POP R10
    POP R1
    POP R0
    RET
 
 
;***********************************************************************************************************************
;* ROTINA DETETA COLISÃO C/ NAVE:    rotina que deteta se ocorreu colisão de um ovni com a nave.                       *
;*                                   OPÇÃO 1: o pixel superior esquerdo da nave está dentro dos limites gerados        *
;*                                   pelo pixel do canto superior esquerdo e pelo canto inferior direito do ovni.      *
;*                                   OPÇÃO 2: o pixel superior direito da nave está dentro dos limites gerados         *
;*                                   pelo pixel do canto superior esquerdo e pelo canto inferior direito do ovni.      *
;*                                   Só há porém colisão se um mesmo pixel estiver ligado tanto no ecrã da nave        *
;*                                   como no ecrã do ovni.                                                             *
;*                                                                                                                     *
;* ARGUMENTOS DE ENTRADA:                                                                                              *
;*                               [local_ovni]    - nº do pixel de ref. do ovni.                                        *
;*                               [local_nave]    - nº do pixel de ref. da nave.                                        *
;*                                                                                                                     *
;* ARGUMENTOS DE SAÍDA:                                                                                                *
;*                      [deteta_colisao_nave]    - guarda 1 se for detetada colisão com a nave.                        *
;***********************************************************************************************************************

rot_deteta_colisao_nave:
    PUSH R0 
    PUSH R1
    PUSH R2
    PUSH R3
    PUSH R4
    PUSH R10
    
    MOV R0, local_ovni                      ; Guarda o endereço da variável c/o nº do pixel de ref. do ovni.  
    MOV R1, [R0]                            ; Cópia do pixel superior esquerdo do ovni.
    CALL rot_obtem_pixel_inf_dir            ; Chama a rotina que obtém o pixel inferior direito do ovni.
    MOV R0, pixel_inf_dir                   ; Gurda o endereço da variável c/o nº do pixel inferior direito do ovni.
    MOV R2, [R0]                            ; Cópia do pixel inferior direito do ovni.
    MOV R0, local_nave                      ; Guarda o endereço da variável c/o nº de ref. da nave.
    MOV R3, [R0]                            ; Cópia do nº pixel superior esquerdo da nave.
    MOV R4, R3                              ; Cópia do nº do pixel superior esquerdo da nave.
    ADD R4, VALOR_4                         ; Guarda o nº do pixel superior direito da nave.

op1_verifica_limite_sup:
    CMP R3, R1                              ; O pixel sup. esq. da nave é igual ou maior que o pixel sup. esq. do ovni?
    JGE op1_verifica_limite_inf             ; Se sim, vai verificar os cantos inf. dir.
    JMP op2_verifica_limite_sup             ; Se não, verifica se os objetos estão nas condições da opcão 2.
    
op1_verifica_limite_inf:
    CMP R3, R2                              ; O pixel inf. esq. da nave é igual ou menor que o pixel inf. dir. do ovni?
    JLE verifica_pixeis_sobrepostos         ; Se sim, vai verificar se os pixeis estão sobrepostos.
    JMP op2_verifica_limite_sup             ; Se não, verifica se os objetos estão nas condições da opção 2.
 
 op2_verifica_limite_sup:             
    CMP R4, R1                              ; O pixel sup. dir. da nave é igual ou maior que o pixel sup. esq. do ovni?
    JGT op2_verifica_limite_inf             ; Se sim, vai verificar os cantos inf. dir.
    JMP nao_colisao_nave                    ; Sai.
    
op2_verifica_limite_inf:               
    CMP R4, R2                              ; O pixel inf. esq. da nave é igual ou menor que o pixel inf. dir. do ovni?
    JLE verifica_pixeis_sobrepostos         ; Se sim, vai verificar se os pixeis estão sobrepostos.
    JMP nao_colisao_nave                    ; Sai.
    
verifica_pixeis_sobrepostos:                
    CALL rot_verifica_pixeis_sobrepostos    ; Chama a rotina que verifica se há pixeis sobrepostos.
    MOV R0, deteta_pixeis_sobrepostos       ; Guarda o endereço da variável que fica a 1 se houver pixeis sobrepostos.
    MOV R1, [R0]                            ; Lê se há ou não pixeis sobrepostos.
    MOV R0, deteta_colisao_nave             ; Guarda o endereço da variável que guarda se houve ou não colisão.
    MOV [R0], R1                            ; Atualiza essa variável p/o valor 1 se houve colisão.
    JMP sai_rot_deteta_colisao_nave         ; Sai.

nao_colisao_nave:
    MOV R1, 0                               ; Escreve 0 no registo 1.
    MOV R0, deteta_colisao_nave             ; Guarda o endereço da variável que guarda se houve ou não colisão.
    MOV [R0], R1                            ; Atualiza essa variável p/o valor 0 logo não houve colisão.
    
sai_rot_deteta_colisao_nave:
    POP R10
    POP R4
    POP R3
    POP R2
    POP R1
    POP R0
    RET 


;***********************************************************************************************************************
;* ROTINA OBTÉM PIXEL CANTO INFERIOR DIREITO:    rotina que obtém o nº do pixel do canto inferior direito de um ovni   *
;*                                               tendo em conta o seu tamanho (nº de linhas/colunas -1) e o nº do      *
;*                                               pixel de ref. desse ovni.                                             *
;*                                                                                                                     *
;* ARGUMENTOS DE ENTRADA:                                                                                              *
;*                      [local_ovni]         - nº do pixel de ref.(pixel superior esquerdo) do ovni.                   *
;*                      [tab_cor_ovni]       - endereço da tabela com as cores do ovni.                                *
;*                                                                                                                     *
;* ARGUMENTOS DE SAÍDA:                                                                                                *
;*                      [pixel_inf_dir]      - guarda o nº dos pixel inferior direito do objeto.                       *
;***********************************************************************************************************************

rot_obtem_pixel_inf_dir:
    PUSH R0
    PUSH R1
    PUSH R2
    PUSH R3
    PUSH R4
    PUSH R5
    PUSH R10
    
    MOV R0, local_ovni          ; Guarda o endereço da variável local_objeto.
    MOV R1, [R0]                ; Cópia do valor do pixel de ref. deste objeto.
    MOV R0, tab_cor_ovni        ; Guarda o endereço da da variável tab_objeto.
    MOV R2, [R0]                ; Cópia do endereço da tabela c/as especificações e cores p/este objeto.
    MOV R5, [R2]                ; Lê o nº de linhas/colunas deste objeto.
    SUB R5, 1                   ; Subtraí um ao nº de linhas deste objeto.
    MOV R3, R5                  ; Guarda o nº de colunas -1 deste objeto.
    MOV R4, 1                   ; Coloca 1 no resgito 4.
    SHL R4, 6                   ; Coloca 64 no registo 4.
    MUL R5, R4                  ; Multiploca o nº de linhas -1 por 64.
    ADD R5, R3                  ; Soma a este valor o nº de colunas -1.
    ADD R1, R5                  ; Soma o valor anterior ao pixel de ref. do objeto.
    MOV R0, pixel_inf_dir       ; Guarda o endereço da variável pixel_inf_dir.
    MOV [R0], R1                ; Escreve nesta variável 
    
    POP R10
    POP R5
    POP R4
    POP R3
    POP R2
    POP R1
    POP R0
    RET
    
    
;***********************************************************************************************************************
;* ROTINA DETETA PIXEIS SOBREPOSTOS:    rotina que verifica se o mesmo pixel está ligado no ecrã da nave e no ecrã     *
;*                                      do ovni.                                                                       *
;*                                                                                                                     *
;* ARGUMENTOS DE ENTRADA:                                                                                              *
;*                      R10                  - endereço da tabela do ovni.                                             *
;*                      ECRA_OVNI            - valor 10.                                                               *
;*                      ESTADO_PIX           - endereço do comando que obtém se o pixel está ligado ou desligado.      *
;*                      SEL_ECRA             - endereço do comando que seleciona o ecrã especificado.                  *
;*                      SEL_PIX              - endereço do comando que seleciona o nº do pixel a usar.                 * 
;*                      [R10 + ECRA_OVNI]    - ecrã do ovni.                                                           *
;*                      [local_nave]         - nº do pixel de ref. da nave.                                            *
;* ARGUMENTOS DE SAÍDA:                                                                                                *
;*                      [deteta_pixeis_sobrepostos]      - guarda 1 se houver pelo menos um pixel sobreposto.          *
;***********************************************************************************************************************

rot_verifica_pixeis_sobrepostos:
    PUSH R0
    PUSH R1
    PUSH R2
    PUSH R3
    PUSH R4
    PUSH R5
    PUSH R6
    PUSH R7
    PUSH R8
    PUSH R9
    PUSH R10
    
    MOV R1, ECRA_OVNI                           ; Escreve 10 no registo 1.
    ADD R1, R10                                 ; Guarda o endereço da entrada da tabela do ovni c/o ecrã do ovni.
    MOV R2, [R1]                                ; Cópia do nº do ecrã do ovni
    MOV R3, VALOR_4                             ; Coloca 4 no regito 3.
    MOV R4, 0                                   ; Começa por tratar a linha 0.
    MOV R5, 0                                   ; Começa por tratar a coluna 0.
    MOV R6, 1                                   ; Coloca 1 no registo 6.
    SHL R6, 6                                   ; Coloca 64 no registo 6.
    
verifica_pixel:
    MOV R0, R4                                  ; Cópia da linha a tratar.
    MOV R1, R5                                  ; Cópia da coluna a tratar.
    MUL R0, R6                                  ; Multiplica o indice linha por 64.
    ADD R0, R1                                  ; Soma a esse valor o indice coluna.
    MOV R8, local_nave                          ; Cópia do pixel de referência da nave.
    MOV R7, [R8]
    ADD R7, R0                                  ; Obtém um pixel da nave.
    
    MOV R0, 0                                   ; Guarda o nº do ecrã da nave.
    MOV R8, SEL_ECRA                            ; Guarda o endereço do comando que seleciona o ecrã.
    MOV [R8], R0                                ; Seleciona o ecrã da nave.
    MOV R8, SEL_PIX                             ; Guarda o endereço do comando que seleciona o pixel.
    MOV [R8], R7                                ; Seleciona o pixel guardado no registo 7.
    MOV R8, ESTADO_PIX                          ; Guarda o endereço do comando que lê o estado do pixel.
    MOV R9, [R8]                                ; Obtém o estado do pixel.
    CMP R9, 0                                   ; Se o pixel estiver apagado no ecrã da nave,
    JZ proximo_pixel                            ; vai verificar o próximo pixel.
    
    MOV R8, SEL_ECRA                            ; Guarda o endereço do comando que seleciona o ecrã.
    MOV [R8], R2                                ; Seleciona o ecrã do ovni.
    MOV R8, SEL_PIX                             ; Guarda o endereço do comando que seleciona o pixel.
    MOV [R8], R7                                ; Seleciona o pixel guardado no registo 7.
    MOV R8, ESTADO_PIX                          ; Guarda o endereço do comando que lê o estado do pixel.
    MOV R9, [R8]                                ; Obtém o estado do pixel.
    CMP R9, 0                                   ; Se o pixel estiver apagado no ecrã do ovni,
    JZ proximo_pixel                            ; vai verificar o próximo pixel.
  
    MOV R8, deteta_pixeis_sobrepostos           ; Guarda o endereço da variável deteta_pixeis_sobrepostos
    MOV R9, 1                                   ; Escreve 1 no registo 9.
    MOV [R8], R9                                ; Atualiza a variável que avisa que há um pixel ativos nos dois ecrãs.
    JMP sai_rot_verifica_pixeis_sobrepostos     ; Sai.
    
proximo_pixel:
    ADD R5,1                                    ; Vai tratar da próxima coluna.
    CMP R5, R3                                  ; Já tratou de todas as colunas?
    JNZ verifica_pixel                          ; Se não, volta ao ciclo. 
    MOV R5, 0                                   ; Se sim, volta à coluna 0.
    ADD R4, 1                                   ; Vai tratar da próxima linha.
    CMP R4, R3                                  ; Já tratou de todas as linhas?
    JNZ verifica_pixel                          ; Se não, volta ao ciclo.
    JMP nao_ha_pixeis_sobrepostos               ; Se chegou aqui, não ha pixeis sobrepostos.

nao_ha_pixeis_sobrepostos:
    MOV R8, deteta_pixeis_sobrepostos           ; Guarda o endereço da variável deteta_pixeis_sobrepostos
    MOV R9, 0                                   ; Escreve 0 no registo 9.
    MOV [R8], R9                                ; Atualiza a variável que avisa que não ha
    JMP sai_rot_verifica_pixeis_sobrepostos     ; Sai.
    
sai_rot_verifica_pixeis_sobrepostos:
    POP R10
    POP R9 
    POP R8
    POP R7
    POP R6
    POP R5
    POP R4
    POP R3
    POP R2
    POP R1
    POP R0
    RET

 
;***********************************************************************************************************************
;* ROTINA DETETA COLISÃO C/ LASER:   rotina que deteta se ocorreu colisão de um ovni c/ o laser.                       *
;*                                   O pixel do laser tem que estar dentro dos limites gerados pelo pixel do           *
;*                                   canto superior esquerdo e pelo canto inferior direito do ovni.                    *
;*                                   Só há porém colisão se o pixel do laser  estiver ligado também no ecrã do ovni.   *
;*                                                                                                                     *
;* ARGUMENTOS DE ENTRADA:                                                                                              *
;*                                    R10    - endereço da tabela do ovni.                                             *
;*                              ECRA_OVNI    - valor 10.                                                               *
;*                      [R10 + ECRA_OVNI]    - nº do ecrã do ovni.                                                     *
;*                           [local_ovni]    - nº do pixel de ref. (pixel do canto superior esq) do ovni.              *
;*                          [local_laser]    - nº do pixel do laser.                                                   *
;*                                                                                                                     * 
;* ARGUMENTOS DE SAÍDA:                                                                                                *
;*                  [deteta_colisao_laser]   - guarda 1 se for detetada colisão com o laser.                           *
;***********************************************************************************************************************

rot_deteta_colisao_laser:
    PUSH R0 
    PUSH R1
    PUSH R2
    PUSH R3
    PUSH R4
    PUSH R5
    PUSH R6
    PUSH R10
    
    MOV R0, local_laser                 ; Guarda o endereço da variável c/o nº do pixel do laser.  
    MOV R1, [R0]                        ; Cópia do nº do pixel do laser.
    MOV R0, SEL_PIX                     ; Guarda o endereço do comando que seleciona o pixel.
    MOV [R0], R1                        ; Seleciona o pixel do laser.
    
    MOV R0, ecra_laser                  ; Guarda o endereço da variável c/o nº do ecrã do laser.
    MOV R1, [R0]                        ; Cópia do nº do ecrã do laser.
    MOV R2, SEL_ECRA                    ; Guarda o endereço do comando que seleciona o ecrã.
    MOV [R2], R1                        ; Seleciona o ecã do laser.
    
    MOV R0, ESTADO_PIX                  ; Guarda o endereço do comando que lê o estado do pixel.
    MOV R1, [R0]                        ; Obtém o estado do pixel.
    MOV R0, 0                           ; Escreve 0 no registo 0.
    CMP R1, R0                          ; O laser não está ativo?
    JZ nao_colisao_laser                ; Então não pode haver colisão com o laser.
  
    MOV R0, local_ovni                  ; Guarda o endereço da variável c/o nº do pixel de ref. do ovni.              
    MOV R1, [R0]                        ; Cópia do pixel superior esquerdo do ovni.
    CALL rot_obtem_pixel_inf_dir        ; Chama a rotina que obtém o pixel inferior direito do ovni.
    MOV R0, pixel_inf_dir               ; Gurda o endereço da variável c/o nº do pixel inferior direito do ovni.
    MOV R2, [R0]                        ; Cópia do pixel inferior direito do ovni.
    MOV R0, local_laser                 ; Guarda o endereço da variável c/o pixel nº do laser.
    MOV R3, [R0]                        ; Cópia do nº do pixel do laser.
    CMP R3, R1                          ; O pixel do laser é menor que o pixel sup. esq. do ovni?
    JLE nao_colisao_laser               ; Se sim, sai.
    CMP R3, R2                          ; O pixel do laser é maior que o pixel inf. dir. do ovni?
    JGE nao_colisao_laser               ; Se sim, sai.
    MOV R2, ECRA_OVNI                   ; Escreve 10 no regitso 2.
    ADD R2, R10                         ; Obtém o endereço da entrada da tabela do ovni c/o nº do seu ecrã.
    MOV R5, [R2]                        ; Cópia do nº do ecrã do ovni.
    MOV R4, SEL_ECRA                    ; Guarda o endereço do comando que seleciona o ecrã.
    MOV [R4], R5                        ; Seleciona o ecrã do ovni.
    MOV R4, SEL_PIX                     ; Guarda o endereço do comando que seleciona o pixel.
    MOV [R4], R3                        ; Seleciona o pixel do laser.
    MOV R4, ESTADO_PIX                  ; Guarda o endereço do comando que lê o estado do pixel.
    MOV R6, [R4]                        ; Obtém o estado do pixel.
    CMP R6, 0                           ; Se o pixel estiver apagado no ecrã do ovni,
    JZ  nao_colisao_laser               ; sai.
    MOV R1, 1                           ; Escreve 1 no registo 1.
    MOV R0, deteta_colisao_laser        ; Guarda o endereço da variável que guarda se houve ou não colisão.
    MOV [R0], R1                        ; Atualiza essa variável p/o valor 1 se houve colisão.
    JMP sai_rot_deteta_colisao_laser
    
nao_colisao_laser:
    MOV R1, 0                           ; Escreve 0 no registo 1.
    MOV R0, deteta_colisao_laser        ; Guarda o endereço da variável que guarda se houve ou não colisão.
    MOV [R0], R1                        ; Atualiza essa variável p/o valor 0 logo não houve colisão.
    JMP sai_rot_deteta_colisao_laser
    
sai_rot_deteta_colisao_laser:
    POP R10
    POP R6
    POP R5 
    POP R4
    POP R3
    POP R2
    POP R1
    POP R0
    RET 
    

;***********************************************************************************************************************
;* ROTINA TRATA COLISAO:     rotina que trata da colisão de um ovni, consoante o seu tipo e o tipo de colisão.         *
;* ARGUMENTOS DE ENTRADA:                                                                                              *
;*                      R10                 - endereço da tabela do ovni.                                              *
;*                      TIPO_OVNI            - valor 2.                                                                *
;*                      [R10 + TIPO_OVNI]    - tipo de ovni.                                                           *
;*                      COLISAO_OVNI             - valor 16.                                                           *
;*                      [R10 + COLISAO_OVNI]     - 0 se não colidiu, 1 se colidou c/ nave, 2 se colidiu c/laser        *
;***********************************************************************************************************************


rot_trata_colisao:
    PUSH R0
    PUSH R1
    PUSH R2
    PUSH R10
    
    MOV R0, TIPO_OVNI                       ; Escreve 2 no registo 0.
    ADD R0, R10                             ; Obtém o endereço da entrada c/ o tipo de ovni.
    MOV R1, [R0]                            ; Cópia do tipo de ovni.
    MOV R2, 0                               ; Escreve 0 no registo 2.
    CMP R1, R2                              ; O ovni é uma nave inimiga?            
    JZ age_colidiu_com_nave                 ; Se sim, salta para a parte que trata de colisões de naves.
    MOV R2, 1                               ; Escreve 1 no resgitso 2.
    CMP R1, R2                              ; O ovni é um asteróide?
    JZ age_colidiu_com_asteroide            ; Se sim, salta p/a parte que trata de colisões com asteroides.
    
age_colidiu_com_nave:
    MOV R0, COLISAO_OVNI                    ; Escreve 16 no registo 0.
    ADD R0, R10                             ; Obtém o endereço da entrada c/o tipo de colisão.
    MOV R1, [R0]                            ; Lê esse valor.
    MOV R2, 1                               ; Escreve 1 no registp 2.
    CMP R1, R2                              ; Houve colisão c/a nave?
    JZ colisao_tipo_0                       ; Se sim, vai tratar da colisão de nave inimiga com nave.
    MOV R2, 2                               ; Escreve 2 no registo 2.
    CMP R1, R2                              ; Houve colisão c/o laser?
    JZ colisao_tipo_1                       ; Se sim, vai tratar da colisão da nave inimiga c/ o laser.
    JMP sai_rot_trata_colisao               ; Se não, sai.
    
age_colidiu_com_asteroide:
    MOV R0, COLISAO_OVNI                    ; Escreve 16 no registo 0.            
    ADD R0, R10                             ; Obtém o endereço da entrada c/o tipo de colisão.   
    MOV R1, [R0]                            ; Lê esse valor.
    MOV R2, 1                               ; Escreve 1 no registp 2.
    CMP R1, R2                              ; Houve colisão c/a nave?    
    JZ colisao_tipo_2                       ; Se sim, vai tratar da colisão do asteróide com nave.
    MOV R2, 2                               ; Escreve 2 no registo 2.
    CMP R1, R2                              ; Houve colisão c/o laser?    
    JZ colisao_tipo_3                       ; Se sim, vai tratar da colisão do asteróide a c/ o laser.
    JMP sai_rot_trata_colisao               ; Se não, sai.

colisao_tipo_0:
    CALL rot_age_opcao_0                    ; Chama a rotina que trata da colisão da nave inimiga c/a nave.
    JMP sai_rot_trata_colisao               ; Sai.

colisao_tipo_1:
    CALL rot_age_opcao_1                    ; Chama a rotina que trata da colisão da nave inimiga c/o laser.
    JMP sai_rot_trata_colisao               ; Sai.
    
colisao_tipo_2:
    CALL rot_age_opcao_2                    ; Chama a rotina que trata da colisão do asteróide c/a nave.
    JMP sai_rot_trata_colisao               ; Sai.
    
colisao_tipo_3:
    CALL rot_age_opcao_3                    ; Chama a rotina que trata da colisão do asteróide c/ o laser.
    JMP sai_rot_trata_colisao               ; Sai.
 
sai_rot_trata_colisao:
    POP R10
    POP R2
    POP R1
    POP R0
    RET
 
 
;***********************************************************************************************************************
;* ROTINA AGE APÓS COLISAO 0:    rotina age quando uma nave inimiga e nave colidem:                                    *
;*                               - apaga a nave inimiga;                                                               *
;*                               - desenha uma explosão;                                                               *
;*                               - reseta o ovni (coloca a 0 a sua varável de estado)                                  *
;*                               - coloca a 1 a variável game over                                                     *
;* ARGUMENTOS DE ENTRADA:                                                                                              *
;*                                    R10   - endereço da tabela do ovni.                                              *
;*                              ECRA_OVNI   - valor 10 .                                                               *
;*                      [R10 + ECRA_OVNI]   - ecrã a desenhar.                                                         *
;*                           [local_ovni]   - nº do pixei de ref. do ovni.                                             *
;*                         [tab_cor_ovni]   - endereço da tabela com as cores dos pixeis do ovni.                      *
;*                         [tab_explosao]   - endereço da tabela com as cores dos pixeis da explosão.                  *
;*                                                                                                                     *
;* ARGUMENTOS DE SAÍDA:                                                                                                *
;*                            [game_over]   - valor 1.                                                                 *
;***********************************************************************************************************************

rot_age_opcao_0:                           
    PUSH R0
    PUSH R1
    PUSH R2
    PUSH R10
    
    MOV R0, game_over                       ; Guarda o endereço da variável game_over.
    MOV R1, 1                               ; Escreve 1 no registo 1.
    MOV [R0], R1                            ; Atualiza a variável game_over.

    
    POP R10
    POP R2
    POP R1
    POP R0
    RET 


;***********************************************************************************************************************
;* ROTINA AGE APÓS COLISAO 1:    rotina age quando uma nave inimiga e o laser colidem:                                 *
;*                               - apaga a nave inimiga;                                                               *
;*                               - apaga o laser;                                                                      *
;*                               - desenha uma explosão;                                                               *
;*                               - reseta  laser (coloca a 0 a sua varável de estado)                                  *
;* ARGUMENTOS DE ENTRADA:                                                                                              *
;*                                    R10   - endereço da tabela do ovni.                                              *
;*                              ECRA_OVNI   - valor 10 .                                                               *
;*                      [R10 + ECRA_OVNI]   - ecrã a desenhar.                                                         *
;*                                VALOR_5   - 5.
;*                           [local_ovni]   - nº do pixei de ref. do ovni.                                             *
;*                         [tab_cor_ovni]   - endereço da tabela com as cores dos pixeis do ovni.                      *
;*                         [tab_explosao]   - endereço da tabela com as cores dos pixeis da explosão.                  *
;*                                                                                                                     *
;* ARGUMENTOS DE SAÍDA:                                                                                                *
;*                   [estado_lanca_laser]   - valor 0.                                                                 *
;*                  [R10 + EXPLOSAO_OVNI]   - valor 1.                                                                 *
;*                              [energia]   - valor de energia - 5.                                                    *
;***********************************************************************************************************************
   
rot_age_opcao_1:                            
    PUSH R0
    PUSH R1
    PUSH R2
    PUSH R10
    
    MOV R0, energia                         ; Guarda o endereço da variável energia.
    MOV R1, [R0]                            ; Cópia do valor da energia.
    ADD R1, VALOR_5                         ; Soma 5 a esse valor.
    MOV [R0], R1                            ; Atualiza a variável.
    CALL rot_displays                       ; Chama a rotina que mostra o valor da energia nos displays.
    
    MOV R1, ecra_laser                      ; Guarda o endereço da variável c/o nº do ecrã do laser.
    MOV R2, [R1]                            ; Cópia do ecrã do laser.
    MOV R1, SEL_ECRA                        ; Guarda o endereço do comando que seleciona o ecrã.
    MOV [R1], R2                            ; Seleciona o ecrã do laser.
    MOV R1, APAGA_ECRA                      ; Guarda o endereço do comando que apaga os pixeis de um ecrã.
    MOV [R1], R2                            ; Apaga o laser.
    
    MOV R0, estado_lanca_laser              ; Variável de estado do processo laser.
    MOV R1, 0                               ; Escreve 0 no registo 1.
    MOV [R0], R1                            ; "Reseta" o laser
    
    MOV R0, SOM_DESTRUIR             
    MOV R1, START_1_MEDIA                  ; Guarda o endereço do comando que inicia um video uma vez.
    MOV [R1], R0
    
    POP R10
    POP R2
    POP R1
    POP R0
    RET 
    
    
;***********************************************************************************************************************
;* ROTINA AGE APÓS COLISAO 2:    rotina age quando um asteróide e nave colidem:                                        *
;*                               - apaga o asteróide;                                                                  *
;*                               - reseta o ovni (coloca a 0 a sua varável de estado).                                 *
;* ARGUMENTOS DE ENTRADA:                                                                                              *
;*                              [energia]   - valor de energia.                                                        *
;* ARGUMENTOS DE SAÍDA:                                                                                                *
;*                              [energia]   - valor de energia + 10.                                                   *
;***********************************************************************************************************************

rot_age_opcao_2:                            
    PUSH R0
    PUSH R1
    PUSH R2
    PUSH R10

    MOV R0, energia                         ; Guarda o endereço da variável energia.
    MOV R1, [R0]                            ; Cópia do valor da energia.
    MOV R2, VALOR_10                        ; Escreve 10 no registo 2.
    ADD R1, R2                              ; Soma 10 a esse valor.
    MOV [R0], R1                            ; Atualiza a variável.
    CALL rot_displays                       ; Chama a rotina que mostra o valor da energia nos displays.
    
    MOV R0, SOM_MINERAR             
    MOV R1, START_1_MEDIA                  ; Guarda o endereço do comando que inicia um video uma vez.
    MOV [R1], R0
    
    POP R10
    POP R2
    POP R1
    POP R0
    RET 
    
    
;***********************************************************************************************************************
;* ROTINA AGE APÓS COLISAO 3:    rotina age quando uma nave inimiga e o laser colidem:                                 *
;*                               - apaga a nave inimiga;                                                               *
;*                               - apaga o laser;                                                                      *
;*                               - desenha uma explosão;                                                               *
;* ARGUMENTOS DE ENTRADA:                                                                                              *
;*                                    R10   - endereço da tabela do ovni.                                              *
;*                              ECRA_OVNI   - valor 10 .                                                               *
;*                      [R10 + ECRA_OVNI]   - ecrã a desenhar.                                                         *
;*                           [local_ovni]   - nº do pixei de ref. do ovni.                                             *
;*                         [tab_cor_ovni]   - endereço da tabela com as cores dos pixeis do ovni.                      *
;*                         [tab_explosao]   - endereço da tabela com as cores dos pixeis da explosão.                  *
;*                                                                                                                     *
;* ARGUMENTOS DE SAÍDA:                                                                                                *
;*                   [estado_lanca_laser]   - valor 0.                                                                 *
;*                              [energia]   - valor de energia - 5.                                                    *
;***********************************************************************************************************************
    
rot_age_opcao_3:                            
    PUSH R0
    PUSH R1
    PUSH R2
    PUSH R10

    
    MOV R0, energia                         ; Guarda o endereço da variável energia.
    MOV R1, [R0]                            ; Cópia do valor da energia.
    ADD R1, VALOR_5                         ; Soma 5 a esse valor.
    MOV [R0], R1                            ; Atualiza a variável.
    CALL rot_displays                       ; Chama a rotina que mostra o valor da energia nos displays.
    
    MOV R1, ecra_laser                      ; Guarda o endereço da variável c/o nº do ecrã do laser.
    MOV R2, [R1]                            ; Cópia do ecrã do laser.
    MOV R1, SEL_ECRA                        ; Guarda o endereço do comando que seleciona o ecrã.
    MOV [R1], R2                            ; Seleciona o ecrã do laser.
    MOV R1, APAGA_ECRA                      ; Guarda o endereço do comando que apaga os pixeis de um ecrã.
    MOV [R1], R2                            ; Apaga o laser.
    
    MOV R0, estado_lanca_laser              ; Variável de estado do processo laser.
    MOV R1, 0                               ; Escreve 0 no registo 1.
    MOV [R0], R1                            ; "Reseta" o laser
    
    MOV R0, SOM_DESTRUIR             
    MOV R1, START_1_MEDIA                  ; Guarda o endereço do comando que inicia um video uma vez.
    MOV [R1], R0
    
    POP R10
    POP R2
    POP R1
    POP R0
    RET 

    
    
;***********************************************************************************************************************
;* ROTINA GERA LASER:  rotina que desenha o laser na coluna central da nave, uma linha acima desta.                    *
;*                                                                                                                     *
;* ARGUMENTOS DE ENTRADA:                                                                                              *
;*                      [local_nave]     - posição do pixel de ref. da nave.                                           *
;*                      [ecra_laser]     - ecrã a desenhar o pixel do laser.                                           *
;*                       [tab_laser]     - tabela c/a cor do laser.                                                    *
;* ARGUMENTOS DE SAÍDA:                                                                                                *
;*                     [local_laser]     - posição do pixel de ref. do laser.                                          *
;***********************************************************************************************************************

rot_gera_laser:
    PUSH R0
    PUSH R1
    PUSH R2
    
    MOV R0, local_nave          ; Obtém o endereço da variável com o pixel de ref. da nave.
    MOV R1, [R0]                ; Cópia do nº do pixel de ref. da nave.
    ADD R1, VALOR_2             ; Seleciona o pixel do topo central da nave.
    MOV R2, 1                   ; Escreve 2 no registo 2.
    SHL R2, 6                   ; Escreve 64 no registo 2.
    SUB R1, R2                  ; Substrai 64 ao pixel do topo central da nave.
    MOV R0, local_laser         ; Endereço da variável que guarda o nº do pixel do laser.
    MOV [R0], R1                ; Guarda na variável o pixel na mesma coluna do centro da nave, mas na linha anterior.
    MOV R0, tab_laser           ; Guarda o endereço da variável c/o endereço da tabela da cor do laser.
    MOV R1, tab_objeto          ; Guarda o endereço da variável tab_objeto.
    MOV [R1], R0                ; Escreve o endereço da tabela do laser na variável tab_objeto.
    MOV R0, ecra_laser          ; Guarda o endereço da variável c/o ecrã a desenhar o laser.
    MOV R2, [R0]                ; Cópia do nº do ecrã a desenhar o laser.
    MOV R1, ecra_pixel          ; Guarda o endereço da variável ecra_pixel.
    MOV [R1], R2                ; Escreve o nº do ecrã a desenhar o laser na variável ecrã_pixel.
    MOV R0, local_laser         ; Guarda o endereço da variável c/o nº do pixel do laser.
    MOV R2, [R0]                ; Cópia do nº do pixel do laser.
    MOV R1, local_objeto        ; Guarda o endereço da variável local_objeto.
    MOV [R1], R2                ; Escreve o nº do pixel do laser na variável local_objeto.
    CALL rot_desenha_objeto     ; Desenha o pixel nesse local e nesse ecrã.
    
    MOV R0, energia             ; Guarda o endereço da variável energia.
    MOV R1, [R0]                ; Cópia do valor da energia.
    SUB R1, VALOR_5             ; Subtrai 5 a esse valor.
    MOV [R0], R1                ; Atualiza a variável.
    CALL rot_displays           ; Chama a rotina que mostra o valor da energia nos displays.
    
    POP R2
    POP R1
    POP R0
    RET
    
    
;***********************************************************************************************************************
;* PROCESSO MOVIMENTA LASER:  rotina que apaga o laser e desenha-o na mesma coluna, mas linha superior.                *
;*                                                                                                                     *
;* ARGUMENTOS DE ENTRADA:                                                                                              *
;*                      [local_laser]     - posição do pixel do laser.                                                 *
;*                       [ecra_laser]     - ecrã a desenhar o pixel do laser.                                          *
;*                        [tab_laser]     - tabela c/a cor do laser.                                                   *
;* ARGUMENTOS DE SAÍDA:                                                                                                *
;*                      [local_laser]     - posição do pixel do laser.                                                 *
;***********************************************************************************************************************

rot_move_laser:
    PUSH R0
    PUSH R1
    PUSH R2
    
    MOV R0, tab_laser           ; Guarda o endereço da variável c/o endereço da tabela da cor do laser.
    MOV R1, tab_objeto          ; Guarda o endereço da variável tab_objeto.
    MOV [R1], R0                ; Escreve o endereço da tabela do laser na variável tab_objeto.
    MOV R0, ecra_laser          ; Guarda o endereço da variável c/o ecrã a desenhar o laser.
    MOV R2, [R0]                ; Cópia do nº do ecrã a desenhar o laser.
    MOV R1, ecra_pixel          ; Guarda o endereço da variável ecra_pixel.
    MOV [R1], R2                ; Escreve o nº do ecrã a desenhar o laser na variável ecrã_pixel.
    MOV R0, local_laser         ; Guarda o endereço da variável c/o nº do pixel do laser.
    MOV R2, [R0]                ; Cópia do nº do pixel do laser.
    MOV R1, local_objeto        ; Guarda o endereço da variável local_objeto.
    MOV [R1], R2                ; Escreve o nº do pixel do laser na variável local_objeto.
    CALL rot_apaga_objeto       ; Apaga o pixel nesse local e nesse ecrã.
    
    MOV R0, local_laser         ; Obtém o endereço da variável com o pixel antigo do laser.
    MOV R1, [R0]                ; Cópia do nº do pixel antigo do laser.
    MOV R2, 1                   ; Escreve 2 no registo 2.
    SHL R2, 6                   ; Escreve 64 no registo 2.
    SUB R1, R2                  ; Substrai 64 ao pixel do laser.
    MOV R0, local_laser         ; Endereço da variável que guarda o nº do pixel do laser.
    MOV [R0], R1                ; Guarda na variável o pixel na mesma coluna do centro da nave, mas na linha anterior.
    
    MOV R0, tab_laser           ; Guarda o endereço da variável c/o endereço da tabela da cor do laser.
    MOV R1, tab_objeto          ; Guarda o endereço da variável tab_objeto.
    MOV [R1], R0                ; Escreve o endereço da tabela do laser na variável tab_objeto.
    MOV R0, ecra_laser          ; Guarda o endereço da variável c/o ecrã a desenhar o laser.
    MOV R2, [R0]                ; Cópia do nº do ecrã a desenhar o laser.
    MOV R1, ecra_pixel          ; Guarda o endereço da variável ecra_pixel.
    MOV [R1], R2                ; Escreve o nº do ecrã a desenhar o laser na variável ecrã_pixel.
    MOV R0, local_laser         ; Guarda o endereço da variável c/o nº do pixel do laser.
    MOV R2, [R0]                ; Cópia do nº do pixel do laser.
    MOV R1, local_objeto        ; Guarda o endereço da variável local_objeto.
    MOV [R1], R2                ; Escreve o nº do pixel do laser na variável local_objeto.
    CALL rot_desenha_objeto     ; Desenha o pixel nesse local e nesse ecrã.
    
    POP R2
    POP R1
    POP R0
    RET


;***********************************************************************************************************************
;* ROTINA EXTINGUE LASER:  rotina que apaga o laser do ecrã.                                                           *
;*                                                                                                                     *
;* ARGUMENTOS DE ENTRADA:                                                                                              *
;*                      [local_laser]     - posição do pixel do laser.                                                 *
;*                       [ecra_laser]     - ecrã a desenhar o pixel do laser.                                          *
;*                       [tab_laser]      - tabela c/a cor do laser.                                                   *
;***********************************************************************************************************************

rot_extingue_laser:
    PUSH R0
    PUSH R1
    PUSH R2
    
    MOV R0, tab_laser           ; Guarda o endereço da variável c/o endereço da tabela da cor do laser.
    MOV R1, tab_objeto          ; Guarda o endereço da variável tab_objeto.
    MOV [R1], R0                ; Escreve o endereço da tabela do laser na variável tab_objeto.
    MOV R0, ecra_laser          ; Guarda o endereço da variável c/o ecrã a desenhar o laser.
    MOV R2, [R0]                ; Cópia do nº do ecrã a desenhar o laser.
    MOV R1, ecra_pixel          ; Guarda o endereço da variável ecra_pixel.
    MOV [R1], R2                ; Escreve o nº do ecrã a desenhar o laser na variável ecrã_pixel.
    MOV R0, local_laser         ; Guarda o endereço da variável c/o nº do pixel do laser.
    MOV R2, [R0]                ; Cópia do nº do pixel do laser.
    MOV R1, local_objeto        ; Guarda o endereço da variável local_objeto.
    MOV [R1], R2                ; Escreve o nº do pixel do laser na variável local_objeto.
    CALL rot_apaga_objeto       ; Apaga o pixel nesse local e nesse ecrã.
    

    POP R2
    POP R1
    POP R0
    RET
 

;***********************************************************************************************************************
;* ROTINAS DE ATENDIMENTO A INTERRUPÇÕES                                                                               * 
;***********************************************************************************************************************
    
;***********************************************************************************************************************
;* ROTINA DE INTERRUPCAO 0:   Rotina de atendimento da interrupcão 0.                                                  *
;*                                                                                                                     *
;* ARGUMENTOS DE SAÍDA:                                                                                                *
;*                      [ocorreu_int] - fica a 1, pois ocorreu a interrupcão 0.                                        * 
;***********************************************************************************************************************

rot_int_0:
    PUSH R0
    PUSH R1
    
    MOV R0, ocorreu_int                     ; Guarda o endereço da tabela c/ a info. da ocorrência de interrupções.
    MOV R1, 1                               ; Escreve 1 no registo 1.
    MOV [R0], R1                            ; Altera p/1 a 1ª entrada desta tabela.
    
    POP R1
    POP R0
    RFE
    
    
;***********************************************************************************************************************
;* ROTINA DE INTERRUPCAO 1:   Rotina de atendimento da interrupção 1.                                                  *
;*                                                                                                                     *
;* ARGUMENTOS DE SAÍDA:                                                                                                *
;*                      [ocorreu_int + 2] - fica a 1, pois ocorreu a interrupcão 1.                                    *
;***********************************************************************************************************************

rot_int_1:
    PUSH R0
    PUSH R1
    
    MOV R0, ocorreu_int                     ; Guarda o endereço da tabela c/ a info. da ocorrência de interrupções.
    ADD R0, VALOR_2                         ; Seleciona a 2 entrada desta tabela.
    MOV R1, 1                               ; Escreve 1 no registo 1.
    MOV [R0], R1                            ; Altera p/1 a 2ª entrada desta tabela.
    
    POP R1
    POP R0
    RFE
    
    
;***********************************************************************************************************************
;* ROTINA DE INTERRUPCAO 2:   Rotina de atendimento da interrupcão 2.                                                  *
;*                                                                                                                     *
;* ARGUMENTOS DE SAÍDA:                                                                                                *
;*                      [ocorreu_int + 4] - fica a 1, pois ocorreu a interrupcão 2.                                    * 
;***********************************************************************************************************************

rot_int_2:
    PUSH R0
    PUSH R1
    
    MOV R0, ocorreu_int                    ; Guarda o endereço da tabela c/ a info. da ocorrência de interrupções.     
    ADD R0, VALOR_4                        ; Seleciona a 4 entrada desta tabela.
    MOV R1, 1                              ; Escreve 1 no registo 1.
    MOV [R0], R1                           ; Altera p/1 a 2ª entrada desta tabela.   
    
    POP R1
    POP R0
    RFE














