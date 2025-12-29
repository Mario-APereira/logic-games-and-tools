#Mário Alexandre Pinto Loureiro Viegas Pereira  nº 99107


def cria_posicao(c,l):
    """
    Recebe uma coluna e uma linha do tabuleiro e devolve a posicao cuja e a intersecao da respetiva
     coluna e da respetiva linha. (Representacao[c,l] = {0: c, 1: l)
    :param c: coluna
    :param l: linha
    :return: posicao
    """
    if not (c in ("a","b","c") and l in ("1","2","3")):
        raise ValueError("cria_posicao: argumentos invalidos")
    return {0: c, 1: l}             #formato com dicionarios


def cria_copia_posicao(p):
    """
    Recebe uma posicao e devolve uma copia dessa posicao
    :param p: posicao
    :return: posicao (copia)
    """
    #devolve uma copia da posicao
    return {0: p[0], 1: p[1]}

def obter_pos_c(p):
    """
    Recebe uma posicao e devolve uma string correspondente a coluna da peca introduzida
    :param p:posicao
    :return:coluna (string)
    """
    return p[0]

def obter_pos_l(p):
    """
    Recebe uma posicao e devolve uma string correspondente a linha da peca introduzida
    :param p:posicao
    :return:linha (string)
    """
    return p[1]

def eh_posicao(arg):
    """
    Recebe um argumento universal e devolve True se o argumento corresponde a uma posicao, caso contrario devolve False
    :param arg: universal
    :return: booleano
    """
    return type(arg) == dict and len(arg) == 2 and obter_pos_c(arg) in ("a","b","c")\
           and obter_pos_l(arg) in ("1","2", "3")                                       #verifica se e uma posicao


def posicoes_iguais(p1,p2):
    """
    Recebe duas posicoes e devolve True se forem posicoes iguais, caso contrario devolve False
    :param p1: posicao 1
    :param p2: posicao 2
    :return: booleano
    """
    if eh_posicao(p1) and eh_posicao(p2):
        return obter_pos_c(p1) == obter_pos_c(p2) and obter_pos_l(p1) == obter_pos_l(p2)
    return False                                                                        #verifica se as posicoes sao iguais comparando as


def posicao_para_str(p):
    """
    Recebe uma posicao e devolve a posicao representada em string
    :param p: posicao
    :return: string
    """
    return obter_pos_c(p) + obter_pos_l(p)                  #devolve no formato de string


def ordem_posicoes(conj):           #funcao auxiliar
    """
    funcao auxiliar que recebe um tuplo de posicoes e ordena-as de acordo com a ordem do tabuleiro
    :param conj: tuplo de posicoes
    :return: tuplo de posicoes (ordenadas)
    """
    ordem = (cria_posicao("a","1"), cria_posicao("b","1"), cria_posicao("c","1"), cria_posicao("a","2"),
             cria_posicao("b","2"), cria_posicao("c","2"), cria_posicao("a","3"), cria_posicao("b","3"),
             cria_posicao("c","3"))
    return tuple(filter(lambda x: x in conj, ordem))        #ordena as posicoes de acordo com o tabuleiro atraves de um tuplo com as posicoes


def obter_posicoes_adjacentes(p):
    """
    Recebe uma posicao e devolve as posicoes adjacentes a essa posicao de acordo com o tabuleiro
    :param p: posicao
    :return: tuplo de posicoes
    """
    lados = [obter_pos_c(p) + str(eval(obter_pos_l(p)) + 1), obter_pos_c(p) + str(eval(obter_pos_l(p)) - 1),
          chr(ord(obter_pos_c(p)) - 1) + obter_pos_l(p), chr(ord(obter_pos_c(p)) + 1) + obter_pos_l(p)]
    if posicao_para_str(p) in ("a1","c1","a3","c3"):
        lados += ["b2"]
    elif posicao_para_str(p) == "b2":
        lados = ("a1", "b1", "c1", "a2", "c2", "a3", "b3", "c3")
    res = tuple(filter(lambda x: x in ("a1", "b1", "c1", "a2","b2", "c2", "a3", "b3", "c3"),lados))
    posicoes = tuple(cria_posicao(p[0], p[1]) for p in res)
    return ordem_posicoes(posicoes)                                                 #retorna as posicoes adjacentes a uma posicao por ordem do tabuleiro


