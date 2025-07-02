; (load "c:/Lenguajes/code/Calculadora-Historica-Sequeira-Steven.scm")

; -------------------------Portada----------------------------------------------------------------
; Tarea: Calculadora Histórica 
; Estudiante: Steven Sequeira Araya 
; Carnet: 2022080836
; Instituto Tecnológico de Costa Rica 
; Escuela Ingeniería en Computación 
; Lenguajes de Programación 
; Fecha de entrega: 16/03/2024


; -------------------------Manual de Usuario-------------------------------------------------------

; Primero se debe descargar y guardar este archivo
; Para poder usar las funciones se debe usar la palabra clase load para cargarlo dentro de Scheme.
;   Caso general: (load "ubicacion/nombreArchivo")
;   Por ejemplo: (load "c:/Lenguajes/code/Calculadora-Historica-Sequeira-Steven.scm")

; Tenemos 6 operaciones disponibles (suma, resta, multiplicacion, division entera, residuo y modulo)
; Tenemos 8 numeraciones disponibles (numeros tradicionales, Romanos, Egipcios, Mayas, Babilónicos, Chinos, Kukulkan, Tengwars)

; NOTA IMPORTANTE: todas las numeraciones cuentan con el estandar del enunciado menos la de los Mayas, ya que en esta se tuvo cambiar el uso 
;                  del simbolo pipe por un (!), ya que el pipe daba ciertos problemas al ejecutarse

; Para probar cada operación se debe hacer: 

