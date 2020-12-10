/* 
** Creación de DB
*/
/* Si existe eliminamos la base de datos*/
drop database if exists comercial;
/*Creamos la base de datos*/
create database comercial character set utf8 collate utf8_general_ci;

/*Selecionamos la base de datos a utilizar*/
use comercial;

/* Creación de la tabla cliente */
create table cliente (
	dni varchar(11) not null comment 'PK de la tabla cliente',
	nombre varchar(50) not null,
	apellidos varchar(50) not null,
	fecha_nac date comment 'Campo con la fecha de nacimiento (este campo admite null)',
	direccion varchar(50) not null,
	cod_postal varchar(7) comment 'Campo con la Código postal (este campo admite null)',
	primary key(dni)
);
/* Inserta datos CLIENTE*/
insert into cliente values ('11111111A','Jose','Perez Perez','1974-08-01','C/Lepanto nº25 5º B','30001');
insert into cliente values ('22222222B','Maria','Sanchez Sanchez','1985-03-25','Ave Cervantes nº1 2ºA','30001');
insert into cliente values ('33333333C','Pedro','Martinez Lopez','1995-06-10','C/Medina nº 15 1º C','30009');
insert into cliente values ('44444444D','Juan','Flores Puerta','1991-04-12','C/Velazquez nº 20 4ºD','30008');

/* Creación de la tabla factura */
create table factura(
	cod_fac varchar(11) not null comment 'PK de tabla facturas',
	dni varchar(11) not null comment 'Campo de clave alternativa',
	fecha_fac date not null comment 'Campo de la con la fecha de la factura',
	importe integer not null,
	primary key(cod_fac),
	foreign key(dni) references cliente(dni) on update cascade 
);
/* Inserción de datos FACTURA*/
insert into factura values ('F-0001','11111111A','2012-02-01',2800);
insert into factura values ('F-0002','11111111A','2012-03-02',1500);
insert into factura values ('F-0003','11111111A','2012-08-15',800);
insert into factura values ('F-0004','22222222B','2013-09-10',3000);
insert into factura values ('F-0005','22222222B','2013-10-02',900);
insert into factura values ('F-0006','33333333C','2013-11-15',2500);
insert into factura values ('F-0007','44444444D','2014-02-02',520);
insert into factura values ('F-0008','44444444D','2015-02-04',2500);



/* Creación de la tabla articulo */
CREATE TABLE articulo(
	cod_art varchar(7) not null comment 'Código de articulo',
	descripcion varchar(255) not null comment 'Descripcion del articulo',
	precio numeric(6,2) not null  comment 'Precio sin iva [6 enteros de los cuales2 decimales]',
	stock integer default 100 comment 'Stock por defecto 100',
	check (stock > 5),
	PRIMARY KEY(cod_art)
);
/* Inserción de datos ARTICULO */
insert into articulo values ('ART-10','Elevador potencia',60,50);
insert into articulo values ('ART-80','Condesador RJW',20,200);
insert into articulo values ('ART-77','Placa Base ASUS 1155',50,35);
insert into articulo values ('ART-100','SAI 1500VA-Salicru',500,8);
insert into articulo values ('ART-101','Condesador RJW',20,200);
insert into articulo values ('ART-120','Ventilador led enermax',10,55);
insert into articulo values ('ART-250','Condesador RJW',250,40);

