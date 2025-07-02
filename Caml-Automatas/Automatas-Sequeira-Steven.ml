(*
   ------------------------------------------- PORTADA -------------------------------------------  
   Tarea: Calculadora Histórica 
   Estudiante: Steven Sequeira Araya 
   Carnet: 2022080836
   Instituto Tecnológico de Costa Rica 
   Escuela Ingeniería en Computación 
   Lenguajes de Programación 
   Fecha de entrega: 5/04/2024 
   ------------------------------------------- PORTADA -------------------------------------------  
*)

(*
    ------------------------------------- Manual de usuario -------------------------------------

    Pasos para cargar el codigo en caml light: 
        1. descargue el archivo y guardelo en su maquina local 
        2. formas de cargar el archivo en caml light:
            2.1 use el comando include "ubicacionArchivo/nombreArchivo.ml"
            2.2 otra forma es iniciar caml light, presionar la opcion File, luego la opcion Include y finalmente buscar el archivo en su maquina
            2.3 ultima forma libre de cualquier error: 
                Hacer control all del codigo de este archivo, abrir caml light, pegarlo todo en la terminal, ejecutar el codigo, 
                seleccionar la opcion Edit, seleccionar la opcion Select All, borrar el codigo de la terminal y listo. 
                Esta opcion usela si las dos anteriores le dan algun problema
        
    
    Formatos de entrada de cada automata disponible

        - AEFD: debe recibir una tupla: 
            La tupla debe contener 5 elementos en el siguiente orden:
                1. Estados: Una lista de numeros enteros
                2. Estado inicial: Un numero entero
                3. Estados finales: Una lista de numeros enteros 
                4. Alfabeto: Una lista de caracteres
                5. Transiciones: Una lista de tuplas con 3 elementos:  
                    5.1 Estado: Un entero 
                    5.2 Simbolo a leer: Un caracter
                    5.3 Estado a moverse: Un entero
            Ejemplo de un AEFD correcto:
                let AEFD1 = 
                    ([0;1;2;3;4],
                    0,
                    [0],
                    [`0`;`1`],
                    [(0,`0`,0);(0,`1`,1);(1,`0`,2);(1,`1`,3);(2,`0`,4);(2,`1`,0);(3,`0`,1);(3,`1`,2);(4,`0`,3);(4,`1`,4)])
        
        - AEFND: debe recibir una tupla y una tira: 
            Tiene el mismo formato que el AEFD con la posibilidad de colocar varior estados de transicion para un mismo simbolo
            Ejemplo de un AEFND correcto:
                let AEFND1 = 
                    ([0;1;2;3],
                    0,
                    [3],
                    [`H`;`2`;`O`],
                    [(0,`O`,0);(0,`H`,1);(0,`H`,2);(0,`2`,3);(1,`H`,0);(1,`2`,3);(2,`H`,0);(2,`2`,2);(2,`O`,2);(2,`O`,3);(3,`H`,1);(3,`H`,3);(3,`O`,2);(3,`2`,1)]) 

        - A2V: debe recibir una tupla: 
            La tupla debe contener 5 elementos en el siguiente orden:
                1. Estados: Una lista de numeros enteros
                2. Estado inicial: Un numero entero
                3. Estados finales: Una lista de numeros enteros 
                4. Alfabeto: Una lista de caracteres
                5. Transiciones: Una lista de tuplas con 4 elementos:  
                    5.1 Estado: Un entero 
                    5.2 Simbolo a leer: Un caracter
                    5.3 Estado a moverse: Un entero
                    5.4 Movimiento de la cabeza lectora: Un caracter
            Ejemplo de un A2V correcto:
                let A2V1 = 
                    ([0;1;2],
                    0,
                    [0],
                    [`0`;`1`],
                    [(0,`0`,0,`L`);(0,`1`,1,`R`);(1,`0`,2,`R`);(1,`1`,0,`L`);(2,`0`,0,`R`);(2,`1`,2,`L`)])
        
        - MMe: debe recibir una tupla: 
            La tupla debe contener 5 elementos en el siguiente orden:
                1. Estados: Una lista de numeros enteros
                2. Estado inicial: Un numero entero
                3. Alfabeto de entrada: Una lista de caracteres 
                4. Alfabeto de salida: Una lista de caracteres
                5. Transiciones: Una lista de tuplas con 4 elementos:  
                    5.1 Estado: Un entero 
                    5.2 Simbolo a leer: Un caracter
                    5.3 Estado a moverse: Un entero
                    5.4 Simbolo a escribir: Un caracter 
            Ejemplo de un MMe correcto:
                let MMe1 = 
                    ([0;1;2],   
                    0,
                    [`0`;`1`],
                    [`a`;`b`],
                    [(0,`0`,0,`b`);(0,`1`,1,`a`);(1,`0`,1,`a`);(1,`1`,2,`b`);(2,`0`,1,`a`);(2,`1`,0,`a`)]) 
        
        - MMo: debe recibir una tupla: 
            La tupla debe contener 6 elementos en el siguiente orden:
                1. Estados: Una lista de numeros enteros
                2. Estado inicial: Un numero entero
                3. Alfabeto de entrada: Una lista de caracteres  
                4. Alfabeto de salida: Una lista de caracteres
                5. Transiciones de estados: Una lista de tuplas con 3 elementos:  
                    5.1 Estado: Un entero 
                    5.2 Simbolo a leer: Un caracter
                    5.3 Estado a moverse: Un entero
                6. Transiciones de estados de escritura: Una lista de tuplas con 2 elementos:  
                    6.1 Estado: Un entero 
                    6.2 Simbolo a escribir: Un caracter
            Ejemplo de un MMo correcto:
                let MMo1 = 
                    ([0;1],   
                    0,
                    [`0`;`1`],
                    [`0`;`1`],
                    [(0,`0`,1);(0,`1`,0);(1,`0`,1);(1,`1`,0)],
                    [(0,`0`);(1,`1`)]) 

    
    Ejecutar las funciones principales implementadas:

        - Ejecutar AEFD (ExecAEFD): 
            1. Recibe lo siguiente: 
                1.1 Un AEFD siguiendo el formato definido anteriormente  
                2.2 La tira sera un string que contiene la entrada a ser evaluada  
            2. Ejemplo de llamadas con resultado esperado: 
                ExecAEFD AEFD1 "1010" ;;
                ExecAEFD AEFD1 "1111001" ;;
                Retornarian true y false respectivamente
            
        - Ejecutar AEFND (ExecAEFND): 
            1. Recibe lo siguiente: 
                1.1 Un AEFND siguiendo el formato definido anteriormente  
                2.2 La tira sera un string que contiene la entrada a ser evaluada  
            2. Ejemplo de llamadas con resultado esperado: 
                ExecAEFND AEFND1 "H2O" ;;
                ExecAEFND AEFND1 "HHH2HHH" ;; 
                ExecAEFND AEFND1 "HHO2HH2O" ;;
                Retornarian true, true y false respectivamente

        - Ejecutar A2V (ExecA2V): 
            1. Recibe lo siguiente: 
                1.1 Un A2V siguiendo el formato definido anteriormente  
                2.2 La tira sera un string que contiene la entrada a ser evaluada  
            2. Ejemplo de llamadas con resultado esperado: 
                ExecA2V A2V1 "0" ;;    
                ExecA2V A2V1 "11" ;;  
                ExecA2V A2V1 "101" ;; 
                ExecA2V A2V1 "10" ;;  
                Retornarian true, true, false y false respectivamente
            NOTA: si percibe que se pega un poco al correr alguna tira, es posible que haya detectado un ciclo infinito y duvuelva false 

        - Ejecutar MMe (ExecMMe): 
            1. Recibe lo siguiente: 
                1.1 Un MMe siguiendo el formato definido anteriormente  
                2.2 La tira sera un string que contiene la entrada a ser evaluada  
            2. Ejemplo de llamadas con resultado esperado: 
                ExecMMe MMe1 "1100110" ;;   
                ExecMMe MMe1 "0000000" ;;   
                ExecMMe MMe1 "1111111" ;; 
                ExecMMe MMe1 "1010101" ;; 
                ExecMMe MMe1 "0101010" ;; 
                Retornarian "abaabab", "bbbbbbb", "abaabaa", "aababab" y "baababa" respectivamente
        
        - Ejecutar MMo (ExecMMo): 
            1. Recibe lo siguiente: 
                1.1 Un MMo siguiendo el formato definido anteriormente  
                2.2 La tira sera un string que contiene la entrada a ser evaluada  
            2. Ejemplo de llamadas con resultado esperado: 
                ExecMMo MMo1 "1100110" ;;   
                ExecMMo MMo1 "0000000" ;;   
                ExecMMo MMo1 "1111111" ;; 
                ExecMMo MMo1 "1010101" ;; 
                ExecMMo MMo1 "0101010" ;; 
                Retornarian "0011001", "1111111", "0000000", "0101010" y "1010101" respectivamente

        - Determinar determinismo (Deterministicop) 
            1. Recibe lo siguiente: 
                1.1 Un AEFD o un AEFND siguiendo el formato definido anteriormente  
            2. Ejemplo de llamadas con resultado esperado: 
                Deterministicop AEFD1 ;;
                Deterministicop AEFND1 ;;
                Retornarian true y false respectivamente

        - Conversion de MMo a MMe (MMoToMMe) 
            1. Recibe lo siguiente: 
                1.1 Un MMo siguiendo el formato definido anteriormente  
                1.2 Nombre del archivo: Un string
            2. Ejemplo de llamadas con resultado esperado: 
                MMoToMMe MMo1 "prueba1";;
                MMoToMMe MMo2 "prueba2";;
                Retornarian MMe correspondiente y un archivo de texto con el paso a paso de la conversion

    ------------------------------------- Manual de usuario -------------------------------------  
*)

