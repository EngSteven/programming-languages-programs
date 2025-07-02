# -------------------------Portada----------------------------------------------------------------
# Tarea: Sopa Letras - Tres ejercicios de shell 
# Estudiante: Steven Sequeira Araya 
# Carnet: 2022080836
# Instituto Tecnológico de Costa Rica 
# Escuela Ingeniería en Computación 
# Lenguajes de Programación 
# Fecha de entrega: 17/04/2024

# -------------------------Manual de Usuario-------------------------------------------------------
# Para probrar este ejercicio de generar una sopa de letras, se debe hacer lo siguiente:
#	1. navegar hasta la ubicacion del archivo
#	2. hacer el archivo ejecutable (chmod +x nombreArchivo.sh)
#	3. ejecutar el archivo (./nombreArchivo.sh p1 p2 p3) donde 
#		p1 es el nombre del archivo de texto con la lista de palabras 
#		p2 es el ancho de la sopa de letras a generar
#		p3 es el alto de la sopa de letras a generar
#		ejemplo: ./Sopa-Letras-Sequeira-Steven.sh listaPalabras.txt 10 10

# -------------------------Análisis de Resultados----------------------------------------------------

# Tabla de autocalificación:

# Parte                        calificación
# Portada                           A
# Manual de usuario                 A 
# Generar Sopa de Letras            A



# funcion que genera numeros aleatorios entre 0 y un maximo
# recibe:
#       $1: maximo del rango
# retorna: un numero aleatorio entre 0 y el maximo ingresado
generarNumeroAleatorio () {
    max="$1"
    min=0
    if [ "$max" == 0 ] ; then  # se comprueba que max no sea 0, para evitar un error de division por 0
    	max=1
    fi  
    resultado=$((RANDOM % max)) # se llama al RANDOM de shell que genera un numero entre 0 y 32767 y se le aplica mod con max para ajustar el rango deseado
    echo "$resultado"	# se retorna el numero aleatorio generado
}

# verifica si se ingresaron los datos de entrada
# recibe:
# 	$1: el nombre del archivo de texto que contiene las palabras 
#	$2: un numero entero positivo que representa el ancho de la sopa letras 
#	$3: un numero entero positivo que representa el alto de la sopa letras
# retorna: un mensaje de error en caso de no haber ingresado algun parametro
verificarEntradaDatos () {
    if [ -z "$1" ]; then
        echo "Error: no se ha ingresado el nombre del archivo con la lista de palabras"
        exit 1
    fi

    if [ -z "$2" ]; then
        echo "Error: no se ha ingresado el ancho de la sopa de letras"
        exit 1
    fi

    if [ -z "$3" ]; then
        echo "Error: no se ha ingresado el alto de la sopa de letras"
        exit 1
    fi

    if [ ! -f "$1" ]; then  
    	echo "Error: el nombre del archivo ingresado, con la lista de palabras, no existe"
        exit 1
    fi
}

# muestra en pantalla el contenido de la sopa letras ingresadas
# recibe 
# 	$1: un numero entero positivo que representa el ancho de la sopa de letras 
#	$2: un numero entero positivo que representa el alto de la sopa de letras
# retorna: no retorna nada, solo imprime la sopa de letras con espacios en blanco entre cada letra 
imprimirSopaLetras () {
    ancho="$1"
    alto="$2"
    sopaLetras=$3
    
    # Imprimir cada fila de sopa letras con un espacio en blanco entre cada letra y un salto de linea entre cada fila 
    # gsub(patron, remplazo) -> remplaza todas las ocurrencias de un patron 
    # /./ -> patron con cualquier caracter 
    # "& " -> remplace el caracter por el mismo caracter y un espacio en blanco
    # 1 es para indicar que debe realizar la impresion 
    echo "Sopa de letras generado"
    printf '%s\n' "${sopaLetras[@]}" | awk '{gsub(/./,"& ")}1'    
}

