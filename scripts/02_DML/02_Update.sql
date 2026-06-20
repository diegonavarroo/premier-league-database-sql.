-- Tabla ciudad_equipo
UPDATE ciudad_equipo SET estado_ciudad_equipo = 'East Midlands' WHERE id_ciudad_equipo =13 ;
UPDATE ciudad_equipo SET estado_ciudad_equipo = 'North Yorkshire' WHERE id_ciudad_equipo = 17 ;

-- Tabla equipo
UPDATE equipo SET nombre_equipo = 'Petrodolar City' WHERE id_equipo = 1 ;
UPDATE equipo SET numero_de_campeonatos = 0 WHERE id_equipo = 1 ;

-- Tabla torneo
UPDATE torneo SET campeon_torneo = 'Petrodolar City' WHERE id_torneo = 1 ;
UPDATE torneo SET temporada_torneo = '2022-08-04' WHERE id_torneo = 1;

-- Tabla desempenio_torneo
UPDATE desempenio_torneo SET posicion = 20 WHERE id_torneo = 1  AND id_equipo = 1 ;
UPDATE desempenio_torneo SET puntos_totales = 0 WHERE id_torneo = 1  AND id_equipo = 1;

-- Tabla arquitecto_estadio
UPDATE arquitecto_estadio SET primer_nombre_arqui = 'Archibald Jr.' WHERE id_arquitecto = 1;
UPDATE arquitecto_estadio SET primer_apellido_arqui = 'Hernandez' WHERE id_arquitecto = 2;

-- Tabla pasto
UPDATE pasto SET tipo_pasto = 'Real' WHERE id_pasto = 1 ;
UPDATE pasto SET tipo_pasto = 'Mezclado' WHERE id_pasto = 2;

-- Tabla direccion_estadio
UPDATE direccion_estadio SET calle_estadio = 'Petro Campus' WHERE id_direccion = 1;
UPDATE direccion_estadio SET ciudad_estadio = 'Arabia' WHERE id_direccion = 1;

-- Tabla estadio
UPDATE estadio SET nombre_estadio = 'Chiqui Stadium' WHERE id_estadio = 1 ;
UPDATE estadio SET capacidad_total = '60704' WHERE id_estadio = 2 ;

-- Tabla clima
UPDATE clima SET tipo_clima = 'Soleado' WHERE id_clima = 1 ;
UPDATE clima SET tipo_clima = 'Lluvioso' WHERE id_clima = 3 ;

-- Tabla partido
UPDATE partido SET goles_local = 0 WHERE id_partido = 30 ;
UPDATE partido SET goles_visita = 3 WHERE id_partido = 15;

-- Tabla entrenador
UPDATE entrenador SET primer_nombre_entrenador = 'Joseph' WHERE id_entrenador = 1 ;
UPDATE entrenador SET nacionalidad_ent = 'Angola' WHERE id_entrenador = 15 ;

-- Tabla estadisticas_entrenador_partido
UPDATE estadisticas_entrenador_partido SET tarjetas_amarillas_entrenador = 1 WHERE id_entrenador = 1 AND id_partido = 1;
UPDATE estadisticas_entrenador_partido SET tarjetas_rojas_entrenador = TRUE WHERE id_entrenador = 1 AND id_partido = 1 ;

-- Tabla estadisticas_estadio_partido
UPDATE estadisticas_estadio_partido SET asistencia = 39000 WHERE id_estadio = 4 AND id_partido = 6 ;
UPDATE estadisticas_estadio_partido SET wifi_disponible = FALSE WHERE id_estadio = 1  AND id_partido = 28;

-- Tabla jugador
UPDATE jugador SET primer_nombre = 'Erling' WHERE id_jugador = 1 ;
UPDATE jugador SET estatura = 190 WHERE id_jugador = 16 ;

-- Tabla estadisticas_jugador_partido
UPDATE estadisticas_jugador_partido SET goles_partido = 2 WHERE id_jugador = 23 AND id_partido = 26 ;
UPDATE estadisticas_jugador_partido SET minutos_jugados_partido = 0 WHERE id_jugador = 11 AND id_partido = 6 ;

-- Tabla lesion
UPDATE lesion SET area_corporal = 'Cerebro' WHERE id_lesion = 23;
UPDATE lesion SET tiempo_recuperacion = 180 WHERE id_lesion = 23 ;

-- Tabla cirugia
UPDATE cirugia SET tipo_cirugia = 'Sin Lesion' WHERE id_cirugia = 30;
UPDATE cirugia SET tipo_cirugia = "Transplante de corazon" WHERE id_cirugia = 29 ;

-- Tabla estatus_lesion
UPDATE estatus_lesion SET esta_lesionado = TRUE WHERE id_jugador = 1 AND id_lesion = 3  AND id_cirugia = 30 ;
UPDATE estatus_lesion SET temporada_lesion = '2022-08-06' WHERE id_jugador = 7  AND id_lesion = 2  AND id_cirugia = 30 ;