(* 
   ------------------------------------- Analisis de resultados -------------------------------------  
   Tabla de autocalificación:

   Parte                        calificación
   Portada                           A
   Manual de usuario                 A 
   Análisis de Resultados            A 
   Ejecutar AEFD                     A 
   Ejecutar AEFND                    A
   Ejecutar A2V                      A
   Ejecutar MMo                      A
   Ejecutar MMe                      A
   Comprobar si determinismo         A
   Conversion AEFND a AEFD           E
   Conversion MMo a MMe              A
   Conversion MMe a MMo              E 
   ------------------------------------- Analisis de resultados -------------------------------------  
*)


(************************************************ AUTOMATAS DE PRUEBA ************************************************)

(* Estos son algunas variables que contienen automatas ya hechos que aparecen en la materia de FOC, salvo A2V1, para probar las funciones *)

let AEFD1 = 
    ([0;1;2;3;4],
     0,
     [0],
     [`0`;`1`],
     [(0,`0`,0);(0,`1`,1);(1,`0`,2);(1,`1`,3);(2,`0`,4);(2,`1`,0);(3,`0`,1);(3,`1`,2);(4,`0`,3);(4,`1`,4)]) ;;

let AEFND1 = 
    ([0;1;2;3],
     0,
     [3],
     [`H`;`2`;`O`],
     [(0,`O`,0);(0,`H`,1);(0,`H`,2);(0,`2`,3);(1,`H`,0);(1,`2`,3);(2,`H`,0);(2,`2`,2);(2,`O`,2);(2,`O`,3);(3,`H`,1);(3,`H`,3);(3,`O`,2);(3,`2`,1)]) ;;