# inicializa la sopa de letras con el ancho y alto ingresado, y colocando un (#) que representa una casilla vacia 
# recibe:
#	$1: un numero entero positivo que representa el ancho de la sopa de letras 
#	$2: un numero entero positivo que representa el alto de la sopa de letras 
# retorna: un array de strings, que representa la sopa de letras con un (#) en cada casilla 
inicializarSopaLetras () {
    ancho="$1"
    alto="$2"
    declare -a sopaLetras
    fila=""
    
    for ((i=0; i<ancho; i++)); do # se itera segun el ancho de la sopa de letras 
	fila+="#"        	  # para construir la fila sin letras
    done

    for ((i=0; i<alto; i++)); do # se itera segun el alto de la sopa de letras
	sopaLetras+=("$fila")    # para agregar la fila construida en la sopa de letras
    done     
 
    echo "${sopaLetras[@]}"      # se retorna la sopa de letras
}

# se usa al final para colocar letras aleatorias en las casillas vacias (#) 
# recibe: 
# 	$1: un numero entero positivo que representa el ancho de la sopa de letras 
# 	$2: un numero entero positivo que representa el alto de la sopa de letras 
# 	$3: un array de strings que representa la sopa de letras 
#	$4: un string que representa las letras disponibles que provienen de las palabras ingresadas
# retorna: un array de strings que representa la sopa letras final 
completarSopaLetras () {
    ancho="$1"
    alto="$2"
    sopaLetras=$3
    letrasDisponibles="$4"
    nLetrasDisponibles="${#letrasDisponibles}"
    posFila=0  
       
    for fila in "${sopaLetras[@]}"; do		# se recorre cada fila de la sopa de letras 
    	for ((i=0; i<ancho; i++)); do		# se recorre cada columna de la sopa de letras
            posAleatoria=$(generarNumeroAleatorio $((nLetrasDisponibles - 1)))
            letraAleatoria="${letrasDisponibles:$posAleatoria:1}"   # se obtiene una letra aleatoria
            if [ "${fila:$i:1}" == "#" ]; then  		# si la casilla esta vacia
            	fila="${fila:0:$i}$letraAleatoria${fila:$i+1}" 	# coloque la letra aleatoria 
            fi	    
	done
	sopaLetras[$posFila]="$fila"	# actualice la fila en la sopa letras
        (( posFila++ ))			
    done
    echo "${sopaLetras[@]}"	# se retorna la sopa de letras
}