def cria_peca(s):
    """
    Recebe uma string correspondente ao identificador do jogador e devolve uma peca (representacao[s] = {0: s})
    :param s:string
    :return: peca (dicionario)
    """
    if not s in ("X","O"," "):
        raise ValueError("cria_peca: argumento invalido")
    return {0: s}         #identificador em dicionario

def cria_copia_peca(j):
    """
    Recebe uma peca e devolve uma copia da peca
    :param j: peca
    :return: peca (copia)
    """
    return {0: j[0]}

def eh_peca(arg):
    """
    Recebe um argumento universal, devolvendo True se corresponder a uma peca e caso contrario devolve False
    :param arg: universal
    :return: booleano
    """
    return type(arg) == dict and len(arg) == 1 and arg[0] in ("X","O"," ")          #verifica se e uma peca

def pecas_iguais(j1,j2):
    """
    Recebe duas pecas, devolvendo True se corresponderem a pecas iguais e False caso contrario
    :param j1: peca 1
    :param j2: peca 2
    :return: booleano
    """
    if eh_peca(j1) and eh_peca(j2):
        return j1[0] == j2[0]
    return False                    #compara as pecas analisando se sao iguais

def peca_para_str(j):
    """
    Recebe uma peca e devolve a representacao da peca em string
    :param j: peca
    :return: peca (string)
    """
    return "["+ j[0] + "]"                      #devolve a peca em formato de string


def peca_para_inteiro(j):
    """
    Recebe uma peca e devolve um inteiro (1 para "X", -1 para "O" e 0 para " ")
    :param j: peca
    :return: inteiro
    """
    if peca_para_str(j) == "[X]":
        return 1
    elif peca_para_str(j) == "[O]":
        return -1
    return 0                                    #devolve o inteiro correspondente a peca introduzida

def inteiro_para_peca(n):       #funcao auxiliar que recebe um inteiro e devolve uma peca
    """
    Funcao auxiliar que recebe um inteiro e devolve uma peca correspondente ao inteiro
    :param n: inteiro
    :return: peca
    """
    if n == 1:
        return cria_peca("X")
    elif n == -1:
        return cria_peca("O")
    return cria_peca(" ")                       #devolve uma peca no formato usado consoante o inteiro introduzido


def cria_tabuleiro():
    """
    Funcao que cria um tabuleiro com todas a pecas vazias nao recebendo qualquer tipo de argumento
    :return: tabuleiro (vazio)
    """
    return {"a1": cria_peca(" "), "b1": cria_peca(" "), "c1": cria_peca(" "), "a2": cria_peca(" "), "b2": cria_peca(" "),
            "c2": cria_peca(" "), "a3": cria_peca(" "), "b3": cria_peca(" "), "c3": cria_peca(" ")}
    #cria um tabuleiro com as pecas vazias
    #identificacao do tabuleiro com dicionarios

def cria_copia_tabuleiro(t):
    """
    Recebe um tabuleiro e devolve uma copia do tabueliro passado como argumento
    :param t: tabuleiro
    :return: tabuleiro (copiado)
    """
    return {"a1": obter_peca(t,cria_posicao("a","1")), "b1": obter_peca(t,cria_posicao("b","1")), "c1": obter_peca(t,cria_posicao("c","1")),
            "a2": obter_peca(t,cria_posicao("a","2")), "b2": obter_peca(t,cria_posicao("b","2")), "c2": obter_peca(t,cria_posicao("c","2")),
            "a3": obter_peca(t,cria_posicao("a","3")), "b3": obter_peca(t,cria_posicao("b","3")), "c3": obter_peca(t,cria_posicao("c","3"))}


def obter_peca(t,p):
    """
    Recebe um tabuleiro e uma posicao e devolve a peca que ocupa a posicao passada como argumento (p)
    :param t: tabuleiro
    :param p: posicao
    :return: peca
    """
    return t[posicao_para_str(p)]               #devolve a peca que esta na posicao introduzida