let A2V1 = 
    ([0;1;2],
     0,
     [0],
     [`0`;`1`],
     [(0,`0`,0,`L`);(0,`1`,1,`R`);(1,`0`,2,`R`);(1,`1`,0,`L`);(2,`0`,0,`R`);(2,`1`,2,`L`)]) ;;

let MMe1 = 
    ([0;1;2],   
     0,
     [`0`;`1`],
     [`a`;`b`],
     [(0,`0`,0,`b`);(0,`1`,1,`a`);(1,`0`,1,`a`);(1,`1`,2,`b`);(2,`0`,1,`a`);(2,`1`,0,`a`)]) ;;

let MMo1 = 
    ([0;1],   
     0,
     [`0`;`1`],
     [`0`;`1`],
     [(0,`0`,1);(0,`1`,0);(1,`0`,1);(1,`1`,0)],
     [(0,`0`);(1,`1`)]) ;;

let MMo2 = 
    ([0;1;2;3;4],   
     0,
     [`0`;`1`],
     [`A`;`E`;`I`;`O`;`U`],
     [(0,`0`,1);(0,`1`,3);(1,`0`,4);(1,`1`,2);(2,`0`,2);(2,`1`,3);(3,`0`,3);(3,`1`,4);(4,`0`,0);(4,`1`,2)],
     [(0,`A`);(1,`E`);(2,`I`);(3,`O`);(4,`U`)]) ;;


(************************************************ FUNCIONES GENERALES ************************************************)


(* Funcion que recibe una transicion (estado actual, valor leido, transicion a realizar) y retorna el estado actual *)

let obtenerEstActTran = function 
    (estAct, _, _) -> estAct ;;
    
(* Funcion que recibe una transicion (estado actual, valor actual, transicion a realizar) y retorna el valor actual *)  

let obtenerValActTran = function 
    (_, valAct, _) -> valAct ;;

(* Funcion que recibe una transicion (estado actual, valor leido, transicion a realizar) y retorna la transicion a realizar *)

let obtenerEstTran = function 
    (_, _, estTran) -> estTran ;;

(* 
    Funcion que comprueba si una transicion hace match con un el estado actual y el valor actual leido 
    Recibe
        estAct: es el estado actual 
        valor: es el valor a leer 
        tran: contiene la informacion de la transicion actual a comprobar
    Retorna: el estado al que hay que moverse, sino un -1
*)

