/*
    ------------------------------------------ Portada --------------------------------------------  
    Tarea: 2048 en Stop Motion 
    Estudiante: Steven Sequeira Araya 
    Carnet: 2022080836
    Instituto Tecnológico de Costa Rica 
    Escuela Ingeniería en Computación 
    Lenguajes de Programación 
    Fecha de entrega: 30/04/2024 
    ------------------------------------------ Portada --------------------------------------------  
*/

/*
    -------------------------------------- Manual de usuario --------------------------------------
    Pasos para correr el código 
	1. Abra su interfaz de línea de comandos, que corra archivos .C 
	2. Navegue a la ubicación donde guardó el archivo fuente
	3. Compile el archivo fuente. Ejemplo: gcc nombreArchivo.c -o nombreArchivo (si usa gcc en WSL como compilador de C). 
	4. Ejecute el archivo fuente, con el formato: archivoFuente p1 p2
	    archivoFuente: es el nombre del archivo fuente
	    p1: es una letra en mayúscula que representa la acción requerida (G,N,S,O,E)
	    p2: es el archivo con extensión .2048 que representa el tablero de la partida 
	    Ejemplos: 
		1.  2048-Stop-Motion-Sequeira-Steven G x.2048
		2.  ./2048-Stop-Motion-Sequeira-Steven G x.2048 (si usa WSL)
	
    Pasos para ejecutar las acciones disponibles (G,N,S,O,E)
	Iniciar o generar una nueva partida:	  	
	    Se debe ejecutar con el formato: archivoFuente G archivo.2048
	    Ejemplos: 
		1. 2048-Stop-Motion-Sequeira-Steven G x.2048
 		2. ./2048-Stop-Motion-Sequeira-Steven G x.2048 (si usa WSL)

	Realizar un movimiento al norte:
            Se debe ejecutar con el formato: archivoFuente N archivo.2048
            Ejemplos: 
		1. 2048-Stop-Motion-Sequeira-Steven N x.2048
		2. ./2048-Stop-Motion-Sequeira-Steven N x.2048 (si usa WSL)

	Realizar un movimiento al sur:
            Se debe ejecutar con el formato: archivoFuente S archivo.2048
            Ejemplos: 
		1. 2048-Stop-Motion-Sequeira-Steven S x.2048
		2. ./2048-Stop-Motion-Sequeira-Steven S x.2048 (si usa WSL)

	Realizar un movimiento al oeste:
            Se debe ejecutar con el formato: archivoFuente O archivo.2048
            Ejemplos: 
		1. 2048-Stop-Motion-Sequeira-Steven O x.2048
		2. ./2048-Stop-Motion-Sequeira-Steven O x.2048 (si usa WSL)

	Realizar un movimiento al este:
            Se debe ejecutar con el formato: archivoFuente E archivo.2048
            Ejemplo: 
		1. 2048-Stop-Motion-Sequeira-Steven E x.2048
		2. ./2048-Stop-Motion-Sequeira-Steven E x.2048 (si usa WSL)

    -------------------------------------- Manual de usuario --------------------------------------
*/

/*
    ------------------------------------ Análisis de resultados -----------------------------------
    Tabla de autocalificación:

    Parte                        	  Calificación
    Portada                           		A
    Manual de usuario                 		A 
    Análisis de Resultados            		A 
    Interfaz por línea de comandos              A 
    Lectura y generación de archivos            A
    Enfoque con stop motion                     A
    Crear una partida                           A
    Realizar movimiento al norte                A
    Realizar movimiento al sur                  A
    Realizar movimiento al oeste                A
    Realizar movimiento al este                 A
    Algoritmo aleatorio  		        A
    Comprobrar victoria 	                A
    Comprobar derrota				A
    Formato del archivo              		A
    ------------------------------------ Analisis de resultados -----------------------------------
*/


#include <stdio.h>
#include <string.h>
#include <time.h>
#include <stdlib.h>

#define N_FILS 4
#define N_COLS 4

