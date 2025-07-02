/*

------------------------------------------- Portada -------------------------------------------  
Tarea: Fractales 
Estudiante: Steven Sequeira Araya 
Carnet: 2022080836
Instituto Tecnológico de Costa Rica 
Escuela Ingeniería en Computación 
Lenguajes de Programación 
Fecha de entrega: 15/05/2024 
------------------------------------------- Portada -------------------------------------------  


------------------------------------- Manual de usuario ---------------------------------------

Pasos para cargar el archivo fuente en Swi-Prolog 
  1. Descargue el archivo fuente en un máquina local 
  2. Cargue el archivo fuente en Swi-Prolog (2 formas):
    2.1 Pulsando el botón "file", luego "Consult ...", buscar el archivo fuente y seleccionarlo.
    2.2 O también puede hacer la consulta: "consult('ubicacion/nombreArchivo.pl')."
  3. Una vez cargado el archivo fuente, siga lo siguiente para poder ejecutarlos.
    Formato: nombreFractalTipo(nivel, tamaño). 
    Donde
      NombreFractal: indica el nombre que representa al fractal 
      Tipo: M, S, R, que representa color monocromático, por secuencia y aleatorio, respectivamente
      nivel: es el nivel del fractal 
      tamaño: es el tamaño del fractal  
    Ejemplo: si hace la consulta "copoDeNieveM(4, 600).", debería imprimir en pantalla el fractal del copo de nieve, 
    en su versión monocromática, en el nivel 4 y con un tamaño de 600.

Fractales disponibles con sus relaciones recomendadas:
  Recuerde que "M" es para color monocromático, "R" es para colores aleatorios y "S" es para colores en secuencia.
  
  copoDeNieveM(4, 600).
  copoDeNieveR(4, 600).
  copoDeNieveS(4,600).

  tapeteExternoM(4, 400).
  tapeteExternoR(4, 400).
  tapeteExternoS(4, 400).

  tapeteInternoM(4, 500).
  tapeteInternoR(4, 500).
  tapeteInternoS(4, 500).

  corbatinM(4, 300).
  corbatinR(4, 300).
  corbatinS(4, 300).

  original1M(5, 280).
  original1R(5, 280).
  original1S(5, 280).

  original2M(4, 400).
  original2R(4, 400).
  original2S(4, 400).

  original3M(3, 200).
  original3R(3, 200).
  original3S(3, 200).
    
  panalM(1, 100).
  panalR(1, 100).
  panalS(1, 100). 

  estrellaM(1, 100).
  estrellaS(1, 100).
  estrellaR(1, 100).

  NOTAS:
    Para el fractal del panal y la estrella, solo dibuja bien el nivel 1, si excede este nivel se formará una figura con poco sentido.

------------------------------------- Manual de usuario ---------------------------------------

------------------------------------- Análisis de resultados ---------------------------------- 
  Tabla de autocalificación:

  Parte                           Calificación
  Portada                               A
  Manual de usuario                     A 
  Análisis de Resultados                A 
  Copo de nieve monocromático           A
  Copo de nieve secuencia               A
  Copo de nieve aleatorio               A
  Tapete externo monocromático          A
  Tapete externo secuencia              A
  Tapete externo aleatorio              A
  Tapete interno monocromático          A
  Tapete interno secuencia              A
  Tapete interno aleatorio              A
  Aros monocromático                    E
  Aros secuencia                        E
  Aros aleatorio                        E
  Corbatín monocromático                A 
  Corbatín secuencia                    A
  Corbatín aleatorio                    A
  Panal monocromático                   C
  Panal secuencia                       C
  Panal aleatorio                       C
  Tonel monocromático                   E
  Tonel secuencia                       E
  Tonel aleatorio                       E
  Estrella monocromático                C
  Estrella secuencia                    C
  Estrella aleatorio                    C
  Original 1 monocromático              A
  Original 1 secuencia                  A
  Original 1 aleatorio                  A
  Original 2 monocromático              A
  Original 2 secuencia                  A
  Original 2 aleatorio                  A
  Original 3 monocromático              A
  Original 3 secuencia                  A
  Original 3 aleatorio                  A
  Imágenes solicitadas                  A

  Equivalencia de calificación:
  A - Concluido con éxito
  B - Concluido con problemas pequeños
  C - Concluido con problemas mayores
  D - Concluido solo en diseño
  E - No implementado
------------------------------------- Análisis de resultados ----------------------------------


------------------------------------------- Extras -------------------------------------------  
Paleta de algunos colores básicos RGB (2^16)

Rojo puro: (65535, 0, 0)
Verde puro: (0, 65535, 0)
Azul puro: (0, 0, 65535)
Amarillo: (65535, 65535, 0)
Blanco: (65535, 65535, 65535)
Negro: (0, 0, 0)
Cian: (0, 65535, 65535)
Magenta: (65535, 0, 65535)
Naranja: (65535, 32768, 0)
Violeta: (49151, 0, 65535)
Rosa: (65535, 32768, 49151)
Verde lima: (32768, 65535, 0)
Turquesa: (0, 49151, 49151)
Gris claro: (49151, 49151, 49151)
Gris oscuro: (32768, 32768, 32768)
Amarillo claro: (65535, 65535, 32768)
Azul cielo: (0, 49151, 65535)
Rojo oscuro: (49151, 0, 0)
Verde oscuro: (0, 32768, 0)
Azul oscuro: (0, 0, 32768)
Celeste: (32768, 49151, 65535)
Marrón claro: (49151, 32768, 16384)
Lavanda: (49151, 32768, 65535)
Verde oliva: (32768, 49151, 16384)
Amarillo pálido: (65535, 65535, 49151)
Naranja oscuro: (49151, 16384, 0)
Azul marino: (0, 16384, 49151)
Gris azulado: (32768, 49151, 49151)
Turquesa oscuro: (0, 32768, 32768)
Amarillo verdoso: (49151, 65535, 16384)
Beige(57311, 49151, 32768)

------------------------------------------- Extras -------------------------------------------  

*/


