--INSERCIÓN DE DATOS(INCOMPLETO)

use TP2_Mercado

insert into Local values (1, 'Local 1'),
						 (2, 'Local 2'),
						 (3, 'Local 3'),
						 (4, 'Local 4');
						 /*(5),
						 (6),
						 (7),
						 (8),
						 (9),
						 (10),
						 (11),
						 (12),
						 (13),
						 (14),
						 (15),
						 (16),
						 (17),
						 (18),
						 (19),
						 (20);*/

insert into domicilio values (1, 'Florencio Varela', 1902, 'San Justo');
insert into domicilio values (2, 'Rivadavia', 1432, 'Ituzaingó');
insert into domicilio values (3, 'Buen Viaje', 512, 'Morón');
insert into domicilio values (4, 'Santa Rosa', 1246, 'Castelar');
/*insert into domicilio values (5, 'Florencio Varela', 1902, 'San Justo');
insert into domicilio values (6, 'Florencio Varela', 1902, 'San Justo');
insert into domicilio values (7, 'Florencio Varela', 1902, 'San Justo');
insert into domicilio values (8, 'Florencio Varela', 1902, 'San Justo');
insert into domicilio values (9, 'Florencio Varela', 1902, 'San Justo');
insert into domicilio values (10, 'Florencio Varela', 1902, 'San Justo');
insert into domicilio values (11, 'Florencio Varela', 1902, 'San Justo');
insert into domicilio values (12, 'Florencio Varela', 1902, 'San Justo');
insert into domicilio values (13, 'Florencio Varela', 1902, 'San Justo');
insert into domicilio values (14, 'Florencio Varela', 1902, 'San Justo');
insert into domicilio values (15, 'Florencio Varela', 1902, 'San Justo');
insert into domicilio values (16, 'Florencio Varela', 1902, 'San Justo');
insert into domicilio values (17, 'Florencio Varela', 1902, 'San Justo');
insert into domicilio values (18, 'Florencio Varela', 1902, 'San Justo');
insert into domicilio values (19, 'Florencio Varela', 1902, 'San Justo');
insert into domicilio values (20, 'Florencio Varela', 1902, 'San Justo');*/

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

insert into Telefono values (20359517530, 46975858);
insert into Telefono values (20398754121, 49685214);
insert into Telefono values (20401587432, 43235474);
insert into Telefono values (20325985643, 49895353);
insert into Telefono values (20125897444, 47415252);

insert into Descuento values (1, 0.09);
insert into Descuento values (2, 0.15);

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

 insert into Turno values (1, '0600', '1159', 'Mañana');
 insert into Turno values (2, '1200', '1759', 'Tarde');
 insert into Turno values (3, '1800', '2300', 'Noche');


-- En este bloque falta llenar Conlleva pero hay que modificarla.
-- Que Conlleva tenga los mismos datos que Compra es redundante.
insert into Compra values (1,20359517530,1,1,1, 1, '20191028', 1, 2301);
insert into Compra values (2,20359517530,1,1,1, 1, '20191029', 1, 5260);
insert into Compra values (3,20359517530,1,1,1, 1, '20191028', 1, 421);
insert into Compra values (4,20359517530,1,1,1, 1, '20191030', 1, 789);
insert into Compra values (5,20359517530,1,1,1, 1, '20191028', 1, 6320);
insert into Compra values (6,20359517530,1,1,1, 1, '20191028', 1, 144);
insert into Compra values (7,20359517530,1,1,1, 1, '20191030', 1, 855);
insert into Compra values (8,20359517530,1,1,1, 1, '20191027', 1, 741);
insert into Compra values (9,20359517530,1,1,1, 1, '20191027', 1, 2369);
insert into Compra values (10,20359517530,1,1,1, 1, '20191026', 1, 3354);
insert into Compra values (11,20359517530,1,1,1, 1, '20191030', 1, 9241);
insert into Compra values (12,20359517530,1,1,1, 1, '20191028', 2, 10214);

insert into Conlleva values (1, 1, 1);
insert into Conlleva values (1, 2, 3);
insert into Conlleva values (2, 1, 1);
insert into Conlleva values (2, 2, 1);
insert into Conlleva values (3, 2, 5);
insert into Conlleva values (3, 1, 1);
insert into Conlleva values (4, 2, 1);
insert into Conlleva values (4, 1, 9);
insert into Conlleva values (5, 2, 1);
insert into Conlleva values (5, 1, 1);
insert into Conlleva values (6, 2, 1);
insert into Conlleva values (6, 1, 7);
insert into Conlleva values (7, 2, 1);
insert into Conlleva values (7, 1, 4);
insert into Conlleva values (8, 2, 5);
insert into Conlleva values (8, 1, 1);
insert into Conlleva values (9, 2, 1);
insert into Conlleva values (9, 1, 8);
insert into Conlleva values (10, 2, 1);
insert into Conlleva values (10, 1, 1);
insert into Conlleva values (11, 2, 4);
insert into Conlleva values (11, 1, 2);
insert into Conlleva values (12, 2, 2);
insert into Conlleva values (12, 1, 3);

insert into Asignacion values('20191026', 3, 1, 1, 1);
insert into Asignacion values('20191026', 4, 1, 1, 2);
insert into Asignacion values('20191026', 5, 1, 1, 3);

insert into Asignacion values('20191027', 3, 1, 1, 1);
insert into Asignacion values('20191027', 4, 1, 1, 2);
insert into Asignacion values('20191027', 5, 1, 1, 3);

insert into Asignacion values('20191028', 1, 1, 1, 1);
insert into Asignacion values('20191028', 2, 1, 1, 2);
insert into Asignacion values('20191028', 3, 1, 1, 3);

insert into Asignacion values('20191029', 2, 1, 1, 1);
insert into Asignacion values('20191029', 3, 1, 1, 2);
insert into Asignacion values('20191029', 4, 1, 1, 3);

insert into Asignacion values('20191030', 2, 1, 1, 1);
insert into Asignacion values('20191030', 3, 1, 1, 2);
insert into Asignacion values('20191030', 4, 1, 1, 3);