let obtenerTranAct = fun estAct valor tran -> 
    if  estAct = (obtenerEstActTran tran) && 
        valor = (obtenerValActTran tran) then
            (obtenerEstTran tran)
    else 
        (-1) ;;

(* 
    Funcion que busca cual es la transicion a realizar, segun el estado actual y el valor leido 
    Recibe
        estAct: es el estado actual 
        valor: es el valor a leer 
        patternMathing: una lista que contiene todas las transiciones disponibles 
    Retorna: la transicion a realizar, sino un -1
*)

let rec buscarTranAct = fun estAct valor -> function 
    [] -> (-1) |
    cabeza :: resto ->  
        if (obtenerTranAct estAct valor cabeza) = -1 then 
            buscarTranAct estAct valor resto
        else 
            (obtenerTranAct estAct valor cabeza) ;;

(* 
    Funcion que busca cuales son las transiciones a realizar, segun el estado actual y el valor leido 
    Recibe
        estAct: es el estado actual 
        valor: es el valor a leer 
        patternMathing: una lista que contiene todas las transiciones disponibles 
    Retorna: una lista con las transiciones a realizar, sino una lista vacia
*)

let rec buscarTransActs = fun estAct valor -> function 
    [] -> [] |
    cabeza :: resto ->  
        if (obtenerTranAct estAct valor cabeza) = -1 then 
            buscarTransActs estAct valor resto
        else 
            (obtenerTranAct estAct valor cabeza) :: (buscarTransActs estAct valor resto) ;;

(* Funcion que recibe una transicion (estado actual, valor leido, transicion a realizar, accion) y retorna el estado actual *)

let obtenerEstActTranTupla4 = function 
    (estAct, _, _, _) -> estAct ;;

(* Funcion que recibe una transicion (estado actual, valor leido, transicion a realizar, accion) y retorna el valor leido *)

let obtenerValActTranTupla4 = function 
    (_, valAct, _, _) -> valAct ;;

(* Funcion que recibe una transicion (estado actual, valor leido, transicion a realizar, accion) y retorna la transicion a realizar *)

let obtenerEstTranTupla4 = function 
    (_, _, estTran, _) -> estTran ;;

(* Funcion que recibe una transicion (estado actual, valor leido, transicion a realizar, accion) y retorna la accion a realizar *)

let obtenerAccionTranTupla4 = function 
    (_, _, _, accion) -> accion ;;

(* 
    Funcion que comprueba si una transicion hace match con un el estado actual y el valor actual leido 
    Recibe
        estAct: es el estado actual 
        valor: es el valor a leer 
        tran: contiene la informacion de la transicion actual a comprobar
    Retorna: el estado y la accion a realizar, sino una tupla con un -1 y un caracter 0
*)

let obtenerTranYAccionTupla4 = fun estAct valor tran -> 
    if  estAct = (obtenerEstActTranTupla4 tran) && 
        valor = (obtenerValActTranTupla4 tran) then
            ((obtenerEstTranTupla4 tran), (obtenerAccionTranTupla4 tran))
    else 
        ((-1), `0`) ;;

(* 
    Funcion que busca cual es la transicion y accion a realizar, segun el estado actual y el valor leido 
    Recibe
        estAct: es el estado actual 
        valor: es el valor a leer 
        patternMathing: una lista que contiene todas las transiciones disponibles 
    Retorna: una tupla con la transicion y movimiento de cabeza lectora a realizar, sino una tupla con un -1 y un `0`
*)

let rec buscarTranYAccionTupla4 = fun estAct valor -> function 
    [] -> ((-1), `0`) |
    cabeza :: resto ->  
        if (obtenerTranYAccionTupla4 estAct valor cabeza) = ((-1), `0`) then 
            buscarTranYAccionTupla4 estAct valor resto
        else 
            obtenerTranYAccionTupla4 estAct valor cabeza ;;

(* Funcion que recibe una quintupla (estados, estadoInicial, estadosFinales, alfabeto y transiciones) y retorna los estados *)

let obtenerEstadosQuintupla = function 
    (estados, _, _, _, _) -> estados ;;

(* Funcion que recibe una quintupla (estados, estadoInicial, estadosFinales, alfabeto y transiciones) y retorna el estado actual *)

let obtenerEstadoActualQuintupla = function 
    (_, estadoActual, _, _, _) -> estadoActual ;;

(* Funcion que recibe una quintupla (estados, estadoInicial, estadosFinales, alfabeto y transiciones) y retorna los estados finales *)

let obtenerEstadosFinalesQuintupla = function 
    (_, _, estadosFinales, _, _) -> estadosFinales ;;

