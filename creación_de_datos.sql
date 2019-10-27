use TP2_Mercado

insert into Local values (1);

insert into domicilio values (1, 'Florencio Varela', 1902, 'San Justo');

insert into Caja values (1,1),
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
	(15,1),
	(16,1),
	(17,1),
	(18,1),
	(19,1),
	(20,1);

insert into Personal values (1, 'Leandro Pintos', 1);
insert into Personal values (2, 'Julian Ricci', 1);
insert into Personal values (3, 'Martín Lecam', 1);
insert into Personal values (4, 'Agustín Dilascio', 1);
insert into Personal values (5, 'Alejandro Ruiz', 1);

insert into Propio values (1,3);
insert into Propio values (2,3);
insert into Propio (Legajo) values (3);

insert into Contratado values (4);
insert into Contratado values (5);

insert into MedioPago values (1, 'Efectivo');
insert into MedioPago values (2, 'Tarjeta de débito');
insert into MedioPago values (3, 'Tarjeta de crédito');

insert into Cliente values (20359517530, 'Juan Flores', 'jflores@gmail.com');
insert into Cliente values (20398754121, 'Laura Carranza', 'lcarranza@hispavista.es');
insert into Cliente values (20401587432, 'Norberto Melián', 'nmelian@hotmail.com');
insert into Cliente values (20325985643, 'Alicia Ferreira', 'aferreira@yahoo.com');
insert into Cliente values (20125897444, 'Micaela Nievas', 'mnievas@gmail.com');

insert into Descuento values (1, 9);
insert into Descuento values (2, 15);

insert into Producto values (1, 'Leche La Martona');
insert into Producto values (2, 'Pan Lactal Bimbo');
insert into Producto values (3, 'Seven Up 1L');
insert into Producto values (4, 'Muzzarella Verónica');
insert into Producto values (5, 'Vino Tinto Latitud 33');
insert into Producto values (6, 'Queso Untable Finlandia');
insert into Producto values (7, 'Azucar Ledesma 1kg');
insert into Producto values (8, 'Yerba La Merced 1Kg');
insert into Producto values (9, 'Shampoo Suave 1L');
insert into Producto values (10, 'Cerveza Patagonia');
insert into Producto values (11, 'Galletitas Pitusas');
insert into Producto values (12, 'Manaos Uva 1,5 L');
insert into Producto values (13, 'Fernet Vittone 750 cc.');

insert into ListaDePrecio values (1, '20191026', '20191130');

 insert into SeLeAdjudica values (1, 32, 1);
 insert into SeLeAdjudica values (2, 45, 1);
 insert into SeLeAdjudica values (3, 59, 1);
 insert into SeLeAdjudica values (4, 87, 1);
 insert into SeLeAdjudica values (5, 51, 1);
 insert into SeLeAdjudica values (6, 65, 1);
 insert into SeLeAdjudica values (7, 48, 1);
 insert into SeLeAdjudica values (8, 32, 1);
 insert into SeLeAdjudica values (9, 120, 1);
 insert into SeLeAdjudica values (10, 94, 1);
 insert into SeLeAdjudica values (11, 72, 1);
 insert into SeLeAdjudica values (12, 45, 1);
 insert into SeLeAdjudica values (13, 115, 1);