% Código de turtle 

:- module(turtle,
    [ turtle_init/0    % Initialize the Turtle.
    , turtle_term/0    % Terminate the Turtle.
    , turtle_drawto/2  % Draw a line to an absolute point P(X/Y).
    , turtle_draw/1    % Draw a line of length L in the current direction.
    , turtle_turn/1    % Turn the direction of the Turtle by W degrees relative.
    , turtle_turnto/1  % Turn the Turtle to the absolute angle W.
    , turtle_move/1    % Move the Turtle a line of length L in the current direction.
    , turtle_moveto/2  % Move the Turtle to a point P(X/Y) without drawing.
    , copoDeNieveM/2
    , copoDeNieveS/2
    , copoDeNieveR/2
    , tapeteExternoM/2
    , tapeteExternoS/2
    , tapeteExternoR/2
    , tapeteInternoM/2
    , tapeteInternoS/2
    , tapeteInternoR/2
    , corbatinM/2
    , corbatinR/2
    , corbatinS/2
    , original1M/2
    , original1S/2
    , original1R/2
    , original2M/2
    , original2S/2
    , original2R/2
    , original3M/2
    , original3S/2
    , original3R/2
    , panalM/2
    , panalS/2
    , panalR/2
    , estrellaM/2
    , estrellaS/2
    , estrellaR/2
  ]).

:- use_module(library(pce)).

turtle_init:-
  % delete old state
  retractall(turtle(_,_,_)),

  % set new state
  B is 1200,
  H is 1000,
  B1 is B /4,
  H1 is H /4,
  W1 is 0,
  assert(turtle(B1, H1, W1)),

  % close old LOGO-window
  free(@logo),

  % open new LOGO-window
  new(@logo, picture('Fractales Prueba', size(B, H))),
  send(@logo, background, black),   % Se pone un fondo de color oscuro
  send(@logo, open_centered).

turtle_term:-
  retractall(logo/3),
  free(@logo).

turtle_drawto(X, Y):-
  retract(turtle(X1, Y1, W)),
  send(@logo, display, new(_, line(X1, Y1, X, Y))),
  assert(turtle(X, Y, W)).

% dibuja una linea de L pixeles
turtle_draw(L):-
  retract(turtle(X1, Y1, W)),
  X2 is X1 + L*cos(W*pi/180),
  Y2 is Y1 - L*sin(W*pi/180),
  send(@logo, display, new(Linea, line(X1, Y1, X2, Y2))),   
  new(C, colour(@default, 65535, 65535, 65535)),
  send(Linea, colour, C),    % Se envia la linea con un color blanco
  assert(turtle(X2, Y2, W)).

% dibuja una linea de L pixeles del color RGB ingresado
turtle_draw_rgb(L,R,G,B):-
  retract(turtle(X1, Y1, W)),
  X2 is X1 + L*cos(W*pi/180),
  Y2 is Y1 - L*sin(W*pi/180),
  send(@logo, display, new(Linea, line(X1, Y1, X2, Y2))),   
  new(C, colour(@default, R, G, B)),
  send(Linea, colour, C),    % Se envia la linea con un color blanco
  assert(turtle(X2, Y2, W)).

