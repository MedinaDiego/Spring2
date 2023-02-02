SELECT nombre FROM `producto`;
SELECT nombre, precio FROM `producto`;
SELECT * FROM `producto`;
SELECT nombre, concat(precio , " €")AS Precio_EUR, concat(round(SUM(precio * 1.09),2)," $")as Precio_USD FROM `producto` GROUP BY nombre ;
SELECT nombre AS "Nombre del producto", concat(precio , " €")AS "Precio en Euros", concat(ROUND(SUM(precio * 1.09),2)," $")AS "Precio en Dólar USD" FROM `producto` GROUP BY nombre ;
SELECT UPPER(nombre), precio FROM `producto`;
SELECT LOWER(nombre), precio FROM `producto`;
SELECT nombre, UPPER(SUBSTRING(nombre,1,2))as Abreviación FROM `fabricante`;
SELECT nombre, round(precio) FROM `producto` ;
SELECT nombre, TRUNCATE(precio,0) FROM `producto`;
SELECT codigo_fabricante FROM `producto`;
SELECT DISTINCT codigo_fabricante FROM `producto`;
SELECT codigo_fabricante FROM `producto` ORDER BY codigo_fabricante ASC;
SELECT codigo_fabricante FROM `producto` ORDER BY codigo_fabricante DESC;
SELECT nombre , precio FROM `producto` ORDER BY nombre ASC, precio DESC;
SELECT * FROM `fabricante` WHERE 1 LIMIT 5;
SELECT * FROM `fabricante` WHERE 1 LIMIT 3,2;
*SELECT nombre, precio FROM `producto` ORDER BY precio ASC LIMIT 1;
*SELECT nombre, precio FROM `producto` ORDER BY precio DESC LIMIT 1;
SELECT nombre FROM `producto` WHERE codigo_fabricante = 2;
SELECT p.nombre, p.precio, f.nombre FROM `producto` p INNER JOIN `fabricante` f ON p.codigo_fabricante = f.codigo;
SELECT p.nombre, p.precio, f.nombre FROM `producto` p INNER JOIN `fabricante` f ON p.codigo_fabricante = f.codigo ORDER BY f.nombre ASC;
SELECT p.codigo, p.nombre, f.codigo, f.nombre FROM `producto` p INNER JOIN `fabricante` f ON p.codigo_fabricante = f.codigo;
*SELECT p.nombre, MIN(p.precio), f.nombre FROM `producto` p INNER JOIN `fabricante` f ON p.codigo_fabricante = f.codigo ;
*SELECT p.nombre, MAX(p.precio), f.nombre FROM `producto` p INNER JOIN `fabricante` f ON p.codigo_fabricante = f.codigo ;
SELECT p.nombre FROM `producto` p INNER JOIN `fabricante` f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Lenovo';
SELECT p.nombre FROM `producto` p INNER JOIN `fabricante` f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Crucial' AND p.precio >= 200;
SELECT p.nombre FROM `producto` p INNER JOIN `fabricante` f ON p.codigo_fabricante = f.codigo WHERE f.nombre = "Seagate" UNION SELECT p.nombre FROM `producto` p INNER JOIN `fabricante` f ON p.codigo_fabricante = f.codigo WHERE f.nombre = "Asus" UNION SELECT p.nombre FROM `producto` p INNER JOIN `fabricante` f ON p.codigo_fabricante = f.codigo WHERE f.nombre = "Hewlett-Packard";
SELECT p.nombre FROM `producto` p INNER JOIN `fabricante` f ON p.codigo_fabricante = f.codigo WHERE f.nombre IN ('Asus', 'Hewlett-Packard' ,'Seagate');
SELECT p.nombre, p.precio FROM `producto` p INNER JOIN `fabricante` f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE '%e';
SELECT p.nombre, p.precio FROM `producto` p INNER JOIN `fabricante` f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE '%w%';
SELECT p.nombre, p.precio, f.nombre FROM `producto` p INNER JOIN `fabricante` f ON p.codigo_fabricante = f.codigo WHERE p.precio >=180 ORDER BY p.precio DESC, p.nombre ASC;
SELECT f.codigo, f.nombre FROM `producto` p LEFT JOIN `fabricante` f ON p.codigo_fabricante = f.codigo GROUP BY f.nombre ORDER BY f.codigo;
SELECT f.codigo, f.nombre, p.nombre, p.precio FROM `producto` p RIGHT OUTER JOIN `fabricante` f ON p.codigo_fabricante = f.codigo 
SELECT f.codigo, f.nombre, p.nombre, p.precio FROM `producto` p RIGHT OUTER JOIN `fabricante` f ON p.codigo_fabricante = f.codigo WHERE p.codigo_fabricante IS NULL;
SELECT codigo_fabricante, nombre  FROM `producto` WHERE codigo_fabricante = (SELECT codigo  FROM `fabricante` WHERE nombre = "Lenovo" )
SELECT * FROM `producto` WHERE precio = (SELECT MAX(precio)  FROM `producto` WHERE codigo_fabricante =  (SELECT codigo  FROM `fabricante` WHERE nombre = "Lenovo" ));
SELECT nombre, MAX(precio)  FROM `producto` WHERE codigo_fabricante = (SELECT codigo  FROM `fabricante` WHERE nombre = "Lenovo" );
SELECT nombre, MIN(precio)  FROM `producto` WHERE codigo_fabricante =  (SELECT codigo  FROM `fabricante` WHERE nombre = "Hewlett-Packard" );
SELECT * FROM `producto` WHERE precio >= (SELECT MAX(precio)  FROM `producto` WHERE codigo_fabricante = (SELECT codigo  FROM `fabricante` WHERE nombre = "Lenovo" ));
SELECT * FROM `producto` WHERE  codigo_fabricante = (SELECT codigo  FROM `fabricante` WHERE nombre = "Asus" ) AND precio > (SELECT AVG(precio) FROM `producto` WHERE codigo_fabricante = (SELECT codigo  FROM `fabricante` WHERE nombre = "Asus" ));


