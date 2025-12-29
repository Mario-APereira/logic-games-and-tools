# Mário Alexandre Pinto Loureiro Viegas Pereira, numero:99107

def eh_tabuleiro(uni):
    """
    Recebe um argumento qualquer e verifica se e um tabuleiro (um tuplo com 3 tuplos contendo cada, um valor inteiro entre (-1, 0, 1)).

    :param: uni: universal
    :return: booleano: True ou False (True se for um tabuleiro e False caso contrario)
    """
    x = 0
    if isinstance(uni,tuple) and len(uni) == 3:                                                             #verifica se é um tuplo com 3 tuplos e 3 inteiros
        for i in range(3):                                                                                  #entre (-1,0,1) caso nao seja, da False
            if isinstance(uni[i],tuple) and len(uni[i]) == 3:
                for j in range(3):
                    if uni[i][j] in (-1,0,1) and isinstance(uni[i][j],int) and type(uni[i][j])!= bool:
                        x = 1
                    else:
                        return False
            else:
                return False
    return bool(x)


def eh_posicao(pos):
    """
    Recebe um valor inteiro e verifica se a posicao existe ou nao.

    :param pos: 1 a 9 (inteiro)
    :return: booleano (True se a posicao existir e False caso contrario)
    """
    return pos in (1, 2, 3, 4, 5, 6, 7, 8, 9) and isinstance(pos, int) and type(pos) != bool            #verifica se a posicao corresponde a alguma do tabuleiro

def obter_coluna(tab, nmr):
    """
    Recebe um tabuleiro e um inteiro e devolve a coluna indicada atraves do numero, validando sempre os valores

    :param tab: tabuleiro
    :param nmr: 1 a 3 (inteiro para identificar o numero da coluna)
    :return: vector de 3 inteiros (-1, 0 ou 1)
    """
    if not (eh_tabuleiro(tab) and nmr in (1, 2, 3) and isinstance(nmr, int) and type(nmr)!=bool):       #verifica os valores dados e devolve a coluna pedida
        raise ValueError("obter_coluna: algum dos argumentos e invalido")
    return (tab[0][nmr-1], tab[1][nmr-1], tab[2][nmr-1])


def obter_linha(tab, nmr):
    """
    Recebe um tabuleiro e um inteiro e devolve a linha indicada atraves do numero, validadno sempre os valores
    :param tab: tabuleiro
    :param nmr: 1 a 3 (inteiro para identificar a linha)
    :return: vector de 3 inteiros (-1, 0 ou 1)
    """
    if not (eh_tabuleiro(tab) and nmr in (1, 2, 3) and isinstance(nmr, int) and type(nmr)!=bool):       #verifica os valores dados e devolve a linha pedida
        raise ValueError("obter_linha: algum dos argumentos e invalido")
    return tab[nmr-1]


def obter_diagonal(tab, nmr):
    """
    Recebe um tabuleiro e um numero inteiro o qual identifica
    a diagonal cujos elementos vao ser devolvidos num vector

    :param tab: tabuleiro
    :param nmr: 1 ou 2 (1 diagonal que contem as posicoes 1,5 e 9 e 2 a diagonal que contem as posicoes 3,5 e 7)
    :return: vector de 3 inteiros (-1, 0 ou 1)
    """
    if not (eh_tabuleiro(tab) and nmr in (1, 2) and isinstance(nmr, int) and type(nmr)!=bool):          #verifica os valores dados e devolve a  pedida
        raise ValueError("obter_diagonal: algum dos argumentos e invalido")
    if nmr == 1:
        res = (tab[0][0], tab[1][1], tab[2][2])
    else:
        res = (tab[2][0], tab[1][1], tab[0][2])
    return res


def cria_lista(tab):                    #funcao auxiliar que cria uma lista com todos os valores
                                        # do tuplo por ordem das posicoes do tabuleiro
    """
    Recebe um tabuleiro e devolve uma lista com os
    elementos das posicoes do tabuleiro por ordem crescente
    
    :param tab: tabuleiro
    :return: lista
    """
    l = []
    for i in range(len(tab)):
        for j in range(len(tab[i])):
            l += [tab[i][j]]
    return l