// funciones principales
void realizarAccion(char accion, char *nombreArchivo, int cuadricula[N_FILS][N_COLS]);
void realizarMovimientoAlNorte(int cuadricula[N_FILS][N_COLS]); 
void realizarMovimientoAlSur(int cuadricula[N_FILS][N_COLS]);
void realizarMovimientoAlOeste(int cuadricula[N_FILS][N_COLS]);
void realizarMovimientoAlEste(int cuadricula[N_FILS][N_COLS]);
void actualizarArchivo(char *nombreArchivo, int cuadricula[N_FILS][N_COLS]);

// funciones auxiliares
int obtenerNDisponibles(int cuadricula[N_FILS][N_COLS], int disponibles[N_FILS*N_COLS][2]);
int generarNumeroAleatorio(int semilla);  
void extraerMatrizCuadricula(char *nombreArchivo, int cuadricula[N_FILS][N_COLS]); 
int comprobarDerrota(int cuadricula[N_FILS][N_COLS]);
int buscarNumCuadricula(int num, int cuadricula[N_FILS][N_COLS]);
void copiarCuadricula(int cuadricula[N_FILS][N_COLS], int copia[N_FILS][N_COLS]);

/*
funcion principal que controla el flujo del funcionamiento de un juego 2048 stop motion
recibe por linea de comandos:
	una letra que representa la accion a realizar
	el nombre del archivo .2048 que se va a usar para ir guardando la cuadricula de la partida
*/
int main(int argc, char *argv[]){
    int cuadricula[N_FILS][N_COLS] = {{0,0,0,0}, {0,0,0,0}, {0,0,0,0}, {0,0,0,0}}; //cuadricula vacia 4x4 
    char accion = argv[1][0];				// se obtiene la accion ingresada
    char *nombreArchivo = argv[2];			// se obtiene el nombre del archivo ingresado
    srand(time(NULL)); // Puedes usar otra semilla en lugar de time(NULL);	
    realizarAccion(accion, nombreArchivo, cuadricula);	// se llama al controlador de acciones
    actualizarArchivo(nombreArchivo, cuadricula);	// una vez realizada la accion, se actualiza el archivo

    if (buscarNumCuadricula(2048, cuadricula)){		// se verifica si ya se logro formar un 2048 (condicion de victoria)
    	printf("\n¡Felicidades, has ganado! :)");
    } 
    else if(comprobarDerrota(cuadricula)){		// se verifica si ya no hay movimientos disponibles (condicion de derrota)
    	printf("\nNo quedan movimentos disponibles, has perdido :(");
    } 

    printf("\n");
    return 0;
}

/*
llama a la funcion que realiza una accion (generar archivo o los 4 movimientos)
recibe:
	accion: una letra que representa la accion a realizar 
	nombreArchivo: un string que representa el nombre del archivo
	cuadricula: una matriz 4x4 de enteros que representa la cuadricula actual
*/
void realizarAccion(char accion, char *nombreArchivo, int cuadricula[N_FILS][N_COLS]){
    switch(accion){						// se analiza la accion
        case 'G':						// si la accion es generar archivo
            actualizarArchivo(nombreArchivo, cuadricula); 	// se llama a la funcion que actualiza para inicialice el archivo
	    printf("\nArchivo generado con exito");		
            break;

        case 'N':						// accion realizar movimento hacia el norte (arriba)
    	    extraerMatrizCuadricula(nombreArchivo, cuadricula); // se extrae la informacion del archivo en la matriz 
    	    realizarMovimientoAlNorte(cuadricula);		// se realiza el movimiento al norte
	    printf("\nMovimiento realizado con exito");
            break;

        case 'S':						// accion realizar movimiento hacia el sur (abajo)
      	    extraerMatrizCuadricula(nombreArchivo, cuadricula);	// se extrae la informacion del archivo en la matriz
            realizarMovimientoAlSur(cuadricula);		// se realiza el movimiento al sur
	    printf("\nMovimiento realizado con exito");
            break;

        case 'O':						// accion realizar movimiento hacia el oeste (izquierda)
            extraerMatrizCuadricula(nombreArchivo, cuadricula); // se extrae la informacion del archivo en la matriz
            realizarMovimientoAlOeste(cuadricula);		// se realiza el movimiento hacia el oeste
	    printf("\nMovimiento realizado con exito");
            break;

        case 'E':						// accion realizar movimiento hacia el este (derecha)
            extraerMatrizCuadricula(nombreArchivo, cuadricula);	// se extrae la informacion del archivo en la matriz
      	    realizarMovimientoAlEste(cuadricula);		// se realiza el movimiento hacie el este
	    printf("\nMovimiento realizado con exito");
            break;

        default:						// caso en el que no se haya ingresado una accion valida
            printf("Se ingreso una accion invalida");		// se indica el mensaje y se corta el flujo del programa
	    exit(0);
            break;
    }
}

