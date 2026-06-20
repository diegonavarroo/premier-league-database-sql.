
--------------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------------------

--4 consultas con JOIN usando operadores de comparación--


--El primer nombre de los jugadores jugadores que sean de inglaterra y tengan más de 1 gol por partido--

SELECT
jugador.primer_nombre,
jugador.id_equipo,
estadisticas_jugador_partido.id_partido, 
jugador.nacionalidad,
estadisticas_jugador_partido.goles_partido 

FROM jugador JOIN estadisticas_jugador_partido ON jugador.id_jugador = estadisticas_jugador_partido.id_jugador 

WHERE nacionalidad = 'inglaterra' 
AND goles_partido = 1;




--jugadores de menos de 25 años en equipos con más de 2 campeonatos--

SELECT
jugador.primer_nombre,
jugador.primer_apellido,
equipo.nombre_equipo,
equipo.numero_de_campeonatos,
EXTRACT(YEAR FROM AGE(CURRENT_DATE, jugador.fecha_nacimient)) AS edad

FROM jugador JOIN equipo ON jugador.id_equipo = equipo.id_equipo 

WHERE  EXTRACT(YEAR FROM AGE(CURRENT_DATE, jugador.fecha_nacimient)) 
 < 25 
AND numero_de_campeonatos > 2;



--entrenadores que sean extranjeros--
SELECT
entrenador.primer_nombre_entrenador,
entrenador.primer_apellido_entrenador,
desempenio_torneo.id_equipo,
entrenador.nacionalidad_ent,
desempenio_torneo.empates

FROM entrenador JOIN desempenio_torneo ON entrenador.id_equipo = desempenio_torneo.id_equipo
WHERE nacionalidad_ent != 'inglaterra' 
AND empates = 10;





--Jugadores que hayan jugado mas de 45 minutos un partido--

SELECT 
jugador.primer_nombre,
jugador.id_equipo,
estadisticas_jugador_partido.minutos_jugados_partido

FROM jugador JOIN estadisticas_jugador_partido ON jugador.id_jugador = estadisticas_jugador_partido.id_jugador

WHERE minutos_jugados_partido > 45;



--------------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------------------

--4 consultas con JOIN usando funciones de agregación y agrupación.--



--contar los jugadores por nacionalidad, en los diferentes equipos--
SELECT 

equipo.nombre_equipo,
jugador.nacionalidad,

COUNT (jugador.id_jugador) AS total_jugadores

FROM jugador JOIN equipo ON jugador.id_equipo = equipo.id_equipo


GROUP BY equipo.nombre_equipo,
jugador.nacionalidad

ORDER BY 
total_jugadores DESC;




--Capacidad promedio por ciudad --

SELECT 

estadio.nombre_estadio,
direccion_estadio,

COUNT (estadio.capacidad_total) AS promedio_total

FROM estadio JOIN direccion_estadio ON estadio .id_direccion = direccion_estadio .id_direccion

GROUP BY 
estadio.nombre_estadio,
direccion_estadio

ORDER BY 
promedio_total DESC;



--equipos con más de 15 goles como local--

SELECT 

equipo.nombre_equipo, 
    
SUM(partido.goles_local) AS goles_totales_casa 

FROM equipo JOIN partido ON equipo.id_equipo = partido.id_equipo_local

GROUP BY equipo.nombre_equipo

HAVING SUM(partido.goles_local) > 15;


--tarjetas amarillas de entrenadores por torneo--

SELECT 

entrenador.primer_nombre_entrenador, 
entrenador.primer_apellido_entrenador, 

SUM(estadisticas_entrenador_partido.tarjetas_amarillas_entrenador) AS total_amarillas

FROM entrenador JOIN estadisticas_entrenador_partido ON entrenador.id_entrenador = estadisticas_entrenador_partido.id_entrenador

GROUP BY 
entrenador.primer_nombre_entrenador, 
entrenador.primer_apellido_entrenador;



--------------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------------------


--2 consultas con JOIN usando funciones de comparación, agregación y agrupación.--


--estadios que con asistencia promedio mayor a 30,000--
SELECT 

estadio.nombre_estadio, 

AVG(estadisticas_estadio_partido.asistencia) AS asistencia_promedio

FROM estadio JOIN estadisticas_estadio_partido ON estadio.id_estadio = estadisticas_estadio_partido.id_estadio

WHERE estadio.capacidad_total >= 40000

GROUP BY estadio.nombre_estadio

HAVING AVG(estadisticas_estadio_partido.asistencia) > 30000;


--jugadores titulares con promedio de pases mayor a 50--

SELECT 
jugador.primer_nombre, 
jugador.primer_apellido, 

AVG(estadisticas_jugador_partido.pases_totales) AS promedio_pases

FROM jugador JOIN estadisticas_jugador_partido  ON jugador.id_jugador = estadisticas_jugador_partido.id_jugador

WHERE estadisticas_jugador_partido.es_titular = true

GROUP BY 
jugador.primer_nombre, 
ugador.primer_apellido

HAVING AVG(estadisticas_jugador_partido.pases_totales) > 50;