def obter_vetor(t,s):
    """
    Recbe um tabuleiro e uma string identificando uma linha ou uma coluna e devolve um tuplo com as pecas desse vetor
    :param t: tabuleiro
    :param s: string (coluna ou linha)
    :return: tuplo de pecas
    """
    return tuple(obter_peca(t,p) for p in ("a1", "b1", "c1", "a2", "b2", "c2", "a3", "b3", "c3") if s in p)
    #devolve o vetor de pecas da coluna ou linha introduzida

def coloca_peca(t,j,p):
    """
    Recebe um tabuleiro, uma peca e uma posicao e devolve o tabuleiro com a peca colacada na posicao recebida
    :param t:tabuleiro
    :param j:peca
    :param p:posicao
    :return:tabuleiro (novo)
    """
    t[posicao_para_str(p)] = j
    return t                    #devolve um tabuleiro com a peca colocada na posicao introduzida


def remove_peca(t,p):
    """
    Recebe um tabuleiro e uma posicao e devolve o tabuleiro com a peca da posicao recebida removida
    :param t: tabuleiro
    :param p: posicao
    :return: tabuleiro (novo)
    """
    t[posicao_para_str(p)] = cria_peca(" ")
    return t                                   #devolve um tabuleiro com a peca removida da posicao introduzida


def move_peca(t,p1,p2):
    """
    Recebe um tabuleiro e duas posicoes, devolvendo um novo tabuleiro com a peca da
    primeira posicao removida e colocada na segunda posicao
    :param t: tabuleiro
    :param p1: primeiro posicao
    :param p2: segunda posicao
    :return: tabuleiro (novo)
    """
    peca = obter_peca(t,p1)
    t = remove_peca(t,p1)
    return coloca_peca(t,peca,p2)               #move a peca da posicao p1 para a posicao p2
                                                #atraves das funcoes remove_peca e coloca_peca

def eh_tabuleiro(arg):
    """
    Recebe uma argumento universal e devolve True caso o argumento seja um tabuleiro e False caso contrario
    :param arg: universal
    :return: booleano
    """
    if type(arg) != dict:
        return False                        #verifica os tipos e o comprimento
    if len(arg) != 9:
        return False
    nv,xs,os = 0,0,0
    for i in ("a","b","c"):
        soma = 0
        for p in obter_vetor(arg,i):
            if not eh_peca(p):
                return False
            soma += peca_para_inteiro(p[0])
            if abs(soma) == 3:
                nv += 1
            elif peca_para_str(p) == "[X]":                 #conta as pecas
                xs += 1
            elif peca_para_str(p) == "[O]":
                os += 1
    for i in ("1","2","3"):
        soma = 0
        for p in obter_vetor(arg,i):                        #verifica se ha mais do que um vencedor
            if not eh_peca(p):
                return False
            soma += peca_para_inteiro(p[0])
            if abs(soma) == 3:
                nv += 1
    return nv <= 1 and xs <= 3 and os <=3 and abs(xs-os) <= 1               #verifica se o input corresponde a um tabuleiro


def eh_posicao_livre(t,p):
    """
    Recebe um tabuleiro e uma posicao e devolve True se a posicao recebida for uma
     posicao livre e devolve False caso esteja ocupada
    :param t: tabuleiro
    :param p: posicao
    :return: booleano
    """
    return peca_para_str(obter_peca(t,p)) == "[ ]" and eh_posicao(p)            #verifica se a posicao introduzida esta livre


def tabuleiros_iguais(t1,t2):
    """
    Recebe dois tabuleiros e devolve True se os tabuleiros forem iguais e False caso contrario
    :param t1: tabuleiro 1
    :param t2: tabuleiro 2
    :return: booleano
    """
    if eh_tabuleiro(t1) and eh_tabuleiro(t2) and len(t1) == len(t2):
        return t1["a1"] == t2["a1"] and t1["a2"] == t2["a2"] and t1["a3"] == t2["a3"] and t1["b1"] == t2["b1"] and \
               t1["b2"] == t2["b2"] and t1["b3"] == t2["b3"] and t1["c1"] == t2["c1"] and t1["c2"] == t2["c2"] and \
               t1["c3"] == t2["c3"]
    return False                    #compara os tabuleiro analisando se sao iguais