/*
realiza el movimiento hacia el norte 
recibe: 
	cuadricula: es una matriz 4x4 de enteros que contiene la informacion de la cuadricula actual 
retorna: nada, pero actualiza la matriz cuadricula con los cambios realizados
*/
void realizarMovimientoAlNorte(int cuadricula[N_FILS][N_COLS]){
    int colisiones[N_FILS][N_COLS] = {{0,0,0,0}, {0,0,0,0}, {0,0,0,0}, {0,0,0,0}}; // 0 puede colisionar, 1 no puede colisionar
    
    for (int i=1; i<N_FILS; i++){                        // se recorre de la fila 1 hacia abajo
        for (int j=0; j<N_COLS; j++){                    // se recorre las columnas de forma normal
            int actual = cuadricula[i][j];
            if (actual != 0){                            // si la casilla actual no esta vacia
                for (int k=i; k>0; k--){                 // se recorre desde la fila actual hacia arriba
                    int arriba = cuadricula[k-1][j];
                    if (arriba == 0){                    // caso en donde la casilla de arriba sea 0
                        cuadricula[k-1][j] = actual;     // se mueve el numero actual en la casilla de arriba
                        cuadricula[k][j] = 0;            // se pone la casilla actual en 0
                    }
                    else if (actual == arriba && colisiones[k-1][j] == 0){  // caso en donde se colisiona la casilla de arriba con la actual
                        cuadricula[k-1][j] = actual*2;   // se duplica la casilla de arriba
                        cuadricula[k][j] = 0;            // se pone la casilla actual en 0
                        colisiones[k-1][j] = 1;          // se bloquea la casilla de arriba para que no haga mas colisiones
                    }
                    else{                                // caso en donde la casilla de arriba sea distinta de la actual
                        break;
                    }
                }
            }
        }
    }
}

/*
realiza el movimiento hacia el sur
recibe:
        cuadricula: es una matriz 4x4 de enteros que contiene la informacion de la cuadricula actual
retorna: nada, pero actualiza la matriz cuadricula con los cambios realizados
*/
void realizarMovimientoAlSur(int cuadricula[N_FILS][N_COLS]){
    int colisiones[N_FILS][N_COLS] = {{0,0,0,0}, {0,0,0,0}, {0,0,0,0}, {0,0,0,0}}; // 0 puede colisionar, 1 no puede colisionar

    for (int i=N_FILS-1; i>=0; i--){                    // se recorre de la fila 3 hacia arriba
        for (int j=0; j<N_COLS; j++){                   // se recorre las columnas de forma normal
            int actual = cuadricula[i][j];
            if (actual != 0){                           // si en la casilla actual no esta vacia
                for(int k=i; k<N_FILS-1; k++){          // se recorre de la fila actual hacia abajo
                    int abajo = cuadricula[k+1][j];
                    if (abajo == 0){                    // caso en donde la casilla de abajo sea 0
                        cuadricula[k+1][j] = actual;    // se mueve el numero actual en la casilla de abajo
                        cuadricula[k][j] = 0;           // se pone la casilla actual en 0
                    }
                    else if (actual == abajo && colisiones[k+1][j] == 0){  // caso en donde se colisiona la casilla de abajo con la actual
                        cuadricula[k+1][j] = actual*2;  // se duplica la casilla de abajo
                        cuadricula[k][j] = 0;           // se pone la casilla actual en 0
                        colisiones[k+1][j] = 1;         // se bloquea la casilla de abajo para que no haga mas colisiones
                    }
                    else{                               // caso en donde la casilla de abajo sea distinta de la actual
                        break;
                    }
                }
            }
        }
    }
}

