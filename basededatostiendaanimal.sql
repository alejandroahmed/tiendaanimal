drop database if exists tienda_animal;
create database tienda_animal;
use tienda_animal;


create table proveedor(
codproveedor int auto_increment,
nombre varchar(50),
primary key (codproveedor) 
);


create table articulos(
codarticulo int auto_increment,
codproveedor int,
seccion varchar(50),
precio float,
nombre varchar(50),
fecha date,
stock int,
primary key (codarticulo),
foreign key (codproveedor) references proveedor(codproveedor)
);

create table cliente(
codcliente int auto_increment,
direccion varchar(50),
telefono varchar(8),
responsable varchar(50),
primary key (codcliente)
);

create table venta(
codventa int auto_increment,
codcliente int,
fecha date,
primary key (codventa),
foreign key (codcliente) references cliente(codcliente)
);

create table detalleventa(
codventa int,
codarticulo int,
primary key (codventa, codarticulo),
foreign key (codventa) REFERENCES venta(codventa),
foreign key (codarticulo) REFERENCES articulos(codarticulo)
);

insert into proveedor values
(1,"Alejo Cuevas");

insert into articulos values
(55,1,"Comida",500,"Excellent Gato","2004-10-8",200);

insert into cliente values
(44,"Mercedes 1219","46212588","Alejandro Ahmed");

insert into venta values
(78,44,curdate());

insert into detalleventa VALUES
(78,55);
