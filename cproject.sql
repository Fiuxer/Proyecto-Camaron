-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-12-2025 a las 17:45:10
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
(6767, 6767, '{\r\n  \"question\": \"Qué es un vector?\",\r\n  \"correct-answer\": \"Un segmento con dirección, sentido y magnitúd\",\r\n  \"incorrect-answers\": [\r\n    \"Una constante como [\\\\pi] o [e]\",\r\n    \"Un valor usado solo para la velocidad\",\r\n    \"Una magnitud igual a [5.76*10^{-7}G\\\\frac{m}{v}]\"\r\n  ]\r\n}'),
(6767002, 6767, '{\r\n  \"question\": \"Qué es un vector pero segunda pregunta?\",\r\n  \"correct-answer\": \"Un segmento con dirección, sentido y magnitúd\",\r\n  \"incorrect-answers\": [\r\n    \"Una constante como [\\\\pi] o [e]\",\r\n    \"Un valor usado solo para la velocidad\",\r\n    \"Una magnitud igual a [5.76*10^{-7}G\\\\frac{m}{v}]\"\r\n  ]\r\n}');

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
(11, 'xcv', 'xcv', 'xcv', '$2y$10$FdJXLUgcyYSgmakCnYLazejJpftyO0LKcKBWDfjotPkqxk294ebL2', 'uploads/692085665d21a_Captura de pantalla (2).png', '2025-11-21 15:29:42');

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
(2, 11, 4, '2025-11-27', NULL, NULL, NULL, 1, 0);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6970;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `user_data`
--
ALTER TABLE `user_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
