/*
* File : proj1.c
* Author:  Mário Pereira 
* Description: A Kanban task manager produced in C, able to connect
people with activities and tasks for a better work planning.
*/
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>

/* maximums of all arrays*/
#define MAX_ID 10000
#define MAX_50 50
#define MAX_ATIV 10
#define MAX_20 20

/****error warnings****/
#define NO_S_ATIV "no such activity"
#define TASK_AL_STARTED "task already started"
#define USER_ALREADY_EXIST "user already exists"
#define TOO_M_USERS "too many users"
#define TOO_M_ACT "too many activities"
#define T_M_TASKS "too many tasks"
#define DUP_DESC "duplicate description"
#define DUP_ACT "duplicate activity"
#define INV_DURATION "invalid duration"
#define INV_DESC "invalid description"
#define NO_S_TASK "no such task"
#define NO_S_USER "no such user"
#define INV_TIME "invalid time"


/*Quicksort*/
#define exch(A, B) { int t = A; A = B; B = t; }

/*print out words*/
#define TASK "task"
#define TO_DO "TO DO"
#define IN_PROG "IN PROGRESS"
#define DONE "DONE"
#define TRUE 1
#define FALSE 0
#define DURATION "duration="
#define SLACK "slack="


/*********************************MAIN*CODE*********************************/

/* definition of structure "tarefa". A tarefa has description, ID,
 user, duration, activity and initial time*/
typedef struct {
    int id, duracao, tempo_ini;
    char desc[MAX_50 + 1], user[MAX_20 + 1], ativ[MAX_20 + 1];
} tarefa;


/*   *****global variables*****
*id: current id of a task about being created
*tempo: global time of system
*n_users: number of users
*n_atives: number of activities of the system
*users(array): array that contains the name of all users
*activities(array): contains all activities name
*task(array): contains all tasks already created
*/
int id = 1, tempo = 0, n_users = 0, n_atives = 3;
char users[MAX_50][MAX_20 + 1], 
activities[MAX_ATIV][MAX_20 + 1] = {TO_DO, IN_PROG, DONE};
tarefa task[MAX_ID];


/* create a new task and adds it to the global array of tasks, verifying possible errors from input*/
void new_tarefa(void){
    int i, erro = 0; /*erro: variable to verify if such description exists*/
    for (i = 0; i < id - 1; i++){
        if (strcmp(task[id - 1].desc, task[i].desc) == 0){
            erro = 1;
        }
    }
    if (id > MAX_ID){
        printf("%s\n", T_M_TASKS);
    }
    else if (erro == 1){
        printf("%s\n", DUP_DESC);
    }
    else if (task[id - 1].duracao <= 0){
        printf("%s\n", INV_DURATION);
    }
    else{
        strcpy(task[id - 1].ativ, TO_DO);
        task[id - 1].tempo_ini = 0;
        task[id - 1].id = id;
        printf("%s %d\n", TASK, id);
        id++;
    }
}
/*Receive an ID and return TRUE if it exists or FALSE if does not*/
int such_task(int identif){
    int i, erro = 1; 
    for (i = 1; i < id; i++){
        if (identif == i){
            erro = 0;
        }
    }
    if (erro == 0){
        return TRUE;
    }
    else{
        return FALSE;
    }
}
/*Receive one user name and check whether or not there is such user */
int such_user(char user[]){
    int i, erro = 1;
    for (i = 0; i < n_users; i++){
        if (strcmp(user, users[i]) == 0){
            erro = 0;
        }
    }
    if (erro == 0){
        return TRUE;
    }
    else{
        return FALSE;
    }
}
/*Receive an activity and check if such activity exists*/
int such_ativ(char ativ[]){
    int i, erro = 1;
    for (i = 0; i < n_atives; i++){
        if (strcmp(ativ, activities[i]) == 0){
            erro = 0;
        }
    }
    if (erro == 0){
        return TRUE;
    }
    else{
        return FALSE;
    }
}

/*function that adds time to the global time of the system*/
int time_f(int duracao){
    if (duracao == 0){
        return tempo;
    }
    else{
        tempo += duracao;
        return tempo;
    }
}

