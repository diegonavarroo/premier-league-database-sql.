-- 1. ciudad_equipo
SELECT id_ciudad_equipo, habitantes, estado_ciudad_equipo
FROM ciudad_equipo
WHERE habitantes > 500000;

SELECT id_ciudad_equipo, estado_ciudad_equipo
FROM ciudad_equipo
WHERE estado_ciudad_equipo = 'Greater Manchester';

SELECT id_ciudad_equipo, habitantes
FROM ciudad_equipo
WHERE habitantes BETWEEN 200000 AND 400000;

SELECT id_ciudad_equipo, estado_ciudad_equipo
FROM ciudad_equipo
WHERE estado_ciudad_equipo LIKE '%Yorkshire%';

SELECT id_ciudad_equipo, habitantes, estado_ciudad_equipo
FROM ciudad_equipo
WHERE habitantes < 150000;



-- 2. equipo
SELECT nombre_equipo, apodo_equipo
FROM equipo
WHERE numero_de_campeonatos > 5;

SELECT nombre_equipo, fecha_fundacion
FROM equipo
WHERE fecha_fundacion < '1880-01-01';

SELECT nombre_equipo, ultimo_campeonato
FROM equipo
WHERE ultimo_campeonato IS NULL;

SELECT nombre_equipo, numero_de_campeonatos
FROM equipo
WHERE numero_de_campeonatos = 0;

SELECT nombre_equipo, ultimo_campeonato, numero_de_campeonatos
FROM equipo
WHERE ultimo_campeonato > '2010-01-01';



-- 3. torneo
SELECT campeon_torneo, temporada_torneo
FROM torneo
WHERE campeon_torneo = 'Manchester City';

SELECT campeon_torneo, goleador_torneo, mvp_torneo
FROM torneo
WHERE goleador_torneo = mvp_torneo;

SELECT campeon_torneo, subcampeon, temporada_torneo
FROM torneo
WHERE subcampeon = 'Arsenal';

SELECT goleador_torneo, temporada_torneo
FROM torneo
WHERE goleador_torneo = 'Harry Kane';

SELECT campeon_torneo, subcampeon, temporada_torneo
FROM torneo
WHERE temporada_torneo BETWEEN '2019-01-01' AND '2024-12-31';



-- 4. desempenio_torneo
SELECT id_equipo, puntos_totales, posicion
FROM desempenio_torneo
WHERE puntos_totales >= 90;

SELECT id_equipo, goles_favor, goles_contra
FROM desempenio_torneo
WHERE goles_favor > 90;

SELECT id_equipo, victorias, derrotas
FROM desempenio_torneo
WHERE derrotas <= 3;

SELECT id_torneo, id_equipo, posicion
FROM desempenio_torneo
WHERE posicion = 1;

SELECT id_equipo, empates, puntos_totales
FROM desempenio_torneo
WHERE empates > 8;


-- 5. arquitecto_estadio
SELECT primer_nombre_arqui, primer_apellido_arqui
FROM arquitecto_estadio
WHERE primer_apellido_arqui = 'Sheard';

SELECT id_arquitecto, primer_nombre_arqui, primer_apellido_arqui
FROM arquitecto_estadio
WHERE id_arquitecto <= 5;

SELECT primer_nombre_arqui, segundo_nombre_arqui, primer_apellido_arqui
FROM arquitecto_estadio
WHERE segundo_nombre_arqui = 'James';

SELECT primer_nombre_arqui, primer_apellido_arqui
FROM arquitecto_estadio
WHERE segundo_nombre_arqui IS NULL;

SELECT primer_nombre_arqui, primer_apellido_arqui
FROM arquitecto_estadio
WHERE primer_nombre_arqui IN ('Colin', 'Nicholas', 'Rod');


-- 6. pasto
SELECT id_pasto, tipo_pasto
FROM pasto
WHERE tipo_pasto = 'Natural';

SELECT id_pasto, tipo_pasto
FROM pasto
WHERE tipo_pasto = 'Hibrido';

SELECT id_pasto, tipo_pasto
FROM pasto
WHERE tipo_pasto = 'Sintetico';

SELECT id_pasto, tipo_pasto
FROM pasto
WHERE id_pasto < 3;

SELECT id_pasto, tipo_pasto
FROM pasto
WHERE id_pasto IN (1, 2);