% dibuja una linea desde de L pixeles con coleres aleatorios
turtle_draw_rand(L):-
  retract(turtle(X1, Y1, W)),
  X2 is X1 + L*cos(W*pi/180),
  Y2 is Y1 - L*sin(W*pi/180),
  send(@logo, display, new(Linea, line(X1, Y1, X2, Y2))), 
  % se inicializa el min del RGB rand en 20000, para evitar lineas muy oscuras
  random(20000, 65535, RAND1),
  random(20000, 65535, RAND2),
  random(20000, 65535, RAND3),
  new(C, colour(@default, RAND1, RAND2, RAND3)),  
  send(Linea, colour, C),    % Se envia la linea con un color blanco
  assert(turtle(X2, Y2, W)).

turtle_turn(W):-
  retract(turtle(X, Y, W1)),
  W2 is W1 + W,
  assert(turtle(X, Y, W2)).

turtle_turnto(W):-
  retract(turtle(X, Y, _)),
  assert(turtle(X, Y, W)).

turtle_move(L):-
  retract(turtle(X1, Y1, W)),
  X2 is X1 + L*cos(W*pi/180),
  Y2 is Y1 - L*sin(W*pi/180),
  assert(turtle(X2, Y2, W)).

turtle_moveto(X, Y):-
  retract(turtle(_, _, W)),
  assert(turtle(X, Y, W)).



%------------------------------------- Copo de nieve ---------------------------------------------

dragonM(0,Tam):- turtle_draw(Tam).
dragonM(N,Tam):-
  Seg is (Tam div 3),
  N1 is (N-1),
  dragonM(N1,Seg),
  turtle_turn(60),
  dragonM(N1,Seg),
  turtle_turn(-120),
  dragonM(N1,Seg),
  turtle_turn(60),
  dragonM(N1,Seg).

dragonS(0,Tam,R,G,B):- turtle_draw_rgb(Tam,R,G,B).
dragonS(N,Tam,R,G,B):-
  Seg is (Tam div 3),
  N1 is (N-1),
  dragonS(N1,Seg,49151,49151,49151),  % color gris claro 
  turtle_turn(60),
  dragonS(N1,Seg,49151,0,0),          % color rojo oscuro 
  turtle_turn(-120),
  dragonS(N1,Seg,49151,0,65535),      % color violeta 
  turtle_turn(60),
  dragonS(N1,Seg,65535,0,65535).      % color magenta

dragonR(0,Tam):- turtle_draw_rand(Tam).
dragonR(N,Tam):-
  Seg is (Tam div 3),
  N1 is (N-1),
  dragonR(N1,Seg),
  turtle_turn(60),
  dragonR(N1,Seg),
  turtle_turn(-120),
  dragonR(N1,Seg),
  turtle_turn(60),
  dragonR(N1,Seg).

copoDeNieveM(N,Tam):-
  turtle_init,
  dragonM(N,Tam),
  turtle_turn(-120),
  dragonM(N,Tam),
  turtle_turn(-120),
  dragonM(N,Tam),
  turtle_turn(-120).

copoDeNieveS(N,Tam):-
  turtle_init,
  dragonS(N,Tam,0,0,0),
  turtle_turn(-120),
  dragonS(N,Tam,0,0,0),
  turtle_turn(-120),
  dragonS(N,Tam,0,0,0),
  turtle_turn(-120).
  
copoDeNieveR(N,Tam):-
  turtle_init,
  dragonR(N,Tam),
  turtle_turn(-120),
  dragonR(N,Tam),
  turtle_turn(-120),
  dragonR(N,Tam),
  turtle_turn(-120).


%------------------------------------- Tapete externo ---------------------------------------------

tapeteExternoBaseM(0,Tam):- turtle_draw(Tam).
tapeteExternoBaseM(N,Tam):-
  Seg is (Tam div 3),
  N1 is (N-1),
  tapeteExternoBaseM(N1, Seg),
  turtle_turn(90),
  tapeteExternoBaseM(N1, Seg),
  turtle_turn(-90),
  tapeteExternoBaseM(N1, Seg),
  turtle_turn(-90),
  tapeteExternoBaseM(N1, Seg),
  turtle_turn(90),
  tapeteExternoBaseM(N1, Seg).

tapeteExternoBaseS(0,Tam,R,G,B):- turtle_draw_rgb(Tam,R,G,B).
tapeteExternoBaseS(N,Tam,R,G,B):-
  Seg is (Tam div 3),
  N1 is (N-1),
  tapeteExternoBaseS(N1, Seg, 32768, 49151, 65535),  % color celeste
  turtle_turn(90),
  tapeteExternoBaseS(N1, Seg, 65535, 65535, 9151),   % color amarillo pálido
  turtle_turn(-90),
  tapeteExternoBaseS(N1, Seg, 49151, 16384, 0),      % color naranja oscuro  
  turtle_turn(-90),
  tapeteExternoBaseS(N1, Seg, 32768, 49151, 16384),  % color verde oliva
  turtle_turn(90),
  tapeteExternoBaseS(N1, Seg, 0, 49151, 49151).      % color turquesa