def tabuleiro_para_str(t):
    """
    Recebe um tabuleiro e devolve a representacao em string do tabuleiro
    :param t: tabuleiro
    :return: cadeia de carateres
    """
    return "   a   b   c\n1 " + peca_para_str(obter_peca(t,cria_posicao("a","1"))) + "-" + peca_para_str(obter_peca(t,cria_posicao("b","1")))+\
    "-" + peca_para_str(obter_peca(t,cria_posicao("c","1"))) + "\n   | \ | / |\n2 " + peca_para_str(obter_peca(t,cria_posicao("a","2"))) + "-" + \
    peca_para_str(obter_peca(t, cria_posicao("b", "2"))) + "-" + peca_para_str(obter_peca(t,cria_posicao("c","2"))) + "\n   | / | \ |\n3 " + \
    peca_para_str(obter_peca(t, cria_posicao("a", "3"))) + "-" + peca_para_str(obter_peca(t, cria_posicao("b", "3"))) + "-" + \
    peca_para_str(obter_peca(t, cria_posicao("c", "3")))
    #devolve o tabuleiro no formato de string, formato que o utilizador visualiza

def tuplo_para_tabuleiro(t):
    """
    Recebe um tuplo com 3 tuplos e devolve um tabuleiro com as pecas definidas pelos
     valores de 1, -1 e 0 dos elementos dos tuplos
    :param t: tuplo
    :return: tabuleiro
    """
    res = {}
    for i in range(0,3):
        for j in range(0,3):
            res[posicao_para_str(cria_posicao(chr(97+j),str(i+1)))] = inteiro_para_peca(t[i][j])
    return res              #devolve um tabuleiro atraves de um tuplo introduzido com 3 tuplos com inteiros (1, -1 e 0)


def obter_ganhador(t):
    """
    Recebe um tabuleiro e devolve a peca do jogador ganhador. Caso nao exista entao devolve a peca vazia
    :param t: tabuleiro
    :return: peca
    """
    for i in ("a","b","c"):
        soma = 0
        for p in obter_vetor(t,i):
            soma += peca_para_inteiro(p)                #verifica se ha algum vencedor nas linhas
            if abs(soma) == 3:
                return p
    for i in ("1","2","3"):
        soma = 0
        for p in obter_vetor(t,i):                      #verifica se ha algum vencedor nas linhas
            soma += peca_para_inteiro(p)
            if abs(soma) == 3:
                return p
    return cria_peca(" ")                               #devolve a peca do jogador vencedor


def posicoes_adjacentes_livres(t,p):                #funcao auxiliar
    """
    funcao auxiliar que recebe um tabuleiro e uma posicao e devolve as posicoes a adjacentes livres da posicao recebida
    :param t:tabuleiro
    :param p:posicao
    :return:tuplo de posicoes
    """
    return tuple(filter(lambda x : eh_posicao_livre(t,x),obter_posicoes_adjacentes(p)))
    #devolve um tuplo com as posicoes adjacentes que estao livres usando um funcional


def obter_posicoes_livres(t):
    """
    Recebe um tabuleiro e devole um tuplo com as posicoes livres do tabuleiro
    :param t: tabuleiro
    :return: tuplo de posicoes
    """
    livres = ()
    for i in ("a","b","c"):                              #verifica todas as posicoes do tabuleiro atraves das linhas
        soma = 0
        for p in range(0,3):
            if peca_para_str(obter_vetor(t,i)[p]) == "[ ]":
                livres += (cria_posicao(i, str(p+1)),)
    return ordem_posicoes(livres)                       #devolve as posicoes livres do tabuleiro


def obter_posicoes_jogador(t,j):
    """
    Recebe um tabuleiro e uma peca e devolve as posicoes do tabuleiro que possuem essa peca
    :param t: tabuleiro
    :param j: peca
    :return: tuplo com as posicoes com a peca j
    """
    posicoes = ()
    for i in ("a", "b", "c"):                               #conta as pecas do jogador introduzido
        soma = 0
        for p in range(0, 3):
            if peca_para_str(obter_vetor(t, i)[p]) == peca_para_str(j):
                posicoes += (cria_posicao(i, str(p + 1)),)
    return ordem_posicoes(posicoes)                         #devolve pela ordem do tabuleiro