/*Base de dades "Universidad"*/
/*1.*/SELECT p.apellido1, p.apellido2, p.nombre FROM `persona` p WHERE p.tipo = 'alumno' ORDER BY p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;
/*2.*/SELECT p.nombre, p.apellido1, p.apellido2 FROM `persona` p WHERE telefono IS NULL AND p.tipo = 'alumno';
/*3.*/SELECT * FROM `persona` p WHERE  YEAR(p.fecha_nacimiento) =1999 AND p.tipo = 'alumno';
/*4.*/SELECT * FROM `persona` WHERE tipo="profesor" AND telefono IS NULL AND nif LIKE '%k';
/*5.*/SELECT * FROM `asignatura` WHERE cuatrimestre = 1 AND curso=3 AND id_grado = 7;
/*6.*/SELECT  per.apellido1, per.apellido2, per.nombre,  dep.nombre FROM `profesor` p  INNER JOIN `persona` per ON p.id_profesor = per.id INNER JOIN `departamento` dep ON p.id_departamento = dep.id ORDER BY per.apellido1 DESC, per.apellido2 DESC, per.nombre DESC;
/*7.*/SELECT asig.nombre, cur.anyo_inicio, cur.anyo_fin FROM `alumno_se_matricula_asignatura` a INNER JOIN `persona` per ON a.id_alumno = per.id INNER JOIN `curso_escolar` cur ON cur.id = a.id_curso_escolar INNER JOIN `asignatura` asig ON asig.id = a.id_asignatura WHERE per.nif = "26902806M";
/*8.*/SELECT p.id_departamento, dep.nombre FROM `grado` g INNER JOIN `asignatura` asig ON g.id = asig.id_grado INNER JOIN `profesor` p ON p.id_profesor = asig.id_profesor INNER JOIN `departamento` dep ON dep.id = p.id_departamento WHERE g.nombre LIKE "Grado en Ingeniería Informática (Plan 2015)";
/*9.*/SELECT p.id, p.nombre, p.apellido1, p.apellido2 FROM `alumno_se_matricula_asignatura` asm INNER JOIN `curso_escolar` ce ON ce.id = asm.id_curso_escolar INNER JOIN `persona` p ON p.id = asm.id_alumno WHERE ce.anyo_inicio = 2018 AND ce.anyo_fin = 2019 GROUP BY p.id;


