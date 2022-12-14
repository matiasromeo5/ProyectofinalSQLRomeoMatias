CREATE SCHEMA ECommerce_indumentaria;
Use Ecommerce_indumentaria;
CREATE TABLE Ecommerce (
id_fiscal varchar(20) NOT NULL PRIMARY KEY,
Mes_periodo date NOT NULL,
Total_ventas INT NOT NULL
);
CREATE TABLE pedido_compra_Proveedor(
ID_pedido INT NOT NULL auto_increment PRIMARY KEY,
fecha DATE not null,
monto_total float not null,
id_fiscal varchar(20)
);
create table detalle_pedido_proveedores (
ID_pedido INT NOT NULL,
id_articulo INT NOT NULL,
descripcion VARCHAR (50),
precio_costo float,
cantidad int NOT NULL
);
CREATE TABLE Mercaderia (
ID_articulo INT NOT NULL auto_increment PRIMARY key,
nombre varchar(30) not null,
descripcion Varchar (30),
precio_costo float Not null,
id_proveedor int not null,
precio_vta_minorista float not null
);
Create table pedido_ventas (
fecha date not null,
id_pedido_ventas INT not null auto_increment Primary key,
monto_total float not null,
id_cliente int not null,
metodo_pago VARCHAR (20) not null,
estado_de_pedido varchar(20),
id_fiscal varchar(20)
);
Create table detalle_pedido (
Id_pedido_ventas INT not null,
id_articulo int not null,
descripcion varchar(50),
precio_vta_minorista float not null,
cantidad int not null
);
Create table Deposito (
Id_movimiento int not null auto_increment Primary key,
fecha DATE not null,
id_articulo int,
id_pedido int,
id_pedido_ventas int,
variacion int,
cantidad_neta int,
id_fiscal varchar(20)
);
Create table proveedores (
Id_proveedor INt not null auto_increment primary key,
nombre Varchar(20) not null,
mail Varchar(50)not null,
telefono Varchar(20) not null,
direccion Varchar(60)not null
);
Create table clientes (
Id_cliente int not null auto_increment primary key,
nombre Varchar (20)  not null,
telefono Varchar (20)  not null,
mail Varchar (60) not null,
localidad Varchar (60) not null
);
ALTER TABLE pedido_compra_proveedor
add foreign key (id_fiscal) references ecommerce(id_fiscal);

ALTER TABLE detalle_pedido_proveedores
ADD FOREIGN KEY (id_pedido) references pedido_compra_proveedor (id_pedido),
add foreign key (id_articulo) references mercaderia (id_articulo);

Alter table mercaderia 
add foreign key (Id_proveedor) references proveedores(Id_proveedor);

Alter table pedido_ventas
add foreign key (id_cliente) references clientes(id_cliente),
add foreign key (id_fiscal) references ecommerce(id_fiscal);

Alter table detalle_pedido
add foreign key (id_pedido_ventas) references pedido_ventas(id_pedido_ventas),
add foreign key (id_articulo) references mercaderia(id_articulo);

Alter table deposito
add foreign key (id_articulo) references mercaderia (id_articulo),
add foreign key (id_pedido) references pedido_compra_proveedor(id_pedido),
add foreign key (id_pedido_ventas) references pedido_ventas(id_pedido_ventas),
add foreign key (id_fiscal) references ecommerce(id_fiscal);
