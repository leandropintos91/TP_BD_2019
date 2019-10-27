use TP2_Mercado

create table Local
(NroLocal tinyint primary key 
)

create table Turno
(IdTurno char(1) primary key,
Descripcion varchar(200)
)

create table Descuento
(IdDescuento smallint primary key
,Porcentaje decimal(5,2) not null
)


create table Cliente 
(Cuil bigint primary key,
NyA varchar(50) not null,
email varchar(50) not null
)

create table Producto
(IdProducto int primary key ,
Nombre varchar(50) not null
)

create table ListaDePrecio
(IdListaPrecio int primary key,
FechaInicio date not null,
FechaFin date,
)


create table domicilio
(NroLocal tinyint not null,
calle varchar(50) not null,
altura int,
barrio varchar(50),
constraint PK_Domicilio primary key (NroLocal),
constraint FK_NroLocal foreign key (NroLocal) references Local(NroLocal)
)


create table Caja
(NroCaja tinyint not null,
NroLocal tinyint not null,
constraint PK_Caja primary key (NroCaja,NroLocal),
constraint FK_NroLocal2 foreign key(NroLocal) references Local(NroLocal)
)

create table MedioPago
(IdMedioPago int primary key,
Descripcion  text
)

create table Personal
(Legajo int not null primary key,
NyA varchar(50) not null,
NroLocal tinyint not null,
constraint FK_NroLocal3 foreign key(NroLocal) references Local(NroLocal)
)

create table Contratado
(Legajo int not null,
constraint PK_Contratado primary key(Legajo),
constraint FK_Legajo foreign key(Legajo) references Personal(Legajo)
)

create table Propio
(Legajo int not null,
LegajoSuperior int,
constraint PK_Propio primary key (Legajo),
constraint FK_LegajoP foreign key (Legajo) references Personal (Legajo),
constraint FK_LegajoSup foreign key (LegajoSuperior) references Personal(Legajo)
)

create table Asignacion
(Fecha date not null,
Legajo int not null,
NroCaja tinyint not null,
NroLocal tinyint not null,
IdTurno char(1),
constraint PK_Asignacion primary key (Fecha,Legajo),
constraint FK_LegajoA foreign key (Legajo) references Personal(Legajo),
constraint FK_TurnoA foreign key (IdTurno) references Turno(IdTurno),
constraint FK_NroCajaLocal foreign key (NroCaja,NroLocal) references Caja(NroCaja,nroLocal)
)


create table Telefono
(Cuil bigint not null,
Telefono bigint not null,
constraint PK_CuilT primary key (Cuil),
constraint FK_CuilT foreign key (Cuil) references Cliente(Cuil)
)

create table SeLeAdjudica
(IdProducto int not null,
precio smallmoney not null,
IdLista int not null,
constraint PK_Adjudica primary key (IdProducto,Idlista),
constraint FK_ProductoA foreign key (IdProducto) references Producto(IdProducto),
constraint FK_ListaA foreign key(IdLista) references ListaDePrecio(IdListaPrecio)
)

create table Compra
(IdCompra bigint not null,
Cuil bigint not null,
NroCaja tinyint not null,
NroLocal tinyint not null,
IdDescuento smallint not null,
IdMedioPago int not null,
fecha date not null,
cantidad smallint not null,
IdListaPrecio int,
constraint PK_Compra primary key (IdCompra,Cuil,NroCaja,NroLocal),
constraint FK_CuilC foreign key (Cuil) references Cliente(Cuil),
constraint FK_NroCajaLocalC foreign key (NroCaja, NroLocal) references Caja(NroCaja,NroLocal),
constraint FK_IdDescuentoC foreign key (IdDescuento) references Descuento(Iddescuento),
constraint FK_IdMedioPagoC foreign key (IdMedioPago) references MedioPago(IdMedioPago),
constraint FK_IdListaPrecio foreign key (IdListaPrecio) references ListaDePrecio(IdListaPrecio)
)

create table Conlleva
(IdCompra bigint not null,
Cuil bigint not null,
NroCaja tinyint not null,
NroLocal tinyint not null,
IdProducto int not null,
Cantidad smallint not null,


constraint FK_IdCompraConlleva foreign key(IdCompra,Cuil,NroCaja,NroLocal) references Compra(IdCompra,Cuil,NroCaja,NroLocal),
constraint FK_IdProductoConlleva foreign key (IdProducto) references Producto(IdProducto)
)