def outro_jogador(j):
    """
    Funcao auxiliar que recebe uma peca e devolve a peca do jogador oponente
    :param j: peca
    :return: peca (contraria)
    """
    return inteiro_para_peca(-peca_para_inteiro(j))         #devolve a peca do jogador oposto ao introduzido


def obter_movimento_manual(t,j):
    """
    Recebe um tabuleiro e uma peca e devolve um tuplo com um ou dois elementos correspondendo a uma posicao
    ou a um movimento introduzido introduzidos manualmente pelo jogador
    :param t:tabuleiro
    :param j:peca
    :return:tuplo
    """
    if len(obter_posicoes_jogador(t, j)) < 3:                                       #o jogador tem menos de 3 pecas
        entrada = input("Turno do jogador. Escolha uma posicao: ")
        if not (entrada in ("a1", "b1", "c1", "a2", "b2", "c2", "a3", "b3", "c3")):
            raise ValueError("obter_movimento_manual: escolha invalida")
        posicao = cria_posicao(entrada[0], entrada[1])
        if not (eh_posicao(posicao) and eh_posicao_livre(t,posicao)):
            raise ValueError("obter_movimento_manual: escolha invalida")
        posicao = cria_posicao(entrada[0], entrada[1])
        return (posicao,)                                                           #posicao que vai ser introduzida
    else:
        entrada = input("Turno do jogador. Escolha um movimento: ")
        if not(entrada[0:2] in ("a1", "b1", "c1", "a2", "b2", "c2", "a3", "b3", "c3") and
               entrada[2:4] in ("a1", "b1", "c1", "a2", "b2", "c2", "a3", "b3", "c3") and len(entrada) == 4):
            raise ValueError("obter_movimento_manual: escolha invalida")
        posicao_1 = cria_posicao(entrada[0], entrada[1])
        posicao_2 = cria_posicao(entrada[2], entrada[3])
        bloquadas = tuple(posicoes_adjacentes_livres(t, p) for p in obter_posicoes_jogador(t, j))       #caso as posicoes adjacentes livres estejam todas ocupadas
        if not (bloquadas[0] or bloquadas[1] or bloquadas[2]):
            if not (posicao_1 == posicao_2 and posicao_1 in obter_posicoes_jogador(t,j)):
                raise ValueError("obter_movimento_manual: escolha invalida")
        else:
            if not (eh_posicao(posicao_1) and eh_posicao(posicao_2) and posicao_1 in obter_posicoes_jogador(t,j)
                and posicao_2 in posicoes_adjacentes_livres(t, posicao_1)):
                raise ValueError("obter_movimento_manual: escolha invalida")                #verifica o input
        return (posicao_1, posicao_2)                                        #movimento introduzido no tabuleiro


def vitoria(t,j):
    """
    Recebe um tabuleiro e uma posicao e devolve a posicao livre na qual o computador consegue vencer
    :param t: tabuleiro
    :param j: peca
    :return: posicao
    """
    posicoes = ()
    for i in ("a","b","c"):
        soma = 0
        livre = ""
        for p in range(0, 3):                                           #verifica se ha opurtonidade de vitoria nas colunas
            soma += peca_para_inteiro(obter_vetor(t, i)[p])
            if peca_para_inteiro(obter_vetor(t, i)[p]) == 0:
                livre = cria_posicao(i, str(p + 1))
        if soma == 2 * peca_para_inteiro(j) and livre:
            posicoes += (livre,)
    for i in ("1", "2", "3"):
        soma = 0
        livre = ""
        for p in range(0, 3):                                           #verifica se ha opurtonidades de vitoria nas linhas
            soma += peca_para_inteiro(obter_vetor(t, i)[p])
            if peca_para_inteiro(obter_vetor(t, i)[p]) == 0:
                livre = cria_posicao(chr(97 + p), i)
        if soma == 2 * peca_para_inteiro(j) and livre:
            posicoes += (livre,)
    if ordem_posicoes(posicoes):
        return ordem_posicoes(posicoes)[0]                              #retorna a posicao para alcancar a vitoria


def bloqueio(t,j):
    """
    Recebe um tabuleiro e uma posicao e devolve a posicao livre na qual o computador
     consegue bloquear a vitoria do adversario
    :param t: tabuleiro
    :param j: peca
    :return: posicao
    """
    return vitoria(t,outro_jogador(j))                              #posicao para bloquear a vitoria do oponente