tapeteExternoBaseR(0,Tam):- turtle_draw_rand(Tam).
tapeteExternoBaseR(N,Tam):-
  Seg is (Tam div 3),
  N1 is (N-1),
  tapeteExternoBaseR(N1, Seg),
  turtle_turn(90),
  tapeteExternoBaseR(N1, Seg),
  turtle_turn(-90),
  tapeteExternoBaseR(N1, Seg),
  turtle_turn(-90),
  tapeteExternoBaseR(N1, Seg),
  turtle_turn(90),
  tapeteExternoBaseR(N1, Seg).

tapeteExternoM(N,Tam):-
  turtle_init,
  tapeteExternoBaseM(N, Tam),
  turtle_turn(-90),
  tapeteExternoBaseM(N, Tam),
  turtle_turn(-90),
  tapeteExternoBaseM(N, Tam),
  turtle_turn(-90),
  tapeteExternoBaseM(N, Tam).

tapeteExternoS(N,Tam):-
  turtle_init,
  tapeteExternoBaseS(N, Tam, 0, 0, 0),
  turtle_turn(-90),
  tapeteExternoBaseS(N, Tam, 0, 0, 0),
  turtle_turn(-90),
  tapeteExternoBaseS(N, Tam, 0, 0, 0),
  turtle_turn(-90),
  tapeteExternoBaseS(N, Tam, 0, 0, 0).

tapeteExternoR(N,Tam):-
  turtle_init,
  tapeteExternoBaseR(N, Tam),
  turtle_turn(-90),
  tapeteExternoBaseR(N, Tam),
  turtle_turn(-90),
  tapeteExternoBaseR(N, Tam),
  turtle_turn(-90),
  tapeteExternoBaseR(N, Tam).


%------------------------------------- Tapete interno ---------------------------------------------


tapeteInternoBaseM(0,Tam):- turtle_draw(Tam).
tapeteInternoBaseM(N,Tam):-
  Seg is (Tam div 3),
  N1 is (N-1),
  tapeteInternoBaseM(N1, Seg),
  turtle_turn(-90),
  tapeteInternoBaseM(N1, Seg),
  turtle_turn(90),
  tapeteInternoBaseM(N1, Seg),
  turtle_turn(90),
  tapeteInternoBaseM(N1, Seg),
  turtle_turn(-90),
  tapeteInternoBaseM(N1, Seg).

tapeteInternoBaseS(0,Tam,R,G,B):- turtle_draw_rgb(Tam,R,G,B).
tapeteInternoBaseS(N,Tam,R,G,B):-
  Seg is (Tam div 3),
  N1 is (N-1),
  tapeteInternoBaseS(N1, Seg, 0, 16384, 49151),     % color azul marino
  turtle_turn(-90),
  tapeteInternoBaseS(N1, Seg, 0, 16384, 49151),     % color azul marino 
  turtle_turn(90),
  tapeteInternoBaseS(N1, Seg, 0, 32768, 0),         % color verde oscuro 
  turtle_turn(90),
  tapeteInternoBaseS(N1, Seg, 49151, 32768, 65535), % color lavanda 
  turtle_turn(-90),
  tapeteInternoBaseS(N1, Seg, 49151, 32768, 65535). % color lavanda

tapeteInternoBaseR(0,Tam):- turtle_draw_rand(Tam).
tapeteInternoBaseR(N,Tam):-
  Seg is (Tam div 3),
  N1 is (N-1),
  tapeteInternoBaseR(N1, Seg),
  turtle_turn(-90),
  tapeteInternoBaseR(N1, Seg),
  turtle_turn(90),
  tapeteInternoBaseR(N1, Seg),
  turtle_turn(90),
  tapeteInternoBaseR(N1, Seg),
  turtle_turn(-90),
  tapeteInternoBaseR(N1, Seg).

tapeteInternoM(N,Tam):-
  turtle_init,
  tapeteInternoBaseM(N, Tam),
  turtle_turn(-90),
  tapeteInternoBaseM(N, Tam),
  turtle_turn(-90),
  tapeteInternoBaseM(N, Tam),
  turtle_turn(-90),
  tapeteInternoBaseM(N, Tam).

tapeteInternoS(N,Tam):-
  turtle_init,
  tapeteInternoBaseS(N, Tam, 0, 0, 0),
  turtle_turn(-90),
  tapeteInternoBaseS(N, Tam, 0, 0, 0),
  turtle_turn(-90),
  tapeteInternoBaseS(N, Tam, 0, 0, 0),
  turtle_turn(-90),
  tapeteInternoBaseS(N, Tam, 0, 0, 0).