/*Create a new user to system useres, after checking any sort of error*/
void new_user(char user[]){
    if (such_user(user) == TRUE){
        printf("%s\n", USER_ALREADY_EXIST);
    }
    else if (n_users == 50){
        printf("%s\n", TOO_M_USERS);
    }
    else{
        strcpy(users[n_users], user);
        n_users++;
    }
}

/*helps quicksort, doing partition of the array and ordering descriptions alphabetically*/
void partition_alpha(tarefa a[], int l, int r){
    tarefa pivot = a[(l + r)/2]; /*pivot of the array, middle value*/
    int i = l; /*left limit*/
    int j = r; /*right limit*/
    strcpy(pivot.desc, task[pivot.id - 1].desc);
    while(i <= j){
        while((strcmp(task[a[i].id - 1].desc, pivot.desc) < 0) && (i < r)){
            i++;
        }
        while((strcmp(task[a[j].id - 1].desc, pivot.desc) > 0) && (j > l)){
            j--;
        }
        if(i <= j){
            exch(a[i].id, a[j].id);
            i++;
            j--;
        }
    }
    if(l < j){
        partition_alpha(a, l, j);
    }
    if(i < r){
        partition_alpha(a, i, r);
    }
}

/*function that conduct partition alpha*/
void quicksort_alpha(tarefa a[], int left, int right){
    partition_alpha(a, left, right);
}

/*read all elements of the array and separate them if they have the same initial time*/
void alpha_order_d(tarefa a[], int elem){
    int i = 1, reps = 0, time_aux;
    time_aux = a[0].tempo_ini;
    while (i < elem){
        if (a[i].tempo_ini == time_aux){
            reps++;
            i++;
            if (reps > 0 && i == elem){
                quicksort_alpha(a, i - reps - 1, i - 1);
            }
        }
        else if (reps == 0){
            time_aux = a[i].tempo_ini;
            i++;
        }
        else{
            quicksort_alpha(a, i - reps - 1, i - 1);
            reps = 0;
        }
    }
    for (i = 0; i < elem; i++){
        printf("%d %d %s\n", a[i].id , a[i].tempo_ini, task[a[i].id - 1].desc);
    }
}

/*assistant fuction of quicksort_d*/
int partition(tarefa a[], int l, int r){
    int i = l - 1, p;
    tarefa pivot;
    pivot.tempo_ini = a[r].tempo_ini;
    pivot.id = a[r].id;
    for (p = l; p < r; p++){
        if (a[p].tempo_ini < pivot.tempo_ini){
            i++;
            exch(a[i].id, a[p].id);
            exch(a[i].tempo_ini, a[p].tempo_ini);
        }
    }
    exch(a[i + 1].id, a[r].id);
    exch(a[i + 1].tempo_ini, a[r].tempo_ini);
    return i + 1;
}

/*function that sort all tasks by their initial time*/
void quicksort_d(tarefa a[], int left, int right){
    int i;
    if (right <= left) return;
    i = partition(a, left, right);
    quicksort_d(a, left, i-1);
    quicksort_d(a, i + 1, right);
}

/*Groups all tasks with activity "ativ"*/
void activities_tasks(char ativ[]){
    int i, elem = 0; /*elem: number of elements in ativ*/
    tarefa tasks_ativ[MAX_ID]; /*new tarefa with info from tasks with activity "ativ"*/
    for (i = 0; i < id - 1; i++){
        if (strcmp(task[i].ativ, ativ) == 0){
            /*Adds activities to "tasks_ativ"*/
            tasks_ativ[elem].id = task[i].id;
            tasks_ativ[elem].tempo_ini = task[i].tempo_ini;
            elem++;
        }
    }
    quicksort_d(tasks_ativ, 0, elem - 1);
    alpha_order_d(tasks_ativ, elem);
}

/*Auxiliary function of m command that manages activity and user
 of a received task. If it is moved to "DONE" prints out duration time and slack one*/