# genera todas las posibles direcciones en donde se puede colocar la palabra ingresada
# recibe: 
# 	$1: un numero entero positivo que representa el ancho de la sopa de letras 
#	$2: un numero entero positivo que representa el alto de la sopa de letras 
#	$3: un array de strings que representa la sopa de letras
#	$4: un string que representa la palabra actual a colocar 
# retorna: un array de strings que contienen todas las posibles direcciones posibles de la palabra 
generarDirPosibles () { 
    ancho="$1"
    alto="$2"
    sopaLetras="$3"
    palabra="$4"
    lenPalabra="${#palabra}" 
    declare -a dirPosibles
   
    for ((i=0; i<alto; i++)); do 	# iterador i para recorrer las filas de la sopa de letras
    	fila="${sopaLetras[i]}"  	# se obtiene la fila actual de la sopa de letras
        for ((j=0; j<ancho; j++)); do	# iterador j para recorrer las columnas de la la fila actual
            letra="${fila:j:1}"         # se obtiene la letra de la fila y columna actual
            
            # comprobar si letra de la casilla actual es (#) o es igual a la primer letra de la palabra ingresada, para comprobar las direcciones 
            if [ $letra == "#" ] || [ $letra == "${palabra:0:1}" ]; then  
    
                # comprobar direccion norte, se verifica si la palabra no se excede por arriba
		resultado=1
		if  (( $i + 1 - $lenPalabra >= 0 )) ; then
                    i2="$i"  		# copia el iterador de la fila actual 			
              
                    for ((k=0; k<$lenPalabra; k++)); do 	# iterador k para recorrer cada letra de la palabra ingresada
                    	filaUp="${sopaLetras[i2]}"           	# se obtiene la fila de arriba 
			letraUp="${filaUp:j:1}"			# se obtiene la letra de la fila de arriba y columna actual
                        letraCmp="${palabra:k:1}"               # se obtiene la letra actual de la palabra ingresada
			(( i2-- ))				# se mueve el iterador una posicion hacia arriba
			
			# se verifica que la letra de arriba no sea vacia y sea distinta de la letra actual de la palabra ingresada
			if [ "$letraUp" != "#" ] && [ "$letraCmp" != "$letraUp" ]; then 	
                            resultado=0		# de serlo se detiene el recorrido de la palabra ingresada y se pone el resultado en falso
			    break		# esto indica que la palabra no se puede colocar hacia el norte en la casilla actual
			fi	
                    done

                    if [ $resultado == 1 ]; then 	# si el resultado es verdadero
		    	infoDir="$i,$j,n"		# se obtiene la informacion de la direccion (fila,columna,direccion)
                        dirPosibles+=("$infoDir") 	# se concatena la posible direccion obtenida
		    fi
		fi


                # comprobar direccion sur, se verifica si la palabra no se excede por abajo
                resultado=1
                if  (( $i + $lenPalabra - 1 <= $alto )) ; then
                    i2="$i"             # copia el iterador de la fila actual

                    for ((k=0; k<$lenPalabra; k++)); do         # iterador k para recorrer cada letra de la palabra ingresada
                        filaDown="${sopaLetras[i2]}"            # se obtiene la fila de abajo
                        letraDown="${filaDown:j:1}"             # se obtiene la letra de la fila de abajo y columna actual
                        letraCmp="${palabra:k:1}"               # se obtiene la letra actual de la palabra ingresada
                        (( i2++ ))				# se mueve el iterador hacia abajo
                       
                        # se verifica que la letra de abajo no sea vacia y sea distante de la letra actual de la palabra ingresada
                        if [ "$letraDown" != "#" ] && [ "$letraCmp" != "$letraDown" ]; then
                            resultado=0         # de serlo se detiene el recorrido de la palabra ingresada y se pone el resultado en falso
                            break               # esto indica que la palabra no se puede colocar hacia el norte en la casilla actual
                        fi
                    done

                    if [ $resultado == 1 ]; then        # si el resultado es verdadero
                        infoDir="$i,$j,s"               # se obtiene la informacion de la direccion (fila,columna,direccion)
                        dirPosibles+=("$infoDir")       # se concatena la posible direccion obtenida
                    fi
                fi


                # comprobar direccion oeste, se verifica si la palabra no se excede por la izquierda
                resultado=1
                if  (( $j + 1 - $lenPalabra >= 0)) ; then
                    j2="$j"             		     # copia el iterador de la columna actual
                    for ((k=0; k<$lenPalabra; k++)); do      # iterador k para recorrer cada letra de la palabra ingresada
                        letraL="${fila:j2:1}"                # se obtiene la letra de la fila actual y columna izquierda
                        letraCmp="${palabra:k:1}"            # se obtiene la letra actual de la palabra ingresada
                        (( j2-- ))		             # mover el iterador de la columna a la izquierda 
                    
                        # se verifica que la letra de abajo no sea vacia y sea distante de la letra actual de la palabra ingresada
                        if [ "$letraL" != "#" ] && [ "$letraCmp" != "$letraL" ]; then
                            resultado=0         # de serlo se detiene el recorrido de la palabra ingresada y se pone el resultado en falso
                            break               # esto indica que la palabra no se puede colocar hacia el norte en la casilla actual
                        fi
                    done

                    if [ $resultado == 1 ]; then        # si el resultado es verdadero
                        infoDir="$i,$j,o"               # se obtiene la informacion de la direccion (fila,columna,direccion)
                        dirPosibles+=("$infoDir")       # se concatena la posible direccion obtenida
                    fi
                fi


                # comprobar direccion este, se verifica si la palabra no se excede por la derecha
                resultado=1
                if  (( $j + $lenPalabra - 1 <= $ancho )) ; then
                    j2="$j"             		  # copia el iterador de la columna actual
                    for ((k=0; k<$lenPalabra; k++)); do   # iterador k para recorrer cada letra de la palabra ingresada
                        letraR="${fila:j2:1}"             # se obtiene la letra de la fila actual y columna derecha
                        letraCmp="${palabra:k:1}"         # se obtiene la letra actual de la palabra ingresada
                        (( j2++ ))                        # mover el iterador de la columna a la derecha
                        
                        # se verifica que la letra de abajo no sea vacia y sea distante de la letra actual de la palabra ingresada
                        if [ "$letraR" != "#" ] && [ "$letraCmp" != "$letraR" ]; then
                            resultado=0         # de serlo se detiene el recorrido de la palabra ingresada y se pone el resultado en falso
                            break               # esto indica que la palabra no se puede colocar hacia el norte en la casilla actual
                        fi
                    done

                    if [ $resultado == 1 ]; then        # si el resultado es verdadero
                        infoDir="$i,$j,e"               # se obtiene la informacion de la direccion (fila,columna,direccion)
                        dirPosibles+=("$infoDir")       # se concatena la posible direccion obtenida
                    fi
                fi                
            
    
                # comprobar direccion noroeste, se verifica si la palabra no se excede por la izquierda y por arriba
                resultado=1
                if  (( $j + 1 - $lenPalabra >= 0)) && (( $i + 1 - $lenPalabra >= 0 )) ; then
                    j2="$j"             			# copia el iterador de la columna actual
		    i2="$i"
                    for ((k=0; k<$lenPalabra; k++)); do      	# iterador k para recorrer cada letra de la palabra ingresada
                        filaLU="${sopaLetras[i2]}"		# se obtiene la fila de arriba
			letraLU="${filaLU:j2:1}"                # se obtiene la letra de la fila arriba y columna izquierda 
                        letraCmp="${palabra:k:1}"            	# se obtiene la letra actual de la palabra ingresada
                        (( j2-- ))                           	# mover el iterador de la columna actual hacia la izquierda
                        (( i2-- ))				# mover el iterador de la fila actual hacia arriba
		
                        # se verifica que la letra de abajo no sea vacia y sea distante de la letra actual de la palabra ingresada
                        if [ "$letraLU" != "#" ] && [ "$letraCmp" != "$letraLU" ]; then
                            resultado=0         # de serlo se detiene el recorrido de la palabra ingresada y se pone el resultado en falso
                            break               # esto indica que la palabra no se puede colocar hacia el norte en la casilla actual
                        fi
                    done

                    if [ $resultado == 1 ]; then        # si el resultado es verdadero
                        infoDir="$i,$j,no"              # se obtiene la informacion de la direccion (fila,columna,direccion)
                        dirPosibles+=("$infoDir")       # se concatena la posible direccion obtenida
                    fi
                fi 


		# comprobar direccion noreste, se verifica si la palabra no se excede por la derecha y por arriba
                resultado=1
                if  (( $j + $lenPalabra - 1 <= $ancho )) && (( $i + 1 - $lenPalabra >= 0 )) ; then
                    j2="$j"                                     # copia el iterador de la columna actual
                    i2="$i"
                    for ((k=0; k<$lenPalabra; k++)); do         # iterador k para recorrer cada letra de la palabra ingresada
                        filaRU="${sopaLetras[i2]}"   		# se obtiene la fila de arriba
                        letraRU="${filaRU:j2:1}"                # se obtiene la letra de la fila de arriba y columna derecha
                        letraCmp="${palabra:k:1}"               # se obtiene la letra actual de la palabra ingresada
                        (( j2++ ))                              # mover el iterador de la columna actual hacia la derecha
                        (( i2-- ))                              # mover el iterador de la fila actual hacia arriba

                        # se verifica que la letra de abajo no sea vacia y sea distante de la letra actual de la palabra ingresada
                        if [ "$letraRU" != "#" ] && [ "$letraCmp" != "$letraRU" ]; then
                            resultado=0         # de serlo se detiene el recorrido de la palabra ingresada y se pone el resultado en falso
                            break               # esto indica que la palabra no se puede colocar hacia el norte en la casilla actual
                        fi
                    done

                    if [ $resultado == 1 ]; then        # si el resultado es verdadero
                        infoDir="$i,$j,ne"              # se obtiene la informacion de la direccion (fila,columna,direccion)
                        dirPosibles+=("$infoDir")       # se concatena la posible direccion obtenida
                    fi
                fi


		# comprobar direccion suroeste, se verifica si la palabra no se excede por la izquierda y por abajo
                resultado=1
                if  (( $j + 1 - $lenPalabra >= 0)) && (( $i + $lenPalabra - 1 <= $alto )) ; then
                    j2="$j"                                     # copia el iterador de la columna actual
                    i2="$i"					# copia el iterador de la fila actual
                    for ((k=0; k<$lenPalabra; k++)); do         # iterador k para recorrer cada letra de la palabra ingresada
                        filaLD="${sopaLetras[i2]}"		# se obtiene la fila de abajo
                        letraLD="${filaLD:j2:1}"                # se obtiene la letra de la fila de abajo y columna izquierda
                        letraCmp="${palabra:k:1}"               # se obtiene la letra actual de la palabra ingresada
                        (( j2-- ))                              # mover el iterador de la columna actual hacia la izquierda
                        (( i2++ ))                              # mover el iterador de la fila actual hacia abajo

                        # se verifica que la letra de abajo no sea vacia y sea distante de la letra actual de la palabra ingresada
                        if [ "$letraLD" != "#" ] && [ "$letraCmp" != "$letraLD" ]; then
                            resultado=0         # de serlo se detiene el recorrido de la palabra ingresada y se pone el resultado en falso
                            break               # esto indica que la palabra no se puede colocar hacia el norte en la casilla actual
                        fi
                    done

                    if [ $resultado == 1 ]; then        # si el resultado es verdadero
                        infoDir="$i,$j,so"              # se obtiene la informacion de la direccion (fila,columna,direccion)
                        dirPosibles+=("$infoDir")       # se concatena la posible direccion obtenida
                    fi
                fi	
		
		
		# comprobar direccion sureste, se verifica si la palabra no se excede por la derecha y por abajo
                resultado=1
                if  (( $j + $lenPalabra - 1 <= $ancho )) && (( $i + $lenPalabra - 1 <= $alto )) ; then
                    j2="$j"                                     # copia el iterador de la columna actual
                    i2="$i"					# copia el iterador de la fila actual
                    for ((k=0; k<$lenPalabra; k++)); do         # iterador k para recorrer cada letra de la palabra ingresada
                        filaRD="${sopaLetras[i2]}"		# se obtiene la fila de abajo
                        letraRD="${filaRD:j2:1}"                # se obtiene la letra de la fila de abajo y columna derecha
                        letraCmp="${palabra:k:1}"               # se obtiene la letra actual de la palabra ingresada
                        (( j2++ ))                              # mover el iterador de la columna actual hacia la derecha
                        (( i2++ ))                              # mover el iterador de la fila actual hacia abajo

                        # se verifica que la letra de abajo no sea vacia y sea distante de la letra actual de la palabra ingresada
                        if [ "$letraRD" != "#" ] && [ "$letraCmp" != "$letraRD" ]; then
                            resultado=0         # de serlo se detiene el recorrido de la palabra ingresada y se pone el resultado en falso
                            break               # esto indica que la palabra no se puede colocar hacia el norte en la casilla actual
                        fi
                    done

                    if [ $resultado == 1 ]; then        # si el resultado es verdadero
                        infoDir="$i,$j,se"              # se obtiene la informacion de la direccion (fila,columna,direccion)
                        dirPosibles+=("$infoDir")       # se concatena la posible direccion obtenida
                    fi
                fi
            fi	
	done
    done
	
    echo "${dirPosibles[@]}"
}