/*
realiza el movimiento hacia el oeste
recibe:
        cuadricula: es una matriz 4x4 de enteros que contiene la informacion de la cuadricula actual
retorna: nada, pero actualiza la matriz cuadricula con los cambios realizados
*/
void realizarMovimientoAlOeste(int cuadricula[N_FILS][N_COLS]){
    int colisiones[N_FILS][N_COLS] = {{0,0,0,0}, {0,0,0,0}, {0,0,0,0}, {0,0,0,0}}; // // 0 puede colisionar, 1 no puede colisionar
  
    for (int i=0; i<N_FILS; i++){                       // se recorre de las filas de forma normal
        for (int j=1; j<N_COLS; j++){                   // se recorre desde la columna 1 hacia la derecha
            int actual = cuadricula[i][j];
            if (actual != 0){                           // si la casilla actual no esta vacia
                for (int k=j; k>0; k--){                // se recorre desde la columna actual hacia la izquierda
                    int izquierda = cuadricula[i][k-1];
                    if (izquierda == 0){                // caso en donde la casilla de la izquierda sea 0
                        cuadricula[i][k-1] = actual;    // se mueve el numero actual a la casilla de la izquierda
                        cuadricula[i][k] = 0;           // se pone la casilla actual en 0
                    }
                    else if (actual == izquierda && colisiones[i][k-1] == 0){  // caso en donde se colisiona la casilla de la izquierda con la actual
                        cuadricula[i][k-1] = actual*2;  // se duplica la casilla de la izquierda
                        cuadricula[i][k] = 0;           // se pone la casilla actual en 0
                        colisiones[i][k-1] = 1;         // se bloquea la casilla de la izquierda para que no haga mas colisiones
                    }
                    else{                               // caso en donde la casilla de la izquierda sea distinta de la actual
                        break;
                    }
                }
            }
        }
    }
}

/*
realiza el movimiento hacia el norte
recibe:
        cuadricula: es una matriz 4x4 de enteros que contiene la informacion de la cuadricula actual
retorna: nada, pero actualiza la matriz cuadricula con los cambios realizados
*/
void realizarMovimientoAlEste(int cuadricula[N_FILS][N_COLS]){
    int colisiones[N_FILS][N_COLS] = {{0,0,0,0}, {0,0,0,0}, {0,0,0,0}, {0,0,0,0}}; // 0 puede colisionar, 1 no puede colisionar

    for (int i=0; i<N_FILS; i++){                       // se recorre de las filas de forma normal
        for (int j=N_COLS-1; j>=0; j--){                // se recorre desde la columna 3 hacia la izquierda
            int actual = cuadricula[i][j];
            if (actual != 0){                           // si la casilla actual no esta vacia
                for (int k=j; k<N_COLS-1; k++){         // se recorre desde la columna actual hacia la derecha
                    int derecha = cuadricula[i][k+1];
                    if (derecha == 0){                  // caso en donde la casilla de la derecha sea 0
                        cuadricula[i][k+1] = actual;    // se mueve el numero actual a la casilla de la derecha
                        cuadricula[i][k] = 0;           // se pone la casilla actual en 0
                    }
                    else if (actual == derecha && colisiones[i][k+1] == 0){  // caso en donde se colisiona la casilla de la derecha con la actual
                        cuadricula[i][k+1] = actual*2;  // se duplica la casilla de la derecha
                        cuadricula[i][k] = 0;           // se pone la casilla actual en 0
                        colisiones[i][k+1] = 1;         // se bloquea la casilla de la derecha para que no haga mas colisiones
                    }
                    else{                               // caso en donde la casilla de la derecha sea distinta de la actual
                        break;
                    }
                }
            }
        }
    }
}