tapeteInternoR(N,Tam):-
  turtle_init,
  tapeteInternoBaseR(N, Tam),
  turtle_turn(-90),
  tapeteInternoBaseR(N, Tam),
  turtle_turn(-90),
  tapeteInternoBaseR(N, Tam),
  turtle_turn(-90),
  tapeteInternoBaseR(N, Tam).


%------------------------------------- Corbatin ---------------------------------------------

corbatinBaseM(0,Tam):- turtle_draw(Tam).
corbatinBaseM(N,Tam):- 
  Seg is (Tam div 2),
  N1 is (N-1), 
  turtle_turn(60),
  corbatinBaseM(N1,Seg),
  turtle_turn(-120),
  corbatinBaseM(N1,Seg),
  corbatinBaseM(N1,Seg),
  turtle_turn(120),
  corbatinBaseM(N1,Seg),
  turtle_turn(-60).

corbatinBaseS(0,Tam,R,G,B):- turtle_draw_rgb(Tam,R,G,B).
corbatinBaseS(N,Tam,R,G,B):- 
  Seg is (Tam div 2),
  N1 is (N-1), 
  turtle_turn(60),
  corbatinBaseS(N1, Seg, 49151, 49151, 49151),  % gris claro 
  turtle_turn(-120),
  corbatinBaseS(N1, Seg, 49151, 0, 0),      % rojo oscuro 
  corbatinBaseS(N1, Seg, 49151, 0, 0),      % rojo oscuro
  turtle_turn(120),
  corbatinBaseS(N1, Seg, 49151, 49151, 49151),  % gris claro 
  turtle_turn(-60).

corbatinBaseR(0,Tam):- turtle_draw_rand(Tam).
corbatinBaseR(N,Tam):- 
  Seg is (Tam div 2),
  N1 is (N-1), 
  turtle_turn(60),
  corbatinBaseR(N1,Seg),
  turtle_turn(-120),
  corbatinBaseR(N1,Seg),
  corbatinBaseR(N1,Seg),
  turtle_turn(120),
  corbatinBaseR(N1,Seg),
  turtle_turn(-60).

corbatinM(N,Tam):-
  turtle_init,
  corbatinBaseM(N,Tam),
  turtle_turn(-90),
  corbatinBaseM(N,Tam),
  turtle_turn(-90),
  corbatinBaseM(N,Tam),
  turtle_turn(-90),
  corbatinBaseM(N,Tam).

corbatinS(N,Tam):-
  turtle_init,
  corbatinBaseS(N,Tam,0,0,0),
  turtle_turn(-90),
  corbatinBaseS(N,Tam,0,0,0),
  turtle_turn(-90),
  corbatinBaseS(N,Tam,0,0,0),
  turtle_turn(-90),
  corbatinBaseS(N,Tam,0,0,0).

corbatinR(N,Tam):-
  turtle_init,
  corbatinBaseR(N,Tam),
  turtle_turn(-90),
  corbatinBaseR(N,Tam),
  turtle_turn(-90),
  corbatinBaseR(N,Tam),
  turtle_turn(-90),
  corbatinBaseR(N,Tam).
  

%------------------------------------- Original 1---------------------------------------------

original1BaseM(0,Tam):- turtle_draw(Tam).
original1BaseM(N,Tam):-
  Seg is (Tam div 2),
  N1 is (N-1),
  original1BaseM(N1, Seg),
  turtle_turn(120),
  original1BaseM(N1, Seg),
  turtle_turn(-60),
  original1BaseM(N1, Seg),
  turtle_turn(-120),
  original1BaseM(N1, Seg),
  turtle_turn(-60),
  original1BaseM(N1, Seg),
  turtle_turn(120),
  original1BaseM(N1, Seg).

original1BaseS(0,Tam,R,G,B):- turtle_draw_rgb(Tam,R,G,B).
original1BaseS(N,Tam,R,G,B):-
  Seg is (Tam div 2),
  N1 is (N-1),
  original1BaseS(N1, Seg, 0, 32768, 32768),       % color turquesa oscuro
  turtle_turn(120),
  original1BaseS(N1, Seg, 0, 65535, 65535),   % Color celeste
  turtle_turn(-60),
  original1BaseS(N1, Seg, 0, 65535, 65535),   % color lavanda
  turtle_turn(-120),
  original1BaseS(N1, Seg, 0, 65535, 65535),       % color azul marino
  turtle_turn(-60),
  original1BaseS(N1, Seg, 0, 65535, 65535),       % color naranja oscuro
  turtle_turn(120),
  original1BaseS(N1, Seg, 0, 32768, 32768).   % color turquesa oscuro

