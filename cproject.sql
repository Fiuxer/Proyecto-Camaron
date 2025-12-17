-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-12-2025 a las 22:24:42
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cproject`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lecciones`
--

CREATE TABLE `lecciones` (
  `id` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `markdown` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `lecciones`
--

INSERT INTO `lecciones` (`id`, `nombre`, `markdown`) VALUES
(1, 'Introducción a los vectores', '# Vectores\r\n\r\nUn vector es una herramienta matemática que usamos en física para describir cosas que tienen magnitud (un tamaño o valor) y dirección.\r\n\r\n- Ejemplos de Vectores $\\vec{V}$: La velocidad (100 km/h hacia el Norte), la fuerza (50 Newtons hacia abajo).\r\n    \r\n- No son Vectores (Escalares) $m$: La temperatura (25°C, no tiene dirección), la masa (80 kg).\r\n    \r\n- Representación: Los representamos con una flecha. La longitud es la magnitud y hacia donde apunta es la dirección. Usamos letras con una flechita (ej. $\\vec{A}$).\r\n\r\n## 1. Componentes de un Vector\r\n\r\nDibujar flechas no es práctico para hacer cálculos. Por eso, \"descomponemos\" un vector en sus componentes rectangulares (sus \"sombras\" en los ejes X e Y).\r\n\r\n- Ejemplo Visual Clave: Un vector $\\vec{V}$ a un ángulo $\\theta$ se divide en su componente horizontal ($V_x$) y su componente vertical ($V_y$).\r\n\r\n- Formulario de Descomposición \r\n	- Para un vector $\\vec{V}$ con magnitud $V$ y un ángulo $\\theta$ (medido desde el eje x positivo):\r\n\r\n- Componente X: $V_x = V \\cdot \\cos(\\theta)$\r\n    \r\n- Componente Y: $V_y = V \\cdot \\sin(\\theta)$\r\n\r\n> Nota, $\\cos$ siempre sirve para sacar la magnitud en paralelo (Normalmente el eje x), mientras que $\\sin$ sirve para la magnitud perpendicular (Normalmente el eje Y)'),
(2, 'Suma y resta de vectores', '# Suma y Resta Analítica (con Componentes)\r\n\r\nEste es el método más preciso.\r\n\r\n- Para sumar vectores ($\\vec{R} = \\vec{A} + \\vec{B}$)\r\n	Simplemente sumas las componentes correspondientes.\r\n\r\n- $R_x = A_x + B_x$\r\n- $R_y = A_y + B_y$\r\n\r\n- Para restar vectores ($\\vec{D} = \\vec{A} - \\vec{B}$)\r\n	Simplemente restas las componentes.\r\n\r\n- $D_x = A_x - B_x$    \r\n- $D_y = A_y - B_y$\r\n\r\n## Recomponer el Vector Resultante\r\n\r\nUna vez que tienes las componentes del resultado ($R_x, R_y$), puedes encontrar su magnitud y dirección final.\r\n\r\n- Magnitud (Teorema de Pitágoras $c= \\sqrt{a^2+b^2}$ ):  \r\n    $$|\\vec{R}| = \\sqrt{R_x^2 + R_y^2}$$\r\n    \r\n- Dirección (Tangente Inversa $\\theta=\\arctan(m)$ ):  \r\n    $$\\theta = \\arctan\\left(\\frac{R_y}{R_x}\\right)$$\r\n    \r\n\r\n**(Cosa Clave)**: ¡Cuidado con el cuadrante! La calculadora te da un ángulo, pero debes mirar los signos de $R_x$ y $R_y$ para saber si tienes que sumarle 180°.\r\n\r\nEjemplo Visual Clave (Suma): El método gráfico \"Punta-Cola\". Para sumar $\\vec{A} + \\vec{B}$, dibujas $\\vec{A}$ y luego pones la \"cola\" de $\\vec{B}$ en la \"punta\" de $\\vec{A}$. El resultado ($\\vec{R}$) es la flecha que va desde el inicio del primero hasta el final del último.'),
(3, 'Introducción a fuerzas', '# Qué es una fuerza\r\n\r\nUna fuerza es una interacción que puede cambiar el estado de movimiento de un cuerpo. Se representa como un vector, lo que significa que tiene:\r\n\r\n-  Magnitud: cuánto vale la fuerza (por ejemplo, 50 N)\r\n    \r\n-  Dirección: hacia dónde actúa (por ejemplo, al norte)\r\n    \r\n-  Sentido: orientación del vector (por ejemplo, hacia arriba o hacia la derecha)\r\n	\r\n\r\n## Tipos de fuerzas comunes\r\n\r\n- Peso ($W$): fuerza gravitacional hacia abajo\r\n    \r\n- Normal ($N$): fuerza perpendicular a la superficie\r\n    \r\n- Fricción ($f$): fuerza que se opone al movimiento\r\n    \r\n- Tensión ($T$): fuerza en cuerdas o cables\r\n    \r\n- Fuerza aplicada ($F$): fuerza externa que empuja o jala\r\n\r\n## Suma de fuerzas en una dimensión (1D)\r\n\r\nCuando todas las fuerzas actúan sobre el mismo eje (horizontal o vertical), se suman algebraicamente:\r\n\r\n-  Fuerzas en el mismo sentido → se suman $F_R=F_1+F_2+F_3\\dots$\r\n    \r\n-  Fuerzas en sentido contrario → se restan $F_R=F_1-F_2-F_3\\dots$\r\n\r\nEjemplo 1: Un objeto recibe una fuerza de +12 N hacia la derecha y otra de -5 N hacia la izquierda. Fuerza neta = 12 N - 5 N = 7 N hacia la derecha\r\n\r\nEjercicio 1: Un bloque recibe 3 fuerzas: 10 N hacia la derecha, 4 N hacia la izquierda y 6 N hacia la derecha. Pregunta: ¿Cuál es la fuerza neta?\r\n\r\n Respuesta: 10 + 6 - 4 = 12 N hacia la derecha'),
(4, 'Suma de fuerzas en 2 dimensiones', '# Suma de fuerzas en dos dimensiones (2D)\r\n\r\nCuando las fuerzas no están sobre el mismo eje, se deben descomponer en componentes:\r\n\r\n###  Paso A: Descomponer cada vector\r\n\r\nUsamos trigonometría para obtener las componentes:\r\n\r\n- Fx = F × cos(ángulo)\r\n    \r\n- Fy = F × sin(ángulo)\r\n\r\nEjemplo 2: Una fuerza de $50 N$ actúa a $30°$ respecto al eje $X$. $Fx = 50 × cos(30°) ≈ 43.3 N$ y $Fy = 50 × sin(30°) ≈ 25.0 N$\r\n\r\n###  Paso B: Sumar componentes\r\n\r\nSumamos todas las componentes X y todas las componentes Y:\r\n\r\n- $Rx = Ax + Bx + Cx\\dots$\r\n    \r\n- $Ry = Ay + By + Cy\\dots$\r\n    \r\n\r\n### Paso C: Calcular la fuerza resultante\r\n\r\nUsamos el teorema de Pitágoras:\r\n\r\n- Magnitud de $R = \\sqrt{Rx² + Ry²}$\r\n    \r\n- Dirección de $R = \\arctan(\\frac{Ry}{Rx})$\r\n    \r\n\r\nEjemplo 3: A = 10 N a 30° B = 8 N a 135°\r\n\r\nDescomposición: $Ax = 8.66$, $Ay = 5.00$, $Bx = -5.66$, $By = 5.66$, $Rx = 3.00$, $Ry = 10.66$, $R ≈ \\sqrt{3² + 10.66²} ≈ 11.07 N$ Ángulo $\\theta ≈ arctan(10.66 / 3) ≈ 74.3°$\r\n\r\n##  Fuerza neta y Segunda Ley de Newton\r\n\r\nLa fuerza neta está relacionada con la aceleración del objeto:\r\n\r\nFuerza neta = masa × aceleración\r\n\r\n Ejercicio 6: Un objeto de 5 kg tiene una aceleración de 2 m/s². Pregunta: ¿Cuál es la fuerza neta? \r\n\r\nRespuesta: $F = 5 × 2 = 10 N$'),
(5, 'Velocidad', '## ¿Qué es la velocidad?\r\n\r\nLa velocidad es una magnitud física que indica qué tan rápido se mueve un objeto y en qué dirección. Es un vector, lo que significa que tiene:\r\n\r\n- Magnitud: cuánto se mueve (por ejemplo, 80 km/h)\r\n    \r\n-  Dirección: hacia dónde se mueve (por ejemplo, al norte)\r\n    \r\n\r\n##  Diferencia entre velocidad y rapidez\r\n\r\n- Rapidez: sólo indica cuánto se mueve un objeto (es un escalar).\r\n    \r\n- Velocidad: indica cuánto y hacia dónde se mueve (es un vector).\r\n    \r\n\r\nEjemplo: Un coche que va a 60 km/h en línea recta tiene rapidez de 60 km/h. Si va a 60 km/h hacia el norte, entonces tiene velocidad de 60 km/h al norte.\r\n\r\n##  Fórmula de la velocidad media\r\n\r\nLa velocidad media se calcula dividiendo el desplazamiento entre el tiempo:\r\n\r\nVelocidad media = desplazamiento / tiempo\r\n\r\n- $v = d / t$\r\n    \r\n- v: velocidad\r\n    \r\n- d: desplazamiento (en metros, kilómetros, etc.)\r\n    \r\n- t: tiempo (en segundos, horas, etc.)\r\n    \r\n\r\nEjemplo: Un ciclista recorre 120 km en 3 horas. v = 120 km / 3 h = 40 km/h\r\n\r\n## Velocidad instantánea\r\n\r\nEs la velocidad que tiene un objeto en un momento específico. Se mide con instrumentos como el velocímetro de un coche.\r\n\r\n---\r\n**\r\n\r\n## Velocidad en movimiento rectilíneo uniforme (MRU)\r\n\r\nEn el MRU, la velocidad es constante y el objeto se mueve en línea recta.\r\n\r\nFórmula: $v = d / t$\r\n\r\nEjemplo: Un coche se mueve en línea recta con una velocidad constante de 5 m/s. Cada segundo, el coche avanza 5 metros. Las posiciones del coche en cada segundo son:\r\n\r\n- En el segundo 0: posición = 0 m\r\n    \r\n- En el segundo 1: posición = 5 m\r\n    \r\n- En el segundo 2: posición = 10 m\r\n    \r\n- En el segundo 3: posición = 15 m\r\n      \r\n  \r\n  \r\n\r\n## Velocidad en movimiento rectilíneo uniformemente acelerado (MRUA)\r\n\r\nEn el MRUA, la velocidad cambia con el tiempo debido a una aceleración constante.\r\n\r\nFórmulas clave:\r\n\r\n- $v = v_0 + at$\r\n    \r\n- $d = v_0t+ \\frac{1}{2} a t²$\r\n    \r\n- $v^2 = v_0^2 + 2ad$\r\n    \r\n\r\nDonde:\r\n\r\n- $v_0$: velocidad inicial\r\n    \r\n- $v$: velocidad final\r\n    \r\n- $a$: aceleración\r\n    \r\n- $t$: tiempo\r\n    \r\n- $d$: desplazamiento\r\n    \r\n\r\nEjemplo: Un coche parte del reposo con una aceleración constante de 10 m/s². Condiciones iniciales:\r\n\r\n- Tiempo inicial: $t_0$ = 0 s\r\n    \r\n- Posición inicial: $r_0$ = 0 m\r\n    \r\n- Velocidad inicial: $v_0$ = 0 m/s\r\n    \r\n\r\nQueremos saber qué velocidad y qué posición tendrá el coche después de 2 segundos.\r\n\r\nCálculos:\r\n\r\n- Velocidad final: $v = v_0 + at = 0 + 10 \\times 2 = 20 m/s$\r\n    \r\n- Posición final: $r = r_0 + v_0t + \\frac{1}{2}at² = 0 + 0 + 0.5 \\times 10 \\times 2^2 = 20 m$\r\n    \r\n\r\n## Unidades de velocidad\r\n\r\n- Sistema Internacional: metros por segundo (m/s)\r\n    \r\n- También se usa: kilómetros por hora (km/h)\r\n    \r\n\r\nConversión útil: $1 m/s = 3.6 km/h$'),
(6, 'Movimiento Lineal', '## ¿Qué es el movimiento lineal?\r\n\r\nEl movimiento lineal es el desplazamiento de un objeto a lo largo de una línea recta. Puede clasificarse en dos tipos:\r\n\r\n- Movimiento rectilíneo uniforme (MRU): la velocidad es constante.\r\n    \r\n- Movimiento rectilíneo uniformemente acelerado (MRUA): la velocidad cambia con el tiempo debido a una aceleración constante.\r\n    \r\n\r\n## Magnitudes clave del movimiento\r\n\r\n- Posición ($x$): lugar donde se encuentra el objeto.\r\n    \r\n- Desplazamiento ($\\Delta x$): cambio de posición.\r\n    \r\n- Velocidad ($v$): qué tan rápido cambia la posición.\r\n    \r\n- Aceleración ($a$): qué tan rápido cambia la velocidad.\r\n    \r\n- Tiempo ($t$): duración del movimiento.\r\n    \r\n\r\n## Movimiento Rectilíneo Uniforme (MRU)\r\n\r\nEs el movimiento en línea recta con velocidad constante y aceleración cero.\r\n\r\nFórmula principal: $v = d / t$\r\n\r\nDonde:\r\n\r\n- $v$: velocidad\r\n    \r\n- $d$: desplazamiento\r\n    \r\n- $t$: tiempo\r\n    \r\n\r\nEjemplo 1: Un auto recorre 180 km en 3 horas. \r\n\r\n$v = 180 / 3 = 60 km/h$\r\n\r\n---\r\n\r\n## Movimiento Rectilíneo Uniformemente Acelerado (MRUA)\r\n\r\nEs el movimiento en línea recta con aceleración constante.\r\n\r\nFórmulas clave:\r\n\r\n- $v = v_0 + at$\r\n    \r\n- $d = v_0t + \\frac{1}{2}at²$\r\n    \r\n- $v^2 = v_0^2 + 2ad$\r\n    \r\n\r\nDonde:\r\n\r\n- $v_0$: velocidad inicial\r\n    \r\n- $v$: velocidad final\r\n    \r\n- $a$: aceleración\r\n    \r\n- $t$: tiempo\r\n    \r\n- $d$: desplazamiento\r\n    \r\n\r\nEjemplo 2: Un objeto parte del reposo ($v_ = 0$) y acelera a $2 m/s^2$ durante $4 s$. $v = 0 + 2 \\times 4 = 8 m/s$\r\n\r\n## Gráficas del movimiento lineal\r\n\r\nMRU:\r\n\r\n- Posición vs tiempo (x vs t): línea recta inclinada\r\n    \r\n- Velocidad vs tiempo (v vs t): línea horizontal\r\n    \r\n- Aceleración vs tiempo (a vs t): línea en cero\r\n    \r\n\r\nMRUA:\r\n\r\n- Posición vs tiempo: curva (parábola)\r\n    \r\n- Velocidad vs tiempo: línea recta inclinada\r\n    \r\n- Aceleración vs tiempo: línea horizontal (constante)\r\n    \r\n'),
(7, 'Cantidad de movimiento', '## ¿Qué es la cantidad de movimiento?\r\n\r\nLa cantidad de movimiento (también llamada momento lineal) es una magnitud física que describe el movimiento de un cuerpo en función de su masa y velocidad.\r\n\r\nFórmula general: $p = m × v$\r\n\r\nDonde:\r\n\r\n- $p$: cantidad de movimiento (en $kg·m/s$)\r\n    \r\n- $m$: masa del objeto (en $kg$)\r\n    \r\n- $v$: velocidad del objeto (en $m/s$)\r\n    \r\n\r\n## ¿Por qué es importante?\r\n\r\nLa cantidad de movimiento nos permite:\r\n\r\n- Analizar cómo se comportan los cuerpos en movimiento.\r\n    \r\n- Estudiar colisiones y rebotes.\r\n    \r\n- Aplicar leyes de conservación en sistemas cerrados.\r\n    \r\n- Relacionar fuerza y tiempo mediante el concepto de impulso.\r\n    \r\n\r\n## Ejemplo básico\r\n\r\nEjemplo 1: Una pelota de 2 kg se mueve a 3 m/s. $p = mv = 2 \\times 3 = 6 kg\\frac{m}{s}$\r\n## Dirección y naturaleza vectorial\r\n\r\nLa cantidad de movimiento es un vector, lo que significa que tiene dirección y sentido. Si un objeto cambia de dirección, también cambia su cantidad de movimiento.\r\n\r\n## Conservación de la cantidad de movimiento\r\n\r\nEn un sistema aislado (sin fuerzas externas), la cantidad de movimiento se conserva.\r\n\r\n  \r\n  \r\n  \r\n\r\n## Impulso y cantidad de movimiento\r\n\r\nEl impulso es el cambio en la cantidad de movimiento causado por una fuerza durante un tiempo.\r\n\r\nFórmula: $I = F\\Delta t = \\Delta p$\r\n\r\nDonde:\r\n\r\n- $I$: impulso (en $Ns$)\r\n    \r\n- $F$: fuerza aplicada\r\n    \r\n- $\\Delta t$: tiempo de aplicación\r\n    \r\n- $\\Delta p$: cambio en la cantidad de movimiento\r\n    \r\n\r\nEjemplo 3: Una fuerza de 10 N actúa durante 2 s sobre un objeto. $I = 10 \\times 2 = 20 Ns \\rightarrow \\Delta p = 20 kg\\frac{m}{s}$'),
(8, 'Segunda ley de Newton', '## ¿Qué dice la Segunda Ley de Newton?\r\n\r\nLa Segunda Ley de Newton establece que la fuerza neta que actúa sobre un objeto es igual al producto de su masa por su aceleración.\r\n\r\nFórmula principal: $F = ma$\r\n\r\nDonde:\r\n\r\n- $F$: fuerza neta (en newtons, $N$)\r\n    \r\n- $m$: masa del objeto (en $kg$)\r\n    \r\n- $a$: aceleración (en $m/s^2$)\r\n    \r\n\r\n## ¿Qué significa?\r\n\r\nEsta ley explica cómo se mueve un objeto cuando se le aplica una fuerza:\r\n\r\n- Si la fuerza aumenta $\\rightarrow$ la aceleración también aumenta.\r\n    \r\n- Si la masa aumenta $\\rightarrow$ se necesita más fuerza para lograr la misma aceleración.\r\n    \r\n- Si no hay fuerza neta $\\rightarrow$ el objeto no cambia su velocidad (puede estar en reposo o en movimiento constante).\r\n    \r\n\r\n## Ejemplo básico\r\n\r\nEjemplo 1: Un objeto de 4 kg acelera a 3 m/s². \r\n\r\n$F = ma = 4 \\times 3 = 12 N$\r\n\r\n  \r\n\r\n## ¿Qué es la fuerza neta?\r\n\r\nLa fuerza neta es la suma de todas las fuerzas que actúan sobre un objeto. Si hay varias fuerzas, se deben sumar considerando dirección y sentido.\r\n\r\nEjemplo 2: Un bloque recibe 10 N hacia la derecha y 4 N hacia la izquierda. \r\n\r\nF neta = $10 - 4 = 6N$ hacia la derecha\r\n\r\n## Relación con la cantidad de movimiento\r\n\r\nLa Segunda Ley también puede expresarse como:\r\n\r\n$F = \\Delta p/\\Delta t$\r\n\r\nEsto significa que la fuerza es igual al cambio en la cantidad de movimiento respecto al tiempo. Es útil cuando la masa no es constante (por ejemplo, en cohetes).\r\n\r\n## Aplicaciones comunes\r\n\r\n- Movimiento de vehículos\r\n    \r\n- Caída libre (cuando se combina con la gravedad)\r\n    \r\n- Empujes, frenadas, aceleraciones\r\n    \r\n- Diseño de estructuras y máquinas\r\n    \r\n'),
(9, 'Movimiento Rectilineo Uniformemente Acelerado (MRUA)', '## ¿Qué es el MRUA?\r\n\r\nEl MRUA es un tipo de movimiento en línea recta donde la aceleración es constante. Esto significa que la velocidad del objeto cambia de forma regular con el tiempo.\r\n\r\n## Características del MRUA\r\n\r\n- El objeto se mueve en línea recta.\r\n    \r\n- La aceleración no cambia: es constante.\r\n    \r\n- La velocidad varía de forma uniforme.\r\n    \r\n- El desplazamiento depende del tiempo al cuadrado.\r\n    \r\n\r\n## Fórmulas principales\r\n\r\n1. Velocidad final: $v = v_0 + at$\r\n    \r\n2. Desplazamiento: $d = v_0t + \\frac{1}{2}at^2$\r\n    \r\n3. Velocidad sin tiempo: $v^2 = v_0^2 + 2ad$\r\n    \r\n\r\nDonde:\r\n\r\n- $v_0$: velocidad inicial\r\n    \r\n- $v$: velocidad final\r\n    \r\n- $a$: aceleración\r\n    \r\n- $t$: tiempo\r\n    \r\n- $d$: desplazamiento\r\n    \r\n\r\n## Ejemplo básico\r\n\r\nUn coche parte del reposo ($v_0 = 0$) y acelera a $2 m/s^2$ durante 5 segundos.\r\n\r\n- Velocidad final: $v = 0 + 2 \\times 5 = 10 m/s$\r\n    \r\n- Desplazamiento: $d = 0 + \\frac{1}{2} \\times 2 \\times 5^2 = 25m \\rightarrow$ $d=\\frac{50}{2}=25m$\r\n    \r\n\r\n## Gráficas del MRUA\r\n\r\n- Velocidad vs tiempo: línea recta inclinada\r\n    \r\n- Desplazamiento vs tiempo: curva parabólica\r\n    \r\n- Aceleración vs tiempo: línea horizontal constante\r\n    \r\n\r\n## Ejercicios prácticos\r\n\r\nEjercicio 1 Un objeto con velocidad inicial de 3 m/s acelera a 4 m/s² durante 2 s. ¿Cuál es su velocidad final? $v = 3 + 4 \\times 2 = 11 m/s$\r\n\r\nEjercicio 2 Un cuerpo parte del reposo y acelera a 1.5 m/s² durante 6 s. ¿Qué distancia recorre? $d = \\frac{1}{2} \\times 1.5 \\times 6^2 = 27 m$\r\n\r\nEjercicio 3 Un objeto alcanza una velocidad de 20 m/s desde el reposo con aceleración de 5 m/s². ¿Qué distancia recorrió? $d = (20^2 - 0^2) \\div (2 \\times 5) = 400 \\div 10 = 40 m$\r\n\r\n  \r\n\r\n7. Comparación con otros movimientos\r\n\r\n|   |   |   |   |\r\n|---|---|---|---|\r\n|Tipo de movimiento|Velocidad|Aceleración|Gráfica d vs t|\r\n|MRU|Constante|Cero|Línea recta inclinada|\r\n|MRUA|Variable (lineal)|Constante|Curva (parabólica)|\r\n'),
(10, 'Caída libre', '# Caída libre.\r\n\r\n## ¿Qué es la caída libre?\r\n\r\n> La caída libre es un tipo de movimiento vertical en el que un objeto se deja caer desde cierta altura y la única fuerza que actúa sobre él es la gravedad. No hay resistencia del aire (idealmente) y el objeto acelera hacia abajo.\r\n\r\n## Características del movimiento\r\n- Es un MRUA (movimiento rectilíneo uniformemente acelerado).\r\n- La aceleración es constante y se debe a la gravedad.\r\n- La velocidad inicial puede ser cero o tener un valor si el objeto ya venía en movimiento.\r\n- El desplazamiento es vertical (hacia abajo).\r\n\r\n## Aceleración de la gravedad\r\nLa aceleración que actúa sobre el objeto es:\r\n	$g = 9.8 m/s^2$ (aproximadamente)\r\nEn algunos ejercicios se usa $g = 10 m/s^2$ para simplificar cálculos.\r\n\r\n## Fórmulas principales\r\nVelocidad final: $v = v_0 + gt$\r\nAltura (desplazamiento): $h = v_0t + \\frac{1}{2}gt^2$\r\nVelocidad sin tiempo: $v^2 = v_0^2 + 2gh$\r\nDonde:\r\n- $v_0$: velocidad inicial\r\n- $v$: velocidad final\r\n- $g$: aceleración de la gravedad\r\n- $t$: tiempo\r\n- $h$: altura o desplazamiento vertical\r\n\r\n## Ejemplo básico\r\nUn objeto se deja caer desde el reposo ($v_0 = 0$) durante 3 segundos.\r\nVelocidad final: $v = 0 + 9.8 \\times 3 = 29.4 m/s$\r\nAltura recorrida: $h = 0 + \\frac{1}{2} 9.8 \\times 3^2 = 44.1 m$\r\n\r\n## Ejercicios prácticos\r\nEjercicio 1 Una piedra cae desde una altura y tarda 4 s en llegar al suelo. ¿Cuál es su velocidad final? $v = 0 + 9.8 · 4 = 39.2 m/s$\r\nEjercicio 2 ¿Cuánto recorre un objeto en 2 s si parte del reposo? $h = \\frac{1}{2} \\times 9.8 · 2^2 = 19.6 m$\r\nEjercicio 3 Un objeto alcanza una velocidad de 20 m/s en caída libre. ¿Cuál fue la altura desde la que cayó? $h = (v^2 - v_0^2) \\div 2g = (400 - 0) \\div (2 \\times 9.8) \\approx 20.4 m$\r\n\r\n## Comparación con MRUA horizontal\r\n\r\n\r\n| Característica           | MRUA horizontal | Caída libre (MRUA vertical) |\r\n| ------------------------ | --------------- | --------------------------- |\r\n| Dirección del movimiento | Horizontal      | Vertical (hacia abajo)      |\r\n| Aceleración              | Constante (a)   | Constante ($g=9.8m/s^2$)    |\r\n| Fórmulas                 | $v=v_0+at$      | $v=v_0+gt$                  |\r\n\r\n\r\n'),
(6767, 'PRUEBA NO HACER CASO', '## **Descripción**\r\n\r\nLos **vectores** son una herramienta fundamental en matemáticas y física. Permiten representar magnitudes que tienen **dirección**, **sentido** y **módulo (tamaño)**, a diferencia de los **escalares**, que solo tienen magnitud.  \r\nSe utilizan para describir desplazamientos, fuerzas, velocidades, y muchas otras cantidades que dependen no solo del “cuánto”, sino también del “hacia dónde”.\r\n\r\n---\r\n\r\n## **1. Definición de Vector**\r\n\r\nUn **vector** es un segmento orientado que tiene:\r\n\r\n- **Magnitud (o módulo)**: la longitud del vector.\r\n    \r\n- **Dirección**: la orientación del vector en el espacio (por ejemplo, norte, sur, este, oeste o un ángulo específico).\r\n    \r\n- **Sentido**: hacia dónde apunta dentro de su dirección.\r\n    \r\n\r\nEjemplo visual:\r\n\r\n```\r\nA -------> B\r\n```\r\n\r\nEl vector va desde el punto **A** hasta el punto **B**, y su módulo es la distancia entre esos dos puntos.\r\n\r\n---\r\n\r\n## **2. Representación**\r\n\r\nUn vector puede representarse de distintas formas:\r\n\r\n### **a) Gráficamente**\r\n\r\nComo una flecha sobre un plano o en el espacio, indicando su dirección y longitud.\r\n\r\n### **b) Analíticamente (por coordenadas)**\r\n\r\nEn el plano, un vector puede expresarse como:\r\n\r\n[  \r\n\\vec{v} = (v_x, v_y)  \r\n]\r\n\r\nY en el espacio tridimensional:\r\n\r\n[  \r\n\\vec{v} = (v_x, v_y, v_z)  \r\n]\r\n\r\nDonde:\r\n\r\n- ( v_x ): componente en el eje X\r\n    \r\n- ( v_y ): componente en el eje Y\r\n    \r\n- ( v_z ): componente en el eje Z (solo si es en 3D)\r\n    \r\n\r\n---\r\n\r\n## **3. Módulo de un Vector**\r\n\r\nEl módulo (o longitud) de un vector se calcula mediante el **Teorema de Pitágoras**:\r\n\r\n- En 2D:  \r\n    [  \r\n    |\\vec{v}| = \\sqrt{v_x^2 + v_y^2}  \r\n    ]\r\n    \r\n- En 3D:  \r\n    [  \r\n    |\\vec{v}| = \\sqrt{v_x^2 + v_y^2 + v_z^2}  \r\n    ]\r\n    \r\n\r\n---\r\n\r\n## **4. Suma y Resta de Vectores**\r\n\r\n### **Suma:**\r\n\r\nPara sumar vectores, se suman sus componentes correspondientes:\r\n\r\n[  \r\n\\vec{a} + \\vec{b} = (a_x + b_x, ; a_y + b_y)  \r\n]\r\n\r\n### **Resta:**\r\n\r\nDe manera similar, para restar:\r\n\r\n[  \r\n\\vec{a} - \\vec{b} = (a_x - b_x, ; a_y - b_y)  \r\n]\r\n\r\nVisualmente, la suma de vectores puede representarse con la **regla del paralelogramo**.\r\n\r\n---\r\n\r\n## **5. Multiplicación de un Vector por un Escalar**\r\n\r\nSi multiplicamos un vector por un número real ( k ):\r\n\r\n[  \r\nk \\cdot \\vec{v} = (k v_x, ; k v_y)  \r\n]\r\n\r\n- Si ( k > 1 ): el vector se **alarga**.\r\n    \r\n- Si ( 0 < k < 1 ): el vector se **acorta**.\r\n    \r\n- Si ( k < 0 ): el vector **cambia de sentido**.\r\n    \r\n\r\n---\r\n\r\n## **6. Producto Escalar**\r\n\r\nEl **producto escalar** entre dos vectores mide qué tanto “apuntan en la misma dirección”:\r\n\r\n[  \r\n\\vec{a} \\cdot \\vec{b} = a_x b_x + a_y b_y  \r\n]\r\n\r\nTambién puede calcularse como:\r\n\r\n[  \r\n\\vec{a} \\cdot \\vec{b} = |\\vec{a}| , |\\vec{b}| , \\cos(\\theta)  \r\n]\r\n\r\ndonde ( \\theta ) es el ángulo entre ambos vectores.\r\n\r\nSi:\r\n\r\n- ( \\vec{a} \\cdot \\vec{b} > 0 ): los vectores forman un ángulo **agudo**.\r\n    \r\n- ( \\vec{a} \\cdot \\vec{b} = 0 ): son **perpendiculares**.\r\n    \r\n- ( \\vec{a} \\cdot \\vec{b} < 0 ): forman un ángulo **obtuso**.\r\n    \r\n\r\n---\r\n\r\n## **7. Producto Vectorial (solo en 3D)**\r\n\r\nEl **producto vectorial** entre dos vectores da como resultado **otro vector**, perpendicular a ambos:\r\n\r\n[  \r\n\\vec{a} \\times \\vec{b} =  \r\n\\begin{vmatrix}  \r\n\\hat{i} & \\hat{j} & \\hat{k} \\  \r\na_x & a_y & a_z \\  \r\nb_x & b_y & b_z  \r\n\\end{vmatrix}  \r\n]\r\n\r\nEl módulo del resultado es:\r\n\r\n[  \r\n|\\vec{a} \\times \\vec{b}| = |\\vec{a}| , |\\vec{b}| , \\sin(\\theta)  \r\n]\r\n\r\n---\r\n\r\n## **8. Vector Unitario**\r\n\r\nUn **vector unitario** es aquel con módulo igual a 1.  \r\nSe usa para representar una **dirección pura**, sin importar la magnitud.\r\n\r\nSe obtiene dividiendo el vector entre su módulo:\r\n\r\n[  \r\n\\hat{u} = \\frac{\\vec{v}}{|\\vec{v}|}  \r\n]\r\n\r\n---\r\n\r\n## **9. Aplicaciones de los Vectores**\r\n\r\n- En **física**, para representar fuerzas, velocidades, desplazamientos o campos eléctricos.\r\n    \r\n- En **programación gráfica**, para calcular posiciones, rotaciones y movimientos.\r\n    \r\n- En **ingeniería**, para analizar estructuras, tensiones o flujos.\r\n    \r\n- En **matemáticas**, como base para el estudio del **álgebra lineal**.\r\n    \r\n\r\n---\r\n\r\n## **Resumen**\r\n\r\n|Concepto|Fórmula / Descripción|\r\n|---|---|\r\n|Módulo (2D)|( \\sqrt{v_x^2 + v_y^2} )|\r\n|Suma|( (a_x + b_x, a_y + b_y) )|\r\n|Resta|( (a_x - b_x, a_y - b_y) )|\r\n|Producto escalar|( a_x b_x + a_y b_y )|\r\n|Producto vectorial|( \\vec{a} \\times \\vec{b} )|\r\n|Vector unitario|( \\vec{v} /|\r\n');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas`
--

CREATE TABLE `preguntas` (
  `id` int(11) NOT NULL,
  `id_lecture` int(11) NOT NULL,
  `json` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `preguntas`
--

INSERT INTO `preguntas` (`id`, `id_lecture`, `json`) VALUES
(1001, 1, '{\r\n  \"question\": \"Que es un vector?\",\r\n  \"correct-answer\": \"Es un elemento con magnitúd y dirección\",\r\n  \"incorrect-answers\": [\r\n    \"Son $30N$\",\r\n    \"$\\\\pi \\\\div e$\",\r\n    \"Una constante aproximadamente igual a $6.67 \\\\times 10^7$\"\r\n  ]\r\n}'),
(2001, 2, '{\r\n  \"question\": \"Que pasa si se suman dos vectores uno de $5N$ y otro de $10N$ los dos en la misma dirección?\",\r\n  \"correct-answer\": \"$15N$\",\r\n  \"incorrect-answers\": [\r\n    \"$10N$\",\r\n    \"$20$\",\r\n    \"No tiene resultados\"\r\n  ]\r\n}'),
(3001, 3, '{\r\n  \"question\": \"Si se suman dos fuerzas una de $5N$ a la derecha y otra de $5N$ a la izquierda, Cuál es la fuerza resultante?\",\r\n  \"correct-answer\": \"$0N$\",\r\n  \"incorrect-answers\": [\r\n    \"$5N$ a la derecha\",\r\n    \"$2N$ hacia arriba\",\r\n    \"$10N$ a ambos lados\"\r\n  ]\r\n}'),
(4001, 4, '{\r\n  \"question\": \"En que dirección irá la fuerza resultante de +10N en x,-10N en y\",\r\n  \"correct-answer\": \"Abajo a la derecha\",\r\n  \"incorrect-answers\": [\r\n    \"Abajo el centro\",\r\n    \"Directamente arriba\",\r\n    \"-30°\"\r\n  ]\r\n}'),
(6767002, 6767, '{\r\n  \"question\": \"Qué es un vector?\",\r\n  \"correct-answer\": \"Un segmento con dirección, sentido y magnitúd\",\r\n  \"incorrect-answers\": [\r\n    \"Una constante como [\\\\pi] o [e]\",\r\n    \"Un valor usado solo para la velocidad\",\r\n    \"Una magnitud igual a [5.76*10^{-7}G\\\\frac{m}{v}]\"\r\n  ]\r\n}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `user` varchar(30) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `pfp_path` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `user`, `email`, `password`, `pfp_path`, `created_at`) VALUES
(11, 'xcv', 'xcv', 'xcv', '$2y$10$FdJXLUgcyYSgmakCnYLazejJpftyO0LKcKBWDfjotPkqxk294ebL2', 'uploads/692085665d21a_Captura de pantalla (2).png', '2025-11-21 15:29:42'),
(12, 'José', 'soyleo', 'leo@gmail.com', '$2y$10$Nnxl1NGz1FOZeqgLC15Ai.R5G.Tb8Wdn3BkyHlmu04AW1GO7cDVA2', 'uploads/6940795556a6b_Captura de pantalla (2).png', '2025-12-15 21:10:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_data`
--

CREATE TABLE `user_data` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `streak` int(11) NOT NULL,
  `last_login` date NOT NULL,
  `color_primary` text DEFAULT NULL,
  `color_secondary` text DEFAULT NULL,
  `color_background` text DEFAULT NULL,
  `user_level` int(10) UNSIGNED NOT NULL,
  `user_exp` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `user_data`
--

INSERT INTO `user_data` (`id`, `user_id`, `streak`, `last_login`, `color_primary`, `color_secondary`, `color_background`, `user_level`, `user_exp`) VALUES
(2, 11, 4, '2025-11-27', NULL, NULL, NULL, 1, 0),
(3, 12, 1, '2025-12-15', NULL, NULL, NULL, 1, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `lecciones`
--
ALTER TABLE `lecciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_lecture` (`id_lecture`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `user_data`
--
ALTER TABLE `user_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `lecciones`
--
ALTER TABLE `lecciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6976;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `user_data`
--
ALTER TABLE `user_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD CONSTRAINT `preguntas_ibfk_1` FOREIGN KEY (`id_lecture`) REFERENCES `lecciones` (`id`);

--
-- Filtros para la tabla `user_data`
--
ALTER TABLE `user_data`
  ADD CONSTRAINT `user_data_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