/*Creación de la tabla albaran*/
create table albaran(
	cod_alb varchar(10) not null,
	cod_fac varchar(11) comment 'No tiene porque haber una factura cuando se crea un albaran', /* No tiene porque haber una factura */
	fecha_alb date not null comment 'fecha del albaran',
	cod_art varchar(10) not null,
	cantidad integer not null,
	primary key(cod_alb),
	foreign key(cod_fac) references factura(cod_fac) on update cascade,
	foreign key(cod_art) references articulo(cod_art) on update cascade
);
/* Inserción de datos ALBARAN */
insert into albaran values ('A-0001','F-0001','2012-01-10','ART-250',10);
insert into albaran values ('A-0002','F-0001','2012-01-20','ART-120',30);
insert into albaran values ('A-0003','F-0002','2012-02-15','ART-100',3);
insert into albaran values ('A-0004','F-0003','2012-04-03','ART-80',25);
insert into albaran values ('A-0005','F-0003','2012-06-15','ART-120',10);
insert into albaran values ('A-0006','F-0003','2012-07-25','ART-77',4);
insert into albaran values ('A-0007','F-0004','2013-09-20','ART-10',50);
insert into albaran values ('A-0008','F-0005','2013-10-02','ART-10',15);
insert into albaran values ('A-0009','F-0006','2013-11-15','ART-100',5);
insert into albaran values ('A-0010','F-0007','2014-02-01','ART-101',1);
insert into albaran values ('A-0011','F-0007','2014-02-02','ART-100',1);
insert into albaran values ('A-0012','F-0008','2015-02-04','ART-100',5);
/* ALBARAN SIN CODIGO DE FACTURA */
/* delete from albaran where cod_alb = 'A-9999'; */
insert into albaran values ('A-9999',null ,'2015-02-04','ART-100',0);
/* ALBARAN PARA OPERADOR DIVISOR */
/* delete from albaran where cod_alb = 'A-8888'; */
/* delete from albaran where cod_alb = 'A-8777'; */
/* delete from albaran where cod_alb = 'A-8666'; */
/* delete from albaran where cod_alb = 'A-8555'; */
insert into albaran(cod_alb,cod_fac,fecha_alb,cod_art,cantidad) values ('A-8888','F-0003','2012-07-25','ART-80',4);
insert into albaran(cod_alb,cod_fac,fecha_alb,cod_art,cantidad) values ('A-8777','F-0004','2012-07-25','ART-80',4);
insert into albaran(cod_alb,cod_fac,fecha_alb,cod_art,cantidad) values ('A-8666','F-0007','2012-07-25','ART-80',4);
insert into albaran(cod_alb,cod_fac,fecha_alb,cod_art,cantidad) values ('A-8555','F-0006','2012-07-25','ART-80',4);

/* Creación de la tabla comercial */
create table comercial(
	dni varchar(11) not null comment 'PK de la tabla comercial',
	nombre varchar(50) not null comment 'Nombre del comercial',
	apellidos varchar(50) not null,
	fecha_nac date not null comment 'La fecha de nacimiento',
	direccion varchar(50) not null,
	cod_postal varchar(7) not null,
	primary key(dni)
);

/* Inserción de datos COMERCIAL*/
insert into comercial values ('55555555E','Berta','Fuertes Ruiz','1980-08-01','C/Medina no40 3o A',30008);
insert into comercial values ('66666666F','Luis','Perez Martinez','1983-02-23','C/Picasso no3 7oC',30001);
insert into comercial values ('77777777G','Ramon','Lucas Sanchez','1995-06-12','C/Nadal no 14 1o D',30009);
insert into comercial values ('88888888H','Juana','Luna Puertas','1991-05-15','C/Colon no 20 4oD',30007);

/* Creación de la tabla visita */
create table visita(
	dni_cli varchar(11) not null,
	dni_comercial varchar(11) not null,
	fecha_visita date not null,
	primary key(dni_cli,dni_comercial,fecha_visita),
	foreign key(dni_cli) references cliente(dni) on update cascade,
	foreign key(dni_comercial) references comercial(dni) on update cascade		
);
/* Inserción de datos  VISITAS*/
insert into visita values ('11111111A','66666666F','2012-04-01');
insert into visita values ('11111111A','66666666F','2012-06-01');
insert into visita values ('22222222B','66666666F','2013-05-10');
insert into visita values ('33333333C','55555555E','2014-07-12');
insert into visita values ('33333333C','66666666F','2014-04-01');
insert into visita values ('44444444D','77777777G','2012-02-07');
insert into visita values ('44444444D','66666666F','2013-04-01');
insert into visita values ('44444444D','55555555E','2014-04-15');
