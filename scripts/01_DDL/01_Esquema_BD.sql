CREATE TABLE ciudad_equipo (
    id_ciudad_equipo INTEGER,
	habitantes INTEGER
    estado_ciudad_equipo VARCHAR(25)
	
);

CREATE TABLE equipo (
    id_equipo INTEGER,
    id_ciudad_equipo INTEGER,
    nombre_equipo VARCHAR(20),
    fecha_fundacion DATE,
	ultimo_campeonato DATE,
	numero_de_campeonatos INTEGER,
	apodo_equipo VARCHAR(50)
);

CREATE TABLE torneo (
    id_torneo INTEGER,
    campeon_torneo VARCHAR(20),
	subcampeon VARCHAR(20),
	goleador_torneo VARCHAR(40),
	mvp_torneo VARCHAR(40),
	temporada_torneo DATE
);

CREATE TABLE desempenio_torneo (
    id_torneo INTEGER,
    id_equipo INTEGER,
    posicion INTEGER,
    goles_favor INTEGER,
	goles_contra INTEGER,
	victorias INTEGER,
	empates INTEGER,
	derrotas INTEGER,
    puntos_totales INTEGER
);

CREATE TABLE arquitecto_estadio (
    id_arquitecto INTEGER,
    primer_nombre_arqui VARCHAR(20),
	segundo_nombre_arqui VARCHAR(20),
	primer_apellido_arqui VARCHAR(20),
	segundo_apellido_arqui  VARCHAR(20)
);

CREATE TABLE pasto (
    id_pasto INTEGER,
    tipo_pasto VARCHAR(15)
);

CREATE TABLE direccion_estadio (
    id_direccion INTEGER,
    numero_estadio INTEGER,
	calle_estadio VARCHAR(30),
	alcaldia_estadio VARCHAR(30),
	ciudad_estadio VARCHAR(30)
	
);

CREATE TABLE estadio (
    id_estadio INTEGER,
    id_arquitecto INTEGER,
	id_pasto INTEGER,
	id_direccion INTEGER,
	nombre_estadio VARCHAR(30),
	fecha_ignauguracion DATE,
	capacidad_total INTEGER
);

CREATE TABLE clima (
    id_clima INTEGER,
    tipo_clima VARCHAR(20)
);

CREATE TABLE partido (
    id_partido INTEGER,
    id_estadio INTEGER,
    id_equipo_visita INTEGER,
    id_equipo_local INTEGER,
    id_clima INTEGER,
	goles_local INTEGER,
	goles_visita INTEGER,
	fecha_partido DATE,
	hora_partido TIME,
	temporada_partido DATE,
	temperatura FLOAT,
	humedad INTEGER
);

CREATE TABLE entrenador (
    id_entrenador INTEGER,
    id_equipo INTEGER,
    primer_nombre_entrenador VARCHAR(20),
	segundo_nombre_entrenador VARCHAR(20),
	primer_apellido_entrenador VARCHAR(20),
	segundo_apellido_entrenador VARCHAR(20),
	apodo_ent VARCHAR(20),
	fecha_nacimient_ent DATE,
	tipo_sangre_ent VARCHAR(5),
	estatura_ent INTEGER,
	nacionalidad_ent VARCHAR(20)
);

CREATE TABLE estadisticas_entrenador_partido (
    id_entrenador INTEGER,
    id_partido INTEGER,
    tarjetas_amarillas_entrenador INTEGER,
	tarjetas_rojas_entrenador BOOLEAN,
	numero_cambios INTEGER
);

CREATE TABLE estadisticas_estadio_partido (
    id_estadio INTEGER,
	id_partido INTEGER,
	asistencia INTEGER,
	wifi_disponible BOOLEAN,
	comida_disponible BOOLEAN
);

CREATE TABLE jugador (
    id_jugador INTEGER,
    id_equipo INTEGER,
    primer_nombre VARCHAR(20),
	segundo_nombre VARCHAR(20),
	primer_apellido VARCHAR(20),
	segundo_apellido VARCHAR(20),
	apodo_jugador VARCHAR(20),
	fecha_nacimient DATE,
	tipo_sangre VARCHAR(5),
	estatura INTEGER,
	nacionalidad VARCHAR(20)
);

CREATE TABLE estadisticas_jugador_partido (
    id_jugador INTEGER,
    id_partido INTEGER,
	es_titular BOOLEAN,
	goles_partido INTEGER,
	km_recorridos INTEGER,
	minutos_jugados_partido INTEGER,
	pases_totales INTEGER,
	pases_efectivos INTEGER,
	posicion_partido VARCHAR(15),
	tarjetas_amarillas INTEGER,
	tarjeta_roja BOOLEAN,
	numero_camiseta INTEGER
);

CREATE TABLE lesion (
	id_lesion INTEGER,
	area_corporal VARCHAR(20),
	tiempo_recuperacion INTEGER
);

CREATE TABLE cirugia (
	id_cirugia INTEGER,
	tipo_cirugia VARCHAR(20)
);

CREATE TABLE estatus_lesion (
    id_jugador INTEGER,
    id_lesion INTEGER,
	id_cirugia INTEGER,
	temporada_lesion DATE,
	esta_lesionado BOOLEAN
);

