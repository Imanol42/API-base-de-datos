create table empleados(
	id serial,
	nombre varchar(50),
	apellido varchar(50),
	alta date,
	constraint empleados_pkey primary key (id)
);

select * from empleados;

alter table empleados add 

INSERT INTO empleados(nombre, apellido, alta)
VALUES ('IMANOL','GONZALEZ','2022-10-26');

INSERT INTO empleados(nombre, apellido, alta)
VALUES ('FLORENCIA','JARA','2022-10-26');

INSERT INTO empleados(nombre, apellido, alta)
VALUES ('EDITH','FLOR','2022-10-26');

INSERT INTO empleados(nombre, apellido, alta)
VALUES ('MIGUEL','GONZALEZ','2022-10-26');

CREATE TABLE puestos(
	id serial,
	puesto varchar(100) not null,
	sueldo double precision not null,
	constraint puestos_pkey primary key(id) 
);

select * from puestos;

insert into puestos(puesto, sueldo)
values ('tecnico',90600.60);

insert into puestos(puesto, sueldo)
values ('administrativo',110000.15);

create table empleados_puestos(
	id_empleados integer NOT NULL,
	id_puestos integer NOT NULL,
	constraint empleados_puestos_pkey primary key(id_empleados, id_puestos),
	constraint empleados_puestos_id_puestos FOREIGN KEY(id_puestos)
	references puestos (id) match simple
	on delete no action
	on update no action,
	constraint empleados_puestos_id_usuarios FOREIGN KEY(id_empleados)
	references empleados (id) match simple
	on delete no action
	on update no action
);

Select * from empleados_puestos;

insert into empleados_puestos(id_empleados, id_puestos) 
values (1,1);

insert into empleados_puestos(id_empleados, id_puestos) 
values (2,2);

insert into empleados_puestos(id_empleados, id_puestos) 
values (2,1);