original1BaseR(0,Tam):- turtle_draw_rand(Tam).
original1BaseR(N,Tam):-
  Seg is (Tam div 2),
  N1 is (N-1),
  original1BaseR(N1, Seg),
  turtle_turn(120),
  original1BaseR(N1, Seg),
  turtle_turn(-60),
  original1BaseR(N1, Seg),
  turtle_turn(-120),
  original1BaseR(N1, Seg),
  turtle_turn(-60),
  original1BaseR(N1, Seg),
  turtle_turn(120),
  original1BaseR(N1, Seg).

original1M(N,Tam):-
  turtle_init,
  original1BaseM(N,Tam),
  turtle_turn(-120),
  original1BaseM(N,Tam),
  turtle_turn(-120),
  original1BaseM(N,Tam).

original1S(N,Tam):-
  turtle_init,
  original1BaseS(N,Tam,0,0,0),
  turtle_turn(-120),
  original1BaseS(N,Tam,0,0,0),
  turtle_turn(-120),
  original1BaseS(N,Tam,0,0,0).

original1R(N,Tam):-
  turtle_init,
  original1BaseR(N,Tam),
  turtle_turn(-120),
  original1BaseR(N,Tam),
  turtle_turn(-120),
  original1BaseR(N,Tam).


%------------------------------------- Original 2---------------------------------------------

original2BaseM(0,Tam):- turtle_draw(Tam).
original2BaseM(N,Tam):-
  Seg is (Tam div 3),
  N1 is (N-1),
  original2BaseM(N1, Seg),
  turtle_turn(60),
  original2BaseM(N1, Seg),
  original2BaseM(N1, Seg),
  turtle_turn(120),
  original2BaseM(N1, Seg),
  turtle_turn(120),
  original2BaseM(N1, Seg),
  original2BaseM(N1, Seg),
  turtle_turn(60),
  original2BaseM(N1, Seg).

original2BaseS(0,Tam,R,G,B):- turtle_draw_rgb(Tam,R,G,B).
original2BaseS(N,Tam,R,G,B):-
  Seg is (Tam div 3),
  N1 is (N-1),
  original2BaseS(N1, Seg, 32768, 32768, 32768),   % color gris oscuro
  turtle_turn(60),
  original2BaseS(N1, Seg, 0, 65535, 65535),       % color cian 
  original2BaseS(N1, Seg, 0, 65535, 65535),       % color cian 
  turtle_turn(120),
  original2BaseS(N1, Seg, 32768, 32768, 32768),   % color gris oscuro
  turtle_turn(120),
  original2BaseS(N1, Seg, 32768, 65535, 0),       % color verde lima
  original2BaseS(N1, Seg, 32768, 65535, 0),       % color verde lima
  turtle_turn(60),
  original2BaseS(N1, Seg, 32768, 32768, 32768).   % color gris oscuro

original2BaseR(0,Tam):- turtle_draw_rand(Tam).
original2BaseR(N,Tam):-
  Seg is (Tam div 3),
  N1 is (N-1),
  original2BaseR(N1, Seg),
  turtle_turn(60),
  original2BaseR(N1, Seg),
  original2BaseR(N1, Seg),
  turtle_turn(120),
  original2BaseR(N1, Seg),
  turtle_turn(120),
  original2BaseR(N1, Seg),
  original2BaseR(N1, Seg),
  turtle_turn(60),
  original2BaseR(N1, Seg).
  
original2M(N,Tam):-
  turtle_init,
  original2BaseM(N,Tam),
  turtle_turn(-90),
  original2BaseM(N,Tam),
  turtle_turn(-90),
  original2BaseM(N,Tam),
  turtle_turn(-90),
  original2BaseM(N,Tam).
  
original2S(N,Tam):-
  turtle_init,
  original2BaseS(N,Tam,0,0,0),
  turtle_turn(-90),
  original2BaseS(N,Tam,0,0,0),
  turtle_turn(-90),
  original2BaseS(N,Tam,0,0,0),
  turtle_turn(-90),
  original2BaseS(N,Tam,0,0,0).

original2R(N,Tam):-
  turtle_init,
  original2BaseR(N,Tam),
  turtle_turn(-90),
  original2BaseR(N,Tam),
  turtle_turn(-90),
  original2BaseR(N,Tam),
  turtle_turn(-90),
  original2BaseR(N,Tam).


%------------------------------------- Original 3---------------------------------------------

original3BaseM(0,Tam):- turtle_draw(Tam).
original3BaseM(N,Tam):-
  Seg is (Tam div 3),
  N1 is (N-1),
  original3BaseM(N1, Seg),
  turtle_turn(90),
  original3BaseM(N1, Seg),
  turtle_turn(90),
  original3BaseM(N1, Seg),
  turtle_turn(-90),
  original3BaseM(N1, Seg),
  turtle_turn(-90),
  original3BaseM(N1, Seg),
  turtle_turn(-45),
  original3BaseM(N1, Seg),
  turtle_turn(90),
  original3BaseM(N1, Seg),
  turtle_turn(-45),
  original3BaseM(N1, Seg),
  turtle_turn(-90),
  original3BaseM(N1, Seg),
  turtle_turn(-90),
  original3BaseM(N1, Seg),
  turtle_turn(90),
  original3BaseM(N1, Seg),
  turtle_turn(90),
  original3BaseM(N1, Seg).