/*LEFT JOIN i RIGHT JOIN*/
/*1.*/SELECT dep.nombre, per.apellido1, per.apellido2, per.nombre
FROM `persona` per
LEFT JOIN `profesor` pro ON per.id = pro.id_profesor
LEFT JOIN `departamento` dep ON pro.id_departamento = dep.id
WHERE per.tipo = "profesor" 
/*2.*/SELECT *
FROM `persona` per
LEFT JOIN `profesor` pro ON per.id = pro.id_profesor;
WHERE per.tipo = "profesor" AND pro.id_departamento IS NULL;
/*3.*/SELECT * 
FROM `profesor` pro
RIGHT JOIN `departamento` dep ON pro.id_departamento = dep.id
WHERE pro.id_profesor IS NULL
/*4.*/SELECT asig.id AS "id Asignatura", pro.id_profesor AS "ID Profesor", per.nif, per.nombre, per.apellido1, per.apellido2 
FROM `asignatura` asig
RIGHT JOIN `profesor` pro ON asig.id_profesor = pro.id_profesor
INNER JOIN `persona` per ON pro.id_profesor = per.id
WHERE asig.id IS NULL;
/*5.*/SELECT asig.id AS "id Asignatura", asig.nombre, pro.id_profesor AS "ID Profesor"
FROM `asignatura` asig
LEFT JOIN `profesor` pro ON asig.id_profesor = pro.id_profesor
WHERE pro.id_profesor IS NULL
/*6.*/SELECT dep.nombre 
FROM `departamento` dep
LEFT JOIN `profesor` pro ON pro.id_departamento = dep.id
LEFT JOIN `asignatura` asig ON asig.id_profesor = pro.id_profesor
WHERE asig.id IS NULL
GROUP BY dep.nombre

/*CONSULTAS RESUM*/
/*1.*/SELECT COUNT(id) AS Total_Alumnos FROM `persona` WHERE tipo = "alumno";
/*2.*/SELECT COUNT(id) AS "ALUMNOS 99" FROM `persona` p WHERE YEAR(p.fecha_nacimiento) =1999 AND p.tipo = 'alumno';
/*3.*/SELECT COUNT(p.id_profesor) AS "Nº Profesores" , dep.nombre FROM `profesor` p LEFT JOIN `departamento` dep ON p.id_departamento = dep.id GROUP BY dep.nombre ORDER BY p.id_profesor ASC;
/*4.*/SELECT COUNT(p.id_profesor) AS "Nº Profesores" , dep.nombre FROM `profesor` p RIGHT JOIN `departamento` dep ON p.id_departamento = dep.id GROUP BY dep.nombre;
/*5.*/SELECT g.nombre , count(asig.nombre) FROM `grado` g LEFT JOIN `asignatura` asig ON g.id = asig.id_grado GROUP BY g.nombre ORDER BY asig.nombre ASC;
/*6.*/SELECT g.nombre , count(asig.nombre) FROM `grado` g RIGHT JOIN `asignatura` asig ON g.id = asig.id_grado GROUP BY g.nombre HAVING COUNT(asig.nombre)>40 ORDER BY asig.nombre ASC;
/*7.*/SELECT g.nombre, a.tipo, SUM(a.creditos) FROM `grado` g INNER JOIN `asignatura` a ON g.id = a.id_grado GROUP BY a.id_grado, a.tipo;
/*9.*/
/*10.*/SELECT * FROM `persona` WHERE tipo="alumno" ORDER BY fecha_nacimiento ASC LIMIT 1;
/*11.*/SELECT dep.nombre, per.nif, per.nombre, per.apellido1, per.apellido2
FROM `departamento` dep
LEFT JOIN `profesor` pro ON pro.id_departamento = dep.id
LEFT JOIN `asignatura` asig ON asig.id_profesor = pro.id_profesor
INNER JOIN `persona` per ON per.id = pro.id_profesor
WHERE asig.id IS NULL



