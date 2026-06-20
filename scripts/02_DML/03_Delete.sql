-- 1. ciudad_equipo
DELETE FROM ciudad_equipo
WHERE id_ciudad_equipo = 26;  
DELETE FROM ciudad_equipo
WHERE estado_ciudad_equipo = 'Staffordshire' AND habitantes = 259000;  
-- 2. equipo
DELETE FROM equipo
WHERE nombre_equipo = 'Chuiquipumas';
DELETE FROM equipo
WHERE apodo_equipo = 'La poderosisima maquina cementera de la cruz azul'; 
-- 3. torneo
DELETE FROM torneo
WHERE campeon_torneo = 'Manchester Utd' AND temporada_torneo = '2007-08-11';
DELETE FROM torneo
WHERE mvp_torneo = 'Eric Cantona' AND temporada_torneo = '1993-08-14';
-- 4. desempenio_torneo
DELETE FROM desempenio_torneo
WHERE id_torneo = 1 AND id_equipo = 2;
DELETE FROM desempenio_torneo
WHERE id_torneo = 6 AND id_equipo = 21;  
-- 5. arquitecto_estadio
DELETE FROM arquitecto_estadio
WHERE primer_apellido_arqui = 'Barry';
DELETE FROM arquitecto_estadio
WHERE primer_apellido_arqui = 'Navarro';
-- 6. pasto
DELETE FROM pasto
WHERE tipo_pasto = 'verde';
DELETE FROM pasto
WHERE tipo_pasto = 'quemado';
-- 7. direccion_estadio
DELETE FROM direccion_estadio
WHERE calle_estadio = 'Periferico'
DELETE FROM direccion_estadio
WHERE ciudad_estadio = 'CDMX'; 
-- 8. estadio
DELETE FROM estadio
WHERE nombre_estadio = 'Olimpico Universitario';  
DELETE FROM estadio
WHERE nombre_estadio = 'Estadio Banorte'; 
-- 9. clima
DELETE FROM clima
WHERE tipo_clima = 'Perfecto';
DELETE FROM clima
WHERE tipo_clima = 'clima';
-- 10. partido
DELETE FROM partido
WHERE id_partido = 67;
DELETE FROM partido
WHERE id_partido = 1671 AND id_clima = 7;
-- 11. entrenador
DELETE FROM entrenador
WHERE primer_apellido_entrenador = 'Ferguson';  
DELETE FROM entrenador
WHERE apodo_ent = 'Le Professeur'; 
-- 12. estadisticas_entrenador_partido
DELETE FROM estadisticas_entrenador_partido
WHERE id_entrenador = 6 AND id_partido = 14;
DELETE FROM estadisticas_entrenador_partido
WHERE id_entrenador = 3 AND id_partido = 29;
-- 13. estadisticas_estadio_partido
DELETE FROM estadisticas_estadio_partido
WHERE id_estadio = 8 AND id_partido = 20;  
DELETE FROM estadisticas_estadio_partido
WHERE id_estadio = 15 AND id_partido = 23;
-- 14. jugador
DELETE FROM jugador
WHERE apodo_jugador = 'Six';
DELETE FROM jugador
WHERE primer_apellido = 'Gomez' AND nacionalidad = 'Mexicano';
-- 15. estadisticas_jugador_partido
DELETE FROM estadisticas_jugador_partido
WHERE id_jugador = 11 AND id_partido = 6; 
DELETE FROM estadisticas_jugador_partido
WHERE id_jugador = 16 AND id_partido = 10;  -- Alexander Isak, amarilla
-- 16. lesion
DELETE FROM lesion
WHERE area_corporal = 'Pelvis'; 
DELETE FROM lesion
WHERE area_corporal = 'Cuello';
-- 17. cirugia
DELETE FROM cirugia
WHERE tipo_cirugia = 'Elongacion Muscular';
DELETE FROM cirugia
WHERE tipo_cirugia = 'Transferencia Tendón';
-- 18. estatus_lesion
DELETE FROM estatus_lesion
WHERE id_jugador = 24 AND esta_lesionado = TRUE;  -- Ivan Toney, lesionado activo
DELETE FROM estatus_lesion
WHERE id_jugador = 16 AND id_lesion = 10;  -- Alexander Isak, Ligamento Cruzado