(* Funcion que recibe una quintupla (estados, estadoInicial, alfabetoEntrada, alfabetoSalida y transiciones) y retorna el alfabeto entrada *)

let obtenerAlfabetoEntradaQuintupla = function 
    (_, _, alfabetoEntrada, _, _) -> alfabetoEntrada ;;

(* Funcion que recibe una quintupla (estados, estadoInicial, estadosFinales, alfabeto y transiciones) y retorna el alfabeto *)

let obtenerAlfabetoQuintupla = function 
    (_, _, _, alfabeto, _) -> alfabeto ;;

(* Funcion que recibe una quintupla (estados, estadoInicial, estadosFinales, alfabeto y transiciones) y retorna las transiciones *)

let obtenerTransicionesQuintupla = function 
    (_, _, _, _, transiciones) -> transiciones ;;


(* Funcion que recibe una sextupla (estados, estadoInicial, alfabetoEntrada, alfabetoSalida, transiciones y escritura estados) y retorna los estados *)

let obtenerEstadosSextupla = function 
    (estados, _, _, _, _, _) -> estados ;;

(* Funcion que recibe una sextupla (estados, estadoInicial, alfabetoEntrada, alfabetoSalida, transiciones y escritura estados) y retorna el estado actual *)

let obtenerEstadoActualSextupla = function 
    (_, estadoActual, _, _, _, _) -> estadoActual ;;

(* Funcion que recibe una sextupla (estados, estadoInicial, alfabetoEntrada, alfabetoSalida, transiciones y escrituras por estado) y retorna el alfabeto de entrada *)

let obtenerAlfabetoEntradaSextupla = function 
    (_, _, alfabetoEntrada, _, _, _) -> alfabetoEntrada ;;

(* Funcion que recibe una sextupla (estados, estadoInicial, alfabetoEntrada, alfabetoSalida, transiciones y escritura estados) y retorna el alfabeto salida *)

let obtenerAlfabetoSalidaSextupla = function 
    (_, _, _, alfabetoSalida, _, _) -> alfabetoSalida ;;

(* Funcion que recibe una sextupla (estados, estadoInicial, alfabetoEntrada, alfabetoSalida, transiciones y escritura estados) y retorna las transiciones *)

let obtenerTransicionesSextupla = function 
    (_, _, _, _, transiciones, _) -> transiciones ;;

(* Funcion que recibe una sextupla (estados, estadoInicial, alfabetoEntrada, alfabetoSalida, transiciones y escritura estados) y retorna escrituras por estado *)

let obtenerEscriturasXEstadoSextupla = function 
    (_, _, _, _, _, escriturasXEstado) -> escriturasXEstado ;;


(********************************************** FUNCIONES AEFD ************************************************)


(* 
    Funcion (ExecAuxAEFD) que simula el comportamiento de una AEFD
    Recibe
        ests: es una lista de enteros con los estados disponibles
        estAct: es un entero que representa el estado actual 
        estsFins: una lista de enteros con estados finales 
        alf: una lista de caracteres que conforman el alfabeto 
        trans: una lista con las transiciones disponibles
        tira: es un string que representa la tira a evaluar 
        largo: es un entero que representa el largo de la tira 
    Retorna: verdadero en caso de terminar en un estado de aceptacion, falso de lo contrario
*)

let rec ExecAuxAEFD = 
    fun ests estAct estsFins alf trans tira largo -> 
        if tira = "" then mem estAct estsFins
        else 
            if mem tira.[0] alf && mem estAct ests then 
                ExecAuxAEFD ests (buscarTranAct estAct tira.[0] trans) estsFins alf trans (sub_string tira 1 largo) (largo - 1) 
            else 
                false ;;
     
(* recibe un AEFD y una tira y retorna verdadero en caso de aceptar la tira, falso de lo contrario*)
let ExecAEFD = fun AEFD tira -> 
    ExecAuxAEFD 
        (obtenerEstadosQuintupla AEFD) 
        (obtenerEstadoActualQuintupla AEFD)
        (obtenerEstadosFinalesQuintupla AEFD)
        (obtenerAlfabetoQuintupla AEFD)
        (obtenerTransicionesQuintupla AEFD)
        tira 
        (string_length tira - 1) ;;


(********************************************** FUNCIONES AEFND ************************************************)


(* 
    Funcion (ejecutarTransActsAEFND) iterar recursivamente todos las posibles transiciones
    Recibe
        ests: es una lista de enteros con los estados disponibles
        estAct: es un entero que representa el estado actual 
        estsFins: una lista de enteros con estados finales 
        alf: una lista de caracteres que conforman el alfabeto 
        trans: una lista con las transiciones disponibles
        tira: es un string que representa la tira a evaluar 
        largo: es un entero que representa el largo de la tira 
        patternMathing: con todas las posibles transiciones segun el estado actual y valor leido
    Retorna: falso en caso de que ninguna transicion haya sido un estado final, verdadero de lo contrario
*)

