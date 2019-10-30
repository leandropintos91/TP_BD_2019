--CREACIÓN DE LA BD

create database TP2_Mercado

use TP2_Mercado

--CREACIÓN DE LAS TABLAS

--LOCAL
create table Local
(NroLocal tinyint primary key,
Nombre varchar(50) 
)

--TURNO
create table Turno
(IdTurno tinyint primary key,
HoraIni time,
HoraFin time,
Descripcion varchar(50)
)

--DESCUENTO
create table Descuento
(IdDescuento smallint primary key,
Porcentaje decimal(3,2) not null
)

--CLIENTE
create table Cliente 
(Cuil bigint primary key,
NyA varchar(50) not null,
email varchar(50) not null
)

--PRODUCTO
create table Producto
(IdProducto int primary key,
Nombre varchar(50) not null
)

--LISTA DE PRECIO
create table ListaDePrecio
(IdListaPrecio int primary key,
FechaInicio date not null,
FechaFin date,
)

--DOMICILIO
create table domicilio
(NroLocal tinyint not null,
calle varchar(50) not null,
altura int,
barrio varchar(50),
constraint PK_Domicilio primary key (NroLocal),
constraint FK_NroLocal foreign key (NroLocal) references Local(NroLocal)
)

--CAJA
create table Caja
(NroCaja tinyint not null,
NroLocal tinyint not null,
constraint PK_Caja primary key (NroCaja,NroLocal),
constraint FK_NroLocal2 foreign key(NroLocal) references Local(NroLocal)
)

--MEDIO DE PAGO
create table MedioPago
(IdMedioPago tinyint primary key,
Descripcion  varchar(50)
)

--PERSONAL
create table Personal
(Legajo int not null primary key,
NyA varchar(50) not null,
NroLocal tinyint not null,
constraint FK_NroLocal3 foreign key(NroLocal) references Local(NroLocal)
)

--CONTRATADO
create table Contratado
(Legajo int not null,
constraint PK_Contratado primary key(Legajo),
constraint FK_Legajo foreign key(Legajo) references Personal(Legajo)
)

--PROPIO
create table Propio
(Legajo int not null,
LegajoSuperior int,
constraint PK_Propio primary key (Legajo),
constraint FK_LegajoP foreign key (Legajo) references Personal (Legajo),
constraint FK_LegajoSup foreign key (LegajoSuperior) references Personal(Legajo)
)

--ASIGNACIÓN
create table Asignacion
(Fecha date not null,
Legajo int not null,
NroCaja tinyint not null,
NroLocal tinyint not null,
IdTurno tinyint,
constraint PK_Asignacion primary key (Fecha,Legajo),
constraint FK_LegajoA foreign key (Legajo) references Personal(Legajo),
constraint FK_TurnoA foreign key (IdTurno) references Turno(IdTurno),
constraint FK_NroCajaLocal foreign key (NroCaja,NroLocal) references Caja(NroCaja,NroLocal)
)

--TELEFONO
create table Telefono
(Cuil bigint not null,
Telefono bigint not null,
constraint PK_CuilT primary key (Cuil),
constraint FK_CuilT foreign key (Cuil) references Cliente(Cuil)
)

--SE_LE_ADJUDICA
create table SeLeAdjudica
(IdProducto int not null,
precio float not null,
IdLista int not null,
constraint PK_Adjudica primary key (IdProducto,Idlista),
constraint FK_ProductoA foreign key (IdProducto) references Producto(IdProducto),
constraint FK_ListaA foreign key(IdLista) references ListaDePrecio(IdListaPrecio)
)

--COMPRA
create table Compra
(IdCompra bigint not null,
Cuil bigint not null,
NroCaja tinyint not null,
NroLocal tinyint not null,
IdDescuento smallint not null,
IdMedioPago tinyint not null,
fecha datetime not null,
IdTurno tinyint not null,
montoTotal float not null,
constraint PK_Compra primary key (IdCompra),
--constraint PK_Compra primary key (IdCompra,Cuil,NroCaja,NroLocal),
constraint FK_CuilC foreign key (Cuil) references Cliente(Cuil),
constraint FK_NroCajaLocalC foreign key (NroCaja, NroLocal) references Caja(NroCaja,NroLocal),
constraint FK_IdDescuentoC foreign key (IdDescuento) references Descuento(Iddescuento),
constraint FK_IdMedioPagoC foreign key (IdMedioPago) references MedioPago(IdMedioPago),
constraint FK_Turno foreign key (IdTurno) references Turno(IdTurno)
)

--CONLLEVA
create table Conlleva
(IdCompra bigint not null,
--Cuil bigint not null,
--NroCaja tinyint not null,
--NroLocal tinyint not null,
IdProducto int not null,
Cantidad smallint not null,
constraint FK_IdCompraConlleva foreign key(IdCompra) references Compra(IdCompra),
--constraint FK_IdCompraConlleva foreign key(IdCompra,Cuil,NroCaja,NroLocal) references Compra(IdCompra,Cuil,NroCaja,NroLocal),
constraint FK_IdProductoConlleva foreign key (IdProducto) references Producto(IdProducto)
)