original3BaseS(0,Tam,R,G,B):- turtle_draw_rgb(Tam,R,G,B).
original3BaseS(N,Tam,R,G,B):-
  Seg is (Tam div 3),
  N1 is (N-1),
  original3BaseS(N1, Seg, 0, 49151, 49151),       % color turquesa
  turtle_turn(90),
  original3BaseS(N1, Seg, 0, 49151, 49151),       % color turquesa
  turtle_turn(90),
  original3BaseS(N1, Seg, 0, 49151, 49151),       % color turquesa
  turtle_turn(-90),
  original3BaseS(N1, Seg, 0, 49151, 49151),       % color turquesa
  turtle_turn(-90),
  original3BaseS(N1, Seg, 0, 49151, 49151),       % color turquesa
  turtle_turn(-45),
  original3BaseS(N1, Seg, 0, 49151, 49151),       % color turquesa
  turtle_turn(90),
  original3BaseS(N1, Seg, 49151, 32768, 16384),   % color marrón claro
  turtle_turn(-45),
  original3BaseS(N1, Seg, 49151, 32768, 16384),   % color marrón claro
  turtle_turn(-90),
  original3BaseS(N1, Seg, 49151, 32768, 16384),   % color marrón claro
  turtle_turn(-90),
  original3BaseS(N1, Seg, 49151, 32768, 16384),   % color marrón claro
  turtle_turn(90),
  original3BaseS(N1, Seg, 49151, 32768, 16384),   % color marrón claro
  turtle_turn(90),
  original3BaseS(N1, Seg, 49151, 32768, 16384).   % color marrón claro

original3BaseR(0,Tam):- turtle_draw_rand(Tam).
original3BaseR(N,Tam):-
  Seg is (Tam div 3),
  N1 is (N-1),
  original3BaseR(N1, Seg),
  turtle_turn(90),
  original3BaseR(N1, Seg),
  turtle_turn(90),
  original3BaseR(N1, Seg),
  turtle_turn(-90),
  original3BaseR(N1, Seg),
  turtle_turn(-90),
  original3BaseR(N1, Seg),
  turtle_turn(-45),
  original3BaseR(N1, Seg),
  turtle_turn(90),
  original3BaseR(N1, Seg),
  turtle_turn(-45),
  original3BaseR(N1, Seg),
  turtle_turn(-90),
  original3BaseR(N1, Seg),
  turtle_turn(-90),
  original3BaseR(N1, Seg),
  turtle_turn(90),
  original3BaseR(N1, Seg),
  turtle_turn(90),
  original3BaseR(N1, Seg).

original3M(N,Tam):-
  turtle_init,
  original3BaseM(N,Tam),
  turtle_turn(-90),
  original3BaseM(N,Tam),
  turtle_turn(-90),
  original3BaseM(N,Tam),
  turtle_turn(-90),
  original3BaseM(N,Tam).

original3S(N,Tam):-
  turtle_init,
  original3BaseS(N,Tam,0,0,0),
  turtle_turn(-90),
  original3BaseS(N,Tam,0,0,0),
  turtle_turn(-90),
  original3BaseS(N,Tam,0,0,0),
  turtle_turn(-90),
  original3BaseS(N,Tam,0,0,0).

original3R(N,Tam):-
  turtle_init,
  original3BaseR(N,Tam),
  turtle_turn(-90),
  original3BaseR(N,Tam),
  turtle_turn(-90),
  original3BaseR(N,Tam),
  turtle_turn(-90),
  original3BaseR(N,Tam).


%------------------------------------- panal ---------------------------------------------


panalBaseM(0,Tam):- turtle_draw(Tam).
panalBaseM(N,Tam):-
  Seg is (Tam div 3),
  N1 is (N-1),  
  panalBaseM(N1,Seg),
  turtle_turn(60),
  panalBaseM(N1,Seg),
  turtle_turn(180),
  turtle_move(Seg),
  turtle_turn(60),
  panalBaseM(N1,Seg),
  turtle_turn(60),
  panalBaseM(N1,Seg),
  turtle_turn(180),
  turtle_move(Seg),
  turtle_turn(60),
  panalBaseM(N1,Seg).
  