(* 
    Funcion (ExecAuxAEFND) que simula el comportamiento de una AEFND
    Recibe
        ests: es una lista de enteros con los estados disponibles
        estAct: es un entero que representa el estado actual 
        estsFins: una lista de enteros con estados finales 
        alf: una lista de caracteres que conforman el alfabeto 
        trans: una lista con las transiciones disponibles
        tira: es un string que representa la tira a evaluar 
        largo: es un entero que representa el largo de la tira 
    Retorna: verdadero en caso de terminar en un estado de aceptacion, falso de lo contrario
*)

let rec ejecutarTransActsAEFND = fun ests estAct estsFins alf trans tira largo -> function 
    [] -> false |
    cabeza :: resto -> 
        if (ExecAuxAEFND ests cabeza estsFins alf trans (sub_string tira 1 largo) (largo - 1)) = true 
            then true 
        else    
            (ejecutarTransActsAEFND ests estAct estsFins alf trans tira largo resto) 
    and 
        ExecAuxAEFND = 
            fun ests estAct estsFins alf trans tira largo -> 
                if tira = "" then mem estAct estsFins
                else 
                    if  mem tira.[0] alf && 
                        mem estAct ests && 
                        (ejecutarTransActsAEFND ests estAct estsFins alf trans tira largo (buscarTransActs estAct tira.[0] trans)) 
                            then true    
                    else 
                        false ;;
     
(* recibe un AEFND y una tira y retorna verdadero en caso de aceptar la tira, falso de lo contrario *)

let ExecAEFND = fun AEFND tira -> 
    ExecAuxAEFND 
        (obtenerEstadosQuintupla AEFND) 
        (obtenerEstadoActualQuintupla AEFND)
        (obtenerEstadosFinalesQuintupla AEFND)
        (obtenerAlfabetoQuintupla AEFND)
        (obtenerTransicionesQuintupla AEFND)
        tira 
        (string_length tira - 1) ;; 


(********************************************** FUNCIONES A2V ***********************************************)


(* 
    Funcion (ExecAuxA2V) que simula el comportamiento de una AEFD
    Recibe
        ests: es una lista de enteros con los estados disponibles
        estAct: es un entero que representa el estado actual 
        estsFins: una lista de enteros con estados finales 
        alf: una lista de caracteres que conforman el alfabeto 
        trans: una lista con las transiciones disponibles
        tira: es un string que representa la tira a evaluar 
        largo: es un entero que representa el largo de la tira 
        posTira: es un entero que indica en cual posicion esta la cabezara lectora 
        cont: es un entero que indica la cantidad de iteraciones 
    Retorna: verdadero en caso de terminar en un estado de aceptacion, falso de lo contrario
*)

let rec ExecAuxA2V = 
    fun ests estAct estsFins alf trans tira largo posTira cont -> 
        if cont > 500000 then false                          (* caso en que se cicle *) 
        else  
            if posTira == largo || posTira = -1 then mem estAct estsFins
            else 
                if mem tira.[posTira] alf && mem estAct ests then 
                    if (snd (buscarTranYAccionTupla4 estAct tira.[posTira] trans)) = `R` then 
                        ExecAuxA2V ests (fst (buscarTranYAccionTupla4 estAct tira.[posTira] trans)) estsFins alf trans tira largo (posTira + 1) (cont + 1) 
                    else 
                        ExecAuxA2V ests (fst (buscarTranYAccionTupla4 estAct tira.[posTira] trans)) estsFins alf trans tira largo (posTira - 1) (cont + 1)
                else 
                    false ;;
     
(* recibe un A2V y una tira y retorna verdadero en caso de aceptar la tira, falso de lo contrario*)
let ExecA2V = fun A2V tira -> 
    ExecAuxA2V 
        (obtenerEstadosQuintupla A2V) 
        (obtenerEstadoActualQuintupla A2V)
        (obtenerEstadosFinalesQuintupla A2V)
        (obtenerAlfabetoQuintupla A2V)
        (obtenerTransicionesQuintupla A2V)
        tira 
        (string_length tira)
        0 
        0 ;;


(********************************************** FUNCIONES MMe ***********************************************)


(* 
    Funcion (ExecMMeAux) que simula el comportamiento de una MMe
    Recibe
        ests: es una lista de enteros con los estados disponibles
        estAct: es un entero que representa el estado actual 
        alfEnt: una lista de caracteres que representan el alfabeto de entrada 
        alfSal: una lista de caracteres que representan el alfabeto de salida 
        trans: una lista con las transiciones disponibles
        tira: es un string que representa la tira a evaluar 
        largo: es un entero que representa el largo de la tira 
    Retorna: un string con la tira de salida de la maquina MMe 
*)

