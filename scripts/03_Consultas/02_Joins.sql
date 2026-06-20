--Consultas con funciones de paginacion
-- 1 Equipos con su ciudad y su estado
SELECT equipo.nombre_equipo, equipo.apodo_equipo, equipo.numero_de_campeonatos, ciudad_equipo.estado_ciudad_equipo, ciudad_equipo.habitantes
FROM equipo
JOIN ciudad_equipo
    ON equipo.id_ciudad_equipo = ciudad_equipo.id_ciudad_equipo
ORDER BY equipo.numero_de_campeonatos DESC
OFFSET 5 ROWS
FETCH NEXT 5 ROWS ONLY;
-- 2 Partidos con nombre de estadio, clima y temperatur
SELECT partido.id_partido, partido.fecha_partido, partido.goles_local, partido.goles_visita, estadio.nombre_estadio, clima.tipo_clima, partido.temperatura
FROM partido
JOIN estadio
    ON partido.id_estadio = estadio.id_estadio
JOIN clima
    ON partido.id_clima = clima.id_clima
ORDER BY partido.fecha_partido ASC
OFFSET 0 ROWS
FETCH NEXT 6 ROWS ONLY;
-- 3 Jugadores con equipo, posición y goles en partido
SELECT jugador.primer_nombre, jugador.primer_apellido, jugador.nacionalidad, equipo.nombre_equipo, estadisticas_jugador_partido.posicion_partido,
    estadisticas_jugador_partido.goles_partido,
    estadisticas_jugador_partido.minutos_jugados_partido
FROM jugador
JOIN equipo
    ON jugador.id_equipo = equipo.id_equipo
JOIN estadisticas_jugador_partido
    ON jugador.id_jugador = estadisticas_jugador_partido.id_jugador
ORDER BY estadisticas_jugador_partido.goles_partido DESC
OFFSET 5 ROWS
FETCH NEXT 5 ROWS ONLY;
-- 4 Estadios con dirección, tipo de pasto y arquitecto
SELECT estadio.nombre_estadio, estadio.capacidad_total, estadio.fecha_ignauguracion, pasto.tipo_pasto, direccion_estadio.calle_estadio,
    direccion_estadio.ciudad_estadio,
    arquitecto_estadio.primer_nombre_arqui,
    arquitecto_estadio.primer_apellido_arqui
FROM estadio
JOIN pasto
    ON estadio.id_pasto = pasto.id_pasto
JOIN direccion_estadio
    ON estadio.id_direccion = direccion_estadio.id_direccion
JOIN arquitecto_estadio
    ON estadio.id_arquitecto = arquitecto_estadio.id_arquitecto
ORDER BY estadio.capacidad_total DESC
OFFSET 4 ROWS
FETCH NEXT 4 ROWS ONLY;
-- 5 Entrenadores con su equipo y estadísticas en partidos
SELECT entrenador.primer_nombre_entrenador, entrenador.primer_apellido_entrenador, entrenador.nacionalidad_ent, equipo.nombre_equipo,
    estadisticas_entrenador_partido.id_partido,
    estadisticas_entrenador_partido.numero_cambios,
    estadisticas_entrenador_partido.tarjetas_amarillas_entrenador,
    estadisticas_entrenador_partido.tarjetas_rojas_entrenador
FROM entrenador
JOIN equipo
    ON entrenador.id_equipo = equipo.id_equipo
JOIN estadisticas_entrenador_partido
    ON entrenador.id_entrenador = estadisticas_entrenador_partido.id_entrenador
ORDER BY estadisticas_entrenador_partido.numero_cambios DESC
OFFSET 10 ROWS
FETCH NEXT 5 ROWS ONLY;


--Consultas con funciones de composición.
-- 1usando  NATURAL JOIN. Jugadores con su equipo
SELECT jugador.primer_nombre, jugador.primer_apellido, jugador.nacionalidad, jugador.estatura, equipo.nombre_equipo, equipo.apodo_equipo
FROM jugador
NATURAL JOIN equipo;


-- 2 usando INNER JOIN. Partidos con el estadio donde se jugaron, la asistencia
--y si había wifi, solo muestra partidos que tienen estadísticas registradas
SELECT partido.id_partido, partido.fecha_partido, partido.goles_local, partido.goles_visita, partido.temperatura,
    estadio.nombre_estadio,
    estadio.capacidad_total,
    estadisticas_estadio_partido.asistencia,
    estadisticas_estadio_partido.wifi_disponible