/*
actualiza la informacion de la cuadricula (matriz) en el archivo 
recibe: 
        nombreArchivo: es un string que contiene el nombre del archivo
        cuadricula: es una matriz 4x4 de enteros que contiene la informacion de la cuadricula actual
retorna: nada, pero actualiza el archivo con la informacion de la matriz
*/
void actualizarArchivo(char *nombreArchivo, int cuadricula[N_FILS][N_COLS]){
    int vacios[N_FILS*N_COLS][2];			   // contie hasta 16 posibles vacios y guarda sus coordenadas
    int nVacios = obtenerNDisponibles(cuadricula, vacios); // se obtienen la cantidad de vacios y posiciones vacias
    int posDisp = 0;
    int posAle[] = {0,0};    
    int num = 0;
    
    if (nVacios > 0) { 					// se comprueba si hay al menos una posicion vacia
    	unsigned int semilla = (unsigned int)time(NULL);   // se obtiene una semilla aleatoria de acuerdo al tiempo
	posDisp = abs(generarNumeroAleatorio(semilla)) % nVacios;	// se genera una posicion aleatoria de 0 a la cantidad de vacios - 1
    	posAle[0] = vacios[posDisp][0];	 		// de esa posicion, se saca la coordena de la fila
    	posAle[1] = vacios[posDisp][1];			// de esa posicion, se saca la coordena de la columna
    }    

    FILE *archivo = fopen(nombreArchivo, "w");		// se abre el archivo en modo escritura
    	for (int i = 0; i < N_FILS; i++) {	  	// se recorre cada fila 
            char fila[22] = "";				// se inicializa la fila
            for (int j = 0; j < N_COLS; j++) {		// se recorre cada columna
                if (i == posAle[0] && j == posAle[1] && nVacios > 0){ // si la fila y columna coincide con la generada y esta vacia	
                    cuadricula[i][j] = 2;		// se coloca el nuevo 2 en esa posicion 
		}
		char strNum[6];				// se inicializa la variable que contendra el numero convertido a string
    		sprintf(strNum, "%d", cuadricula[i][j]); 	// se convierte el numero (int) de la matricula en un string
    		strcat(strNum, " ");			// se le agrega el espacio en blanco que separa cada numero en la fila
    		strcat(fila, strNum);			// y se concatena a la fila el numero 
            }
            fprintf(archivo, "%s\n", fila);		// finalmente se escribe la nueva fila formada en el archivo
    	}
    fclose(archivo);					// se cierra el archivo
}

/*
cuenta la cantidad de vacios de una matriz y guarda sus posiciones en otra matriz
recibe:
        cuadricula: es una matriz 4x4 de enteros que contiene la informacion de la cuadricula actual
	disponibles: es una matriz 16x2 de enteros que guarda las posiciones vacias
retorna: un entero que representa la cantidad de vacios y guarda las posiciones vacias
*/
int obtenerNDisponibles(int cuadricula[N_FILS][N_COLS], int disponibles[N_FILS*N_COLS][2]){
    int nDisp = 0;
     
    for (int i=0; i<N_FILS; i++){
    	for (int j=0; j<N_COLS; j++){
	    if (cuadricula[i][j] == 0){
                disponibles[nDisp][0] = i; 
      		disponibles[nDisp][1] = j;
		nDisp++; 
	    }	
    	} 
    }
    return nDisp;
}

/*
genera un numero aleatorio de 0 a un maximo ingresado, usando el algoritmo LSFR
recibe:
	semilla: es un entero que representa la semilla
retorna: un entero aleatorio
*/
int generarNumeroAleatorio(int semilla){
    semilla ^= (semilla << 13);	// se hace un desplazamiento a la izquierda de la semilla por 13 bits y a eso se le hace un xor
    semilla ^= (semilla >> 17); // se hace un desplazamiento a la derecha de la semilla por 17 bits y a eso se le hace un xor
    semilla ^= (semilla << 5); // se hace un desplamiento a la izquierda de la semilla por 5 bits y a eso se le hace un xor
    return semilla;    
}

