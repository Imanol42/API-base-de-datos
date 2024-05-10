drop table lectores_libros;
drop table lectores;
drop table libros;
drop view libros_prestados;

create table lectores(
	id serial,
	nombre varchar(50) not null,
	apellido varchar (50),
	email varchar (100),
	fecha_nacimiento date not null,
	constraint lectores_pkey primary key(id)
);
insert into lectores (nombre,apellido,email,fecha_nacimiento)
	values ('Juan Alberto','Cortez','juancortez@gmail.com','1983-06-20'),
	('Antonia','De Los Rios','antoniarios_23@yahoo.com','1978-11-24'),
	('Nicolas Martin','','nico_martin23@gmail.com','1986-07-11'),
	('Néstor','Casco','nestor_casco2331@hotmmail.com','1981-02-11'),
	('Lisa','Perez','lisperez@hotmail.com','1994-08-11'),
	('Ana Rosa','Estagnolli','anros@abcdatos.com','1974-10-15'),
	('Milagros','Pastoruti','mili_2231@gmail.com','2001-01-22'),
	('Pedro','Alonso','alonso.pedro@impermebilizantesrosario.com','1983-09-05'),
	('Arturo Ezequiel','Ramírez','artu.rama@outlook.com','1998-03-29'),
	('Juan Ignacio','Altarez','juanaltarez.223@yahoo.com','1975-08-24');

select * from lectores;

create table libros(
	id serial,
	nombre_libro varchar(100) not null,
	nombre_editorial varchar(100),
	autor varchar(50),
	constraint libros_pkey primary key (id),
	ISBN integer
);
insert into libros (nombre_libro,nombre_editorial,autor,ISBN)
	values 	('Cementerio de animales','Ediciones de Mente','Stephen King','4568874'),
			('En el nombre de la rosa','Editorial España','Umberto Eco','44558877'),
			('Cien años de soledad','Sudamericana','Gabriel García Márquez','7788845'),
			('El diario de Ellen Rimbauer','Editorial Maine','Stephen King','45699874'),
			('La hojarasca','Sudamericana','Gabriel García Márquez','7787898'),
			('El amor en los tiempos del cólera','Sudamericana','Gabriel García Márquez','2564111'),
			('La casa de los espíritus','Ediciones Chile','Isabel Allende','5544781'),
			('Paula','Ediciones Chile','Isabel Allende','22545447'),
			('La tregua','Alfa','Mario Benedetti','2225412'),
			('Gracias por el fuego','Alfa','Mario Benedetti','88541254');

select * from libros;

create table lectores_libros(
	id_lectores integer not null,
	id_libros integer not null,
	constraint lectores_libros_pkey primary key (id_lectores,id_libros),
	constraint lectores_libros_id_lectores foreign key (id_lectores) references lectores(id)
	on delete no action
	on update no action,
	constraint lectores_libros_id_libros foreign key (id_libros) references libros (id)
	on delete no action
	on update no action
);

select * from lectores_libros; 

/*primer lector*/
insert into lectores_libros (id_lectores,id_libros) values (1,1);
insert into lectores_libros (id_lectores,id_libros) values (1,2);
insert into lectores_libros (id_lectores,id_libros) values (1,3);
insert into lectores_libros (id_lectores,id_libros) values (1,4);
insert into lectores_libros (id_lectores,id_libros) values (1,5);
/*segundo lector*/
insert into lectores_libros (id_lectores,id_libros) values (2,5);
insert into lectores_libros (id_lectores,id_libros) values (2,6);
insert into lectores_libros (id_lectores,id_libros) values (2,7);
insert into lectores_libros (id_lectores,id_libros) values (2,8);
insert into lectores_libros (id_lectores,id_libros) values (2,9);
/*tercer lector*/
insert into lectores_libros (id_lectores,id_libros) values (3,5);
insert into lectores_libros (id_lectores,id_libros) values (3,6);
insert into lectores_libros (id_lectores,id_libros) values (3,7);
insert into lectores_libros (id_lectores,id_libros) values (3,8);
insert into lectores_libros (id_lectores,id_libros) values (3,9);
/*cuarto lector*/
insert into lectores_libros (id_lectores,id_libros) values (4,1);
insert into lectores_libros (id_lectores,id_libros) values (4,3);
insert into lectores_libros (id_lectores,id_libros) values (4,4);
insert into lectores_libros (id_lectores,id_libros) values (4,6);
insert into lectores_libros (id_lectores,id_libros) values (4,2);

/*quinto lector*/
insert into lectores_libros (id_lectores,id_libros) values (5,3);
insert into lectores_libros (id_lectores,id_libros) values (5,7);
insert into lectores_libros (id_lectores,id_libros) values (5,9);
/*sexto lector*/
insert into lectores_libros (id_lectores,id_libros) values (6,4);
insert into lectores_libros (id_lectores,id_libros) values (6,2);
insert into lectores_libros (id_lectores,id_libros) values (6,7);
/*septimo lector*/
insert into lectores_libros (id_lectores,id_libros) values (7,1);
insert into lectores_libros (id_lectores,id_libros) values (7,3);
insert into lectores_libros (id_lectores,id_libros) values (7,9);