void move(int ident, char util[], char ativ[]){
    int to_do, done;
    to_do = strcmp(task[ident - 1].ativ, TO_DO); /*if activity is "TO DO"*/
    done = strcmp(ativ, DONE);  /*if new activity is moved to "DONE"*/
    strcpy(task[ident - 1].user, util);
    if (to_do == 0){
        task[ident - 1].tempo_ini = tempo;
    }
    if (done == 0 && strcmp(task[ident - 1].ativ, DONE) != 0){
        int gasto = tempo - task[ident - 1].tempo_ini;
        strcpy(task[ident - 1].ativ, DONE);
        printf("%s%d %s%d\n", DURATION, gasto,
        SLACK, gasto - task[ident - 1].duracao);
    }
    else{
        strcpy(task[ident - 1].ativ, ativ);
    }
}
/*Verify all irregularities of the "m" command*/
void erros_move(int ident, char util[], char ativ[]){
    if (such_task(ident) == FALSE){
        printf("%s\n", NO_S_TASK);
    }
    else if (strcmp(ativ, TO_DO) == 0 && strcmp(task[ident - 1].ativ, TO_DO) != 0){
        printf("%s\n", TASK_AL_STARTED);
    }
    else if (such_user(util) == FALSE){
        printf("%s\n", NO_S_USER);
    }
    else if (such_ativ(ativ) == FALSE){
        printf("%s\n", NO_S_ATIV);
    }
    else{
        move(ident, util, ativ);
    }
}

/*Auxiliary function of "l" command that prints ,through alphabetic order, all tasks of the system*/
void quicksort_alpha_l(tarefa aux[], int l, int r){
    partition_alpha(aux, l, r);
}

/*sort alphabetically all tasks called by "l" command*/
void ordem_l_alfabetica(void){
    tarefa aux[MAX_ID + 1]; /*new tarefa to order alphabetically*/
    int i;
    for (i = 0; i < id - 1; i++){
        aux[i].id = task[i].id;
    }
    quicksort_alpha_l(aux, 0, i - 1);
    for (i = 0; i < id - 1; i++){
        printf("%d %s #%d %s\n", aux[i].id, task[aux[i].id - 1].ativ,
        task[aux[i].id - 1].duracao, task[aux[i].id - 1].desc);
    }
}

/*Funcion that prints ID, activity and description of all tasks
insertedon "l" command*/
void ordem_l(int vect[], int max){
    int i = 0;
    for (i = 0; i < max; i++){
        if (such_task(vect[i]) == FALSE){
            printf("%d: %s\n", vect[i], NO_S_TASK);
        }
        else{
            printf("%d %s #%d %s\n", task[vect[i] - 1].id, task[vect[i]
             - 1].ativ, task[vect[i] - 1].duracao, task[vect[i] - 1].desc);
        }
    }
}
/*Function that checks any kind of error from "a" command input*/
void erros_a(int rep_desc, int erro, char ativ[]){
    if (rep_desc == 1){
        printf("%s\n", DUP_ACT);
    }
    else if (erro == 1){
        printf("%s\n", INV_DESC);
    }
    else if (n_atives == MAX_ATIV){
        printf("%s\n", TOO_M_ACT);
    }
    else{
        strcpy(activities[n_atives], ativ);
        n_atives++;
    }
}
/*Helps to verify errors from "a" command input */
void adds_a(char ativ[], int len){
    int i, rep_desc = 0, erro = 0;
    for (i = 0; i < n_atives; i++){
        if (strcmp(activities[i], ativ) == 0){
            rep_desc = 1;
        }
    }
    for (i = 0; i < len; i++){
        if (islower(ativ[i])){
            erro = 1;
        }
    }
    erros_a(rep_desc, erro, ativ);
}
/*Gets input of "t" command*/
void reconhece_t(void){
    char caract;
    int len = 0;
    scanf("%d", &task[id - 1].duracao);
    caract = getchar();
    while (caract == ' ' || caract == '\t'){
        caract = getchar();
    }
    while (caract != '\n' && len < MAX_50){
        task[id - 1].desc[len] = caract;
        caract = getchar();
        len++;
    }
    task[id - 1].desc[len] = '\0';
    if (caract != '\n'){
        while ((caract = getchar()) != '\n');
    }
    new_tarefa();
}