def tabuleiro_str(tab):
    """
    Recebe um tabuleiro e devolve a cadeia de caracteres que representa o tabuleiro externamente

    :param tab: tabuleiro
    :return: representacao do tabuleiro
    """
    if not eh_tabuleiro(tab):                                                   #verifica os valores fornecidos
        raise ValueError("tabuleiro_str: o argumento e invalido")
    l = cria_lista(tab)
    for i in range(len(l)):
        if l[i] == 1:
            l[i] = "X"
        elif l[i] == -1:
            l[i] = "O"
        else:
            l[i] = " "
    return " "+l[0]+" | "+l[1]+" | "+l[2]+" \n-----------\n "+l[3]+" | "+l[4]+" | "+l[5]+\
           " \n-----------\n "+l[6]+" | "+l[7]+" | "+l[8]+" "                               #devolve a representacao do tabuleiro


def eh_posicao_livre(tab,pos):
    """
    Recebe um tabuleiro e uma posicao do tabuleiro e retorna True se essa
    posicao estiver livre ou False se a posicao estiver ocupada

    :param tab: tabuleiro
    :param pos: posicao (1 a 9)
    :return: booleano
    """
    if not (eh_tabuleiro(tab) and eh_posicao(pos)):                                #verifica se a posicao fornecida esta livre ou nao
        raise ValueError("eh_posicao_livre: algum dos argumentos e invalido")
    l = cria_lista(tab)
    return not(bool(l[pos-1]))


def obter_posicoes_livres(tab):
    """
    Recebe um tabuleiro e devolve um vector com todas as posicoes livres do tabuleiro

    :param tab: tabuleiro
    :return: vector
    """
    if not eh_tabuleiro(tab):                                               #verifica os valores
        raise ValueError("obter_posicoes_livres: o argumento e invalido")
    l = cria_lista(tab)
    p_livres = ()                                                           #cria um tuplo com as posicoes livres do tabuleiro
    for i in range(len(l)):
        if l[i] == 0 :
            p_livres += (i+1,)
    return p_livres

def soma_vector(vet):                                       #funcao auxiliar que calcula a soma dos elementos
                                                            # de um vector
    """
    Recebe um vector e calcula a soma de todos os seus elementos

    :param vet: vector
    :return: inteiro
    """
    soma = 0
    for i in vet:
        soma += i
    return soma


def jogador_ganhador(tab):
    """
    Recebe um tabuleiro e retorna um inteiro que identifica qual o jogador que
    ganhou ou se terminou em empate.

    Retorna 1 se o jogador ganhador tinha a marca "X", -1 se o jogador ganhador tinha a
    marca "O" ou 0 se o jogo terminou em empate

    :param tab: tabuleiro
    :return: inteiro
    """
    if not eh_tabuleiro(tab):                                               #verifica os valoes
        raise ValueError("jogador_ganhador: o argumento e invalido")
    for i in range(1,4):                                                    #verifica se alguma linha/coluna/diagonal esta totalmente preenchida
        for j in range(1,3):
            if 3 in (soma_vector(obter_diagonal(tab, j)), soma_vector(obter_coluna(tab, i)), soma_vector(obter_linha(tab, i))):
                return 1
            elif -3 in (soma_vector(obter_diagonal(tab, j)), soma_vector(obter_coluna(tab, i)), soma_vector(obter_linha(tab, i))):
                return -1
    else:
        return 0