def centro(t):
    """
    Recebe um tabuleiro e devolve a posicao central caso esta esteja vazia
    :param t: tabuleiro
    :return: posicao central
    """
    if eh_posicao_livre(t,cria_posicao("b", "2")):
        return cria_posicao("b", "2")                   #colca na posicao b2 caso esteja vazia

def canto_vazio(t):
    """
    Recebe um tabuleiro e devolve uma posicao correspondente ao primeiro canto vazio do tabuleiro
    :param t: tabuleiro
    :return: posicao (canto)
    """
    cantos_livres = tuple(filter(lambda x : x in obter_posicoes_livres(t),(cria_posicao("a", "1"),
                    cria_posicao("c", "1"),cria_posicao("a", "3"),cria_posicao("c", "3"))))         #verifica os cantos vazios
    if cantos_livres:
        return cantos_livres[0]             #devolve o primeiro canto livre


def lateral_vazia(t):
    """
    Recebe um tabuleiro e devolve uma posicao correspondente a primeira lateral vazia do tabuleiro
    :param t: tabuleiro
    :return: posicao (lateral)
    """
    laterais_livres = tuple(filter(lambda x : x in obter_posicoes_livres(t),(cria_posicao("b", "1"),
                    cria_posicao("a", "2"),cria_posicao("c", "2"),cria_posicao("b", "3"))))     #verifica as laterais vazias
    if laterais_livres:
        return laterais_livres[0]               #devolve a primeira lateral livre


def minimax(t, j, profundidade, seq_movimentos):
    """
    Recebe um tabuleiro, uma peca, uma profundidade e uma sequencia de movimentos devolvendo assim um
     tuplo com a posicao ou o movimento mais eficaz consoante a sequencia de movimentos
    :param t: tabuleiro
    :param j: pecea
    :param profundidade: profundidade da recursao
    :param seq_movimentos: tuplo com os movimentos
    :return: tuplo (posicao ou movimento)
    """
    valor_do_tabuleiro = peca_para_inteiro(obter_ganhador(t))
    if profundidade == 0 or peca_para_str(obter_ganhador(t)) != "[ ]":              #acaba com a profundidade 0 ou se ha um vencedor
        return valor_do_tabuleiro, seq_movimentos
    else:
        melhor_seq_movimentos = seq_movimentos
        melhor_resultado = peca_para_inteiro(outro_jogador(j))                      #inicializa as variavies de melhor resultado e melhor sequencia de movimentos
        for i in obter_posicoes_jogador(t,j):
            for h in obter_posicoes_adjacentes(i):
                if eh_posicao_livre(t,h):
                    novo_movimento = (i, h)
                    novo_tabuleiro = move_peca(cria_copia_tabuleiro(t), i, h)
                    novo_resultado, nova_seq_movimentos = minimax(novo_tabuleiro, outro_jogador(j), profundidade-1, seq_movimentos + novo_movimento)
                    if not (melhor_seq_movimentos) or (peca_para_str(j) == "[X]" and novo_resultado > melhor_resultado) or\
                            (peca_para_str(j) == "[O]" and novo_resultado < melhor_resultado):
                        melhor_resultado, melhor_seq_movimentos = novo_resultado, nova_seq_movimentos
        return melhor_resultado, melhor_seq_movimentos                                                                      #devolve a o melhor resultado possivel nas jogadas a seguir