FROM partido
INNER JOIN estadio
    ON partido.id_estadio = estadio.id_estadio
INNER JOIN estadisticas_estadio_partido
    ON partido.id_partido = estadisticas_estadio_partido.id_partido;

-- 3 Torneos con su campeon, goleador y MVP, cruzado con el desempeño del equipo campeon en ese torneo
SELECT
    torneo.temporada_torneo,
    torneo.campeon_torneo,
    torneo.subcampeon,
    torneo.goleador_torneo,
    torneo.mvp_torneo,
    desempenio_torneo.victorias,
    desempenio_torneo.empates,
    desempenio_torneo.derrotas,
    desempenio_torneo.goles_favor,
    desempenio_torneo.puntos_totales
FROM torneo
INNER JOIN desempenio_torneo
    ON torneo.id_torneo = desempenio_torneo.id_torneo
INNER JOIN equipo
    ON desempenio_torneo.id_equipo = equipo.id_equipo
WHERE desempenio_torneo.posicion = 1;
-- 4 LEFT OUTER JOIN. Todos los jugadores y sus lesiones.
SELECT
    jugador.primer_nombre,
    jugador.primer_apellido,
    jugador.nacionalidad,
    equipo.nombre_equipo,
    lesion.area_corporal,
    lesion.tiempo_recuperacion,
    estatus_lesion.esta_lesionado,
    estatus_lesion.temporada_lesion
FROM jugador
LEFT OUTER JOIN estatus_lesion
    ON jugador.id_jugador = estatus_lesion.id_jugador
LEFT OUTER JOIN lesion
    ON estatus_lesion.id_lesion = lesion.id_lesion
LEFT OUTER JOIN equipo
    ON jugador.id_equipo = equipo.id_equipo;


-- 5 RIGHT OUTER JOIN
--Todos los estadios y sus partidos jugados, incluyendo estadios donde no se ha jugado ningun partido
SELECT
    estadio.nombre_estadio,
    estadio.capacidad_total,
    direccion_estadio.ciudad_estadio,
    pasto.tipo_pasto,
    partido.id_partido,
    partido.fecha_partido,
    partido.goles_local,
    partido.goles_visita
FROM partido
RIGHT OUTER JOIN estadio
    ON partido.id_estadio = estadio.id_estadio
RIGHT OUTER JOIN direccion_estadio
    ON estadio.id_direccion = direccion_estadio.id_direccion
RIGHT OUTER JOIN pasto
    ON estadio.id_pasto = pasto.id_pasto;

--tablas renombradas
-- 1 Jugadores con su equipo y ciudad
SELECT
    jugador_tabla.primer_nombre,
    jugador_tabla.primer_apellido,
    jugador_tabla.nacionalidad,
    jugador_tabla.estatura,
    equipo_tabla.nombre_equipo,
    equipo_tabla.apodo_equipo,
    equipo_tabla.numero_de_campeonatos,
    ciudad_tabla.estado_ciudad_equipo,
    ciudad_tabla.habitantes
FROM jugador AS jugador_tabla
INNER JOIN equipo AS equipo_tabla
    ON jugador_tabla.id_equipo = equipo_tabla.id_equipo
INNER JOIN ciudad_equipo AS ciudad_tabla
    ON equipo_tabla.id_ciudad_equipo = ciudad_tabla.id_ciudad_equipo;
-- 2. Partidos con estadio, arquitecto y tipo de pasto,
SELECT
    partido_tabla.id_partido,
    partido_tabla.fecha_partido,
    partido_tabla.goles_local,
    partido_tabla.goles_visita,
    partido_tabla.temperatura,
    estadio_tabla.nombre_estadio,
    estadio_tabla.capacidad_total,
    pasto_tabla.tipo_pasto,
    arquitecto_tabla.primer_nombre_arqui,
    arquitecto_tabla.primer_apellido_arqui,
    direccion_tabla.calle_estadio,
    direccion_tabla.ciudad_estadio
FROM partido AS partido_tabla
INNER JOIN estadio AS estadio_tabla
    ON partido_tabla.id_estadio = estadio_tabla.id_estadio
INNER JOIN pasto AS pasto_tabla
    ON estadio_tabla.id_pasto = pasto_tabla.id_pasto
INNER JOIN arquitecto_estadio AS arquitecto_tabla
    ON estadio_tabla.id_arquitecto = arquitecto_tabla.id_arquitecto
INNER JOIN direccion_estadio AS direccion_tabla
    ON estadio_tabla.id_direccion = direccion_tabla.id_direccion;