def marcar_posicao(tab, vlr, pos):
    """
    Marca a posicao do jogador que jogou, devolvendo um tabuleiro com o vlr marcado na posicao recebida

    Recebe um tabuleiro, um valor (1 ou -1) e uma posicao do tabuleiro e devolve um novo tabuleiro com a
    marca do jogador ou do computador na posicao definida caso esta estejas vazia

    :param tab: tabuleiro
    :param vlr: valor do jogador (1 ou -1)
    :param pos: posicao (1 a 9)
    :return: um novo tabuleiro com o valor marcado marcado na posicao indicada
    """
    if not (eh_tabuleiro(tab) and vlr in (1,-1) and isinstance(vlr,int) and type(vlr)!=bool and eh_posicao(pos)):      #verifica os valores
        raise ValueError("marcar_posicao: algum dos argumentos e invalido")
    l = cria_lista(tab)
    if l[pos-1] != 0:
        raise ValueError("marcar_posicao: algum dos argumentos e invalido")
    l[pos-1] = vlr
    return ((l[0], l[1], l[2]), (l[3], l[4], l[5]), (l[6], l[7], l[8]))                 #um novo tuplo com a nova posicao marcada


def escolher_posicao_manual(tab):
    """
    Recebe um tabuleiro e devolve uma posicao introduzida pelo jogador

    :param tab: tabuleiro
    :return: posicao introduzida pelo utilizador
    """
    if not eh_tabuleiro(tab):                                                       #verifica valores
        raise ValueError("escolher_posicao_manual: o argumento e invalido")
    l,p_livres = cria_lista(tab),()
    for i in range(len(l)):
        if l[i] == 0:
            p_livres += (i+1,)
    pos = int(input("Turno do jogador. Escolha uma posicao livre: "))                   #introduz uma posicao
    if pos not in p_livres:
        raise ValueError("escolher_posicao_manual: a posicao introduzida e invalida")       #verifica se a posicao esta lirve
    return pos


def vitoria(tab,vlr):
    """
    Recebe um tabuleiro e um valor e caso alguma linha possua duas das suas peças e uma
    posicao livre entao vai devolver essa posicao livre a qual vai introduzir esse valor

    :param tab: tabuleiro
    :param vlr: inteiro (1 ou -1)
    :return: posicao
    """
    pos,sol = 1,()                                                               #verifica se alguma linha ou coluna tem duas pecas e se tiver, incrementa
    for i in range(1,4):                                                                #a posicao que quando marcada origina a vitoria, ao tuplo sol
        for j in range(1,4):
            if (soma_vector(obter_linha(tab,i)) == 2*vlr or
                soma_vector(obter_coluna(tab,j))==2*vlr) and eh_posicao_livre(tab,pos):
                sol += (pos,)
            pos += 1
    for p1 in (1,5,9):                                                                  #verifica se as diagonais verificam a condicao e caso aconteca incrementa
        if eh_posicao_livre(tab,p1) and soma_vector(obter_diagonal(tab,1))== 2*vlr:     #a posicao ao tuplo sol
            sol += (p1,)
    for p2 in (3,5,7):
        if eh_posicao_livre(tab,p2) and soma_vector((obter_diagonal(tab,2)))==2*vlr:
            sol += (p2,)
    if len(sol) >= 1:                                                                   #devolve a posicao de ordem menor que verifica a condicao da vitoria
        min = sol[0]
        for k in range(len(sol)):
            if sol[k] < min:
                min = sol[k]
        return min
    else:
        return None


def bloqueio(tab,vlr):
    """
    Recebe um tabuleiro e um valor a introduzir na posicao obtida caso se em uma linha haja duas peças adversarias
    e um posicao livre

    :param tab: tabuleiro
    :param vlr: inteiro (1 ou -1)
    :return: posicao
    """
    return vitoria(tab,-vlr)                #devolve a posicao para bloquear a condicao da vitoria