# coloca una palabra ingresada en la sopa de letras, segun la direccion ingresada 
# recibe: 
# 	$1: un numero entero positivo que representa la posicion de la fila a colocar 
#       $2: un numero entero positivo que representa la posicion de la columna a colocar
#       $3: un string que representa la direccion a colocar (n,s,e,o,no,ne,so,se)
#       $4: un string que representa la palabra a colocar
#       $5: un array de strings que representa la sopa de letras
colocarPalabraSopaLetras () {
    posFil="$1"
    posCol="$2"
    dir="$3"
    palabra="$4"
    sopaLetras="$5"
    lenPalabra="${#palabra}" 

    for ((k=0; k<lenPalabra; k++)) ; do  # se recorren todas las letras de la palabra
        letra="${palabra:k:1}"					# se obtiene la letra actual de la palabra
        fila="${sopaLetras[posFil]}"				# se obtiene la fila actual de la sopa de letras
        nuevaFila="${fila:0:$posCol}$letra${fila:$posCol+1}" 	# se arma la nueva fila, remplazando (#) por la letra 
        sopaLetras[posFil]="$nuevaFila"        			# se remplaza la fila por la nueva fila

	# segun la dir ingresada, se va moviendo el iterador
    	if [ "$dir" == "n" ] ; then
    	    (( posFil-- ))
        fi
 
        if [ "$dir" == "s" ] ; then
            (( posFil++ ))
        fi

        if [ "$dir" == "o" ] ; then
            (( posCol-- ))
        fi 
     
	if [ "$dir" == "e" ] ; then
            (( posCol++ ))
        fi
	
	if [ "$dir" == "no" ] ; then
	    (( posFil-- ))
            (( posCol-- ))
        fi

        if [ "$dir" == "ne" ] ; then
            (( posFil-- ))
            (( posCol++ ))
        fi

        if [ "$dir" == "so" ] ; then
            (( posFil++ ))
            (( posCol-- ))
        fi

        if [ "$dir" == "se" ] ; then
            (( posFil++ ))
            (( posCol++ ))
        fi 
   
    done  

    echo "${sopaLetras[@]}"
}

