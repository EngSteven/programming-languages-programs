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
#       1. navegar hasta la ubicacion del archivo
#       2. hacer el archivo ejecutable (chmod +x nombreArchivo.sh)
#       3. ejecutar el archivo (./nombreArchivo.sh p1 p2) donde
#               p1 es el nombre del archivo de texto con la lista de palabras
#               p2 es el nombre del archivo de texto con la sopa de letras
#		NOTA: la sopa de letras debe tener espacios en blanco entre cada palabra y un salto de linea entre cada fila, tal y como lo imprime el genenerador de sopa de letras
#               ejemplo: ./Sopa-Solver-Sequeira-Steven.sh listaPalabras.txt sopaLetras.txt


# -------------------------Análisis de Resultados----------------------------------------------------

# Tabla de autocalificación:

# Parte                        calificación
# Portada                           A
# Manual de usuario                 A
# Solucionador Sopa de Letras       A



# verifica si se ingresaron los datos de entrada
# recibe:
#       $1: el nombre del archivo de texto que contiene las palabras
#       $2: un numero entero positivo que representa el ancho de la sopa letras
# retorna: un mensaje de error en caso de no haber ingresado algun parametro

verificarEntradaDatos () {
    if [ -z "$1" ]; then                                                            
	echo "Error: no se ha ingresado el nombre del archivo con la lista de palabras"
        exit 1
    fi

    if [ -z "$2" ]; then
        echo "Error: no se ha ingresado el nombre del archivo con la sopa de letras"
        exit 1
    fi

    if [ ! -f "$1" ]; then
        echo "Error: el nombre del archivo ingresado, con la lista de palabras, no existe"
        exit 1
    fi 
    
    if [ ! -f "$2" ]; then
        echo "Error: el nombre del archivo ingresado, con la sopa de letras, no existe"
        exit 1
    fi
}


# remueve los espacios en blanco que contiene la sopa de letras del archivo y lo guarda en un array 
# recibe: 
#	$1: el nombre del archivo que contiene la sopa de letras
# retorna: un array de strings con la sopa de letras sin espacios en blanco
quitarEspaciosSopaLetras () {
    archivoSopa="$1"
    declare -a sopaLetras    

    while IFS= read fila; do				          # recorrer cada fila de la sopa
	filaSinEsp=$(echo "$fila" | awk '{gsub(" ", ""); print}') # remplazar cada espacio en blanco
        sopaLetras+=("$filaSinEsp")				  # agregar cada fila modificada
    done < $archivoSopa

    echo "${sopaLetras[@]}"					  # retornar la sopa de letras
}