let rec ExecMMeAux = fun ests estAct alfEnt alfSal trans tira largo -> 
    if tira = "" then ""  
    else 
        if mem tira.[0] alfEnt && mem estAct ests then 
            make_string 1 
                    (snd (buscarTranYAccionTupla4 estAct tira.[0] trans)) 
                ^ 
                    ExecMMeAux ests (fst (buscarTranYAccionTupla4 estAct tira.[0] trans)) alfEnt alfSal trans (sub_string tira 1 largo) (largo - 1) 
        else 
            ""  ;;

(* recibe un MMe y una tira y retorna la tira de salida correspondiente *)

let ExecMMe = fun MMe tira -> 
    ExecMMeAux 
        (obtenerEstadosQuintupla MMe) 
        (obtenerEstadoActualQuintupla MMe)
        (obtenerAlfabetoEntradaQuintupla MMe)
        (obtenerAlfabetoQuintupla MMe)
        (obtenerTransicionesQuintupla MMe)
        tira 
        (string_length tira - 1) ;;


(********************************************** FUNCIONES MMo ***********************************************)

(* 
    Funcion que busca cual es la transicion a realizar, segun el estado actual y el valor leido 
    Recibe
        estAct: es el estado actual 
        valor: es el valor a leer 
        patternMathing: una lista que contiene todas las escrituras por estado 
    Retorna: la escritura a realizar, sino un `0`
*)

let rec buscarEscXEst = fun estAct -> function 
    [] -> `0` |
    cabeza :: resto ->  
        if (fst cabeza) = estAct then 
            (snd cabeza)
        else 
            (buscarEscXEst estAct resto) ;;

(* 
    Funcion que simula el comportamiento de una MMe
    Recibe
        ests: es una lista de enteros con los estados disponibles
        estAct: es un entero que representa el estado actual 
        alfEnt: una lista de caracteres que representan el alfabeto de entrada 
        alfSal: una lista de caracteres que representan el alfabeto de salida 
        trans: una lista con las transiciones disponibles
        escsXEst: una lista con el simbolo a escribir por cada estado
        tira: es un string que representa la tira a evaluar 
        largo: es un entero que representa el largo de la tira 
    Retorna: un string con la tira de salida de la maquina MMo 
*)

let rec ExecMMoAux = fun ests estAct alfEnt alfSal trans escsXEst tira largo -> 
    if tira = "" then 
        make_string 1
            (buscarEscXEst estAct escsXEst) ^ "" 

    else 
        if mem tira.[0] alfEnt && mem estAct ests then 
            make_string 1 
                    (buscarEscXEst estAct escsXEst) 
                ^ 
                    ExecMMoAux ests (buscarTranAct estAct tira.[0] trans) alfEnt alfSal trans escsXEst (sub_string tira 1 largo) (largo - 1) 
        else 
            ""  ;;


(* recibe un MMo y una tira y retorna la tira de salida correspondiente *)

let ExecMMo = fun MMo tira -> 
    if tira = "" then ""
    else 
        ExecMMoAux 
            (obtenerEstadosSextupla MMo) 
            (buscarTranAct 0 tira.[0] (obtenerTransicionesSextupla MMo))
            (obtenerAlfabetoEntradaSextupla MMo)
            (obtenerAlfabetoSalidaSextupla MMo)
            (obtenerTransicionesSextupla MMo)
            (obtenerEscriturasXEstadoSextupla MMo)
            (sub_string tira 1 (string_length tira - 1)) 
            (string_length tira - 2) ;;


(********************************************** FUNCION DETERMINAR DETERMINISTMO ***********************************************)

(*
    Funcion que verifica si una transicion de 3 elementos, tiene estados no deterministicos 
    Recibe: 
        estAct: es un entero que representa el estado actual 
        valAct: es un caracter que representa el valor leido actual 
        patternMathing: con una lista que contiene tuplas con 3 elementos que representan las transiciones 
    Retorna: Verdadero en caso de que hayan no determinismos, falso de lo contrario
*)

let rec tieneNoDeterTransTupla3 = fun estAct valAct -> function 
    [] -> false |
    cabeza :: resto ->  
        if (obtenerTranAct estAct valAct cabeza) = -1 then 
            tieneNoDeterTransTupla3 estAct valAct resto
        else 
            true ;;

(*
    Funcion que verifica si una transicion con tuplas de 3 elementos es deterministico
    Recibe: 
        patternMathing: recibe una lista que contien tuplas de tres elementos que representa las transiciones 
    Retorna: Verdadero en caso en caso de que el automata sea deterministico, falso de lo contrario
*)