-- 7. direccion_estadio
SELECT calle_estadio, ciudad_estadio
FROM direccion_estadio
WHERE ciudad_estadio = 'London';

SELECT id_direccion, calle_estadio, alcaldia_estadio
FROM direccion_estadio
WHERE ciudad_estadio = 'Manchester';

SELECT ciudad_estadio, calle_estadio
FROM direccion_estadio
WHERE alcaldia_estadio = 'Fulham';

SELECT calle_estadio, ciudad_estadio
FROM direccion_estadio
WHERE ciudad_estadio NOT IN ('London', 'Manchester', 'Liverpool');

SELECT id_direccion, calle_estadio, ciudad_estadio
FROM direccion_estadio
WHERE calle_estadio LIKE '%Road%';



-- 8. estadio
SELECT nombre_estadio, capacidad_total
FROM estadio
WHERE capacidad_total > 60000;

SELECT nombre_estadio, fecha_ignauguracion
FROM estadio
WHERE fecha_ignauguracion < '1900-01-01';

SELECT nombre_estadio, capacidad_total
FROM estadio
WHERE capacidad_total BETWEEN 30000 AND 50000;

SELECT nombre_estadio, id_pasto
FROM estadio
WHERE id_pasto = 2;

SELECT nombre_estadio, capacidad_total
FROM estadio
WHERE capacidad_total < 20000;



-- 9. clima
SELECT id_clima, tipo_clima
FROM clima
WHERE tipo_clima = 'Tormenta';

SELECT id_clima, tipo_clima
FROM clima
WHERE tipo_clima LIKE '%Nublado%';

SELECT id_clima, tipo_clima
FROM clima
WHERE id_clima <= 3;

SELECT id_clima, tipo_clima
FROM clima
WHERE tipo_clima IN ('Nevado', 'Ventoso');

SELECT id_clima, tipo_clima
FROM clima
WHERE tipo_clima NOT IN ('Soleado', 'Nevado');



-- 10. partido
SELECT id_partido, goles_local, goles_visita, fecha_partido
FROM partido
WHERE goles_local > 3;

SELECT id_partido, temperatura, humedad
FROM partido
WHERE temperatura < 7.0;

SELECT id_partido, fecha_partido, id_estadio
FROM partido
WHERE temporada_partido = '2023-08-11'
  AND fecha_partido < '2023-12-01';

SELECT id_partido, goles_local, goles_visita
FROM partido
WHERE goles_local = goles_visita;

SELECT id_partido, id_clima, temperatura
FROM partido
WHERE id_clima IN (5, 6);


-- 11. entrenador
SELECT primer_nombre_entrenador, primer_apellido_entrenador, nacionalidad_ent
FROM entrenador
WHERE nacionalidad_ent = 'Espanola';

SELECT primer_nombre_entrenador, primer_apellido_entrenador, estatura_ent
FROM entrenador
WHERE estatura_ent > 185;

SELECT primer_nombre_entrenador, primer_apellido_entrenador, fecha_nacimient_ent
FROM entrenador
WHERE fecha_nacimient_ent < '1970-01-01';

SELECT apodo_ent, primer_apellido_entrenador
FROM entrenador
WHERE nacionalidad_ent IN ('Portuguesa', 'Holandesa');

SELECT primer_nombre_entrenador, primer_apellido_entrenador, tipo_sangre_ent
FROM entrenador
WHERE tipo_sangre_ent = 'O+';


-- 12. estadisticas_entrenador_partido
SELECT id_entrenador, id_partido, numero_cambios
FROM estadisticas_entrenador_partido
WHERE numero_cambios = 5;

SELECT id_entrenador, id_partido, tarjetas_amarillas_entrenador
FROM estadisticas_entrenador_partido
WHERE tarjetas_amarillas_entrenador > 0;

SELECT id_entrenador, id_partido, tarjetas_rojas_entrenador
FROM estadisticas_entrenador_partido
WHERE tarjetas_rojas_entrenador = TRUE;

SELECT id_entrenador, numero_cambios
FROM estadisticas_entrenador_partido
WHERE numero_cambios >= 4;

SELECT id_entrenador, id_partido, tarjetas_amarillas_entrenador, numero_cambios
FROM estadisticas_entrenador_partido
WHERE tarjetas_amarillas_entrenador = 0
  AND numero_cambios = 3;