;   suma: Se debe ingresar 4 parámetros para usar la funcion
;       1- palabra clave (suma) que se refiere a la funcion de sumar 
;       2- letra o número que representa la numeración destino (resultado final)
;       3- una lista con 2 parámetros:
;           3.1: letra o número que representa la numeración del operando 1
;           3.2: una lista que representa los digitos del operando 1 
;       4- una lista con 2 parámetros:
;           4.1: letra o número que representa la numeración del operando 2
;           4.2: una lista que representa los digitos del operando 2
;       Ejemplo de uso: 
;           Entrada: (suma 'R '(10 (2 0 2 2)) '(2 (1 0)))
;           Salida: (R (M M X X I V))

;   resta: Se debe ingresar 4 parámetros para usar la funcion 
;       1- palabra clave (resta) que se refiere a la funcion de restar 
;       2- letra o número que representa la numeración destino (resultado final)
;       3- una lista con 2 parámetros:
;           3.1: letra o número que representa la numeración del operando 1
;           3.2: una lista que representa los digitos del operando 1 
;       4- una lista con 2 parámetros:
;           4.1: letra o número que representa la numeración del operando 2
;           4.2: una lista que representa los digitos del operando 2
;       Ejemplo de uso: 
;           Entrada: (resta 'R '(10 (2 0 2 2)) '(2 (1 0)))
;           Salida: (R (M M X X))

;   multiplicacion: Se debe ingresar 4 parámetros para usar la funcion 
;       1- palabra clave (multiplicacion) que se refiere a la funcion de multiplicar 
;       2- letra o número que representa la numeración destino (resultado final)
;       3- una lista con 2 parámetros:
;           3.1: letra o número que representa la numeración del operando 1
;           3.2: una lista que representa los digitos del operando 1 
;       4- una lista con 2 parámetros:
;           4.1: letra o número que representa la numeración del operando 2
;           4.2: una lista que representa los digitos del operando 2
;       Ejemplo de uso: 
;           Entrada: (multiplicacion 'R '(10 (1 2 0 0)) '(2 (1 0)))
;           Salida: (R (M M C D))

;   division entera: Se debe ingresar 4 parámetros para usar la funcion 
;       1- palabra clave (divisionEntera) que se refiere a la funcion de dividir 
;       2- letra o número que representa la numeración destino (resultado final)
;       3- una lista con 2 parámetros:
;           3.1: letra o número que representa la numeración del operando 1
;           3.2: una lista que representa los digitos del operando 1 
;       4- una lista con 2 parámetros:
;           4.1: letra o número que representa la numeración del operando 2
;           4.2: una lista que representa los digitos del operando 2
;       Ejemplo de uso: 
;           Entrada: (divisionEntera 'R '(10 (1 2 0 0)) '(2 (1 0)))
;           Salida: (R (D C))

;   residuo: Se debe ingresar 4 parámetros para usar la funcion 
;       1- palabra clave (residuo) que se refiere a la funcion de obtener el residuo o resto 
;       2- letra o número que representa la numeración destino (resultado final)
;       3- una lista con 2 parámetros:
;           3.1: letra o número que representa la numeración del operando 1
;           3.2: una lista que representa los digitos del operando 1 
;       4- una lista con 2 parámetros:
;           4.1: letra o número que representa la numeración del operando 2
;           4.2: una lista que representa los digitos del operando 2
;       Ejemplo de uso: 
;           Entrada: (residuo 'R '(10 (1 2 0 5)) '(2 (1 1)))
;           Salida: (R (I I))

;   complemento: Se debe ingresar 3 parámetros para usar la funcion 
;       1- palabra clave (complemento) que se refiere a la funcion de obtener el complemento 
;       2- número que representa la numeración destino (resultado final)
;       3- una lista con 2 parámetros:
;           3.1: número que representa la numeración del operando 1
;           3.2: una lista que representa los digitos del operando 1 
;       Ejemplo de uso: 
;           Entrada: (complemento 2 '(10 (9 0 7)))
;           Salida: (2 (1 0 1 1 1 0 1))


; -------------------------Análisis de Resultados----------------------------------------------------

; Tabla de autocalificación:

; Parte                        calificación
; Portada                           A
; Manual de usuario                 A 
; Análisis de Resultados            A 
; Operación suma                    A 
; Operación resta                   A
; Operación multiplicación          A
; Operación división entera         A
; Operación residuo                 A
; Operación complemento             A
; Numeración tradicional            A 
; Numeración Romana                 A
; Numeración Egipcia                A
; Numeración Maya                   A
; Numeración Babilónica             A
; Numeración China                  A
; Numeración Kukulkan               A
; Numeración Kukulkan Grande        E
; Numeración asignada               A


; Equivalencia de calificación
; A - Concluído con éxito
; B - Concluido con problemas pequeños
; C - Concluido con problemas mayores
; D - Concluido solo en diseño
; E - No implementado



; -------------------------Implementacion de Funciones------------------------------------------------


; -------------------------Funciones Auxiliares-------------------------------------------------------

; Funcion que retorna cuantos digitos tiene un numero
(define (nDigitos num)
    (cond
        ((zero? num) 0)
        (#t (add1 (nDigitos (quotient num 10))))))


; Funcion que convierte un numero entero a una lista
(define (numToList num)
    (cond
        ((zero? num) '())
        (#t (append (numToList (quotient num 10)) (cons (remainder num 10) '())))))

; Funcion queo convierte una lista de numeros a un numero 
(define (listToNum nums)
    (cond 
        ((null? nums) 0)
        (#t (+ (* (car nums) (expt 10 (sub1 (length nums)))) (listToNum (cdr nums))))))


; Funcion que retorna n veces un elemento ingresado
(define (clone X N)
    (cond
        ((zero? N) '())
        (#t (cons X (clone X (sub1 N))))))


; Funcion que coloca todas las sublistas de una lista en una sola lista
(define (quitarSubListas L)
    (cond   
        ((null? L) '())
        ((list? (car L)) (append (quitarSubListas (car L)) (quitarSubListas (cdr L))))
        (#t (cons (car L) (quitarSubListas (cdr L))))))

; Funcion que devuelve una sublista desde una posicion inicial hasta una final
(define (obtSubList l act ini fin)
    (cond
        ((>= act fin) '())
        ((>= act ini) (cons (car l) (obtSubList (cdr l) (add1 act) ini fin)))
        (#t (obtSubList (cdr l) (add1 act) ini fin))))


; -----------------------------------------Funciones Aritmeticas------------------------------------------------------

; Funcion que convierte una numeracion a decimal 
; Recibe:
;   numeracion: una letra o numero que representa la numeracion a convertir 
;   num: un numero escrito en esa numeracion
; Retorna: la numeracion convertida a decimal

(define (converXNumeracionToDecimal numeracion num)
    (cond   
        ((and (eq? 'R numeracion) (> (romToNum num) 3999)) (error "El romano ingresado causa overflow")) ; Manejo overflow romano  
        ((and (eq? 'E numeracion) (> (egipToNum num) 9999999)) (error "El egipcio ingresado causa overflow")) ; Manejo overflow egipcio
        ((and (eq? 'K numeracion) (> (kukToNum num 8) (expt 20 9))) (error "El kukulkan ingresado causa overflow")) ; Manejo overflow kukulkan
        ((number? numeracion) (baseNToBase10 num numeracion)) ; caso en que sea un numero tradicional, la numeracion representa la base
        ((eq? 'R numeracion) (romToNum num))        ; caso en que sea un numero romano
        ((eq? 'E numeracion) (egipToNum num))    ; caso en que sea un numero egipcio
        ((eq? 'M numeracion) (mayaToNum (reverse num)))    ; caso en que sea un numero maya
        ((eq? 'B numeracion) (babToNum num))    ; caso en que sea un numero babilonico
        ((eq? 'C numeracion) (chinToNum num))    ; caso en que sea un numero chino
        ((eq? 'K numeracion) (kukToNum num 8))    ; caso en que sea un numero kukulkan
        ((eq? 'T numeracion)  (tengToNum (reverse num)))    ; caso en que sea un numero tengwar
        (#t (error "Se ha ingresado una numeracion invalida para los operandos"))))


; Funcion que convierte de decimal a una numeracion destino con el formato correcto
; Recibe:
;   numDes: una letra o numero que representa la numeracion destino 
;   num: el numero decimal a convertir a la numeracion destino
; Retorna: el decimal convertido en la numeracion con el formato correcto

(define (converDecimalToXNumeracion numDes num)
    (cond   
        ((and (eq? 'R numDes) (> num 3999)) (error "El resultado de la operacion causa overflow para retornar el resultado en romano")) ; Manejo overflow romano  
        ((and (eq? 'E numDes) (> num 9999999)) (error "El resultado de la operacion causa overflow para retornar el resultado en egipcio")) ; Manejo overflow egipcio  
        ((and (eq? 'K numDes) (>= num (expt 20 9))) (error "El resultado de la operacion causa overflow para retornar el resultado en kukulkan")) ; Manejo overflow kukulkan  
        ((number? numDes) (resBase10ToBaseN num numDes)) ; caso en que sea un numero tradicional, la numeracion representa la base
        ((eq? 'R numDes) (resNumToRom (reverse (numToList num))))    ; caso en que sea un numero romano
        ((eq? 'E numDes) (resNumToEgips (numToEgip (reverse (numToList num)))))    ; caso en que sea un numero egipcio
        ((eq? 'M numDes) (resNumToMaya num))    ; caso en que sea un numero maya
        ((eq? 'B numDes) (resNumToBab num))    ; caso en que sea un numero babilonico
        ((eq? 'C numDes) (resNumToChin (reverse (numToList num))))    ; caso en que sea un numero chino
        ((eq? 'K numDes) (resNumToKuk (completarCerosKuk (numToKuk num))))    ; caso en que sea un numero kukulkan
        ((eq? 'T numDes) (resNumToTeng num))    ; caso en que sea un numero tengwar
        (#t (error "Se ha ingresado una numeracion destino invalida"))))



; Funcion que suma dos numeraciones y retorna el resultado en la numeracion destino
; Recibe: 
;   numDes: una numeracion destino, que es una letra o numero que represanta la numeracion
;   ope1: un operando 1 que es una lista que contiene una letra o numero que representa la numeracion y el numero como tal en esa numeracion     
;   ope2: un operando 2 que es una lista que contiene una letra o numero que representa la numeracion y el numero como tal en esa numeracion
; Retorna: una lista con una letra que representa la numeracion destino y una sublista con los digitos del resultado de la suma

(define (suma numDes ope1 ope2) 
    (converDecimalToXNumeracion
        numDes 
        (+ 
            (converXNumeracionToDecimal (car ope1) (car (cdr ope1)))
            (converXNumeracionToDecimal (car ope2) (car (cdr ope2))))))


; Funcion que resta dos numeraciones y retorna el resultado en la numeracion destino
; Recibe: 
;   numDes: una numeracion destino, que es una letra o numero que represanta la numeracion
;   ope1: un operando 1 que es una lista que contiene una letra o numero que representa la numeracion y el numero como tal en esa numeracion     
;   ope2: un operando 2 que es una lista que contiene una letra o numero que representa la numeracion y el numero como tal en esa numeracion
; Retorna: una lista con una letra que representa la numeracion destino y una sublista con los digitos del resultado de la resta

(define (resta numDes ope1 ope2) 
    (cond 
        ((> 0  
            (- 
                (converXNumeracionToDecimal (car ope1) (car (cdr ope1)))
                (converXNumeracionToDecimal (car ope2) (car (cdr ope2)))))  
            (cons numDes (cons '(0) '())))|
        (#t (converDecimalToXNumeracion
                numDes 
                (- 
                    (converXNumeracionToDecimal (car ope1) (car (cdr ope1)))
                    (converXNumeracionToDecimal (car ope2) (car (cdr ope2))))))))


; Funcion que multiplica dos numeraciones y retorna el resultado en la numeracion destino
; Recibe: 
;   numDes: una numeracion destino, que es una letra o numero que represanta la numeracion
;   ope1: un operando 1 que es una lista que contiene una letra o numero que representa la numeracion y el numero como tal en esa numeracion     
;   ope2: un operando 2 que es una lista que contiene una letra o numero que representa la numeracion y el numero como tal en esa numeracion
; Retorna: una lista con una letra que representa la numeracion destino y una sublista con los digitos del resultado de la multiplicacion

(define (multiplicacion numDes ope1 ope2) 
    (converDecimalToXNumeracion
        numDes 
        (* 
            (converXNumeracionToDecimal (car ope1) (car (cdr ope1)))
            (converXNumeracionToDecimal (car ope2) (car (cdr ope2))))))


; Funcion que divide y obtiene la parte entera de dos numeraciones y retorna el resultado en la numeracion destino
; Recibe: 
;   numDes: una numeracion destino, que es una letra o numero que represanta la numeracion
;   ope1: un operando 1 que es una lista que contiene una letra o numero que representa la numeracion y el numero como tal en esa numeracion     
;   ope2: un operando 2 que es una lista que contiene una letra o numero que representa la numeracion y el numero como tal en esa numeracion
; Retorna: una lista con una letra que representa la numeracion destino y una sublista con los digitos del resultado de la division entera

(define (divisionEntera numDes ope1 ope2) 
    (converDecimalToXNumeracion
        numDes 
        (quotient 
            (converXNumeracionToDecimal (car ope1) (car (cdr ope1)))
            (converXNumeracionToDecimal (car ope2) (car (cdr ope2))))))


; Funcion que obtiene el residuo de dos numeraciones y retorna el resultado en la numeracion destino
; Recibe: 
;   numDes: una numeracion destino, que es una letra o numero que represanta la numeracion
;   ope1: un operando 1 que es una lista que contiene una letra o numero que representa la numeracion y el numero como tal en esa numeracion     
;   ope2: un operando 2 que es una lista que contiene una letra o numero que representa la numeracion y el numero como tal en esa numeracion
; Retorna: una lista con una letra que representa la numeracion destino y una sublista con los digitos del resultado del residuo

(define (residuo numDes ope1 ope2) 
    (converDecimalToXNumeracion
        numDes 
        (modulo 
            (converXNumeracionToDecimal (car ope1) (car (cdr ope1)))
            (converXNumeracionToDecimal (car ope2) (car (cdr ope2))))))


; Funcion que calcula el complemento de un numero decimal 
; Recibe 
;   nums: es una lista con los digitos decimales 
; Retorna: una lista con el resultado del complemento en decimal 

(define (complementoBase10 nums) 
    (cond 
        ((null? nums) '())
        (#t (cons (- 9 (car nums)) (complementoBase10 (cdr nums))))))

; Funcion que obtiene el complemento de un numero desde base 2 a 36 y retorna el resultado en la base destino
; Recibe: 
;   baseDes: es un numero entero desde 2 a 36 que indica cual va a ser la base final del resultado 
;   nums: es una lista que contiene un numero que representa la base y una sublista con digitos en esa base
; Retorna: una lista con una letra que representa la base destino y una sublista con los digitos del resultado del complemento

(define (complemento baseDes nums)
    (cond 
        ((number? baseDes) 
            (converDecimalToXNumeracion
                baseDes 
                (add1 (listToNum (complementoBase10 (reverse (numToList (converXNumeracionToDecimal (car nums) (car (cdr nums))))))))))
        (#t (error "La base destino debe ser un numero entero entre 2 a 36"))))


; -----------------------------------------Funciones para Numeros tradicionales------------------------------------------------

; Funcion que convierte la equivencia de un digito hasta la base 36 a base 10
; Recibe: 
;   dig: un digito de alguna base entre 2 a 36 
;   base: un numero que indica cual es la base del digito 
; Retorna: la equivalencia del digito de la numeracion a base decimal o error en caso de ser una base o digito invalido

(define (convDigBaseNToBase10 dig base)
    (cond   
        ((or (> base 36) (< base 2)) (error "La base debe ser mayor que 1 y menor que 37"))
        ((eq? dig '0) 0)
        ((eq? dig '1) 1)
        ((and (eq? dig '2) (> base 2)) 2)
        ((and (eq? dig '3) (> base 3)) 3)
        ((and (eq? dig '4) (> base 4)) 4)
        ((and (eq? dig '5) (> base 5)) 5)
        ((and (eq? dig '6) (> base 6)) 6)
        ((and (eq? dig '7) (> base 7)) 7)
        ((and (eq? dig '8) (> base 8)) 8)
        ((and (eq? dig '9) (> base 9)) 9)
        ((and (eq? dig 'A) (> base 10)) 10)
        ((and (eq? dig 'B) (> base 11)) 11)
        ((and (eq? dig 'C) (> base 12)) 12)
        ((and (eq? dig 'D) (> base 13)) 13)
        ((and (eq? dig 'E) (> base 14)) 14)
        ((and (eq? dig 'F) (> base 15)) 15)
        ((and (eq? dig 'G) (> base 16)) 16)
        ((and (eq? dig 'H) (> base 17)) 17)
        ((and (eq? dig 'I) (> base 18)) 18)
        ((and (eq? dig 'J) (> base 19)) 19)
        ((and (eq? dig 'K) (> base 20)) 20)
        ((and (eq? dig 'L) (> base 21)) 21)
        ((and (eq? dig 'M) (> base 22)) 22)
        ((and (eq? dig 'N) (> base 23)) 23)
        ((and (eq? dig 'O) (> base 24)) 24)
        ((and (eq? dig 'P) (> base 25)) 25)
        ((and (eq? dig 'Q) (> base 26)) 26)
        ((and (eq? dig 'R) (> base 27)) 27)
        ((and (eq? dig 'S) (> base 28)) 28)
        ((and (eq? dig 'T) (> base 29)) 29)
        ((and (eq? dig 'U) (> base 30)) 30)
        ((and (eq? dig 'V) (> base 31)) 31)
        ((and (eq? dig 'W) (> base 32)) 32)
        ((and (eq? dig 'X) (> base 33)) 33)
        ((and (eq? dig 'Y) (> base 34)) 34)
        ((and (eq? dig 'Z) (> base 35)) 35)
        (#t (error "Se le leyo un digito invalido para la base numerica solicita"))))


; Funcion que convierte bases numericas desde la 2 a la 36 a base decimal
; Recibe:
;   nums: es una lista de digitos de una base entre 2 a 36
;   base: es un numero entre 2 a 36 que indica la base del digito 
; Retorna: la numeracion convertida a un numero decimal 

(define (baseNToBase10 nums base)
    (cond 
        ((null? nums) 0)                                    ; Si llegamos al final de la lista se detiene y devuelve 0
        (#t (+                                              ; Sino usamos la formula general para convertir a base 10
                (*                                          ; obteniendo la multiplicacion
                    (convDigBaseNToBase10 (car nums) base)  ; del digito actual convertido a base 10
                    (expt base (sub1 (length nums))))       ; con la base numerica elevado al largo de la lista actual menos 1
                (baseNToBase10 (cdr nums) base)))))         ; y se suma con la llamada recusiva quitandole la cabeza actual a lista


; Funcion que convierte la equivencia de un digito en base 10 a alguna base desde la 2 a la 36
; Recibe: 
;   dig: un digito decimal 
;   base: un numero que indica a cual base debe convertise el digito
; Retorna: la equivalencia del digito decimal a la numeracion o error en caso de ser una base o digito invalido

(define (convDigBase10ToBaseN dig base)
    (cond   
        ((or (> base 36) (< base 2)) (error "La base debe ser mayor que 1 y menor que 37"))
        ((eq? dig '0) 0)
        ((eq? dig '1) 1)
        ((and (eq? dig '2) (> base 2)) 2)
        ((and (eq? dig '3) (> base 3)) 3)
        ((and (eq? dig '4) (> base 4)) 4)
        ((and (eq? dig '5) (> base 5)) 5)
        ((and (eq? dig '6) (> base 6)) 6)
        ((and (eq? dig '7) (> base 7)) 7)
        ((and (eq? dig '8) (> base 8)) 8)
        ((and (eq? dig '9) (> base 9)) 9)
        ((and (eq? dig '10) (> base 10)) 'A)
        ((and (eq? dig '11) (> base 11)) 'B)
        ((and (eq? dig '12) (> base 12)) 'C)
        ((and (eq? dig '13) (> base 13)) 'D)
        ((and (eq? dig '14) (> base 14)) 'E)
        ((and (eq? dig '15) (> base 15)) 'F)
        ((and (eq? dig '16) (> base 16)) 'G)
        ((and (eq? dig '17) (> base 17)) 'H)
        ((and (eq? dig '18) (> base 18)) 'I)
        ((and (eq? dig '19) (> base 19)) 'J)
        ((and (eq? dig '20) (> base 20)) 'K)
        ((and (eq? dig '21) (> base 21)) 'L)
        ((and (eq? dig '22) (> base 22)) 'M)
        ((and (eq? dig '23) (> base 23)) 'N)
        ((and (eq? dig '24) (> base 24)) 'O)
        ((and (eq? dig '25) (> base 25)) 'P)
        ((and (eq? dig '26) (> base 26)) 'Q)
        ((and (eq? dig '27) (> base 27)) 'R)
        ((and (eq? dig '28) (> base 28)) 'S)
        ((and (eq? dig '29) (> base 29)) 'T)
        ((and (eq? dig '30) (> base 30)) 'U)
        ((and (eq? dig '31) (> base 31)) 'V)
        ((and (eq? dig '32) (> base 32)) 'W)
        ((and (eq? dig '33) (> base 33)) 'X)
        ((and (eq? dig '34) (> base 34)) 'Y)
        ((and (eq? dig '35) (> base 35)) 'Z)
        (#t (error "Se le leyo un digito invalido para la base numerica solicita"))))


; Funcion que convirte un numero decimal a una base
; Recibe:
;   nums: un numero decimal
;   base: es un numero de 2 a 36 que representa la base requerida
; Retorna: una lista con los digitos convertidos a la base ingresada 

(define (base10ToBaseN nums base)
    (cond
        ((zero? nums) '())
        (#t (cons (convDigBase10ToBaseN (modulo nums base) base) (base10ToBaseN (quotient nums base) base)))))


; Funcion que le da formato final a convertir de base 10 a base N 
; Recibe:
;   nums: un numero decimal
;   base: es un numero de 2 a 36 que representa la base requerida
; Retorna: una lista con los digitos convertidos a la base ingresada y con el formato correcto

(define (resBase10ToBaseN nums base) 
    (cond
        ((zero? nums) (cons base (cons '(0) '())))
        (#t (cons base (cons (reverse (base10ToBaseN nums base)) '())))))


; -----------------------------------------Funciones para Numeros Romanos------------------------------------------------


; Funcion que convierte un digito romano a la equivalencia decimal
; Recibe: 
;   rom: digito romano
; Retorna: el digito romano convertido a decimal

(define (convDigRomToNum rom)
    (cond                                                           ; Se obtienen todas las conversiones posibles de digitos a decimal
        ((eq? rom 'I) 1)
        ((eq? rom 'V) 5)
        ((eq? rom 'X) 10)
        ((eq? rom 'L) 50)
        ((eq? rom 'C) 100)
        ((eq? rom 'D) 500)
        ((eq? rom 'M) 1000)
        (#t (error "Se ha leido un simbolo invalido para numeros romanos")))) ; Sino entonces un error


; Funcion convierte de romano a decimal
; Recibe:
;   roms: es una lista con digitos romanos 
; Retorna: el numero romano convertido a decimal 

(define (romToNum roms)
    (cond
        ((null? roms) 0)
        ((null? (cdr roms)) (convDigRomToNum (car roms)))
        ((>= (convDigRomToNum (car roms)) (convDigRomToNum (car (cdr roms)))) (+ (convDigRomToNum (car roms)) (romToNum (cdr roms))))
        (#t (+ (- (convDigRomToNum (car (cdr roms))) (convDigRomToNum (car roms))) (romToNum (cdr (cdr roms)))))))


; Funcion que convierte un decimal a romano
; Recibe: 
;   nums: una lista de digitos decimales
; Retorna: una lista con los digitos decimales convertidos a romanos

(define (numToRom nums)
    (cond
        ((null? nums) '())
                ; Analizar el caso de 1000
        ((> (quotient (* (car nums)(expt 10 (sub1 (length nums)))) 1000) 0)              ; Comprobar si el 1000 entra mas de 0 veces en el num actual
            (cons                                                                        ; agregamos una sublista
                (clone 'M (quotient (* (car nums) (expt 10 (sub1 (length nums)))) 1000)) ; de tantas M como veces entre el 1000 en num actual 
                (numToRom (cdr nums))))                                                  ; llamada recursiva quitando la cabeza
                ; Analizar el caso de 900
        ((> (quotient (* (car nums) (expt 10 (sub1 (length nums)))) 900) 0) (cons '(C M) (numToRom (cdr nums))))
                ; Analizar el caso de 500 cuando el numero actual es 500 
        ((eq? (* (car nums) (expt 10 (sub1 (length nums)))) 500) (cons '(D) (numToRom (cdr nums))))
                ; Analizar el caso de 500 cuando el numero actual es 800 o 700 o 600
        ((and (> (quotient (* (car nums) (expt 10 (sub1 (length nums)))) 500) 0)
              (> (modulo (car nums) 5) 0)) 
              (cons (clone 'D (quotient (* (car nums) (expt 10 (sub1 (length nums)))) 500)) (numToRom (cons (- (car nums) 5) (cdr nums)))))    
                ; Analizar el caso de 400
        ((> (quotient (* (car nums) (expt 10 (sub1 (length nums)))) 400) 0) (cons '(C D) (numToRom (cdr nums))))
                ; Analizar el caso de 100
        ((> (quotient (* (car nums) (expt 10 (sub1 (length nums)))) 100) 0) 
            (cons (clone 'C (quotient (* (car nums) (expt 10 (sub1 (length nums)))) 100)) (numToRom (cdr nums))))
                ; Analizar el caso de 90
        ((> (quotient (* (car nums) (expt 10 (sub1 (length nums)))) 90) 0) (cons '(X C) (numToRom (cdr nums))))
                ; Analizar el caso de 50 cuando el numero actual sea 50
        ((eq? (* (car nums) (expt 10 (sub1 (length nums)))) 50) (cons '(L) (numToRom (cdr nums))))
                ; Analizar el caso de 50 cuando el numero actual es 80 o 70 o 60
        ((and (> (quotient (* (car nums) (expt 10 (sub1 (length nums)))) 50) 0)
              (> (modulo (car nums) 5) 0)) 
              (cons (clone 'L (quotient (* (car nums) (expt 10 (sub1 (length nums)))) 50)) (numToRom (cons (- (car nums) 5) (cdr nums)))))
                ; Analizar el caso de 40
        ((> (quotient (* (car nums) (expt 10 (sub1 (length nums)))) 40) 0) (cons '(X L) (numToRom (cdr nums))))
                ; Analizar el caso de 10
        ((> (quotient (* (car nums) (expt 10 (sub1 (length nums)))) 10) 0) 
            (cons (clone 'X (quotient (* (car nums) (expt 10 (sub1 (length nums)))) 10)) (numToRom (cdr nums))))
        ((> (quotient (* (car nums) (expt 10 (sub1 (length nums)))) 9) 0) (cons '(I X) (numToRom (cdr nums))))
                ; Analizar el caso de 5 cuando el numero actual es 5
        ((eq? (* (car nums) (expt 10 (sub1 (length nums)))) 5) (cons '(V) (numToRom (cdr nums))))
        ; Analizar el caso de 5 cuando el numero actual es 8 o 7 o 6
        ((and (> (quotient (* (car nums) (expt 10 (sub1 (length nums)))) 5) 0)
              (> (modulo (car nums) 5) 0))
              (cons (clone 'V (quotient (* (car nums) (expt 10 (sub1 (length nums)))) 5)) (numToRom (cons (- (car nums) 5) (cdr nums)))))
                ; Analizar el caso de 4
        ((> (quotient (* (car nums) (expt 10 (sub1 (length nums)))) 4) 0) (cons '(I V) (numToRom (cdr nums))))
        ; Analizar el caso de 1
        ((> (quotient (* (car nums) (expt 10 (sub1 (length nums)))) 1) 0) 
            (cons (clone 'I (quotient (* (car nums) (expt 10 (sub1 (length nums)))) 1)) (numToRom (cdr nums))))
                ; Analizar el caso de 0
        ((zero? (car nums)) (numToRom (cdr nums)))
        ; Analizar el caso de numero invalido
        (#t (error "numero ingresado invalido"))))


; Funcion que le aplica el formato final de convertir un decimal a romano 
; Recibe: 
;   nums: una lista de digitos decimales
; Retorna: una lista con los digitos decimales convertidos a romanos con el formato correcto

(define (resNumToRom nums) (cons 'R (cons (quitarSubListas (numToRom nums)) '())))


; -----------------------------------------Funciones para Egipcios------------------------------------------------


; Funcion convierte un digito egipcia a su valor decimal 
; Recibe: 
;   egip: Es un digito de la numeracion egipcia 
; Retorna: La conversion del digito egipcio a un numero decimal 

(define (convDigEgipToNum egip)
    (cond 
        ((eq? egip 'B) 1)
        ((eq? egip 'A) 10)
        ((eq? egip 'C) 100)
        ((eq? egip 'F) 1000)
        ((eq? egip 'D) 10000)
        ((eq? egip 'E) 100000)
        ((eq? egip 'R) 1000000)
        (#t (error "Se ha leido un simbolo invalido para numeros egipcios"))))


; Funcion que convierte de numeracion egipcia a decimal 
; Recibe: 
;   egips: es una lista con digitos de la numeracion egipcia 
; Retorna: la numeracion egipcia convertida a un numero decimal 

(define (egipToNum egips) 
    (cond 
        ((null? egips) 0)                                                   ; Cuando se llega al final de la lista se retorna el 0 neutro
        (#t (+ (convDigEgipToNum (car egips)) (egipToNum (cdr egips))))))   ; Sino entonces vamos sumando cada conversion del car a decimal


; Funcion que convierte un digito decimal a numeracion egipcia 
; Recibe: 
;   n: digito decimal que representa la cantidad de veces que tiene que repetirse un simbolo egipcio
;   pot10: es un digito decimal que representa el simbolo egipcio a convertir 
; Retorna: una lista con n digitos de la numeracion egipcia  

(define (convDig10ToEgip n pot10)
    (cond 
        ((> n 9) (error "No se pueden ingresar mas de 9 simbolos egipcios por cada tipo")) ; cantidad por simbolo invalido
        ((= pot10 0) (clone 'B n))    ; Retorna la B de "Baston" n veces 
        ((= pot10 1) (clone 'A n))    ; Retorna la A de "Asa" n veces
        ((= pot10 2) (clone 'C n))    ; Retorna la C de "Cuerda enrrollada" n veces
        ((= pot10 3) (clone 'F n))    ; Retorna la F de "Flor de loto" n veces
        ((= pot10 4) (clone 'D n))    ; Retorna la D de "Dedo" n veces
        ((= pot10 5) (clone 'E n))    ; Retorna la E de "Esclava acostada" n veces
        ((= pot10 6) (clone 'R n))    ; Retorna la R de "Adorador de Ra" n veces
        (#t (error "El numero no puede sobrepasar los 9 millones"))))    ; Error de sobrepasar el maximo posible a convertir


; Funcion que convierte de decimal a numeracion egipcia 
; Recibe:
;   nums: una lista de digitos decimales 
; Retorna: una lista con sublistas que contienen los simbolos egipcios 

(define (numToEgip nums)
    (cond
        ((null? nums) '())
        ((zero? (car nums)) (numToEgip (cdr nums)))
        (#t (cons (convDig10ToEgip (car nums) (sub1 (length nums))) (numToEgip (cdr nums))))))


; Funcion que ordena los extremos de la una lista de egipcios 
; Recibe:
;   egips: una lista con sublistas de simbolos egipcios 
; Retorna: una lista con la mitad de los simbolos ubicados en sublistas de largo par 

(define (ordenarEgipsExt egips)
    (cond 
        ((null? egips) '())
        ((odd? (length (car egips))) (ordenarEgipsExt (cdr egips)))
        (#t (append (list-tail (car egips) (quotient (length (car egips)) 2)) (ordenarEgipsExt (cdr egips))))))
        

; Funcion que ordena el medio de una lista de egipcios 
; Recibe:
;   egips: una lista con sublistas de simbolos egipcios 
; Retorna: una lista con los simbolos ubicados en sublistas de largo impar 

(define (ordenarEgipsMed egips)
    (cond
        ((null? egips) '())
        ((even? (length (car egips))) (ordenarEgipsMed (cdr egips)))
        (#t (append (car egips) (ordenarEgipsMed (cdr egips))))))

; Funcion que ordena una numeracion egipcia para que sea mediamente simetrica 
; Recibe: 
;   egips: es una lista con sublistas que contiene simbolos egipcios 
; Retorna: una sola lista con los simbolos egipcios ordenados simetricamente y con el formato correcto

(define (resNumToEgips egips) (cons 'E (cons (append (ordenarEgipsExt egips) (append (ordenarEgipsMed egips) (ordenarEgipsExt (reverse egips)))) '())))


; -----------------------------------------Funciones para Mayas------------------------------------------------
; UNA NOTA IMPORTANTE ES QUE PARA ESTA NUMERACION SE USARA UN '!' EN LUGAR DE '|' YA QUE ESTE ULTIMO PUEDE DAR PROBLEMAS AL EJECUTAR LA FUNCION


; Funcion que convierte un simbolo maya a decimal 
; Recibe: 
;   maya: una lista con simbolos de la numeracion maya 
; Retorna: un digito maya convertido a decimal 

(define (convDigMayaToNum maya)
    (cond
        ((null? maya) 0)
        ((equal? maya '(*)) 1)
        ((equal? maya '(* *)) 2)
        ((equal? maya '(* * *)) 3)
        ((equal? maya '(* * * *)) 4) 
        ((equal? maya '(!)) 5)
        ((equal? maya '(! *)) 6)
        ((equal? maya '(! * *)) 7)
        ((equal? maya '(! * * *)) 8)
        ((equal? maya '(! * * * *)) 9)
        ((equal? maya '(! !)) 10)
        ((equal? maya '(! ! *)) 11)
        ((equal? maya '(! ! * *)) 12)
        ((equal? maya '(! ! * * *)) 13)
        ((equal? maya '(! ! * * * *)) 14)
        ((equal? maya '(! ! !)) 15)
        ((equal? maya '(! ! ! *)) 16)
        ((equal? maya '(! ! ! * *)) 17)
        ((equal? maya '(! ! ! * * *)) 18)
        ((equal? maya '(! ! ! * * * *)) 19)
        (#t (error "Se ha leido un simbolo invalido para la numeracion maya o si usaste pipes cambialos por !"))))


; Funcion que convierte de numeracion maya a decimal 
; Recibe: 
;   mayas: es una lista con digitos de la numeracion maya 
; Retorna: la numeracion maya convertida a un numero decimal 

(define (mayaToNum mayas)
    (cond 
        ((null? mayas) 0)                              
        (#t (+                                              
                (*                                          
                    (convDigMayaToNum (car mayas))          
                    (expt 20 (sub1 (length mayas))))       
                (mayaToNum (cdr mayas))))))         

 
; Funcion que convierte un digito decimal a maya  
; Recibe: 
;   dig: numero decimal
; Retorna: el decimal convertido a una lista con el digito maya

(define (convDig10ToMaya dig)
    (cond
        ((zero? dig) '())
        ((eq? dig 1) '(*)) 
        ((eq? dig 2) '(* *))
        ((eq? dig 3) '(* * *)) 
        ((eq? dig 4) '(* * * *)) 
        ((eq? dig 5) '(!)) 
        ((eq? dig 6) '(! *)) 
        ((eq? dig 7) '(! * *)) 
        ((eq? dig 8) '(! * * *)) 
        ((eq? dig 9) '(! * * * *)) 
        ((eq? dig 10) '(! !)) 
        ((eq? dig 11) '(! ! *)) 
        ((eq? dig 12) '(! ! * *)) 
        ((eq? dig 13) '(! ! * * *)) 
        ((eq? dig 14) '(! ! * * * *)) 
        ((eq? dig 15) '(! ! !)) 
        ((eq? dig 16) '(! ! ! *)) 
        ((eq? dig 17) '(! ! ! * *)) 
        ((eq? dig 18) '(! ! ! * * *)) 
        ((eq? dig 19) '(! ! ! * * * *)) 
        (#t (error "Se ha leido un simbolo invalido para la numeracion maya"))))


; Funcion que convierte de decimal a numeracion maya 
; Recibe:
;   nums: un numero decimal
; Retorna: una lista con sublistas que contienen los simbolos mayas 

(define (numToMaya nums)
    (cond
        ((zero? nums) '())
        (#t (cons (convDig10ToMaya (modulo nums 20)) (numToMaya (quotient nums 20))))))


; Funcion que pone el formato correcto a una numeracion maya
; Recibe: 
;   nums: es un numero decimal
; Retorna: una lista con sublistas de los simbolos mayas con el formato correcto

(define (resNumToMaya nums) (cons 'M (cons (numToMaya nums) '())))


; -----------------------------------------Funciones para Babilonicos------------------------------------------------


; Funcion que convierte un simbolo babilonico a decimal 
; Recibe: 
;   bab: una lista con simbolos de la numeracion babilonica 
; Retorna: un digito babilonico convertido a decimal 

(define (convDigBabToNum bab)
    (cond 
        ((null? bab) 0)
        ((equal? bab '(^)) 1)
        ((equal? bab '(^ ^)) 2)
        ((equal? bab '(^ ^ ^)) 3)
        ((equal? bab '(^ ^ ^ ^)) 4)
        ((equal? bab '(^ ^ ^ ^ ^)) 5)
        ((equal? bab '(^ ^ ^ ^ ^ ^)) 6)
        ((equal? bab '(^ ^ ^ ^ ^ ^ ^)) 7)
        ((equal? bab '(^ ^ ^ ^ ^ ^ ^ ^)) 8)
        ((equal? bab '(^ ^ ^ ^ ^ ^ ^ ^ ^)) 9)
        ((equal? bab '(<)) 10)
        ((equal? bab '(< ^)) 11)
        ((equal? bab '(< ^ ^)) 12)
        ((equal? bab '(< ^ ^ ^)) 13)
        ((equal? bab '(< ^ ^ ^ ^)) 14)
        ((equal? bab '(< ^ ^ ^ ^ ^)) 15)
        ((equal? bab '(< ^ ^ ^ ^ ^ ^)) 16)
        ((equal? bab '(< ^ ^ ^ ^ ^ ^ ^)) 17)
        ((equal? bab '(< ^ ^ ^ ^ ^ ^ ^ ^)) 18)
        ((equal? bab '(< ^ ^ ^ ^ ^ ^ ^ ^ ^)) 19)
        ((equal? bab '(< <)) 20)
        ((equal? bab '(< < ^)) 21)
        ((equal? bab '(< < ^ ^)) 22)
        ((equal? bab '(< < ^ ^ ^)) 23)
        ((equal? bab '(< < ^ ^ ^ ^)) 24)
        ((equal? bab '(< < ^ ^ ^ ^ ^)) 25)
        ((equal? bab '(< < ^ ^ ^ ^ ^ ^)) 26)
        ((equal? bab '(< < ^ ^ ^ ^ ^ ^ ^)) 27)
        ((equal? bab '(< < ^ ^ ^ ^ ^ ^ ^ ^)) 28)
        ((equal? bab '(< < ^ ^ ^ ^ ^ ^ ^ ^)) 28)
        ((equal? bab '(< < ^ ^ ^ ^ ^ ^ ^ ^ ^)) 29)
        ((equal? bab '(< < <)) 30)
        ((equal? bab '(< < < ^)) 31)
        ((equal? bab '(< < < ^ ^)) 32)
        ((equal? bab '(< < < ^ ^ ^)) 33)
        ((equal? bab '(< < < ^ ^ ^ ^)) 34)
        ((equal? bab '(< < < ^ ^ ^ ^ ^)) 35)
        ((equal? bab '(< < < ^ ^ ^ ^ ^ ^)) 36)
        ((equal? bab '(< < < ^ ^ ^ ^ ^ ^ ^)) 37)
        ((equal? bab '(< < < ^ ^ ^ ^ ^ ^ ^ ^)) 38)
        ((equal? bab '(< < < ^ ^ ^ ^ ^ ^ ^ ^ ^)) 39)
        ((equal? bab '(< < < <)) 40)
        ((equal? bab '(< < < < ^)) 41)
        ((equal? bab '(< < < < ^ ^)) 42)
        ((equal? bab '(< < < < ^ ^ ^)) 43)
        ((equal? bab '(< < < < ^ ^ ^ ^)) 44)
        ((equal? bab '(< < < < ^ ^ ^ ^ ^)) 45)
        ((equal? bab '(< < < < ^ ^ ^ ^ ^ ^)) 46)
        ((equal? bab '(< < < < ^ ^ ^ ^ ^ ^ ^)) 47)
        ((equal? bab '(< < < < ^ ^ ^ ^ ^ ^ ^ ^)) 48)
        ((equal? bab '(< < < < ^ ^ ^ ^ ^ ^ ^ ^ ^)) 49)
        ((equal? bab '(< < < < <)) 50)
        ((equal? bab '(< < < < < ^)) 51)
        ((equal? bab '(< < < < < ^ ^)) 52)
        ((equal? bab '(< < < < < ^ ^ ^)) 53)
        ((equal? bab '(< < < < < ^ ^ ^ ^)) 54)
        ((equal? bab '(< < < < < ^ ^ ^ ^ ^)) 55)
        ((equal? bab '(< < < < < ^ ^ ^ ^ ^ ^)) 56)
        ((equal? bab '(< < < < < ^ ^ ^ ^ ^ ^ ^)) 57)
        ((equal? bab '(< < < < < ^ ^ ^ ^ ^ ^ ^ ^)) 58)
        ((equal? bab '(< < < < < ^ ^ ^ ^ ^ ^ ^ ^ ^)) 59)
        (#t (error "Se ha leido un simbolo invalido para numeracion babilonica"))))


; Funcion que convierte de numeracion babilonica a decimal 
; Recibe: 
;   babs: es una lista con digitos de la numeracion babilonica 
; Retorna: la numeracion babilonica convertida a un numero decimal 

(define (babToNum babs)
    (cond 
        ((null? babs) 0)
        (#t (+                                              
                (*                                          
                    (convDigBabToNum (car babs))          
                    (expt 60 (sub1 (length babs))))       
                (babToNum (cdr babs))))))    


; Funcion que convierte un digito decimal a babilonico  
; Recibe: 
;   dig: un numero decimal
; Retorna: el numero decimal convertido a una lista del digito babilonico 

(define (convDig10ToBab dig)
    (cond 
        ((zero? dig) '())
        ((eq? dig 1) '(^)) 
        ((eq? dig 2) '(^ ^)) 
        ((eq? dig 3) '(^ ^ ^)) 
        ((eq? dig 4) '(^ ^ ^ ^)) 
        ((eq? dig 5) '(^ ^ ^ ^ ^)) 
        ((eq? dig 6) '(^ ^ ^ ^ ^ ^)) 
        ((eq? dig 7) '(^ ^ ^ ^ ^ ^ ^)) 
        ((eq? dig 8) '(^ ^ ^ ^ ^ ^ ^ ^)) 
        ((eq? dig 9) '(^ ^ ^ ^ ^ ^ ^ ^ ^)) 
        ((eq? dig 10) '(<)) 
        ((eq? dig 11) '(< ^)) 
        ((eq? dig 12) '(< ^ ^)) 
        ((eq? dig 13) '(< ^ ^ ^)) 
        ((eq? dig 14) '(< ^ ^ ^ ^)) 
        ((eq? dig 15) '(< ^ ^ ^ ^ ^)) 
        ((eq? dig 16) '(< ^ ^ ^ ^ ^ ^))
        ((eq? dig 17) '(< ^ ^ ^ ^ ^ ^ ^)) 
        ((eq? dig 18) '(< ^ ^ ^ ^ ^ ^ ^ ^)) 
        ((eq? dig 19) '(< ^ ^ ^ ^ ^ ^ ^ ^ ^)) 
        ((eq? dig 20) '(< <)) 
        ((eq? dig 21) '(< < ^)) 
        ((eq? dig 22) '(< < ^ ^)) 
        ((eq? dig 23) '(< < ^ ^ ^)) 
        ((eq? dig 24) '(< < ^ ^ ^ ^)) 
        ((eq? dig 25) '(< < ^ ^ ^ ^ ^)) 
        ((eq? dig 26) '(< < ^ ^ ^ ^ ^ ^)) 
        ((eq? dig 27) '(< < ^ ^ ^ ^ ^ ^ ^)) 
        ((eq? dig 28) '(< < ^ ^ ^ ^ ^ ^ ^ ^)) 
        ((eq? dig 29) '(< < ^ ^ ^ ^ ^ ^ ^ ^ ^))
        ((eq? dig 30) '(< < <)) 
        ((eq? dig 31) '(< < < ^)) 
        ((eq? dig 32) '(< < < ^ ^)) 
        ((eq? dig 33) '(< < < ^ ^ ^)) 
        ((eq? dig 34) '(< < < ^ ^ ^ ^)) 
        ((eq? dig 35) '(< < < ^ ^ ^ ^ ^)) 
        ((eq? dig 36) '(< < < ^ ^ ^ ^ ^ ^))
        ((eq? dig 37) '(< < < ^ ^ ^ ^ ^ ^ ^)) 
        ((eq? dig 38) '(< < < ^ ^ ^ ^ ^ ^ ^ ^)) 
        ((eq? dig 39) '(< < < ^ ^ ^ ^ ^ ^ ^ ^ ^)) 
        ((eq? dig 40) '(< < < <)) 
        ((eq? dig 41) '(< < < < ^)) 
        ((eq? dig 42) '(< < < < ^ ^)) 
        ((eq? dig 43) '(< < < < ^ ^ ^)) 
        ((eq? dig 44) '(< < < < ^ ^ ^ ^)) 
        ((eq? dig 45) '(< < < < ^ ^ ^ ^ ^)) 
        ((eq? dig 46) '(< < < < ^ ^ ^ ^ ^ ^)) 
        ((eq? dig 47) '(< < < < ^ ^ ^ ^ ^ ^ ^))
        ((eq? dig 48) '(< < < < ^ ^ ^ ^ ^ ^ ^ ^)) 
        ((eq? dig 49) '(< < < < ^ ^ ^ ^ ^ ^ ^ ^ ^)) 
        ((eq? dig 50) '(< < < < <)) 
        ((eq? dig 51) '(< < < < < ^)) 
        ((eq? dig 52) '(< < < < < ^ ^)) 
        ((eq? dig 53) '(< < < < < ^ ^ ^)) 
        ((eq? dig 54) '(< < < < < ^ ^ ^ ^)) 
        ((eq? dig 55) '(< < < < < ^ ^ ^ ^ ^)) 
        ((eq? dig 56) '(< < < < < ^ ^ ^ ^ ^ ^)) 
        ((eq? dig 57) '(< < < < < ^ ^ ^ ^ ^ ^ ^))
        ((eq? dig 58) '(< < < < < ^ ^ ^ ^ ^ ^ ^ ^)) 
        ((eq? dig 59) '(< < < < < ^ ^ ^ ^ ^ ^ ^ ^ ^))
        (#t (error "Se ha leido un simbolo invalido para numeracion babilonica"))))
        

; Funcion que convierte de decimal a numeracion babilonica 
; Recibe:
;   nums: un numero decimal
; Retorna: una lista con sublistas que contienen los simbolos babilonicos 

(define (numToBab nums)
    (cond
        ((zero? nums) '())
        (#t (cons (convDig10ToBab (modulo nums 60)) (numToBab (quotient nums 60))))))


; Funcion que pone el formato correcto a una numeracion babilonica
; Recibe: 
;   nums: es un numero decimal
; Retorna: una lista con sublistas de los simbolos babilonicos con el formato correcto

(define (resNumToBab nums) (cons 'B (cons (reverse (numToBab nums)) '())))


; -----------------------------------------Funciones para Chinos------------------------------------------------


; Funcion que convierte un digito chino y lo convierte a decimal 
; Recibe:
;   chin: es una lista que contiene hanzis
; Retorna: el hanzi ingresado convertido a su valor decimal 

(define (convDigChinToNum chin)
    (cond 
        ((null? chin) 1)
        ((eq? (car chin) 'ling) (* 0 (convDigChinToNum (cdr chin))))
        ((eq? (car chin) 'yi) (* 1 (convDigChinToNum (cdr chin))))
        ((eq? (car chin) 'er) (* 2 (convDigChinToNum (cdr chin))))
        ((eq? (car chin) 'san) (* 3 (convDigChinToNum (cdr chin))))
        ((eq? (car chin) 'si) (* 4 (convDigChinToNum (cdr chin))))
        ((eq? (car chin)'wu) (* 5 (convDigChinToNum (cdr chin))))
        ((eq? (car chin) 'liu) (* 6 (convDigChinToNum (cdr chin))))
        ((eq? (car chin) 'qi) (* 7 (convDigChinToNum (cdr chin))))
        ((eq? (car chin) 'ba) (* 8 (convDigChinToNum (cdr chin))))
        ((eq? (car chin) 'jiu) (* 9 (convDigChinToNum (cdr chin))))
        ((eq? (car chin) 'shi) (* 10 (convDigChinToNum (cdr chin))))
        ((eq? (car chin) 'bai) (* 100 (convDigChinToNum (cdr chin))))
        ((eq? (car chin) 'quian) (* 1000 (convDigChinToNum (cdr chin))))
        ((eq? (car chin) 'wan) (* 10000 (convDigChinToNum (cdr chin))))
        (#t (error "Se ha leido un simbolo invalido para la numeracion china"))))


; Funcion que convierte un numero chino a numero decimal 
; Recibe:
;    chins: es una lista con sublistas que contienes hanzis 
; Retornar: el numero chino convertido a un numero decimal 

(define (chinToNum chins)
    (cond 
        ((null? chins) 0)
        (#t (+ (convDigChinToNum (car chins)) (chinToNum (cdr chins))))))


; Funcion que recibe un numero decimal y lo convierte en chino 
; Recibe:
;   dig: una lista con numeros decimales
; Retorna: una lista del numero decimal convertido a chino 

(define (convDig10ToChin digs)
    (cond 
        ((null? digs) '())
        ((eq? (car digs) 0 ) (cons 'ling (convDig10ToChin (cdr digs))))
        ((eq? (car digs) 1) (cons 'yi (convDig10ToChin (cdr digs))))
        ((eq? (car digs) 2) (cons 'er (convDig10ToChin (cdr digs))))
        ((eq? (car digs) 3) (cons 'san (convDig10ToChin (cdr digs))))
        ((eq? (car digs) 4) (cons 'si (convDig10ToChin (cdr digs))))
        ((eq? (car digs) 5) (cons 'wu (convDig10ToChin (cdr digs))))
        ((eq? (car digs) 6) (cons 'liu (convDig10ToChin (cdr digs))))
        ((eq? (car digs) 7) (cons 'qi (convDig10ToChin (cdr digs))))
        ((eq? (car digs) 8) (cons 'ba (convDig10ToChin (cdr digs))))
        ((eq? (car digs) 9) (cons 'jiu (convDig10ToChin (cdr digs))))
        ((eq? (car digs) 10) (cons 'shi (convDig10ToChin (cdr digs))))
        ((eq? (car digs) 100) (cons 'bai (convDig10ToChin (cdr digs))))
        ((eq? (car digs) 1000) (cons 'quian (convDig10ToChin (cdr digs))))
        ((eq? (car digs) 10000) (cons 'wan (convDig10ToChin (cdr digs))))
        (#t (error "Se ha leido un simbolo invalido para la numeracion china"))))


; Funcion que convierte de decimal a numero chino 
; Recibe:
;   nums: es una lista que contine un numero decimal
; Retorna: una lista del numero decimal convertido a chino

(define (numToChin nums)
    (cond 
        ((null? nums) '())
        ((eq? 1  (length nums)) (cons (convDig10ToChin (list (car nums))) '()))
        (#t (cons (convDig10ToChin (cons (expt 10 (sub1 (length nums))) (cons (car nums) '()))) (numToChin (cdr nums))))))


; Funcion que le coloca el formato correcto al resultado de convertir un decimal a numero chino 
; Recibe:
;   nums: es una lista que contine un numero decimal
; Retorna: una lista del numero decimal convertido a chino con el formato correcto

(define (resNumToChin nums) (cons 'C (numToChin nums)))


; -----------------------------------------Funciones para Kukulkan------------------------------------------------


; Funcion que indica cual es el kukulkan actual que se debe evaluar 
; Recibe:
;   kuks: una lista con sublistas que contienen los simbolos kukulkanes
;   pos: es un numero que indica la posicion del kukulkan actual evaluado 
; Retorna: el kukulkan actual a ser evaluado

(define (kukActualAEvaluar kuks pos) 
    (cond
        ((eq? pos 8) (car (cdr (cdr (car (cdr (cdr kuks)))))))
        ((eq? pos 7) (car (cdr (car (cdr (cdr kuks))))))
        ((eq? pos 6) (car (car (cdr (cdr kuks)))))
        ((eq? pos 5) (car (car (cdr kuks))))
        ((eq? pos 4) (car (car kuks)))
        ((eq? pos 3) (car (cdr (car kuks))))
        ((eq? pos 2) (car (cdr (cdr (car kuks)))))
        ((eq? pos 1) (car (cdr (cdr (car (cdr kuks))))))
        ((eq? pos 0) (car (cdr (car (cdr kuks)))))
        (#t (error "Se ha leido un simbolo invalido para la numeracion de kukulkan"))))


; Funcion que convierte un digito kukulkan a decimal 
; recibe: 
; kuk: es una letra que representa un digito kukulkan 
; Retorna: el digito kukulkan convertido a decimal 

(define (convDigKukTo10 kuk)
    (cond 
        ((eq? kuk 'imix) 0) 
        ((eq? kuk 'ben) 1)
        ((eq? kuk 'chicchan) 2)
        ((eq? kuk 'caban) 3)
        ((eq? kuk 'muluc) 4)
        ((eq? kuk 'ix) 5)
        ((eq? kuk 'cimi) 6)
        ((eq? kuk 'etznab) 7)
        ((eq? kuk 'oc) 8)
        ((eq? kuk 'ik) 9)
        ((eq? kuk 'manic) 10)
        ((eq? kuk 'cauac) 11)
        ((eq? kuk 'chuen) 12)
        ((eq? kuk 'akbal) 13)
        ((eq? kuk 'men) 14)
        ((eq? kuk 'ahaun) 15)
        ((eq? kuk 'eb) 16)
        ((eq? kuk 'kan) 17)
        ((eq? kuk 'cib) 18)
        ((eq? kuk 'lamat) 19)
        (#t (error "Se ha leido un simbolo invalido para la numeracion de kukulkan"))))
        


; Funcion que convierte de kukulkan a decimal 
; Recibe:
;   kuks: una lista con sublistas que contienen los simbolos kukulkanes
;   cont: contador inicializado en 8 para ir evaluando los simbolos en orden espiral 
; Retorna: la lista kukulkan convertida a un numero decimal 

(define (kukToNum kuks cont)
    (cond 
        ((< cont 0) 0)
        (#t (+ (* (convDigKukTo10 (kukActualAEvaluar kuks cont)) (expt 20 cont)) (kukToNum kuks (sub1 cont))))))


; Funcion que convierte un dijito decimal a kakukulkan
; Recibe: 
; dig: es un numero decimal 
; Retorna: el digito convertido a kukulkan

(define (convDig10ToKuk dig)
    (cond 
        ((eq? dig 0) 'imix)  
        ((eq? dig 1) 'ben) 
        ((eq? dig 2) 'chicchan) 
        ((eq? dig 3) 'caban) 
        ((eq? dig 4) 'muluc) 
        ((eq? dig 5) 'ix) 
        ((eq? dig 6) 'cimi) 
        ((eq? dig 7) 'etznab)
        ((eq? dig 8) 'oc) 
        ((eq? dig 9) 'ik) 
        ((eq? dig 10) 'manic) 
        ((eq? dig 11) 'cauac) 
        ((eq? dig 12) 'chuen) 
        ((eq? dig 13) 'akbal) 
        ((eq? dig 14) 'men) 
        ((eq? dig 15) 'ahaun) 
        ((eq? dig 16) 'eb) 
        ((eq? dig 17) 'kan) 
        ((eq? dig 18) 'cib) 
        ((eq? dig 19) 'lamat) 
        (#t (error "Se ha leido un simbolo invalido para la numeracion de kukulkan"))))


; Funcion que converte de decimal a kukulkan 
; Recibe:
;   nums: un decimal 
; Retorna: el numero convertirdo a una lista con simbolos kukulkanes 

(define (numToKuk nums)
    (cond
        ((zero? nums) '())
        (#t (cons (convDig10ToKuk (modulo nums 20)) (numToKuk (quotient nums 20))))))


; Funcion que completa los imix (0) del espiral kukulkan
; Recibe 
;   kuks: una lista aplana horizontal con simbolos kukulkanes
; Retorna: la lista aplana horizontal con ceros que hagan falta 

(define (completarCerosKuk kuks) 
    (cond 
        ((> (length kuks) 8) kuks)
        (#t (append kuks (clone 'imix (- 9 (length kuks)))))))


; Funcion que acomoda en sublistas de 3 para darle el formato correcto 
; Recibe 
;   kuks: una lista aplana horizontal con simbolos kukulkanes
; Retorna: la lista con sublistas de 3 simbolos kukulkanes correspondientes 

(define (resNumToKuk kuks) (cons 'K (cons (reverse (obtSubList kuks 0 2 5)) (cons (append (obtSubList kuks 0 5 6) (obtSubList kuks 0 0 2)) (cons (obtSubList kuks 0 6 9) '())))))
  

; -----------------------------------------Funciones para numeracion asignada (Tengwar)------------------------------------------------

; Para esta asignacion cada digito sera representado por su nombre elfico, ignorando caracteres especiales


; Funcion que convierte la equivencia de un digito tengwar a decimal
; Recibe: 
;   teng: una letra que representa el digito tengwar
; Retorna: la equivalencia del digito tengwar a base decimal

(define (convDigTengToNum teng)
    (cond   
        ((eq? teng 'munta) 0)
        ((eq? teng 'mine) 1)
        ((eq? teng 'atta) 2)
        ((eq? teng 'nelde) 3)
        ((eq? teng 'canta) 4)
        ((eq? teng 'lempe) 5)
        ((eq? teng 'enque) 6)
        ((eq? teng 'otso) 7)
        ((eq? teng 'tolto) 8)
        ((eq? teng 'nerte) 9)
        ((eq? teng 'cainen) 10)
        ((eq? teng 'minque) 11)
        (#t (error "Se ha leido un digito invalido para los Tengwars"))))

; Funcion que convierte tengwar a base decimal
; Recibe:
;   teng: es una lista de digitos tengwar
; Retorna: la numeracion tengwar convertida a un numero decimal 

(define (tengToNum teng)
    (cond 
        ((null? teng) 0)                                    ; Si llegamos al final de la lista se detiene y devuelve 0
        (#t (+                                              ; Sino usamos la formula general para convertir a base 10
                (*                                          ; obteniendo la multiplicacion
                    (convDigTengToNum (car teng))  ; del digito actual convertido a base 10
                    (expt 12 (sub1 (length teng))))       ; con la base numerica elevado al largo de la lista actual menos 1
                (tengToNum (cdr teng))))))         ; y se suma con la llamada recusiva quitandole la cabeza actual a lista


; Funcion que convierte la equivencia de un digito decimal a tengwar
; Recibe: 
;   dig: un digito decimal 
; Retorna: la equivalencia del digito decimal a tengwar 

(define (convNumToTeng dig)
    (cond   
        ((eq? dig 0) 'munta) 
        ((eq? dig 1) 'mine) 
        ((eq? dig 2) 'atta) 
        ((eq? dig 3) 'nelde) 
        ((eq? dig 4) 'canta) 
        ((eq? dig 5) 'lempe) 
        ((eq? dig 6) 'enque) 
        ((eq? dig 7) 'otso) 
        ((eq? dig 8) 'tolto) 
        ((eq? dig 9) 'nerte) 
        ((eq? dig 10) 'cainen) 
        ((eq? dig 11) 'minque) 
        (#t (error "Se ha leido un digito invalido para los Tengwars"))))


; Funcion que convirte un numero decimal a un tengwar
; Recibe:
;   nums: un numero decimal
; Retorna: una lista con los digitos convertidos a tengwar

(define (numToTeng nums)
    (cond
        ((zero? nums) '())
        (#t (cons (convNumToTeng (modulo nums 12)) (numToTeng (quotient nums 12))))))


; Funcion que le da formato final a la numeracion tengwar
; Recibe:
;   nums: un numero decimal
; Retorna: una lista con los digitos convertidos a tengwar con el formato correcto

(define (resNumToTeng nums) (cons 'T (cons (numToTeng nums) '())))