def obter_movimento_auto(t,j,nivel):
    """
    Recebe um tabuleiro, uma peca e um string correspondendo ao nivel do computador e devolve
     as posicoes e os movimentos executados pelo computador
    :param t: tabuleiro
    :param j: peca
    :param nivel: string (nivel)
    :return: tuplo (jogada do computador)
    """
    pos = ""
    if len(obter_posicoes_jogador(t, j)) < 3:               #fase de colocacao das pecas ate o jogador ter 3 pecas
        if vitoria(t,j):
            pos =  vitoria(t,j)
        elif bloqueio(t,j):
            pos = bloqueio(t,j)
        elif centro(t):
            pos = centro(t)
        elif canto_vazio(t):
            pos = canto_vazio(t)
        elif lateral_vazia(t):
            pos = lateral_vazia(t)
        return (pos,)
    else:
        if nivel == "facil":                                                        #modo facil para a fase de movimento
            posicoes_jogador = obter_posicoes_jogador(t,j)
            posicoes_moviveis = tuple(filter(lambda x: posicoes_adjacentes_livres(t,x),posicoes_jogador))
            if posicoes_moviveis:
                return (posicoes_moviveis[0], posicoes_adjacentes_livres(t, posicoes_moviveis[0])[0])
            return (posicoes_jogador[0],posicoes_jogador[0])
        elif nivel == "normal":                                                     #modo normal para a fase de movimento atraves do minimax (profundidade 1)
            return tuple(minimax(t,j,1,())[1][0:2])
        elif nivel == "dificil":                                                    #modo dificil para a fase de movimento atraves do minimax (profundidade 5)
            res = tuple(minimax(t,j,5,())[1][0:2])
            if res[0] == cria_posicao("b", "1"):
                return (cria_posicao("b", "1"), cria_posicao("c", "1"))
            return res                                                          #retorna o movimento obtido pelo minimax


def moinho(peca,nivel):
    """
    Funcao que recebe uma peca identificando o jogador humando e uma string correspondendo
     ao nivel do computador e devolve um conjunto de strings mostrando o jogo ao utilizador
    :param peca:peca (humano)
    :param nivel: string (nivel/dificuldade)
    :return: cadeia de strings
    """
    if not (peca in ("[X]", "[O]") and nivel in ("facil", "normal", "dificil")):
        raise ValueError("moinho: argumentos invalidos")
    tabuleiro = cria_tabuleiro()
    print("Bem-vindo ao JOGO DO MOINHO. Nivel de dificuldade " + nivel + ".")
    turno = 0
    if peca == "[X]":                                                               #jogador humano com a peca X
        print(tabuleiro_para_str(tabuleiro))
        while peca_para_str(obter_ganhador(tabuleiro)) == "[ ]":
            if turno % 2 == 0:                                                      #alternancia de turnos
                jogador = obter_movimento_manual(tabuleiro, cria_peca("X"))
                if len(jogador) == 1:
                    coloca_peca(tabuleiro, cria_peca("X"), jogador[0])
                    print(tabuleiro_para_str(tabuleiro))
                else:
                    move_peca(tabuleiro,jogador[0], jogador[1])
                    print(tabuleiro_para_str(tabuleiro))
            else:                                                                       #devolve o tabuleiro ao longo das jogadas
                print("Turno do computador (" + nivel + "):")
                computador = obter_movimento_auto(tabuleiro, cria_peca("O"), nivel)
                if len(computador) == 1:
                    coloca_peca(tabuleiro, cria_peca("O"), computador[0])
                    print(tabuleiro_para_str(tabuleiro))
                else:
                    move_peca(tabuleiro,computador[0], computador[1])
                    print(tabuleiro_para_str(tabuleiro))
            turno += 1
    else:                                                                           #jogador humano com a peca O
        print(tabuleiro_para_str(tabuleiro))
        while peca_para_str(obter_ganhador(tabuleiro)) == "[ ]":
            if turno % 2 == 0:                                                      #alternancia de turnos
                print("Turno do computador (" + nivel + "):")
                computador = obter_movimento_auto(tabuleiro, cria_peca("X"), nivel)
                if len(computador) == 1:
                    coloca_peca(tabuleiro, cria_peca("X"), computador[0])
                    print(tabuleiro_para_str(tabuleiro))
                else:
                    move_peca(tabuleiro, computador[0], computador[1])
                    print(tabuleiro_para_str(tabuleiro))
            else:                                                                   #devolve o tabuleiro ao longo das jogadas
                jogador = obter_movimento_manual(tabuleiro, cria_peca("O"))
                if len(jogador) == 1:
                    coloca_peca(tabuleiro, cria_peca("O"), jogador[0])
                    print(tabuleiro_para_str(tabuleiro))
                else:
                    move_peca(tabuleiro, jogador[0], jogador[1])
                    print(tabuleiro_para_str(tabuleiro))
            turno += 1
    return peca_para_str(obter_ganhador(tabuleiro))