/*Gets input of "l" command. Takes care if "l" receive IDs or does not*/
void reconhece_l(void){
    char caract;
    caract = getchar();
    if (caract == '\n'){
        ordem_l_alfabetica();
    }
    else{   /*if l receive more arguments*/
        int vect[MAX_ID], i = 0, num;
        while (caract != '\n'){
            scanf("%d", &num);
            caract = getchar();
            vect[i] = num;
            i++;
        }
        ordem_l(vect, i);
    }
}
/*Gets input of "n" command and check possible erros from input*/
void reconhece_n(void){
    int duracao;
    scanf("%d", &duracao);
    if (duracao < 0){
        printf("%s\n", INV_TIME);
    }
    else{
        printf("%d\n", time_f(duracao));
    }
}
/*Gets input of "u" command. Takes care if "u" receives user names*/
void reconhece_u(void){
    char user[MAX_20 + 1], caract;
    int i;
    if (getchar() == '\n'){
        for (i = 0; i < n_users; i++){
            printf("%s\n", users[i]);
        }
    }
    else{   /*if receive argument after "u" */
        scanf("%20s", user);
        caract = getchar();
        if (caract != '\n'){
            while ((caract = getchar()) != '\n');  /*remove characters until end of the line*/
        }
        new_user(user);
    }
}
/*Gets input of "m" command*/
void reconhece_m(void){
    char caract;
    int ident, j = 0;
    char user[MAX_20 + 1], ativ[MAX_20 + 1]; /*Reads user name and activity name*/
    scanf("%d", &ident);
    scanf("%20s", user);
    caract = getchar();
    while (caract == ' ' || caract == '\t'){  /*erase white spaces between agruments*/
        caract = getchar();
    }
    while (caract != '\n' && j < MAX_20){
        ativ[j] = caract;
        j++;
        caract = getchar();
    }
    ativ[j] = '\0';
    if (caract != '\n'){
        while ((caract = getchar()) != '\n');   /*remove characters until end of the line*/
    }
    erros_move(ident, user, ativ);
}

/*Gets input of "d" command. Check possible errors*/
void reconhece_d(void){
    int j = 0;
    char ativ[MAX_20 + 1], caract; /*ativ: activiy name*/
    caract = getchar();
    while (caract == ' ' || caract == '\t'){
        caract = getchar();
    }
    while (caract != '\n' && j < MAX_20){
        ativ[j] = caract;
        j++;
        caract = getchar();
    }
    ativ[j] = '\0';
    if (caract != '\n'){
        while ((caract = getchar()) != '\n');   /*remove characters until end of the line*/
    }
    if (such_ativ(ativ) == FALSE){
        printf("%s\n", NO_S_ATIV);
    }
    else{
        activities_tasks(ativ);
    }
}
/*Gets input of "a" command. Verify if "a" receives more arguments*/
void reconhece_a(void){
    int i;
    char ativ[MAX_20 + 1], caract; /*ativ: activiy name*/
    caract = getchar();
    if (caract == '\n'){
        for (i = 0; i < n_atives; i++){
            printf("%s\n", activities[i]);
        }
    }
    else{       /*if "a" has more arguments*/
        i = 0;
        caract = getchar();
        while (caract == ' ' || caract == '\t'){
            caract = getchar();
        }
        while (caract != '\n' && i < MAX_20){
            ativ[i] = caract;
            i++;
            caract = getchar();
        }
        ativ[i] = '\0';
        adds_a(ativ, i);
    }
}

/*Identify what command was inserted by stdin*/
void reconhece_comando(char c){
    if (c == 't'){
        reconhece_t();
    }
    else if (c == 'l'){
        reconhece_l();
    }
    else if (c == 'n'){
        reconhece_n();
    }
    else if (c == 'u'){
        reconhece_u();
    }
    else if (c == 'm'){
        reconhece_m();
    }
    else if (c == 'd'){
        reconhece_d();
    }
    else if (c == 'a'){
        reconhece_a();
    }
}

/*Reads commands from stdin and manipulate them through the system
 functions in order to perfom kanban management*/
int main(){
    int i = 0;
    char c;
    scanf("%c", &c);    /*char "c" receives command charaters*/
    while (i == 0){
        if (c == 'q'){  /* "q" to end the program*/
            break;
        }
        reconhece_comando(c);
        scanf("%c", &c);
    }
    return 0;
}