/*octavo lector*/
insert into lectores_libros (id_lectores,id_libros) values (8,8);
/*octavo lector*/
insert into lectores_libros (id_lectores,id_libros) values (9,1);

/*consulta para contar la cantidad de libros de la tabla lectores_libros y ordenar en orden descendente*/
select id_libros, count(id_libros) as cantidad from lectores_libros group by id_libros order by 
cantidad desc;

/*consulta para saber cuantas veces se prestó un determinado libro*/
select count (id_libros) as cantidad from lectores_libros where id_libros = 1;

select id_lectores, count(id_libros) as cantidad_libros_prestados from lectores_libros group by id_lectores order by 
id_lectores asc;

/*consulta para saber cuantos libros tiene prestado un determinado lector*/
/*lector 1*/select count (id_lectores) as lector_1 from lectores_libros where id_lectores = 1;
/*lector 2*/select count (id_lectores) as lector_2 from lectores_libros where id_lectores = 2;
/*lector 3*/select count (id_lectores) as lector_3 from lectores_libros where id_lectores = 3;
/*lector 4*/select count (id_lectores) as lector_4 from lectores_libros where id_lectores = 4;
/*lector 5*/select count (id_lectores) as lector_5 from lectores_libros where id_lectores = 5;
/*lector 6*/select count (id_lectores) as lector_6 from lectores_libros where id_lectores = 6;
/*lector 7*/select count (id_lectores) as lector_7 from lectores_libros where id_lectores = 7;
/*lector 8*/select count (id_lectores) as lector_8 from lectores_libros where id_lectores = 8;
/*lector 9*/select count (id_lectores) as lector_9 from lectores_libros where id_lectores = 9;
/*lector 10*/select count (id_lectores) as lector_10 from lectores_libros where id_lectores = 10;

/*consulta para borrar un dato de la tabla (ddl)*/
delete from lectores_libros where id_lectores = 2 and id_libros = 9; 

/*consulta para calcular promedios de edades de los lectores*/
select avg (date_part('YEAR',AGE(fecha_nacimiento))) as promedio_edad_lectores from lectores;

/*consulta para saber cual es el lector con mayor edad*/
select max (date_part('YEAR',AGE(fecha_nacimiento))) as mayor_edad from lectores;
/*consulta para saber cual es el lector con menor edad*/
select min (date_part('YEAR',AGE(fecha_nacimiento))) as mayor_edad from lectores;

/*consulta para calcular la edad de un lector*/ 
select date_part('year',AGE(fecha_nacimiento)) from lectores where id = 1;

/*consulta para ordenar de mayor a menor una tabla y mostrar el nombre y edad*/
select nombre, date_part('YEAR',AGE(fecha_nacimiento)) as edad from lectores order by fecha_nacimiento; 

/*consulta para crear una vista para visualizar en éste caso nombre, apellido, nombre del libro, nombre de la editorial e ISBN*/ 
create or replace view libros_prestados 
	as
	select lectores.nombre, lectores.apellido, libros.nombre_libro, libros.nombre_editorial, libros.ISBN
	from lectores
	inner join lectores_libros on lectores_libros.id_lectores = lectores.id 
	inner join libros on lectores_libros.id_libros = libros.id;

/*consulta para traer la vista con los datos de determinado lector y que libros tiene*/
select * from libros_prestados where nombre = 'Pedro' and apellido = 'Alonso';

--creación de un procedimiento almacenado para cargar usuarios.  
create or replace function carga_lectores(c_nombre varchar(50), c_apellido varchar(50), c_email varchar(100), nacimiento date) 
returns void as $$
begin
insert into lectores(nombre, apellido, email, fecha_nacimiento)
values(c_nombre, c_apellido, c_email, nacimiento);
end;
$$ language plpgsql;


/*API 3*/
--creacion de un procedimiento almacenado para quitar la relacion entre 1 lector y 1 libro (devolucion del libro)
create or replace function devoluciones(lector integer, libro integer) 
returns void as $$
begin
delete from lectores_libros where id_lectores = lector and id_libros = libro;
end;
$$ language plpgsql;

create table devolucion_libros(
	id_lectores integer not null,
	id_libros integer not null,
	fecha timestamp
);

create or replace function devolucion_libros_logs() returns trigger as
$$
begin
	insert into devolucion_libros (id_lectores, id_libros, fecha)
	values(old.id_lectores, old.id_libros, now());
	return old;
end
$$
language plpgsql;

create trigger devolucion_logs before delete on lectores_libros
for each row
execute procedure devolucion_libros_logs();

select devoluciones (9,1);
select devoluciones (1,1);
select devoluciones (8,8);
select * from devolucion_libros;

create or replace function libros_prestados(integer) returns bigint as
'
select count (id_libros) as cantidad from lectores_libros where id_libros = $1;
'
language sql;

select libros_prestados(1);