def solucoes_bifurcacao(tab,vlr):
    """
    Recebe um tabuleiro e um valor e devolve um vector com todas as posicoes de
    possiveis bifurcacoes do jogador a jogar com o valor dado

    :param tab: tabuleiro
    :param vlr: inteiro (1 ou -1)
    :return: vector com posicoes possiveis de bifurcacao
    """
    pos, sol = 1, ()                                                            #verfica as possiveis bifurcacoes em colunas e linhas
    for i in range(1, 4):
        for j in range(1, 4):
            if soma_vector(obter_linha(tab, i)) == vlr and\
                soma_vector(obter_coluna(tab, j)) == vlr and eh_posicao_livre(tab, pos):
                sol += (pos,)
            pos += 1
    for p1 in (1, 5, 9):                                                                                        #verifica bifurcacoes entre diagonal 1 e linha/coluna
        for k in range(1, 4):
            if eh_posicao_livre(tab, p1) and soma_vector(obter_diagonal(tab, 1)) == vlr and soma_vector(
                    obter_linha(tab, k)) == vlr and p1 in (1+3*(k-1),2+3*(k-1),3+3*(k-1)):
                sol += (p1,)
            elif eh_posicao_livre(tab, p1) and soma_vector(obter_diagonal(tab, 1)) == vlr and soma_vector(
                    obter_coluna(tab, k)) == vlr and p1 in (1*k,3+1*k,6+1*k):
                sol += (p1,)
    for p2 in (3, 5, 7):                                                                                        #verifica bifurcacoes entre diagonal 2 e linha/coluna
        for k in range(1, 4):
            if eh_posicao_livre(tab, p2) and soma_vector(obter_diagonal(tab, 2)) == vlr and soma_vector(
                    obter_linha(tab, k)) == vlr and p2 in (1+3*(k-1),2+3*(k-1),3+3*(k-1)):
                sol += (p2,)
            elif eh_posicao_livre(tab, p2) and soma_vector(obter_diagonal(tab, 2)) == vlr and soma_vector(
                    obter_coluna(tab, k)) == vlr and p2 in (1*k,3+1*k,6+1*k):
                sol += (p2,)
    if eh_posicao_livre(tab,5) and soma_vector(obter_diagonal(tab,1)) == vlr and soma_vector(obter_diagonal(tab,2)) == vlr:
        sol += (5,)
    return sol                                                                                                  #devolve todas as possiveis birfurcacoes


def bifurcacao(tab,vlr):
    """
    Recebe um tabuleiro e um valor e devolve uma posicao a fim de criar uma bifurcacao criando duas formas de vencer

    :param tab: tabuleiro
    :param vlr: inteiro
    :return: posicao
    """
    sol = solucoes_bifurcacao(tab,vlr)
    if len(sol) >= 1:                                                               #devolve a posicao de possivel bifurcacao de menor ordem
        min = sol[0]
        for k in range(len(sol)):
            if sol[k] < min:
                min = sol[k]
        return min
    else:
        return None