# busca la ubicacion de una palabra en una sopa de letras y su direccion
# recibe:
# 	$1: un numero entero positivo que representa el ancho
#	$2: un numero entero positivo que representa el alto
#	$3: un array de strings que representa la sopa de letras
#	$4: un string que representa la palabra a buscar
# retorna: un strin con las coordenadas y direccion de la palabra, 0 de lo contrario
buscarPalabraSopaLetras () {
    ancho="$1"
    alto="$2"
    sopaLetras="$3"
    palabra="$4"
    lenPalabra="${#palabra}" 
    infoDir="0"

    #echo "ancho: $ancho - alto: $alto - palabra: $palabra - n filas: ${#sopaLetras[@]}"
	 
    for ((i=0; i<alto; i++)); do 	# iterador i para recorrer las filas de la sopa de letras
    	fila="${sopaLetras[i]}"  	# se obtiene la fila actual de la sopa de letras
        for ((j=0; j<ancho; j++)); do	# iterador j para recorrer las columnas de la la fila actual
 
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
			if [ "$letraCmp" != "$letraUp" ]; then 	
                            resultado=0		# de serlo se detiene el recorrido de la palabra ingresada y se pone el resultado en falso
			    break		# esto indica que la palabra no se puede colocar hacia el norte en la casilla actual
			fi	
                    done
                    
  		    if [ $resultado == 1 ]; then        # si el resultado es verdadero
            		infoDir="$i,$j,norte"       # se obtiene la informacion de la direccion (fila,columna,direccion)
			break
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
                        if [ "$letraCmp" != "$letraDown" ]; then
                            resultado=0         # de serlo se detiene el recorrido de la palabra ingresada y se pone el resultado en falso
                            break               # esto indica que la palabra no se puede colocar hacia el norte en la casilla actual
                        fi
                    done
                    
                    if [ $resultado == 1 ]; then        # si el resultado es verdadero
                        infoDir="$i,$j,sur"       # se obtiene la informacion de la direccion (fila,columna,direccion)
                        break
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
                        if [ "$letraCmp" != "$letraL" ]; then
                            resultado=0         # de serlo se detiene el recorrido de la palabra ingresada y se pone el resultado en falso
                            break               # esto indica que la palabra no se puede colocar hacia el norte en la casilla actual
                        fi
                    done

                    if [ $resultado == 1 ]; then        # si el resultado es verdadero
                        infoDir="$i,$j,oeste"       # se obtiene la informacion de la direccion (fila,columna,direccion)
                        break
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
                        if [ "$letraCmp" != "$letraR" ]; then
                            resultado=0         # de serlo se detiene el recorrido de la palabra ingresada y se pone el resultado en falso
                            break               # esto indica que la palabra no se puede colocar hacia el norte en la casilla actual
                        fi
                    done

                    if [ $resultado == 1 ]; then        # si el resultado es verdadero
                        infoDir="$i,$j,este"       # se obtiene la informacion de la direccion (fila,columna,direccion)
                        break
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
                        if [ "$letraCmp" != "$letraLU" ]; then
                            resultado=0         # de serlo se detiene el recorrido de la palabra ingresada y se pone el resultado en falso
                            break               # esto indica que la palabra no se puede colocar hacia el norte en la casilla actual
                        fi
                    done

                    if [ $resultado == 1 ]; then        # si el resultado es verdadero
                        infoDir="$i,$j,noroeste"       # se obtiene la informacion de la direccion (fila,columna,direccion)
                        break
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
                        if [ "$letraCmp" != "$letraRU" ]; then
                            resultado=0         # de serlo se detiene el recorrido de la palabra ingresada y se pone el resultado en falso
                            break               # esto indica que la palabra no se puede colocar hacia el norte en la casilla actual
                        fi
                    done

                    if [ $resultado == 1 ]; then        # si el resultado es verdadero
                        infoDir="$i,$j,noreste"       # se obtiene la informacion de la direccion (fila,columna,direccion)
                        break
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
                        if [ "$letraCmp" != "$letraLD" ]; then
                            resultado=0         # de serlo se detiene el recorrido de la palabra ingresada y se pone el resultado en falso
                            break               # esto indica que la palabra no se puede colocar hacia el norte en la casilla actual
                        fi
                    done

                    if [ $resultado == 1 ]; then        # si el resultado es verdadero
                        infoDir="$i,$j,suroeste"       # se obtiene la informacion de la direccion (fila,columna,direccion)
                        break
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
                        if [ "$letraCmp" != "$letraRD" ]; then
                            resultado=0         # de serlo se detiene el recorrido de la palabra ingresada y se pone el resultado en falso
                            break               # esto indica que la palabra no se puede colocar hacia el norte en la casilla actual
                        fi
                    done
                    
		    if [ $resultado == 1 ]; then        # si el resultado es verdadero
                        infoDir="$i,$j,sureste"       # se obtiene la informacion de la direccion (fila,columna,direccion)
                        break
                    fi
                fi
	done 
        if [ "$infoDir" != "0" ]; then        # si el resultado es verdadero
            break
        fi
    done

    echo "$infoDir"
}

# funcion principal que controla el proceso de solucionar una sopa de letras
# recibe:
# 	$1: nombre del archivo que contiene la lista de palabras
#	$2: nombre del archivo que contiene la sopa de letras
main () {
    verificarEntradaDatos "$1" "$2"
    archivoPalabras="$1"
    archivoSopa="$2"
  
    sopaLetras=($(quitarEspaciosSopaLetras "$archivoSopa"))	# se obtiene la sopa de letras sin espacios en blanco
    fila="${sopaLetras[0]}"			# se guarda la fila 0
    ancho="${#fila}" 				# para obtener el ancho de la sopa de letras
    alto="${#sopaLetras[@]}"    		# se obtiene la altura de la sopa de letras
    
    echo "Solucion de la sopa de letras"
    while IFS= read palabra; do		# se recorre cada palabra del archivo ingresado
   	infoDir=$(buscarPalabraSopaLetras "$ancho" "$alto" "$sopaLetras" "$palabra") # se obtiene la direccion "fil,col,dir"
        if [ "$infoDir" == "0" ]; then	# en caso de que la direccion sea "0"
            echo "La palabra $palabra no se pudo encontrar en la sopa de letras"  # alertamos que no se encontro la palabra  
   	else
            fil=$(echo "$infoDir" | awk -F ',' '{print $1}') 	# se obtiene el contenido hasta la primer coma
	    col=$(echo "$infoDir" | awk -F ',' '{print $2}')   # se obtiene el contenido desde la primer coma hasta la segunda
	    dir=$(echo "$infoDir" | awk -F ',' '{print $3}')   # se obtiene el contenido desde la segunda coma hasta el final
            echo "Palabra $palabra - Coordenadas [$fil,$col] - Direccion $dir"  # se muestra la palabra con su coordena y direccion
        fi     
    done < $archivoPalabras	
}

main "$1" "$2"