panalBaseS(0,Tam,R,G,B):- turtle_draw_rgb(Tam,R,G,B).
panalBaseS(N,Tam,R,G,B):-
  Seg is (Tam div 3),
  N1 is (N-1),  
  panalBaseS(N1, Seg, 65535, 65535, 65535),
  turtle_turn(60),
  panalBaseS(N1, Seg, 65535, 65535, 65535),
  turtle_turn(180),
  turtle_move(Seg),
  turtle_turn(60),
  panalBaseS(N1, Seg, 65535, 32768, 0),
  turtle_turn(60),
  panalBaseS(N1, Seg, 65535, 65535, 65535),
  turtle_turn(180),
  turtle_move(Seg),
  turtle_turn(60),
  panalBaseS(N1, Seg, 65535, 65535, 65535).

panalBaseR(0,Tam):- turtle_draw_rand(Tam).
panalBaseR(N,Tam):-
  Seg is (Tam div 3),
  N1 is (N-1),  
  panalBaseR(N1,Seg),
  turtle_turn(60),
  panalBaseR(N1,Seg),
  turtle_turn(180),
  turtle_move(Seg),
  turtle_turn(60),
  panalBaseR(N1,Seg),
  turtle_turn(60),
  panalBaseR(N1,Seg),
  turtle_turn(180),
  turtle_move(Seg),
  turtle_turn(60),
  panalBaseR(N1,Seg).

panalM(N,Tam):-
  turtle_init,
  panalBaseM(N,Tam),
  turtle_turn(60),
  panalBaseM(N,Tam),
  turtle_turn(60),
  panalBaseM(N,Tam),
  turtle_turn(60),
  panalBaseM(N,Tam),
  turtle_turn(60),
  panalBaseM(N,Tam),
  turtle_turn(60),
  panalBaseM(N,Tam).

panalS(N,Tam):-
  turtle_init,
  panalBaseS(N,Tam,0,0,0),
  turtle_turn(60),
  panalBaseS(N,Tam,0,0,0),
  turtle_turn(60),
  panalBaseS(N,Tam,0,0,0),
  turtle_turn(60),
  panalBaseS(N,Tam,0,0,0),
  turtle_turn(60),
  panalBaseS(N,Tam,0,0,0),
  turtle_turn(60),
  panalBaseS(N,Tam,0,0,0).

panalR(N,Tam):-
  turtle_init,
  panalBaseR(N,Tam),
  turtle_turn(60),
  panalBaseR(N,Tam),
  turtle_turn(60),
  panalBaseR(N,Tam),
  turtle_turn(60),
  panalBaseR(N,Tam),
  turtle_turn(60),
  panalBaseR(N,Tam),
  turtle_turn(60),
  panalBaseR(N,Tam).

%------------------------------------- Estrella ---------------------------------------------

estrellaBaseM(0,Tam):- turtle_draw(Tam).
estrellaBaseM(N,Tam):- 
  Seg is (Tam div 2),
  N1 is (N-1),
  estrellaBaseM(N1,Seg),
  turtle_turn(30),
  estrellaBaseM(N1,Seg).

estrellaBaseS(0,Tam,R,G,B):- turtle_draw_rgb(Tam,R,G,B).
estrellaBaseS(N,Tam,R,G,B):- 
  Seg is (Tam div 2),
  N1 is (N-1),
  estrellaBaseS(N1, Seg, 32768, 65535, 0),        % color verde lima  
  turtle_turn(30),  
  estrellaBaseS(N1, Seg, 0, 32768, 32768).    % color marron claro 

estrellaBaseR(0,Tam):- turtle_draw_rand(Tam).
estrellaBaseR(N,Tam):- 
  Seg is (Tam div 2),
  N1 is (N-1),
  estrellaBaseR(N1,Seg),
  turtle_turn(30),
  estrellaBaseR(N1,Seg).

estrellaM(N,Tam):-
  turtle_init,
  turtle_turn(30),
  estrellaBaseM(N,Tam),
  turtle_turn(-120),
  estrellaBaseM(N,Tam),
  turtle_turn(-120),
  estrellaBaseM(N,Tam),
  turtle_turn(-120),
  estrellaBaseM(N,Tam).

estrellaS(N,Tam):-
  turtle_init,
  turtle_turn(30),
  estrellaBaseS(N,Tam,0,0,0),
  turtle_turn(-120),
  estrellaBaseS(N,Tam,0,0,0),
  turtle_turn(-120),
  estrellaBaseS(N,Tam,0,0,0),
  turtle_turn(-120),
  estrellaBaseS(N,Tam,0,0,0).

estrellaR(N,Tam):-
  turtle_init,
  turtle_turn(30),
  estrellaBaseR(N,Tam),
  turtle_turn(-120),
  estrellaBaseR(N,Tam),
  turtle_turn(-120),
  estrellaBaseR(N,Tam),
  turtle_turn(-120),
  estrellaBaseR(N,Tam).