def bloqueio_bifurcacao(tab,vlr):
    """
    Recebe um tabuleiro e um valor a introduzir numa posicao que poderia ser alguma eventual bifurcacao e caso nao se
     consiga, entao obriga o adversario a jogar numa posicao nao favoravel, impedindo de conseguir a bifurcacao

    :param tab: tabuleiro
    :param vlr: inteiro
    :return: posicao
    """
    sol = solucoes_bifurcacao(tab,-vlr)
    if len(sol) == 1:                                                                                                   #se houver apenas uma possivel bifurcacao entao bloqueia essa posicao
        return sol[0]
    elif sol == ():
        return None
    else:
        sol_bloq = ()
        for i in range(1, 4):                                                                                           #verifica os bloqueios de bifurcacao nas linhas
            for j in range(0,3):
                if soma_vector(obter_linha(tab,i)) == vlr and obter_linha(tab,i)[j] == 0:
                    ntab = marcar_posicao(tab,vlr,(j+1)+(i-1)*3)
                    for k in range(0,3):
                        if obter_linha(ntab,i)[k] == 0 and not ((k+1+(i-1)*3) in solucoes_bifurcacao(ntab,-vlr)):
                            sol_bloq += ((j+1)+(i-1)*3,)
        for i in range(1, 4):                                                                                           #verifica os bloqueios de bifurcacao nas linhas
            for j in range(0,3):
                if soma_vector(obter_coluna(tab,i)) == vlr and obter_coluna(tab,i)[j] == 0:
                    ntab = marcar_posicao(tab,vlr,i+(j*3))
                    for k in range(0,3):
                        if obter_linha(ntab,i)[k] == 0 and not ((i+k*3) in solucoes_bifurcacao(ntab,-vlr)):
                            sol_bloq += (i+j*3,)
        for i in (1,5,9):                                                                                               #verifica os bloqueios de bifurcacao na diagonal 1
            if eh_posicao_livre(tab,i) and soma_vector(obter_diagonal(tab,1)) == vlr:
                ntab = marcar_posicao(tab,vlr,i)
                for j in (1,5,9):
                    if eh_posicao_livre(tab,j) and not (j in solucoes_bifurcacao(tab,-vlr)):
                        sol_bloq += (1 + 4 * j,)
        for i in (3,5,7):                                                                                               #verifica os bloqueios de bifurcacao na diagonal
            if eh_posicao_livre(tab,i) and soma_vector(obter_diagonal(tab,2)) == vlr:
                ntab = marcar_posicao(tab,vlr,i)
                for j in (3,5,7):
                    if eh_posicao_livre(tab,j) and not (j in solucoes_bifurcacao(tab,-vlr)):
                        sol_bloq += (3 + 4 * j,)                                                                                                           #devolve a posicao de bloqueio de bifurcacao de menor ordem
        min = sol_bloq[0]
        for k in range(len(sol_bloq)):
            if sol_bloq[k] < min:
                min = sol_bloq[k]
        return min


def centro(tab):
    """
    Recebe um tabuleiro e se a posicao 5 (centro) estiver livre entao joga nessa posicao

    :param tab: tabuleiro
    :return: posicao
    """
    if eh_posicao_livre(tab,5):                                         #se a posicao 5 esta livre, joga nessa posicao
        return 5


def canto_oposto(tab,vlr):
    """
    Recebe um tabuleiro e um valor e caso um canto possua uma um peça adversaria e o
    canto oposto estiver livre entao joga nessa posicao

    :param tab: tabuleiro
    :param vlr: inteiro
    :return: posicao
    """
    l = cria_lista(tab)
    if eh_posicao_livre(tab,1) and l[8] ==(-vlr):                   #se um canto esta com um peça do adversario e o canto
        return 1                                                    #oposto esta livre entao devolve essa posicao
    elif eh_posicao_livre(tab,3) and l[6]== (-vlr):
        return 3
    elif l[2]==(-vlr) and eh_posicao_livre(tab,7):
        return 7
    elif l[0]==(-vlr) and eh_posicao_livre(tab,9):
        return 9


def canto_vazio(tab):
    """
    Recebe um tabuleiro e se algum canto estiver vazio entao joga nessa posicao

    :param tab: tabuleiro
    :return: posicao
    """
    for i in (1,3,7,9):                                             #devolve o canto vazio de menor ordem
        if eh_posicao_livre(tab,i):
            return i


def lateral_vazio(tab):
    """
    Recebe um tabuleiro e caso alguma lateral esteja vazia entao joga nessa posicao
    :param tab: tabuleiro
    :return: posicao
    """
    for i in (2,4,6,8):                                     #devolve a lateral vazia de menor ordem
        if eh_posicao_livre(tab,i):
            return i

