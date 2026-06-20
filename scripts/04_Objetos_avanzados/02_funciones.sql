CREATE OR REPLACE FUNCTION SP_INSERTA_DATOS_NUEVO_JUGADOR
(qid_jugador INTEGER,
qid_equipo INTEGER,
qprimer_nombre CHARACTER VARYING (20),
qsegundo_nombre CHARACTER VARYING (20),
qprimer_apellido CHARACTER VARYING (20),
qsegundo_apellido CHARACTER VARYING (20),
qapodo_jugador CHARACTER VARYING (20),
qfecha_nacimient DATE,
qtipo_sangre CHARACTER VARYING (5),
qestatura INTEGER,
qnacionalidad CHARACTER VARYING (20))

RETURNs VARCHAR (20)
AS
$$

DECLARE id_jugador_calculado INTEGER;
DECLARE estatus_insercion VARCHAR (25);

BEGIN 

IF ((SELECT count (*)
	FROM jugador
	WHERE qid_jugador = id_jugador  
	AND qid_equipo = id_equipo
	AND qprimer_nombre = primer_nombre 
	AND qsegundo_nombre = segundo_nombre
	AND qprimer_apellido = primer_apellido 
	AND qsegundo_apellid = segundo_apellido
	AND qapodo_jugador = apodo_jugador
	AND qfecha_nacimient = fecha_nacimient
	AND qtipo_sangre = tipo_sangre
	AND qestatura = estatura
	AND qnacionalidad  = nacionalidad) = 0) 

THEN

 id_jugador_calculado = CASE

	WHEN ((SELECT MAX (id_jugador)
		FROM CLIENTE) IS NOT NULL)
	
	THEN(SELECT MAX (id_jugador)
		FROM CLIENTE)+1

 ELSE 1
 END;

 INSERT INTO jugador VALUES (id_jugador,id_equipo,primer_nombre,segundo_nombre,
 primer_apellido,segundo_apellido,apodo_jugador,fecha_nacimient,tipo_sangre
 ,estatura,nacionalidad);

 
 estatus_insercion = 'INSERCION_EXITOSA';

ELSE

 estatus_insercion = 'EL JUGADOR YA ESTA REGISTRADO';

END IF;

RETURN estatus_insercion;

END;
$$
LANGUAGE 'plpgsql';