let rec DeterministicopTransTupla3 = function  
    [] -> true |
    tranAct :: resto ->  
        if (tieneNoDeterTransTupla3 (obtenerEstActTran tranAct) (obtenerValActTran tranAct) resto) = true then 
            false 
        else DeterministicopTransTupla3 resto ;;

(* Funcion que recibe un automata y retorna verdadero en caso de ser deterministico *)

let Deterministicop = function automata -> 
    DeterministicopTransTupla3 (obtenerTransicionesQuintupla automata)  ;;


(********************************************** FUNCIONES DE CONVERSION ***********************************************)

(*
    Funcion que crea un archivo .txt con la informacion del paso a paso de la conversion de MMo a MMe  
    Recibe: 
        nombreArchivo: es un strin que contien el nombre del archivo a generar
        pasoAPaso: es string que contiene todos los pasos realizados  
    Retorna: un archivo de texto con la informacion del paso a paso 
*)

let crearBitacoraMMoToMMe = fun nombreArchivo pasoAPaso ->
    let canalSalida = open_out nombreArchivo in
    output_string canalSalida pasoAPaso;
    close_out canalSalida;;

(*
    Funcion que escribe, en un string, todos los pasos realizados en la conversion de un MMo a MMe   
    Recibe: 
        cont: es un numero entero, que enumera los pasos
        patternMathing: recibe la transicion convertida a MMe 
    Retorna: un string con la informacion de cada paso realizado
*)

let rec escribirPasoAPasoMMoToMMe = function cont -> function 
    [] -> "" |
    tranAct :: resto ->
        "Paso #" ^ 
        string_of_int cont ^ 
        " para el estado " ^
        string_of_int (obtenerEstActTranTupla4 tranAct) ^ 
        " cuando se lea el simbolo " ^
        make_string 1 (obtenerValActTranTupla4 tranAct) ^ 
        " hacer una transicion al estado " ^ 
        string_of_int (obtenerEstTranTupla4 tranAct) ^ 
        " y escribir el simbolo " ^ 
        make_string 1 (obtenerAccionTranTupla4 tranAct) ^ 
        "\n" ^
        escribirPasoAPasoMMoToMMe (cont + 1) resto ;;

(* 
    Funcion que convierte las transiciones de MMo a MMe
    Recibe
        ests: es una lista de enteros con los estados disponibles
        estAct: es un entero que representa el estado actual 
        alfEnt: una lista de caracteres que representan el alfabeto de entrada 
        alfSal: una lista de caracteres que representan el alfabeto de salida 
        escsXEst: una lista con el simbolo a escribir por cada estado
        patternMathing: recibe la transicion MMo 
    Retorna: un string con la tira de salida de la maquina MMe 
*)

let rec MMoToMMeAux = fun ests estAct alfEnt alfSal escsXEst -> function 
    [] -> [] |
    tranAct :: resto -> 
        ((obtenerEstActTran tranAct), 
        (obtenerValActTran tranAct), 
        (obtenerEstTran tranAct), 
        (buscarEscXEst (obtenerEstTran tranAct) escsXEst)) 
        :: 
        MMoToMMeAux ests estAct alfEnt alfSal escsXEst resto ;;

(* Funcion que recibe un MMo y un nombre de archivo, devuelte el MMo convertido a MMe y un archivo de texto con los paso realizados *)

let MMoToMMe = fun MMo nombreArchivo -> 
    fst ( ((obtenerEstadosSextupla MMo), 
    (obtenerEstadoActualSextupla MMo),
    (obtenerAlfabetoEntradaSextupla MMo),
    (obtenerAlfabetoSalidaSextupla MMo),
    (MMoToMMeAux 
        (obtenerEstadosSextupla MMo) 
        (obtenerEstadoActualSextupla MMo)
        (obtenerAlfabetoEntradaSextupla MMo)
        (obtenerAlfabetoSalidaSextupla MMo)
        (obtenerEscriturasXEstadoSextupla MMo)
        (obtenerTransicionesSextupla MMo))), 
    (crearBitacoraMMoToMMe
        nombreArchivo
        (escribirPasoAPasoMMoToMMe 
            1
            (MMoToMMeAux 
                (obtenerEstadosSextupla MMo) 
                (obtenerEstadoActualSextupla MMo)
                (obtenerAlfabetoEntradaSextupla MMo)
                (obtenerAlfabetoSalidaSextupla MMo)
                (obtenerEscriturasXEstadoSextupla MMo)
                (obtenerTransicionesSextupla MMo)))) ) ;;