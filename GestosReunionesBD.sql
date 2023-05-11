--Creacion de tablas
CREATE TABLE lugar_procedencia(
	id_lugar_procedencia INT(10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50)
);

CREATE TABLE persona(
	id_persona INT(10)PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_lugar_procedencia INT(10),
    nombre VARCHAR(50),
    telefono INT(10),
    tipo_asistente VARCHAR(10),
    FOREIGN KEY(id_lugar_procedencia) REFERENCES lugar_procedencia(id_lugar_procedencia) ON DELETE CASCADE
);

CREATE TABLE partido_politico(
	id_partido INT(10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
   	nombre VARCHAR(50),
    url_logo VARCHAR(50)
);

CREATE TABLE reunion(
	id_reunion INT(10) PRIMARY KEY NOT NULL AUTO_INCREMENT, 
    id_partido INT(10),
    fecha VARCHAR(10),
    tematica VARCHAR(50),
    hora VARCHAR(10),
    dirigida_por VARCHAR(50),
    presupuesto INT(10),
    FOREIGN KEY (id_partido) REFERENCES partido_politico(id_partido)
);

CREATE TABLE lugar_reunion(
	id_lugar_reunion INT(10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50)
);

CREATE TABLE item(
	id_item INT(10) PRIMARY KEY AUTO_INCREMENT,
    nombre_item VARCHAR(50)   
);

CREATE TABLE propuesta(
	id_propuesta INT(10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    tema_propuesta VARCHAR(500),
    descripcion_propuesta VARCHAR(500)
);

CREATE TABLE pregunta(
	id_pregunta INT(10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_propuesta INT(10),
    descripcion_pregunta VARCHAR(250),
    FOREIGN KEY (id_propuesta) REFERENCES propuesta(id_propuesta) ON DELETE CASCADE
);

CREATE TABLE persona_pregunta(
	id_perso_pregun INT(10)PRIMARY KEY NOT NULL AUTO_INCREMENT, 
    id_persona INT(10),
    id_pregunta	INT(10),
    respuesta VARCHAR(50),
    FOREIGN KEY(id_persona) REFERENCES persona(id_persona) ON DELETE CASCADE,
    FOREIGN KEY(id_pregunta) REFERENCES pregunta(id_pregunta) ON DELETE CASCADE
);

CREATE TABLE persona_reunion(
	id_perso_reu INT(10)PRIMARY KEY NOT NULL AUTO_INCREMENT, 
    id_persona INT(10),
    id_reunion	INT(10),
    FOREIGN KEY(id_persona) REFERENCES persona(id_persona) ON DELETE CASCADE,
    FOREIGN KEY(id_reunion) REFERENCES reunion(id_reunion) ON DELETE CASCADE
);

CREATE TABLE reunion_lugarreunion(
	id_reu_lugarreu INT(10)PRIMARY KEY NOT NULL AUTO_INCREMENT, 
    id_lugar_reunion INT(10),
    id_reunion	INT(10),
    FOREIGN KEY(id_lugar_reunion) REFERENCES lugar_reunion(id_lugar_reunion) ON DELETE CASCADE,
    FOREIGN KEY(id_reunion) REFERENCES reunion(id_reunion) ON DELETE CASCADE
);

CREATE TABLE item_reunion(
	id_item_reunion INT(10)PRIMARY KEY NOT NULL AUTO_INCREMENT, 
    id_item INT(10),
    id_reunion	INT(10),
    FOREIGN KEY(id_item) REFERENCES item(id_item) ON DELETE CASCADE,
    FOREIGN KEY(id_reunion) REFERENCES reunion(id_reunion) ON DELETE CASCADE
);

CREATE TABLE propuesta_partido(
	id_propuesta_partido INT(10)PRIMARY KEY NOT NULL AUTO_INCREMENT, 
    id_propuesta INT(10),
    id_partido	INT(10),
    FOREIGN KEY(id_propuesta) REFERENCES propuesta(id_propuesta) ON DELETE CASCADE,
    FOREIGN KEY(id_partido) REFERENCES partido_politico(id_partido) ON DELETE CASCADE
);

--Insercion de datos

INSERT INTO lugar_procedencia(nombre) VALUES
('Las torres'),
('La yunga'),
('Santa rosa'),
('Piendamo'),
('La vega'),
('El charco'),
('Julumito'),
('Los cerrillos'),
('Las mercedes'),
('Las piedras'),
('San Rafael'),
('La rejoya'),
('Calibio'),
('Poblazon'),
('El canelo');

INSERT INTO persona(id_lugar_procedencia,nombre,telefono,tipo_asistente) VALUES
(2,'Carlos',3218901,'invitado'),
(10,'Andres',123213,'invitado'),
(13,'Juan',53234,'invitado'),
(8,'Antonio',3432412,'invitado'),
(4,'Manuel',9765454,'invitado'),
(15,'Francisco',5325723,'invitado'),
(5,'Fernando',890394057,'invitado'),
(2,'Javier',8623746,'presidente de juntas'),
(3,'Daniel',902364,'lider'),
(2,'Jose',47235123,'dirigente'),
(7,'Luis',3216543,'administrativo'),
(4,'Julio',3290532,'concejal'),
(2,'Maria',326759022,'madre lider'),
(8,'Carmen',329086432,'lider social'),
(6,'Lucia',321823423,'representante grupo etnico');

INSERT INTO partido_politico(nombre,url_logo) VALUES
('Liberal','C:\Users\desktop\logo');

INSERT INTO reunion(id_partido,fecha,tematica,hora,dirigida_por,presupuesto) VALUES
(1,'10/04/2023','presentacion','12:00pm','William',200000),
(1,'30/04/2023','propuestas','12:00pm','Kaleft',250000),
(1,'15/04/2023','debates','1:00pm','William',150000),
(1,'16/04/2023','continuacion de debate','8:00am','William',150000),
(1,'18/04/2023','acuerdos','9:00am','Cristian',200000),
(1,'22/05/2023','continuacion de acuerdos','10:00am','Cristian',150000),
(1,'21/05/2023','introduccion a sonas rurales','7:00am','Juan',200000),
(1,'31/04/2032','solucion de dudas','10:00am','Angie',150000),
(1,'2/04/2023','discurso inspirador','1:00pm','Angie',300000),
(1,'27/04/2023','Encuentro con poblaciones indigenas','1:00pm','Angie',300000),
(1,'25/05/2023','Medidas para contrarrestar los grupos armados','1:00pm','Cristian',300000),
(1,'2/05/2023','Medidas para disminuir el indice de robos','3:00pm','Miguel',300000),
(1,'4/05/2023','Catedra sobre la etica del partido','2:00pm','Miguel',300000),
(1,'4/05/2023','Metodos para mejorar la educacion','2:00pm','Miguel',300000),   
(1,'4/05/2023','Ayudas monetarias para poblaciones vulnerables','2:00pm','Miguel',300000);

INSERT INTO lugar_reunion(nombre) VALUES
('Auditorio principal'),
('Lomas'),
('Paque centra de Santa rosa'),
('Parque central Piendamo'),
('Parque caldas'),
('Estadio regional popayan'),
('Estadio ciro lopez'),
('Los cerrillos'),
('Las mercedes'),
('Las piedras'),
('San Rafael'),
('La rejoya'),
('Calibio'),
('Poblazon'),
('El canelo');

INSERT INTO item(nombre_item) VALUES
('cillas'),
('mesas'),
('equipos de sonido'),
('proyector'),
('camaras'),
('microfonos'),
('portatiles'),
('galletas'),
('tamales'),
('pan'),
('cafe'),
('gaseosas'),
('empanadas'),
('arepas'),
('chocolate');

INSERT INTO propuesta(tema_propuesta,descripcion_propuesta) VALUES
('Reparacion de vias','Realizar mantenimiento a las vias de la ciudad de popayan'),
('Inversiones a la educacion','Realizar mayor inversion en el campo academico de popayan'),
('Incremento de la seguridad','Ubicar mas puntos de vigilancia en popayan para su respectiva seguridad'),
('Mejoras en la infraestrutura de clinicas y hospitales','Se invertira mas en el campo de la salud para su infraestructura'),
('Implementacion de nuevas bibliotecas en zona urbana ','Se construiran nuevas bibliotecas en la ciudad popayan para el publico'),
('Implementacion de nuevas bibliotecas en zona rural ','Se construiran nuevas bibliotecas en las zonas rurares de popayan'),
('Invertira en material educativo infantil','Niños tendran acceso a el material'),
('Implementacion del acceso a internet en lugares publicos de la zona rurales','Se ubicaran puntos de acceso a internet en zonas publicas rurales'),
('Implementacion del acceso a internet en lugares publicos de la zona urbana','Se ubicaran puntos de acceso a internet en zonas publicas de la ciudad de popayan'),
('Inversión en suministros agrícolas ','Apoyar a los campesinos con suministros como abonos, semillas entre otros'),
('Construcción de polideportivos ','Creación de escenarios deportivos'),
('Fomentar la actividad física ','Hacer jornadas de deporte en escenarios deportivos'),
('Jornadas de cuidado animal, jornadas de vacunacion, esterilizacion etc ','Se implemenetara jornadas para el cuidado delas mascotas'),
('Inversión en limpieza ','Mejorar el servicio de limpieza en la zona rural y urbana'),
('Incrementar el indice de empleo','Realizar mas proyectos de empleo para disminuir el desempleo');

INSERT INTO pregunta(id_propuesta,descripcion_pregunta) VALUES
(1,'Esta de acuerdo?'),
(2,'Esta de acuerdo?'),
(3,'Esta de acuerdo?'),
(4,'Esta de acuerdo?'),
(5,'Esta de acuerdo?'),
(6,'Esta de acuerdo?'),
(7,'Esta de acuerdo?'),
(8,'Esta de acuerdo?'),
(9,'Esta de acuerdo?'),
(10,'Esta de acuerdo?'),
(11,'Esta de acuerdo?'),
(12,'Esta de acuerdo?'),
(13,'Esta de acuerdo?'),
(14,'Esta de acuerdo?'),
(15,'Esta de acuerdo?');

INSERT INTO persona_pregunta(id_persona,id_pregunta,respuesta ) VALUES
(1,1,'si esta de acuerdo, pero desea mas vias para arreglar'),
(2,2,'si esta de acuerdo'),
(3,3,'no esta de acuerdo'),
(4,4,'no esta de acuerdo'),
(5,5,'si esta de acuerdo'),
(6,6,'si esta de acuerdo'),
(7,7,'no esta de acuerdo'),
(8,8,'si esta de acuerdo'),
(9,9,'no esta de acuerdo'),
(10,10,'no esta de acuerdo'),
(11,12,'no esta de acuerdo'),
(12,12,'si esta de acuerdo'),
(13,13,'si esta de acuerdo'),
(14,14,'no esta de acuerdo'),
(15,15,'si esta de acuerdo');

INSERT INTO persona_reunion(id_persona,id_reunion ) VALUES
(1,1),
(2,1),
(3,1),
(4,1),
(5,2),
(6,2),
(7,2),
(8,2),
(9,2),
(10,3),
(11,3),
(12,3),
(13,3),
(14,3),
(15,5),
(1,5),
(2,5),
(3,5),
(4,5),
(5,4),
(6,4),
(7,4),
(8,4),
(9,6),
(10,7),
(11,7),
(12,8),
(13,8),
(14,9),
(15,9),
(1,10),
(2,10),
(3,10),
(4,10),
(5,11),
(6,11),
(7,11),
(8,11),
(9,12),
(10,12),
(11,12),
(12,12),
(13,13),
(14,13),
(15,14);

INSERT INTO reunion_lugarreunion(id_reunion,id_lugar_reunion ) VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,12),
(11,14),
(12,10),
(13,2),
(14,4),
(15,9);
INSERT INTO item_reunion(id_reunion,id_item ) VALUES
(1,1),
(2,1),
(3,1),
(4,1),
(5,1),
(6,1),
(7,1),
(8,1),
(9,1),
(1,2),
(2,2),
(3,2),
(4,2),
(5,2),
(6,2),
(7,2),
(8,2),
(9,2),
(1,3),
(2,3),
(3,3),
(4,3),
(5,3),
(6,3),
(7,3),
(8,3),
(9,3),
(1,4),
(2,4),
(3,4),
(4,4),
(5,4),
(6,4),
(7,4),
(8,4),
(9,4),
(1,5),
(2,5),
(3,5),
(4,5),
(5,5),
(6,5),
(7,5),
(8,5),
(9,5),
(1,6),
(2,6),
(3,6),
(4,6),
(5,6),
(6,6),
(7,6),
(8,6),
(9,6),
(1,7),
(2,7),
(3,7),
(4,7),
(5,7),
(6,7),
(7,7),
(8,7),
(9,7),
(1,10),
(2,10),
(3,10),
(4,10),
(5,10),
(6,10),
(7,10),
(8,10),
(9,10),
(1,11),
(2,11),
(3,11),
(4,11),
(5,11),
(6,11),
(7,11),
(8,11),
(9,11);

INSERT INTO propuesta_partido(id_propuesta,id_partido ) VALUES
(1,1),
(2,1),
(3,1),
(4,1),
(5,1),
(6,1),
(7,1),
(8,1),
(9,1),
(10,1),
(11,1),
(12,1),
(13,1),
(14,1),
(15,1);