/*
extrar los datos del archivo que contiene la cuadricula actual en una matriz
recibe:
	nombreArchivo: strin que contiene el nombre del archivo 
        cuadricula: es una matriz 4x4 de enteros que guarda la informacion de la cuadricula actual
retorna: nada, pero actualiza la matriz cuadricula con la informacion leida
*/
void extraerMatrizCuadricula(char *nombreArchivo, int cuadricula[N_FILS][N_COLS]){
    FILE *archivo = fopen(nombreArchivo, "r");    	// se abre el archivo en modo lectura

    if (archivo == NULL) {		// en caso de que no exista el archivo ingresado
        perror("Error el nombre del archivo ingresado no existe");	// se manda un error
        exit(0);			// se corta el flujo del programa
    }

    char linea[22];    			// se inicializa la varible que contendra la linea actual leida
    int fil = 0;	
    while (fgets(linea, sizeof(linea), archivo) != NULL) {	// se recorre cada linea del archivo
        int col = 0, k = 0;		
        int nChars = strlen(linea);	// se obtiene la cantidad de caracteres que tiene la linea actual
        while (k < nChars-1){		// se recorre cada caracter de la linea
            char num[6] = "";		
            int j = 0;
	    while (linea[k] != ' ') {	// se recorre hasta encontrar el primer espacio en blanco
            	num[j] = linea[k];	// se guarda cada caracter de la linea para formar el numero actual
           	k++;			// se incrementa el indice de la linea
            	j++;			// se incrementa el indice del numero a formar
            }
	    cuadricula[fil][col] = atoi(num);	// se convierte a entero y se guarda el numero leido
            col++;			// se incrementa la columna de la matriz cuadricula
            k++;			// se incrementa el indice de la linea, para saltar avanzar del espacio en blanco
	}
        fil++;				// se incrementa la fila de la matriz cuadricula
    }	

    fclose(archivo);			// se cierra el archivo
}

/*
revisa si la cuadricula actual ya no tiene mas movimientos posibles, lo que indicaria una derrota
recibe:
        cuadricula: es una matriz 4x4 de enteros que contiene la informacion de la cuadricula actual
retorna: un 0 en caso de que ya no hayan mas movimientos posibles, 1 de lo contrario
*/

int comprobarDerrota(int cuadricula[N_FILS][N_COLS]){ 
    int copia[N_FILS][N_COLS] = {{0,0,0,0}, {0,0,0,0}, {0,0,0,0}, {0,0,0,0}};
    copiarCuadricula(cuadricula, copia);
    if (!buscarNumCuadricula(0, cuadricula)){		// si la cuadricula no tiene vacios
	realizarMovimientoAlNorte(copia);		// se realiza un movimiento al norte en la copia
	realizarMovimientoAlSur(copia);         	// se realiza un movimiento al sur en la copia
	realizarMovimientoAlOeste(copia);		// se realiza un movimiento al oeste en la copia
	realizarMovimientoAlEste(copia);		// se realiza un movimiento al este en la copia
	for (int i=0; i<N_FILS; i++){			// se recorre la cuadricula copia y la original
     	    for (int j=0; j<N_COLS; j++){
               	if (cuadricula[i][j] != copia[i][j]){	// si se produjo un cambio en copia
               	    return 0;				// no se ha perdido
                }
            }
    	}
    	return 1; 					// si no se produjo algun cambio en copia, se ha perdido
    }
    return 0;						// si tiene algun vacio la cuadricula, entonces no se ha perdido
}

/*
busca si un numero se encuentra en la matriz cuadricula
recibe:
	num: es el entero que se desea encontrar en la matriz
        cuadricula: es una matriz 4x4 de enteros que contiene la informacion de la cuadricula actual
retorna: 1 en caso de encontrar el numero, 0 de lo contrio
*/
int buscarNumCuadricula(int num, int cuadricula[N_FILS][N_COLS]){
    for (int i=0; i<N_FILS; i++){		// se recorren las filas
        for (int j=0; j<N_COLS; j++){		// se recorren las columans
            if (cuadricula[i][j] == num){	// en caso de que el numero coincida con el contenido de la cuadricula
                return 1;			// se retorna un 1 (true)
            }
        }
    }
    return 0;					// se retorna un 0 (false) de lo contrario
}

/*
copia el contenido de una matriz en otra
recibe:
        cuadricula: es una matriz 4x4 de enteros que contiene la informacion de la cuadricula actual
	copia: es una matriz 4x4 vacia
retorna: nada, pero agrega a la copia la informacion de la cuadricula
*/
void copiarCuadricula(int cuadricula[N_FILS][N_COLS], int copia[N_FILS][N_COLS]){  
    for (int i=0; i<N_FILS; i++){		// se recorren las fila
        for (int j=0; j<N_COLS; j++){		// se recorren la columnas
            copia[i][j] = cuadricula[i][j];	// se copian los valores
	}
    } 
}
