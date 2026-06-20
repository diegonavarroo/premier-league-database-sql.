-------Creación de índices a tablas que consideren necesarias.-------CREATE INDEX idp ON partido(id_partido)
CREATE INDEX idj ON jugador(id_jugador)
CREATE INDEX ident ON entrenador(id_entrenador)
CREATE INDEX idtorneo ON desempenio_torneo(id_torneo)
CREATE INDEX idest ON estadio(id_estadio)


--VISTA 1: tabla de jugadores  que marcaron mas de un gol en un partido

CREATE VIEW 

estadisticas_jpp (nombre, partido, goles, minutos_jugados)

AS SELECT 
primer_nombre,id_partido,goles_partido, minutos_jugados_partido 

FROM
estadisticas_jugador_partido JOIN jugador ON jugador.id_jugador = estadisticas_jugador_partido.id_jugador
	
WHERE goles_partido >1 
	
ORDER BY goles_partido;

SELECT* FROM estadisticas_jpp

--VISTA 2: jugadores que tuvieron una lesión en el tobillo

CREATE VIEW

lesion_tobillo (idjugador, nombre, equipo, partido, lesion, temporada)

AS SELECT 
    jugador.id_jugador,
    jugador.primer_nombre,
    jugador.id_equipo ,
    estadisticas_jugador_partido.id_partido,
    estatus_lesion.id_lesion,
    estatus_lesion.temporada_lesion
   
FROM jugador

JOIN estadisticas_jugador_partido 
ON jugador.id_jugador = estadisticas_jugador_partido.id_jugador

JOIN estatus_lesion 
ON estadisticas_jugador_partido.id_jugador = estatus_lesion.id_jugador

Where id_lesion =2

ORDER BY temporada_lesion;

SELECT* FROM lesion_tobillo

---VISTA 3: Goles de cada jugador por temporada----
goles_en_liga (idjugador, nombre, equipo, temporada, golestot)

AS SELECT 
    jugador.id_jugador,
    jugador.primer_nombre,
    jugador.id_equipo ,
    partido.temporada_partido,
    SUM (estadisticas_jugador_partido.goles_partido)

   
FROM jugador

JOIN estadisticas_jugador_partido 
ON jugador.id_jugador = estadisticas_jugador_partido.id_jugador

JOIN partido 
ON estadisticas_jugador_partido.id_partido = partido.id_partido

GROUP BY 
    jugador.id_jugador,
    jugador.primer_nombre,
    jugador.id_equipo ,
    partido.temporada_partido

ORDER BY 	
SUM (estadisticas_jugador_partido.goles_partido) DESC;

SELECT* FROM goles_en_liga


---CTE TIPO SELECT 1 ---

WITH cte_asistencia 

AS (SELECT

estadio.nombre_estadio,
estadisticas_estadio_partido.id_partido,
partido.temporada_partido,
estadisticas_estadio_partido.asistencia

FROM estadio

JOIN estadisticas_estadio_partido
ON estadio.id_estadio = estadisticas_estadio_partido.id_estadio

JOIN partido
ON estadisticas_estadio_partido.id_partido = partido.id_partido)

SELECT* FROM cte_asistencia 

WHERE asistencia > 10000

ORDER BY asistencia;

---CTE TIPO SELECT 2 ---

WITH cte_efectividad

AS (SELECT

jugador.id_jugador,
jugador.primer_nombre,
estadisticas_jugador_partido.pases_totales,
estadisticas_jugador_partido.pases_efectivos,
(estadisticas_jugador_partido.pases_efectivos::numeric /estadisticas_jugador_partido.pases_totales) AS ratio
FROM jugador
JOIN estadisticas_jugador_partido 
ON jugador.id_jugador = estadisticas_jugador_partido.id_jugador)

SELECT* FROM cte_efectividad

WHERE ratio >.90

ORDER BY ratio;


---CTE TIPO DELETE 1 ---

WITH nuevas_estadisticas AS(
	DELETE FROM estadisticas_jugador_partido
	WHERE 
		minutos_jugados_partido < 70
	RETURNING *
)
INSERT INTO no_titulares -- nueva tabla considera en la base



SELECT * FROM nuevas_estadisticas;

---CTE TIPO DELETE 2 ---

WITH nuevos_campeones AS(
	DELETE FROM torneo
	WHERE 
		temporada_torneo < CURRENT_DATE - INTERVAL '2 YEARS' 
	RETURNING *
)
INSERT INTO viejos_campeones -- nueva tabla considera en la base



SELECT * FROM nuevos_campeones;