-- 13. estadisticas_estadio_partido
SELECT id_estadio, id_partido, asistencia
FROM estadisticas_estadio_partido
WHERE asistencia > 70000;

SELECT id_estadio, id_partido, wifi_disponible
FROM estadisticas_estadio_partido
WHERE wifi_disponible = FALSE;

SELECT id_estadio, asistencia
FROM estadisticas_estadio_partido
WHERE asistencia < 20000;

SELECT id_estadio, id_partido, asistencia
FROM estadisticas_estadio_partido
WHERE asistencia BETWEEN 50000 AND 65000;

SELECT id_estadio, id_partido, wifi_disponible, comida_disponible
FROM estadisticas_estadio_partido
WHERE wifi_disponible = TRUE AND comida_disponible = TRUE;



-- 14. jugador
SELECT primer_nombre, primer_apellido, nacionalidad
FROM jugador
WHERE nacionalidad = 'Inglaterra';

SELECT primer_nombre, primer_apellido, estatura
FROM jugador
WHERE estatura > 190;

SELECT primer_nombre, primer_apellido, fecha_nacimient
FROM jugador
WHERE fecha_nacimient > '2000-01-01';

SELECT apodo_jugador, primer_apellido, id_equipo
FROM jugador
WHERE id_equipo = 1;

SELECT primer_nombre, primer_apellido, tipo_sangre
FROM jugador
WHERE tipo_sangre = 'A+';



-- 15. estadisticas_jugador_partido
SELECT id_jugador, id_partido, goles_partido
FROM estadisticas_jugador_partido
WHERE goles_partido >= 2;

SELECT id_jugador, id_partido, minutos_jugados_partido
FROM estadisticas_jugador_partido
WHERE es_titular = FALSE;

SELECT id_jugador, posicion_partido, goles_partido
FROM estadisticas_jugador_partido
WHERE posicion_partido = 'Portero';

SELECT id_jugador, id_partido, tarjetas_amarillas
FROM estadisticas_jugador_partido
WHERE tarjetas_amarillas > 0;

SELECT id_jugador, km_recorridos, pases_totales
FROM estadisticas_jugador_partido
WHERE km_recorridos >= 11;


-- 16. lesion
SELECT area_corporal, tiempo_recuperacion
FROM lesion
WHERE tiempo_recuperacion > 90;

SELECT id_lesion, area_corporal
FROM lesion
WHERE area_corporal LIKE '%Rodilla%';

SELECT area_corporal, tiempo_recuperacion
FROM lesion
WHERE tiempo_recuperacion <= 21;

SELECT id_lesion, area_corporal, tiempo_recuperacion
FROM lesion
WHERE tiempo_recuperacion BETWEEN 40 AND 60;

SELECT area_corporal, tiempo_recuperacion
FROM lesion
WHERE tiempo_recuperacion = (SELECT MAX(tiempo_recuperacion) FROM lesion);



-- 17. cirugia
SELECT id_cirugia, tipo_cirugia
FROM cirugia
WHERE tipo_cirugia LIKE '%Reparacion%';

SELECT id_cirugia, tipo_cirugia
FROM cirugia
WHERE tipo_cirugia LIKE '%Rodilla%' OR tipo_cirugia LIKE '%LCA%';

SELECT id_cirugia, tipo_cirugia
FROM cirugia
WHERE id_cirugia BETWEEN 1 AND 5;

SELECT tipo_cirugia
FROM cirugia
WHERE tipo_cirugia LIKE '%Aquiles%';

SELECT id_cirugia, tipo_cirugia
FROM cirugia
WHERE tipo_cirugia LIKE '%Artroscopia%';


-- 18. estatus_lesion
SELECT id_jugador, id_lesion, esta_lesionado
FROM estatus_lesion
WHERE esta_lesionado = TRUE;

SELECT id_jugador, temporada_lesion
FROM estatus_lesion
WHERE temporada_lesion = '2023-08-11';

SELECT id_jugador, id_lesion, id_cirugia
FROM estatus_lesion
WHERE id_cirugia = 10;

SELECT id_jugador, id_lesion, temporada_lesion
FROM estatus_lesion
WHERE temporada_lesion < '2022-01-01';

SELECT id_jugador, id_lesion, esta_lesionado
FROM estatus_lesion
WHERE esta_lesionado = FALSE AND id_lesion IN (1, 10, 12);