# genera todas las letras a usar en las casillas donde no hayan palabras
# rebibe:
# 	$1: un string que representa la palabra
#	$2: un string que representa todas las letras disponibles 
# retorna: un string que con todas las letras disponibles agregadas de la palabra ingresada
obtenerLetrasDisponibles () {
    palabra="$1"
    letrasDisponibles="$2"

    #Crear la lista con todas las letras diferentes de las palabras ingresadas
    for ((i=0; i<${#palabra}; i++)); do
        letra="${palabra:$i:1}"
        resultado=0

        for ((j=0; j<${#letrasDisponibles}; j++)); do		# busca si la letra ya se encuentra en la lista
            letraDisponible="${letrasDisponibles:$j:1}"
            if [ "$letra" == "$letraDisponible" ]; then
                resultado=1
            fi
        done
        if [ "$resultado" == 0 ]; then
            letrasDisponibles+="$letra"		# se concatena la letra a las letras disponibles
        fi
    done
    echo "$letrasDisponibles"			# se retorna las letras disponibles 
}

# Funcion principal que controla los procesos para generar una sopa letras
# recibe: 
# 	$1: es un string que representa el nombre del archivo de texto con las palabras de la sopa de letra
#       $2: es un entero positivo que representa el ancho de la sopa de letras 
#       $3: es un entero positivo que representa el alto de la sopa de letras
main () {
    verificarEntradaDatos "$1" "$2" "$3"
    archivoPalabras="$1"
    ancho="$2"
    alto="$3"
    letrasDisponibles=""    
    sopaLetras=($(inicializarSopaLetras "$ancho" "$alto"))    

    while IFS= read palabra  # se recorre cada palabra del archivo ingresado 
    do
        letrasDisponibles=$(obtenerLetrasDisponibles "$palabra" "$letrasDisponibles") # se agregan las letras de la palabra actual a la lista  
	    dirPosibles=($(generarDirPosibles "$ancho" "$alto" "$sopaLetras" "$palabra")) # se obtiene las direcciones posibles para la palabra actual
        posAleatoria=$(generarNumeroAleatorio $(( ${#dirPosibles[@]} - 1 ))) 	# de todas las direcciones posibles, se saca una aleatoria
        dirAleatoria="${dirPosibles[posAleatoria]}"  		# se guarda esa info de la direccion aleatoria
        # Se obtienen los datos de la direccion en variables. El formato es: "fila,columna,direccion"
        fil=$(echo "$dirAleatoria" | awk -F ',' '{print $1}') 	# se obtiene el contenido hasta la primer coma
        col=$(echo "$dirAleatoria" | awk -F ',' '{print $2}')   # se obtiene el contenido desde la primer coma hasta la segunda
        dir=$(echo "$dirAleatoria" | awk -F ',' '{print $3}')   # se obtiene el contenido desde la segunda coma hasta el final
        sopaLetras=($(colocarPalabraSopaLetras "$fil" "$col" "$dir" "$palabra" "$sopaLetras"))	# se coloca la palabra en la direccion aleatoria     
    done < $archivoPalabras
            
    sopaLetras=($(completarSopaLetras "$ancho" "$alto" "$sopaLetras" "$letrasDisponibles")) # se completa la sopa con letras aleatorias 
    imprimirSopaLetras "$ancho" "$alto" "$sopaLetras"	# se imprime la sopa con espacios en blanco entre cada una
}

main "$1" "$2" "$3" # se llama a la funcion principal, con el nombre del archivo con las palabras, el ancho y el alto 