def escolher_posicao_auto(tab,vlr,est):
    """
    Recebe um tabuleiro, um valor e uma estrategia e retorna uma posicao escolhida automatica pelo computador.

    A partir do tabuleiro e da estrategia fornecidas vai ser devolvida uma posicao que vai ser jogada
    com o valor 1 ou -1 consoante o jogador a jogar

    :param tab: tabuleiro
    :param vlr: inteiro
    :param est: estrategia de jogo
    :return:
    """
    if not (eh_tabuleiro(tab) and vlr in (1,-1) and type(vlr)!=bool and isinstance(vlr,int) and est in ("basico","normal","perfeito")):
        raise ValueError("escolher_posicao_auto: algum dos argumentos e invalido")
    p_final = 0
    if est == "basico":                                                 #estrategias para o modo basico
        if centro(tab):
            p_final = centro(tab)
        elif canto_vazio(tab):
            p_final = canto_vazio(tab)
        elif lateral_vazio(tab):
            p_final = lateral_vazio(tab)
    elif est == "normal":                                               #estrategias para o modo normal
        if vitoria(tab,vlr):
            p_final = vitoria(tab,vlr)
        elif bloqueio(tab,vlr):
            p_final = bloqueio(tab,vlr)
        elif centro(tab):
            p_final = centro(tab)
        elif canto_oposto(tab,vlr):
            p_final = canto_oposto(tab,vlr)
        elif canto_vazio(tab):
            p_final = canto_vazio(tab)
        elif lateral_vazio(tab):
            p_final = lateral_vazio(tab)
    elif est == "perfeito":                                             #estrategias para o modo perfeito
        if vitoria(tab,vlr):
            p_final = vitoria(tab,vlr)
        elif bloqueio(tab,vlr):
            p_final = bloqueio(tab,vlr)
        elif bifurcacao(tab,vlr):
            p_final = bifurcacao(tab,vlr)
        elif bloqueio_bifurcacao(tab,vlr):
            p_final = bloqueio_bifurcacao(tab,vlr)
        elif centro(tab):
            p_final = centro(tab)
        elif canto_oposto(tab,vlr):
            p_final = canto_oposto(tab,vlr)
        elif canto_vazio(tab):
            p_final = canto_vazio(tab)
        elif lateral_vazio(tab):
            p_final = lateral_vazio(tab)
    return p_final


def jogo_do_galo(marca,est):
    """
    Recebe a marca do jogador ("X" ou "O") e a estrategia usada pela computador e vai devolver as
    representacoes das jogadas e a marca do vencedor do jogo () ou em caso de empate devolve "EMPATE"

    :param marca: marca do jogador
    :param est: estrategia de jogo
    :return: cadeia de caracteres representando o jogo a ser jogado
    """
    if not marca in ("X", "O") and not est in ("basico","normal","perfeito"):           #verifica os valores
        raise ValueError("jogo_do_galo: algum dos argumentos e invalido")
    tab = ((0, 0, 0), (0, 0, 0), (0, 0, 0))
    print("Bem-vindo ao JOGO DO GALO.\nO jogador joga com '"+marca+"'.")
    if marca == "O":                                                                    #o jogador joga com a marca "O"
        while jogador_ganhador(tab) == 0:
            if obter_posicoes_livres(tab) == ():
                return "EMPATE"
            elif len(obter_posicoes_livres(tab)) % 2 ==1:
                print("Turno do computador ("+est+"):")
                tab = marcar_posicao(tab,1,escolher_posicao_auto(tab,1,est))
                print(tabuleiro_str(tab))
            else:
                tab = marcar_posicao(tab, -1, escolher_posicao_manual(tab))
                print(tabuleiro_str(tab))
        if jogador_ganhador(tab) == 1:                                                  #devolve o vencedor
            return "X"
        elif jogador_ganhador(tab) == -1:
            return "O"

    else:                                                                               #o jogador joga com a marca "X"
        while jogador_ganhador(tab) == 0:
            if obter_posicoes_livres(tab) == ():
                return "EMPATE"
            elif len(obter_posicoes_livres(tab)) % 2 ==0:
                print("Turno do computador ("+est+"):")
                tab = marcar_posicao(tab,-1,escolher_posicao_auto(tab,-1,est))
                print(tabuleiro_str(tab))
            else:
                tab = marcar_posicao(tab, 1, escolher_posicao_manual(tab))
                print(tabuleiro_str(tab))
        if jogador_ganhador(tab) == 1:                                                  #devolve o vencedor
            return "X"
        elif jogador_ganhador(tab) == -1:
            return "O"

jogo_do_galo("X", "perfeito")